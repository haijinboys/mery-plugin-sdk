#include "stdafx.h"
#include "plugin.h"

#define IDS_MENU_TEXT 1
#define IDS_STATUSMESSAGE 2
#define IDI_ICON 101

// -----------------------------------------------------------------------------
// OnCommand
// プラグインを実行した時に呼び出されます
// パラメータ
//   hwnd: ウィンドウのハンドル

EXTERN_C void WINAPI OnCommand(HWND hwnd)
{
	MessageBox(hwnd, L"Hello World!", L"基本的なサンプル", MB_OK);
}

// -----------------------------------------------------------------------------
// QueryStatus
//   プラグインが実行可能か、またはチェックされた状態かを調べます
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   pbChecked: チェックの状態
// 戻り値
//   実行可能であればTrueを返します

EXTERN_C BOOL WINAPI QueryStatus(HWND hwnd, LPBOOL pbChecked)
{
	return true;
}

// -----------------------------------------------------------------------------
// GetMenuTextID
//   メニューに表示するテキストのリソース識別子を取得します
// 戻り値
//   リソース識別子

EXTERN_C UINT WINAPI GetMenuTextID()
{
	return IDS_MENU_TEXT;
}

// -----------------------------------------------------------------------------
// GetStatusMessageID
//   ツールチップに表示するテキストのリソース識別子を取得します
// 戻り値
//   リソース識別子

EXTERN_C UINT WINAPI GetStatusMessageID()
{
	return IDS_STATUSMESSAGE;
}

// -----------------------------------------------------------------------------
// GetIconID
//   ツールバーに表示するアイコンのリソース識別子を取得します
// 戻り値
//   リソース識別子

EXTERN_C UINT WINAPI GetIconID()
{
	return IDI_ICON;
}

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

EXTERN_C void WINAPI OnEvents(HWND hwnd, UINT nEvent, LPARAM lParam)
{
	//
}

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

EXTERN_C LRESULT WINAPI PluginProc(HWND hwnd, UINT nMsg, WPARAM wParam, LPARAM lParam)
{
	wchar_t szName[] = L"基本的なサンプル";
	wchar_t szVersion[] = L"Version 2.0.0.0";
	switch(nMsg)
	{
	case MP_GET_NAME:
		if(lParam != 0)
			lstrcpynW(LPWSTR(lParam), szName, wParam);
		return wcslen(szName);
	case MP_GET_VERSION:
		if(lParam != 0)
			lstrcpynW(LPWSTR(lParam), szVersion, wParam);
		return wcslen(szVersion);
	}
	return	0;
}
