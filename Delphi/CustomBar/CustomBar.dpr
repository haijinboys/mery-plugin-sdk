// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

library CustomBar;

{$R 'mPlugin.res' 'mPlugin.rc'}


uses
  Winapi.Windows,
  System.Classes,
  System.Types,
  mMain in 'mMain.pas' {MainForm},
  mProp in 'mProp.pas' {PropForm},
  mFrame in 'mFrame.pas',
  mCustomBar in 'mCustomBar.pas',
  mPlugin in 'mPlugin.pas';

const
  IDS_MENU_TEXT = 1;
  IDS_STATUS_MESSAGE = 2;
  IDI_ICON = 101;

var
  FList: TFrameList;

{$IFDEF DEBUG}
{$R *.res}
{$ENDIF}

  // -----------------------------------------------------------------------------
  // OnCommand
  // プラグインを実行した時に呼び出されます
  // パラメータ
  //   hwnd: ウィンドウのハンドル

procedure OnCommand(hwnd: HWND); stdcall;
var
  LFrame: TFrame;
begin
  LFrame := FList.Find(hwnd);
  LFrame.OnCommand(hwnd);
end;

// -----------------------------------------------------------------------------
// QueryStatus
//   プラグインが実行可能か、またはチェックされた状態かを調べます
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   pbChecked: チェックの状態
// 戻り値
//   実行可能であればTrueを返します

function QueryStatus(hwnd: HWND; pbChecked: PBOOL): BOOL; stdcall;
var
  LFrame: TFrame;
begin
  Result := False;
  LFrame := FList.Find(hwnd);
  if LFrame <> nil then
    Result := LFrame.QueryStatus(hwnd, pbChecked);
end;

// -----------------------------------------------------------------------------
// GetMenuTextID
//   メニューに表示するテキストのリソース識別子を取得します
// 戻り値
//   リソース識別子

function GetMenuTextID: Cardinal; stdcall;
begin
  Result := IDS_MENU_TEXT;
end;

// -----------------------------------------------------------------------------
// GetStatusMessageID
//   ツールチップに表示するテキストのリソース識別子を取得します
// 戻り値
//   リソース識別子

function GetStatusMessageID: Cardinal; stdcall;
begin
  Result := IDS_STATUS_MESSAGE;
end;

// -----------------------------------------------------------------------------
// GetIconID
//   ツールバーに表示するアイコンのリソース識別子を取得します
// 戻り値
//   リソース識別子

function GetIconID: Cardinal; stdcall;
begin
  Result := IDI_ICON;
end;

// -----------------------------------------------------------------------------
// OnEvents
//   イベントが発生した時に呼び出されます
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nEvent: イベントの種類
//   lParam: メッセージ特有の追加情報
// 備考
//   EVENT_CREATE:             エディタを起動した時
//   EVENT_CLOSE:              エディタを終了した時
//   EVENT_CREATE_FRAME:       フレームを作成された時
//   EVENT_CLOSE_FRAME:        フレームが破棄された時
//   EVENT_SET_FOCUS:          フォーカスを取得した時
//   EVENT_KILL_FOCUS:         フォーカスを失った時
//   EVENT_FILE_OPENED:        ファイルを開いた時
//   EVENT_FILE_SAVED:         ファイルを保存した時
//   EVENT_MODIFIED:           更新の状態が変更された時
//   EVENT_CARET_MOVED:        カーソルが移動した時
//   EVENT_SCROLL:             スクロールされた時
//   EVENT_SEL_CHANGED:        選択範囲が変更された時
//   EVENT_CHANGED:            テキストが変更された時
//   EVENT_CHAR:               文字が入力された時
//   EVENT_MODE_CHANGED:       編集モードが変更された時
//   EVENT_DOC_SEL_CHANGED:    アクティブな文書が変更された時
//   EVENT_DOC_CLOSE:          文書を閉じた時
//   EVENT_TAB_MOVED:          タブが移動された時
//   EVENT_CUSTOM_BAR_CLOSING: カスタムバーを閉じようとした時
//   EVENT_CUSTOM_BAR_CLOSED:  カスタムバーを閉じた時
//   EVENT_TOOL_BAR_CLOSED:    ツールバーを閉じた時
//   EVENT_TOOL_BAR_SHOW:      ツールバーが表示された時
//   EVENT_IDLE:               アイドル時

procedure OnEvents(hwnd: HWND; nEvent: Cardinal; lParam: LPARAM); stdcall;
var
  I: Integer;
  LFrame: TFrame;
begin
  if (nEvent and EVENT_CREATE) <> 0 then
  begin
    FList := TFrameList.Create;
  end
  else
  begin
    if Assigned(FList) then
    begin
      if (nEvent and EVENT_CREATE_FRAME) <> 0 then
      begin
        LFrame := TCustomBarFrame.Create;
        with LFrame do
        begin
          Handle := hwnd;
          OnEvents(hwnd, nEvent, lParam);
        end;
        FList.Add(LFrame);
      end
      else if (nEvent and EVENT_CLOSE_FRAME) <> 0 then
      begin
        LFrame := FList.Find(hwnd);
        if LFrame <> nil then
          with LFrame do
          begin
            OnEvents(hwnd, nEvent, lParam);
            FList.Remove(LFrame);
            Free;
          end;
      end
      else if (nEvent and EVENT_CLOSE) <> 0 then
      begin
        for I := FList.Count - 1 downto 0 do
          FList[I].Free;
        FList.Free;
      end
      else
      begin
        LFrame := FList.Find(hwnd);
        if LFrame <> nil then
          LFrame.OnEvents(hwnd, nEvent, lParam);
      end;
    end;
  end;
end;

// -----------------------------------------------------------------------------
// PluginProc
//   プラグインに送られるメッセージを処理します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nMsg:   メッセージ
//   wParam: メッセージ特有の追加情報
//   lParam: メッセージ特有の追加情報
// 戻り値
//   メッセージにより異なります

function PluginProc(hwnd: HWND; nMsg: Cardinal; wParam: WPARAM; lParam: LPARAM): LRESULT; stdcall;
var
  LFrame: TFrame;
begin
  Result := 0;
  case nMsg of
    MP_GET_NAME:
      begin
        Result := Length(SName);
        if lParam <> 0 then
          lstrcpynW(PChar(lParam), PChar(SName), wParam);
      end;
    MP_GET_VERSION:
      begin
        Result := Length(SVersion);
        if lParam <> 0 then
          lstrcpynW(PChar(lParam), PChar(SVersion), wParam);
      end;
  else
    begin
      LFrame := FList.Find(hwnd);
      if LFrame = nil then
      begin
        hwnd := GetParent(hwnd);
        LFrame := FList.Find(hwnd);
      end;
      if LFrame <> nil then
        Result := LFrame.PluginProc(hwnd, nMsg, wParam, lParam);
    end;
  end;
end;

exports
  OnCommand,
  QueryStatus,
  GetMenuTextID,
  GetStatusMessageID,
  GetIconID,
  OnEvents,
  PluginProc;

begin
{$IFDEF DEBUG}
  ReportMemoryLeaksOnShutdown := True;
{$ENDIF}

end.
