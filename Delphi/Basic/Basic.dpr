// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

library Basic;

{$R 'mPlugin.res' 'mPlugin.rc'}


uses
  Winapi.Windows,
  mPlugin in 'mPlugin.pas';

resourcestring
  SName = '��{�I�ȃT���v��';
  SVersion = '1.0.0';

const
  IDS_MENU_TEXT = 1;
  IDS_STATUS_MESSAGE = 2;
  IDI_ICON = 101;

{$IFDEF DEBUG}
{$R *.res}
{$ENDIF}

  // -----------------------------------------------------------------------------
  // OnCommand
  // �v���O�C�������s�������ɌĂяo����܂�
  // �p�����[�^
  //   hwnd: �E�B���h�E�̃n���h��

procedure OnCommand(hwnd: HWND); stdcall;
begin
  MessageBox(hwnd, 'Hello World!', '��{�I�ȃT���v��', MB_OK);
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
begin
  pbChecked^ := False;
  Result := True;
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
begin
  //
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
