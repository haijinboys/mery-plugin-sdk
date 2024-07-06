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
  // �v���O�C�������s�������ɌĂяo����܂�
  // �p�����[�^
  //   hwnd: �E�B���h�E�̃n���h��

procedure OnCommand(hwnd: HWND); stdcall;
var
  LFrame: TFrame;
begin
  LFrame := FList.Find(hwnd);
  LFrame.OnCommand(hwnd);
end;

// -----------------------------------------------------------------------------
// QueryStatus
//   �v���O�C�������s�\���A�܂��̓`�F�b�N���ꂽ��Ԃ��𒲂ׂ܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   pbChecked: �`�F�b�N�̏��
// �߂�l
//   ���s�\�ł����True��Ԃ��܂�

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
//   ���j���[�ɕ\������e�L�X�g�̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

function GetMenuTextID: Cardinal; stdcall;
begin
  Result := IDS_MENU_TEXT;
end;

// -----------------------------------------------------------------------------
// GetStatusMessageID
//   �c�[���`�b�v�ɕ\������e�L�X�g�̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

function GetStatusMessageID: Cardinal; stdcall;
begin
  Result := IDS_STATUS_MESSAGE;
end;

// -----------------------------------------------------------------------------
// GetIconID
//   �c�[���o�[�ɕ\������A�C�R���̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

function GetIconID: Cardinal; stdcall;
begin
  Result := IDI_ICON;
end;

// -----------------------------------------------------------------------------
// OnEvents
//   �C�x���g�������������ɌĂяo����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nEvent: �C�x���g�̎��
//   lParam: ���b�Z�[�W���L�̒ǉ����
// ���l
//   EVENT_CREATE:             �G�f�B�^���N��������
//   EVENT_CLOSE:              �G�f�B�^���I��������
//   EVENT_CREATE_FRAME:       �t���[�����쐬���ꂽ��
//   EVENT_CLOSE_FRAME:        �t���[�����j�����ꂽ��
//   EVENT_SET_FOCUS:          �t�H�[�J�X���擾������
//   EVENT_KILL_FOCUS:         �t�H�[�J�X����������
//   EVENT_FILE_OPENED:        �t�@�C�����J������
//   EVENT_FILE_SAVED:         �t�@�C����ۑ�������
//   EVENT_MODIFIED:           �X�V�̏�Ԃ��ύX���ꂽ��
//   EVENT_CARET_MOVED:        �J�[�\�����ړ�������
//   EVENT_SCROLL:             �X�N���[�����ꂽ��
//   EVENT_SEL_CHANGED:        �I��͈͂��ύX���ꂽ��
//   EVENT_CHANGED:            �e�L�X�g���ύX���ꂽ��
//   EVENT_CHAR:               ���������͂��ꂽ��
//   EVENT_MODE_CHANGED:       �ҏW���[�h���ύX���ꂽ��
//   EVENT_DOC_SEL_CHANGED:    �A�N�e�B�u�ȕ������ύX���ꂽ��
//   EVENT_DOC_CLOSE:          �����������
//   EVENT_TAB_MOVED:          �^�u���ړ����ꂽ��
//   EVENT_CUSTOM_BAR_CLOSING: �J�X�^���o�[����悤�Ƃ�����
//   EVENT_CUSTOM_BAR_CLOSED:  �J�X�^���o�[�������
//   EVENT_TOOL_BAR_CLOSED:    �c�[���o�[�������
//   EVENT_TOOL_BAR_SHOW:      �c�[���o�[���\�����ꂽ��
//   EVENT_IDLE:               �A�C�h����

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
//   �v���O�C���ɑ����郁�b�Z�[�W���������܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nMsg:   ���b�Z�[�W
//   wParam: ���b�Z�[�W���L�̒ǉ����
//   lParam: ���b�Z�[�W���L�̒ǉ����
// �߂�l
//   ���b�Z�[�W�ɂ��قȂ�܂�

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
