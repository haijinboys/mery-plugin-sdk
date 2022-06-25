#include "stdafx.h"
#include "plugin.h"

#define IDS_MENU_TEXT 1
#define IDS_STATUSMESSAGE 2
#define IDI_ICON 101

// -----------------------------------------------------------------------------
// OnCommand
// �v���O�C�������s�������ɌĂяo����܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��

EXTERN_C void WINAPI OnCommand(HWND hwnd)
{
	MessageBox(hwnd, L"Hello World!", L"��{�I�ȃT���v��", MB_OK);
}

// -----------------------------------------------------------------------------
// QueryStatus
//   �v���O�C�������s�\���A�܂��̓`�F�b�N���ꂽ��Ԃ��𒲂ׂ܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   pbChecked: �`�F�b�N�̏��
// �߂�l
//   ���s�\�ł����True��Ԃ��܂�

EXTERN_C BOOL WINAPI QueryStatus(HWND hwnd, LPBOOL pbChecked)
{
	return true;
}

// -----------------------------------------------------------------------------
// GetMenuTextID
//   ���j���[�ɕ\������e�L�X�g�̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

EXTERN_C UINT WINAPI GetMenuTextID()
{
	return IDS_MENU_TEXT;
}

// -----------------------------------------------------------------------------
// GetStatusMessageID
//   �c�[���`�b�v�ɕ\������e�L�X�g�̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

EXTERN_C UINT WINAPI GetStatusMessageID()
{
	return IDS_STATUSMESSAGE;
}

// -----------------------------------------------------------------------------
// GetIconID
//   �c�[���o�[�ɕ\������A�C�R���̃��\�[�X���ʎq���擾���܂�
// �߂�l
//   ���\�[�X���ʎq

EXTERN_C UINT WINAPI GetIconID()
{
	return IDI_ICON;
}

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

EXTERN_C void WINAPI OnEvents(HWND hwnd, UINT nEvent, LPARAM lParam)
{
	//
}

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

EXTERN_C LRESULT WINAPI PluginProc(HWND hwnd, UINT nMsg, WPARAM wParam, LPARAM lParam)
{
	wchar_t szName[] = L"��{�I�ȃT���v��";
	wchar_t szVersion[] = L"Version 2.0.0";
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
