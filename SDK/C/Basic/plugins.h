#pragma once

#define MAX_MODE_NAME 260
#define MAX_THEME_NAME 32

#define COLOR_GENERAL 0
#define COLOR_SELECTION 1
#define COLOR_CURRENT_LINE 2
#define COLOR_HYPERLINK 3
#define COLOR_STRING 4
#define COLOR_COMMENT 5
#define COLOR_SCRIPT 6
#define COLOR_BRACKET 7
#define COLOR_TAG 8
#define COLOR_KEYWORD_1 9
#define COLOR_KEYWORD_2 10
#define COLOR_KEYWORD_3 11
#define COLOR_KEYWORD_4 12
#define COLOR_KEYWORD_5 13
#define COLOR_KEYWORD_6 14
#define COLOR_KEYWORD_7 15
#define COLOR_KEYWORD_8 16
#define COLOR_CRLF 17
#define COLOR_WRAP 18
#define COLOR_TAB 19
#define COLOR_EOF 20
#define COLOR_CARET_LINE 21
#define COLOR_LINE_NUMBERS 22
#define COLOR_RULER 23
#define COLOR_VERTICAL_LINE 24
#define COLOR_SB_ALPHABETIC 25
#define COLOR_SB_NUMBER 26
#define COLOR_SB_SYMBOL 27
#define COLOR_SB_KATAKANA 28
#define COLOR_SB_SPACE 29
#define COLOR_DB_ALPHABET 30
#define COLOR_DB_NUMBER 31
#define COLOR_DB_SYMBOL 32
#define COLOR_DB_HIRAGANA 33
#define COLOR_DB_KATAKANA 34
#define COLOR_DB_KANJI 35
#define COLOR_DB_SPACE 36
#define COLOR_BOOKMARK 37
#define COLOR_SEARCH_STRING 38
#define COLOR_FOREIGN 39
#define COLOR_OTHER 40
#define COLOR_CONTROL 41
#define COLOR_INVALID 42

#define CUSTOM_BAR_LEFT 0
#define CUSTOM_BAR_TOP 1
#define CUSTOM_BAR_RIGHT 2
#define CUSTOM_BAR_BOTTOM 3
#define MAX_CUSTOM_BAR 4

#define EVENT_CREATE 0x00000001
#define EVENT_CLOSE 0x00000002
#define EVENT_CREATE_FRAME 0x00000004
#define EVENT_CLOSE_FRAME 0x00000008
#define EVENT_SET_FOCUS 0x00000010
#define EVENT_KILL_FOCUS 0x00000020
#define EVENT_FILE_OPENED 0x00000040
#define EVENT_FILE_SAVED 0x00000080
#define EVENT_MODIFIED 0x00000100
#define EVENT_CARET_MOVED 0x00000200
#define EVENT_SCROLL 0x00000400
#define EVENT_SEL_CHANGED 0x00000800
#define EVENT_CHANGED 0x00001000
#define EVENT_CHAR 0x00002000
#define EVENT_MODE_CHANGED 0x00004000
#define EVENT_DOC_SEL_CHANGED 0x00008000
#define EVENT_DOC_CLOSE 0x00010000
#define EVENT_TAB_MOVED 0x00020000
#define EVENT_CUSTOM_BAR_CLOSING 0x00040000
#define EVENT_CUSTOM_BAR_CLOSED 0x00080000
#define EVENT_TOOL_BAR_CLOSED 0x00100000
#define EVENT_TOOL_BAR_SHOW 0x00200000
#define EVENT_IDLE 0x00400000

#define CLOSED_FRAME_WINDOW 1
#define CLOSED_ANOTHER_CUSTOM_BAR 2

#define ME_FIRST (WM_USER + 0x0400)
#define ME_NEW (ME_FIRST + 0)
#define ME_GET_CMD_ID (ME_FIRST + 1)
#define ME_QUERY_STATUS (ME_FIRST + 2)
#define ME_GET_SEL_TEXT (ME_FIRST + 3)
#define ME_GET_LINES (ME_FIRST + 4)
#define ME_GET_LINE (ME_FIRST + 5)
#define ME_GET_CARET_POS (ME_FIRST + 6)
#define ME_GET_SCROLL_POS (ME_FIRST + 7)
#define ME_LINE_FROM_CHAR (ME_FIRST + 8)
#define ME_LINE_INDEX (ME_FIRST + 9)
#define ME_LOAD_FILE (ME_FIRST + 10)
#define ME_LOGICAL_TO_SERIAL (ME_FIRST + 11)
#define ME_LOGICAL_TO_VIEW (ME_FIRST + 12)
#define ME_SAVE_FILE (ME_FIRST + 13)
#define ME_SERIAL_TO_LOGICAL (ME_FIRST + 14)
#define ME_SET_CARET_POS (ME_FIRST + 15)
#define ME_SET_SCROLL_POS (ME_FIRST + 16)
#define ME_VIEW_TO_LOGICAL (ME_FIRST + 17)
#define ME_EXEC_COMMAND (ME_FIRST + 18)
#define ME_GET_MODIFIED (ME_FIRST + 19)
#define ME_SET_MODIFIED (ME_FIRST + 20)
#define ME_GET_SEL_START (ME_FIRST + 21)
#define ME_GET_SEL_END (ME_FIRST + 22)
#define ME_SET_SEL_LENGTH (ME_FIRST + 23)
#define ME_GET_MODE (ME_FIRST + 24)
#define ME_SET_MODE (ME_FIRST + 25)
#define ME_EMPTY_UNDO_BUFFER (ME_FIRST + 26)
#define ME_INSERT_STRING (ME_FIRST + 27)
#define ME_SET_SEL_VIEW (ME_FIRST + 28)
#define ME_FIND (ME_FIRST + 29)
#define ME_REPLACE (ME_FIRST + 30)
#define ME_SET_STATUS (ME_FIRST + 31)
#define ME_CONVERT (ME_FIRST + 32)
#define ME_GET_MARGIN (ME_FIRST + 33)
#define ME_GET_VERSION (ME_FIRST + 34)
#define ME_REDRAW (ME_FIRST + 35)
#define ME_GET_SEL_TYPE (ME_FIRST + 36)
#define ME_IS_CHAR_HALF_OR_FULL (ME_FIRST + 37)
#define ME_INFO (ME_FIRST + 38)
#define ME_GET_STATUS (ME_FIRST + 39)
#define ME_CUSTOM_BAR_OPEN (ME_FIRST + 40)
#define ME_CUSTOM_BAR_CLOSE (ME_FIRST + 41)
#define ME_MATCH_REGEX (ME_FIRST + 42)
#define ME_FIND_REGEX (ME_FIRST + 43)
#define ME_ENUM_MODE (ME_FIRST + 44)
#define ME_TOOL_BAR_OPEN (ME_FIRST + 45)
#define ME_TOOL_BAR_CLOSE (ME_FIRST + 46)
#define ME_TOOL_BAR_SHOW (ME_FIRST + 47)
#define ME_LAST (ME_FIRST + 255)

#define MI_GET_FILE_NAME 256
#define MI_GET_APP_VERSION 257
#define MI_IS_WINDOW_COMBINED 258
#define MI_WINDOW_COMBINE 259
#define MI_GET_DOC_COUNT 260
#define MI_INDEX_TO_DOC 261
#define MI_DOC_TO_INDEX 262
#define MI_GET_ACTIVE_INDEX 263
#define MI_SET_ACTIVE_INDEX 264
#define MI_GET_ACTIVE_DOC 265
#define MI_SET_ACTIVE_DOC 266
#define MI_CLOSE_DOC 267
#define MI_SAVE_DOC 268
#define MI_GET_FONT_NAME 269
#define MI_GET_FONT_CHARSET 270
#define MI_GET_FONT_SIZE 271
#define MI_GET_TEXT_COLOR 272
#define MI_GET_BACK_COLOR 273

#define POS_VIEW 0
#define POS_LOGICAL 1
#define POS_DEV 2
#define MAX_LINE_COLUMN_MODE 4
#define SEL_TYPE_NONE 0
#define SEL_TYPE_CHAR 1
#define SEL_TYPE_BOX 2
#define SEL_TYPE_SELECTED 0x0020
#define FLAG_MAKE_LOWER 0
#define FLAG_MAKE_UPPER 1
#define FLAG_HAN_TO_ZEN 2
#define FLAG_ZEN_TO_HAN 3
#define FLAG_CAPITALIZE 4
#define FLAG_CONVERT_SELECT_ALL 0x0100
#define FLAG_FIND_NEXT 0x00000001
#define FLAG_REPLACE_ALL 0x00000002
#define FLAG_FIND_OPEN_DOC 0x00000004
#define FLAG_FIND_MATCH_CASE 0x00000008
#define FLAG_FIND_RECURSIVE 0x00000010
#define FLAG_FIND_REG_EX 0x00000020
#define FLAG_FIND_WHOLE_WORD 0x00000040
#define FLAG_FIND_AROUND 0x00000080
#define FLAG_REPLACE_SEL_ONLY 0x00000100
#define FLAG_FIND_CLOSE 0x00000200
#define FLAG_FIND_FILENAMES_ONLY 0x00000400
#define FLAG_REPLACE_BACKUP 0x00000800
#define FLAG_LOGICAL 1

#define MP_FIRST (WM_USER + 0x0500)
#define MP_QUERY_PROPERTIES (MP_FIRST + 0)
#define MP_SET_PROPERTIES (MP_FIRST + 1)
#define MP_GET_NAME (MP_FIRST + 2)
#define MP_GET_VERSION (MP_FIRST + 3)
#define MP_PRE_TRANSLATE_MSG (MP_FIRST + 4)
#define MP_LAST (MP_FIRST + 50)

#define MEID_NEW 4096
#define MEID_NEW_PASTE 4097
#define MEID_NEW_PASTE_QUOTES 4098
#define MEID_OPEN 4099
#define MEID_FIND_IN_FILES 4100
#define MEID_SAVE_ALL 4101
#define MEID_SAVE_CLOSE_ALL 4102
#define MEID_CLOSE_ALL 4103
#define MEID_CASCADE 4104
#define MEID_TILE_HORZ 4105
#define MEID_TILE_VERT 4106
#define MEID_MINIMIZE_ALL 4107
#define MEID_CLOSE_TRAY_ICON 4108
#define MEID_FILE_NEW 4109
#define MEID_FILE_OPEN 4110
#define MEID_FILE_CLOSE_OPEN 4111
#define MEID_FILE_SAVE 4112
#define MEID_FILE_SAVE_AS 4113
#define MEID_FILE_SAVE_ALL 4114
#define MEID_FILE_INSERT 4115
#define MEID_FILE_RELOAD_AUTO_SELECT 4116
#define MEID_FILE_RELOAD_UTF16LE 4117
#define MEID_FILE_RELOAD_UTF16BE 4118
#define MEID_FILE_RELOAD_UTF8 4119
#define MEID_FILE_RELOAD_UTF7 4120
#define MEID_FILE_RELOAD_ARABIC 4121
#define MEID_FILE_RELOAD_BALTIC 4122
#define MEID_FILE_RELOAD_CENTRAL_EUROPEAN 4123
#define MEID_FILE_RELOAD_CHINESE_SIMPLIFIED 4124
#define MEID_FILE_RELOAD_CHINESE_TRADITIONAL 4125
#define MEID_FILE_RELOAD_CYRILLIC 4126
#define MEID_FILE_RELOAD_GREEK 4127
#define MEID_FILE_RELOAD_HEBREW 4128
#define MEID_FILE_RELOAD_EUC 4129
#define MEID_FILE_RELOAD_JIS 4130
#define MEID_FILE_RELOAD_SHIFTJIS 4131
#define MEID_FILE_RELOAD_KOREAN 4132
#define MEID_FILE_RELOAD_THAI 4133
#define MEID_FILE_RELOAD_TURKISH 4134
#define MEID_FILE_RELOAD_VIETNAMESE 4135
#define MEID_FILE_RELOAD_WESTERN_EUROPEAN 4136
#define MEID_FILE_LINE_ENDING_CRLF 4137
#define MEID_FILE_LINE_ENDING_CR 4138
#define MEID_FILE_LINE_ENDING_LF 4139
#define MEID_FILE_PRINT 4140
#define MEID_FILE_PRINT_PREVIEW 4141
#define MEID_FILE_SAVE_CLOSE 4142
#define MEID_FILE_CLOSE 4143
#define MEID_FILE_SAVE_CLOSE_ALL 4144
#define MEID_FILE_CLOSE_ALL 4145
#define MEID_EDIT_UNDO 4146
#define MEID_EDIT_REDO 4147
#define MEID_EDIT_CUT 4148
#define MEID_EDIT_COPY 4149
#define MEID_EDIT_PASTE 4150
#define MEID_EDIT_COPY_QUOTES 4151
#define MEID_EDIT_DELETE 4152
#define MEID_EDIT_SELECT_ALL 4153
#define MEID_EDIT_DATE_TIME 4154
#define MEID_EDIT_GO_TO_LINE 4155
#define MEID_EDIT_GO_TO_FILE 4156
#define MEID_EDIT_READ_ONLY 4157
#define MEID_EDIT_INSERT_NEW_LINES 4158
#define MEID_EDIT_REMOVE_NEW_LINES 4159
#define MEID_EDIT_SPLIT_LINES 4160
#define MEID_EDIT_JOIN_LINES 4161
#define MEID_EDIT_UPPER_CASE 4162
#define MEID_EDIT_LOWER_CASE 4163
#define MEID_EDIT_CAPITALIZE 4164
#define MEID_EDIT_HALF_WIDTH 4165
#define MEID_EDIT_FULL_WIDTH 4166
#define MEID_EDIT_TABIFY 4167
#define MEID_EDIT_UNTABIFY 4168
#define MEID_EDIT_INDENT 4169
#define MEID_EDIT_UNINDENT 4170
#define MEID_EDIT_RECONVERT 4171
#define MEID_EDIT_BASE64_DECODE 4172
#define MEID_EDIT_INSERT 4173
#define MEID_EDIT_TOGGLE_BOOKMARK 4174
#define MEID_EDIT_NEXT_BOOKMARK 4175
#define MEID_EDIT_PREV_BOOKMARK 4176
#define MEID_EDIT_CLEAR_BOOKMARK 4177
#define MEID_EDIT_TOGGLE_SPELL 4178
#define MEID_EDIT_NEXT_SPELL 4179
#define MEID_EDIT_PREV_SPELL 4180
#define MEID_SEARCH_FIND 4181
#define MEID_SEARCH_NEXT 4182
#define MEID_SEARCH_PREV 4183
#define MEID_SEARCH_NEXT_WORD 4184
#define MEID_SEARCH_PREV_WORD 4185
#define MEID_SEARCH_REPLACE 4186
#define MEID_SEARCH_ERASE_FIND_HIGHLIGHT 4187
#define MEID_SEARCH_FIND_IN_FILES 4188
#define MEID_SEARCH_REPLACE_IN_FILES 4189
#define MEID_SEARCH_GOOGLE 4190
#define MEID_SEARCH_WIKIPEDIA 4191
#define MEID_VIEW_MODE_CUSTOMIZE 4192
#define MEID_VIEW_INVERT_COLOR 4193
#define MEID_VIEW_WRAP_NONE 4194
#define MEID_VIEW_WRAP_BY_CHAR 4195
#define MEID_VIEW_WRAP_BY_WINDOW 4196
#define MEID_VIEW_SHOW_LINE_NUMBERS 4197
#define MEID_VIEW_SHOW_RULER 4198
#define MEID_VIEW_SHOW_CRLF 4199
#define MEID_VIEW_SHOW_WRAP 4200
#define MEID_VIEW_SHOW_EOF 4201
#define MEID_VIEW_SHOW_TABS 4202
#define MEID_VIEW_SHOW_SB_SPACES 4203
#define MEID_VIEW_SHOW_DB_SPACES 4204
#define MEID_VIEW_CRLF_DIFFERENT 4205
#define MEID_VIEW_STANDARD_BAR 4206
#define MEID_VIEW_MACROS_BAR 4207
#define MEID_VIEW_PLUGINS_BAR 4208
#define MEID_VIEW_TOOLS_BAR 4209
#define MEID_VIEW_TOOL_BAR_TITLES 4210
#define MEID_VIEW_LOCK_TOOL_BARS 4211
#define MEID_VIEW_TOOL_BAR_CUSTOMIZE 4212
#define MEID_VIEW_STATUS_BAR 4213
#define MEID_VIEW_INC_FONT_SIZE 4214
#define MEID_VIEW_DEC_FONT_SIZE 4215
#define MEID_VIEW_FONT_CUSTOMIZE 4216
#define MEID_MACROS_RECORD 4217
#define MEID_MACROS_RUN 4218
#define MEID_MACROS_SAVE 4219
#define MEID_MACROS_EDIT 4220
#define MEID_MACROS_SELECT 4221
#define MEID_MACROS_SELECT_THIS 4222
#define MEID_MACROS_CUSTOMIZE 4223
#define MEID_TOOLS_OPTIONS 4224
#define MEID_TOOLS_COMPLETION 4225
#define MEID_TOOLS_SQL_FORMAT 4226
#define MEID_TOOLS_XML_FORMAT 4227
#define MEID_TOOLS_PLUGIN_CUSTOMIZE 4228
#define MEID_TOOLS_TOOL_CUSTOMIZE 4229
#define MEID_TOOLS_POPUP_MENU_CUSTOMIZE 4230
#define MEID_WINDOW_ALWAYS_TOP 4231
#define MEID_WINDOW_SPLIT 4232
#define MEID_WINDOW_NEXT_PANE 4233
#define MEID_WINDOW_PREV_PANE 4234
#define MEID_WINDOW_ACTIVE_PANE 4235
#define MEID_WINDOW_COMBINE 4236
#define MEID_WINDOW_CASCADE 4237
#define MEID_WINDOW_TILE_HORZ 4238
#define MEID_WINDOW_TILE_VERT 4239
#define MEID_WINDOW_MINIMIZE_ALL 4240
#define MEID_WINDOW_NEXT 4241
#define MEID_WINDOW_PREV 4242
#define MEID_HELP_ONLINE 4243
#define MEID_HELP_KEYBOARD_MAP 4244
#define MEID_HELP_ABOUT 4245

#define MEID_MY_DICTS 4096
#define MEID_MY_MODES 5120
#define MEID_MY_MACROS 6144
#define MEID_MY_PLUGINS 7168
#define MEID_MY_TOOLS 8192

typedef struct _GET_LINE_INFO
{
	UINT_PTR cch;
	UINT flags;
	UINT_PTR yLine;
} GET_LINE_INFO;

typedef struct _MATCH_REGEX_INFO
{
	size_t cbSize;
	UINT nFlags;
	LPCWSTR pszRegex;
	LPCWSTR pszText;
	LPCWSTR pszReplace;
	LPWSTR pszResult;
	UINT cchResult;
} MATCH_REGEX_INFO;

typedef struct _FIND_REGEX_INFO
{
	size_t cbSize;
	UINT nFlags;
	LPCWSTR pszRegex;
	LPCWSTR pszText;
	LPCWSTR* ppszStart;
	LPCWSTR* ppszEnd;
	LPCWSTR* ppszNext;
} FIND_REGEX_INFO;

typedef struct _CUSTOM_BAR_INFO
{
	size_t cbSize;
	HWND hwndCustomBar;
	HWND hwndClient;
	LPCTSTR pszTitle;
	int iPos;
} CUSTOM_BAR_INFO;

typedef struct _CUSTOM_BAR_CLOSE_INFO
{
	UINT nID;
	int iPos;
	DWORD dwFlags;
} CUSTOM_BAR_CLOSE_INFO;

typedef struct tagPOINT_PTR
{
	LONG x;
	LONG y;
} POINT_PTR, *PPOINT_PTR;

typedef struct tagSIZE_PTR
{
	LONG cx;
	LONG cy;
} SIZE_PTR, *PSIZE_PTR;

typedef struct _TOOLBAR_INFO
{
	size_t cbSize;
	HWND hwndToolBar;
	HWND hwndClient;
	LPCTSTR pszTitle;
	UINT nID;
	UINT nFlags;
	BOOL bVisible;
} TOOLBAR_INFO;

// -----------------------------------------------------------------------------
// Editor_New
//   新規にファイルを作成します
// パラメータ
//   hwnd:      ウィンドウのハンドル
// 戻り値
//   ウィンドウのハンドル

inline UINT Editor_New(HWND hwnd)
{
	return (UINT)SendMessage(hwnd, ME_NEW, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   プラグインのコマンドIDを取得します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   hInstance: プラグインのインスタンスのハンドル
// 戻り値
//   プラグインを実行するためのコマンドID

inline UINT Editor_GetCmdID(HWND hwnd, HINSTANCE hInstance)
{
	return (UINT)SendMessage(hwnd, ME_GET_CMD_ID, 0, (LPARAM)hInstance);
}

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   プラグインが実行可能か、またはチェックされた状態かを調べます
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   nCmdID:    実行するプラグインのコマンドID
//   pbChecked: チェックの状態
// 戻り値
//   実行可能であればTrueを返します

inline BOOL Editor_QueryStatus(HWND hwnd, UINT nCmdID, BOOL* pbChecked)
{
	return (BOOL)SendMessage(hwnd, ME_QUERY_STATUS, (WPARAM)nCmdID, (LPARAM)pbChecked);
}

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   選択されている文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   nBufferSize: 終端文字を含むバッファのサイズ
//   szBuffer:    文字列を取得するバッファへのポインタ
// 戻り値
//   nBufferSizeが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline UINT_PTR Editor_GetSelText(HWND hwnd, UINT_PTR nBufferSize, LPWSTR szBuffer)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_SEL_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetLines
//   文書の行数を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
// 戻り値
//   文書の行数を返します

inline UINT_PTR Editor_GetLines(HWND hwnd, int nLogical)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_LINES, (WPARAM)(int)(nLogical), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetLine
//   指定した行の文字列を取得します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   pGetLineInfo: GET_LINE_INFO構造体へのポインタ
//   szString:     文字列を取得するバッファへのポインタ
// 戻り値
//   pGetLineInfo->cchが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline UINT_PTR Editor_GetLine(HWND hwnd, GET_LINE_INFO* pGetLineInfo, LPWSTR szString)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_LINE, (WPARAM)(GET_LINE_INFO*)(pGetLineInfo), (LPARAM)(LPWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_GetCaretPos
//   カーソル位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   カーソルの位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetCaretPos(HWND hwnd, int nLogical, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_GET_CARET_POS, (WPARAM)nLogical, (LPARAM)pptPos);
}

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   スクロールバーの位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   pptPos:   スクロールバーの位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetScrollPos(HWND hwnd, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_GET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_LineFromChar
//   指定したシリアル位置の行番号を返します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   nLogical:     POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   nSerialIndex: シリアル位置(-1を指定した場合はカーソル位置)
// 戻り値
//   行番号を返します

inline UINT_PTR Editor_LineFromChar(HWND hwnd, int nLogical, UINT_PTR nSerialIndex)
{
	return (UINT_PTR)SendMessage(hwnd, ME_LINE_FROM_CHAR, (WPARAM)(int)(nLogical), (LPARAM)(UINT_PTR)(nSerialIndex));
}

// -----------------------------------------------------------------------------
// Editor_LineIndex
//   指定した行番号のシリアル位置を返します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   yLine:    行番号(-1を指定した場合はカーソル行)
// 戻り値
//   シリアル位置を返します

inline UINT_PTR Editor_LineIndex(HWND hwnd, BOOL bLogical, UINT_PTR yLine)
{
	return (UINT_PTR)SendMessage(hwnd, ME_LINE_INDEX, (WPARAM)(BOOL)(bLogical), (LPARAM)(UINT_PTR)(yLine));
}

// -----------------------------------------------------------------------------
// Editor_LoadFile
//   ファイルを開きます
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   bAllowNewWindow: 新しいウィンドウで開きます
//   szFileName:      読み込むファイル名
// 戻り値
//   成功するとTrueを返します

inline BOOL Editor_LoadFile(HWND hwnd, LPCWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_LOAD_FILE, (WPARAM)0, (LPARAM)(LPCWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_LogicalToSerial
//   論理座標をシリアル位置に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   pptLogical: 論理座標を指定した構造体へのポインタ
// 戻り値
//   シリアル位置を返します

inline UINT_PTR Editor_LogicalToSerial(HWND hwnd, POINT_PTR* pptLogical)
{
	return (UINT_PTR)SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, (WPARAM)0, (LPARAM)(POINT_PTR*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_LogicalToView
//   論理座標を表示座標に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   pptLogical: 論理座標を指定した構造体へのポインタ
//   pptView:    表示座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_LogicalToView(HWND hwnd, POINT_PTR* pptLogical, POINT_PTR* pptView)
{
	SendMessage(hwnd, ME_LOGICAL_TO_VIEW, (WPARAM)(POINT_PTR*)(pptLogical), (LPARAM)(POINT_PTR*)(pptView));
}

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   ファイルに保存します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   bReplace:   使用されません
//   szFileName: 保存するファイル名
// 戻り値
//   成功するとTrueを返します

inline BOOL Editor_SaveFile(HWND hwnd, BOOL bReplace, LPWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_SAVE_FILE, (WPARAM)(BOOL)(bReplace), (LPARAM)(LPWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_SerialToLogical
//   シリアル位置を論理座標に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nSerial:    シリアル位置
//   pptLogical: 論理座標を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_SerialToLogical(HWND hwnd, UINT_PTR nSerial, POINT_PTR* pptLogical)
{
	SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, (WPARAM)(UINT_PTR)(nSerial), (LPARAM)(POINT_PTR*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_SetCaretPos
//   カーソル位置を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   カーソル位置を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_SetCaretPos(HWND hwnd, int nLogical, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_SET_CARET_POS, (WPARAM)(int)(nLogical), (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetCaretPosEx
//   カーソル位置を設定します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   nLogical:  POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:    カーソル位置を指定した構造体へのポインタ
//   bExtend:   選択範囲を伸縮するかどうか
// 戻り値
//   使用されません

inline void Editor_SetCaretPosEx(HWND hwnd, int nLogical, POINT_PTR* pptPos, BOOL bExtend)
{
	SendMessage(hwnd, ME_SET_CARET_POS, MAKEWPARAM(nLogical, bExtend), (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   スクロールバーの位置を設定します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptPos: スクロールバーの位置を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_SetScrollPos(HWND hwnd, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_SET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   表示座標を論理座標に変換します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptView:    表示座標を指定した構造体へのポインタ
//   pptLogical: 論理座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_ViewToLogical(HWND hwnd, POINT_PTR* pptView, POINT_PTR* pptLogical)
{
	SendMessage(hwnd, ME_VIEW_TO_LOGICAL, (WPARAM)(POINT_PTR*)(pptView), (LPARAM)(POINT_PTR*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   指定するコマンドIDを実行します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   pptView: 実行するコマンドID
// 戻り値
//   使用されません

inline void Editor_ExecCommand(HWND hwnd, UINT nCmdID)
{
	SendMessage(hwnd, ME_EXEC_COMMAND, (WPARAM)(UINT)(nCmdID), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetModified
//   文書が更新されているかどうかを取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   更新されている場合はTrueを返します

inline BOOL Editor_GetModified(HWND hwnd)
{
	return (BOOL)SendMessage(hwnd, ME_GET_MODIFIED, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_SetModified
//   文書が更新されているかどうかを設定します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   bModified: 更新の状態
// 戻り値
//   使用されません

inline void Editor_SetModified(HWND hwnd, BOOL bModified)
{
	(void)SendMessage(hwnd, ME_SET_MODIFIED, (WPARAM)(BOOL)(bModified), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetSelStart
//   選択文字列の開始位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   選択文字列の開始位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetSelStart(HWND hwnd, int nLogical, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_START, (WPARAM)(int)(nLogical), (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_GetSelEnd
//   選択文字列の終了位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   選択文字列の終了位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetSelEnd(HWND hwnd, int nLogical, POINT_PTR* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_END, (WPARAM)(int)(nLogical), (LPARAM)(POINT_PTR*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   選択文字列の長さを設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   nLen: 選択文字列の長さ
// 戻り値
//   使用されません

inline void Editor_SetSelLength(HWND hwnd, UINT_PTR nLen)
{
	(void)SendMessage(hwnd, ME_SET_SEL_LENGTH, (WPARAM)(UINT_PTR)(nLen), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetMode
//   編集モードを文字列で取得します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   szModeName: 名称を取得するバッファ(MAX_MODE_NAMEの文字数)
// 戻り値
//   使用されません

inline void Editor_GetMode(HWND hwnd, LPWSTR szModeName)
{
	SendMessage(hwnd, ME_GET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_SetMode
//   編集モードを文字列で設定します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   szModeName: 編集モードの名称
// 戻り値
//   使用されません

inline BOOL Editor_SetMode(HWND hwnd, LPWSTR szModeName)
{
	return (BOOL)SendMessage(hwnd, ME_SET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_EmptyUndoBuffer
//   元に戻す、やり直しのバッファを空にします
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

inline void Editor_EmptyUndoBuffer(HWND hwnd)
{
	SendMessage(hwnd, ME_EMPTY_UNDO_BUFFER, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_InsertString
//   カーソル位置に文字列を挿入または上書きします
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

inline void Editor_InsertString(HWND hwnd, LPCWSTR szString, bool bKeepDestReturnType = false)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)0, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_SetSelView
//   選択文字列の開始位置と終了位置を設定します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   pptSelStart: 選択文字列の開始位置を表す構造体へのポインタ
//   pptSelEnd:   選択文字列の終了位置を表す構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_SetSelView(HWND hwnd, POINT_PTR* pptSelStart, POINT_PTR* pptSelEnd)
{
	SendMessage(hwnd, ME_SET_SEL_VIEW, (WPARAM)(POINT_PTR*)(pptSelStart), (LPARAM)(POINT_PTR*)(pptSelEnd));
}

// -----------------------------------------------------------------------------
// Editor_Find
//   文字列を検索します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nFlags: フラグ
//   szFind: 検索する文字列
// 戻り値
//   成功するとTrueを返します
// 備考
//   FLAG_FIND_NEXT:      下方向に検索します
//   FLAG_FIND_CASE:      大文字と小文字を区別します
//   FLAG_FIND_ONLY_WORD: 単語のみ検索します
//   FLAG_FIND_AROUND:    文末まで検索したら文頭に移動します
//   FLAG_FIND_REG_EXP:   正規表現を使用します

inline BOOL Editor_Find(HWND hwnd, UINT nFlags, LPCWSTR szFind)
{
	return (BOOL)SendMessage(hwnd, ME_FIND, (WPARAM)(UINT)(nFlags), (LPARAM)(LPCWSTR)(szFind));
}

// -----------------------------------------------------------------------------
// Editor_Replace
//   文字列を置換します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nFlags: フラグ
//   szFind: 検索する文字列と置換する文字列(区切り、終端に#0を指定)
// 戻り値
//   成功するとTrueを返します
// 備考
//   FLAG_FIND_CASE:        大文字と小文字を区別します
//   FLAG_FIND_ONLY_WORD:   単語のみ検索します
//   FLAG_FIND_REG_EXP:     正規表現を使用します
//   FLAG_REPLACE_SEL_ONLY: 選択した範囲のみを対象とします

inline BOOL Editor_Replace(HWND hwnd, UINT nFlags, LPCWSTR szFindReplace)
{
	return (BOOL)SendMessage(hwnd, ME_REPLACE, (WPARAM)(UINT)(nFlags), (LPARAM)(LPCWSTR)(szFindReplace));
}

// -----------------------------------------------------------------------------
// Editor_SetStatus
//   ステータスバーに表示する文字列を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szStatus: ステータスバーに表示する文字列
// 戻り値
//   使用されません

inline void Editor_SetStatus(HWND hwnd, LPCWSTR szStatus)
{
	SendMessage(hwnd, ME_SET_STATUS, (WPARAM)0, (LPARAM)(LPCWSTR)(szStatus));
}

// -----------------------------------------------------------------------------
// Editor_Convert
//   文字列を変換します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nFlags: フラグ
// 戻り値
//   成功するとTrueを返します
// 備考
//   FLAG_MAKE_LOWER:         小文字に変換します
//   FLAG_MAKE_UPPER:         大文字に変換します
//   FLAG_HAN_TO_ZEN:         全角に変換します
//   FLAG_ZEN_TO_HAN:         半角に変換します
//   FLAG_CONVERT_SELECT_ALL: 文書全体を対象とします

inline BOOL Editor_Convert(HWND hwnd, UINT nFlags)
{
	return (BOOL)SendMessage(hwnd, ME_CONVERT, (WPARAM)(UINT)(nFlags), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetMargin
//   折り返し桁数を返します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   折り返し桁数を返します

inline UINT_PTR Editor_GetMargin(HWND hwnd)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_MARGIN, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetVersion
//   バージョン番号を返します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   バージョン番号を返します

inline UINT Editor_GetVersion(HWND hwnd)
{
	return (UINT)SendMessage(hwnd, ME_GET_VERSION, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetVersionEx
//   実装していません

inline UINT Editor_GetVersionEx(HWND hwnd, UINT* pnProductType)
{
	return (UINT)SendMessage(hwnd, ME_GET_VERSION, (WPARAM)pnProductType, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_Redraw
//   ウィンドウの再描画を行うかどうかを指定します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   bRedraw: Falseを指定すると、次にTrueを指定するまで再描画を行いません
// 戻り値
//   使用されません

inline void Editor_Redraw(HWND hwnd, BOOL bRedraw)
{
	SendMessage(hwnd, ME_REDRAW, (WPARAM)bRedraw, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetSelType
//   選択状態の種類を取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   SEL_TYPE_NONE: 選択されていません
//   SEL_TYPE_CHAR: 通常選択されています
//   SEL_TYPE_BOX:  矩形選択されています

inline int Editor_GetSelType(HWND hwnd)
{
	return (int)SendMessage(hwnd, ME_GET_SEL_TYPE, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_IsCharHalfOrFull
//   指定する文字が半角か全角かを調べます
// パラメータ
//   hwnd: ウィンドウのハンドル
//   ch:   調べたい文字
// 戻り値
//   半角の場合は1、全角の場合は2を返します

inline int Editor_IsCharHalfOrFull(HWND hwnd, WCHAR ch)
{
	return (int)SendMessage(hwnd, ME_IS_CHAR_HALF_OR_FULL, (WPARAM)ch, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_Info
//   文書の情報を取得・設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   nCmd: 取得・設定する情報の種類
// 戻り値
//   nCmdにより異なります
// 備考
//   MI_GET_FILE_NAME:      開いているファイル名を取得します
//   MI_GET_APP_VERSION:    バージョンを取得します
//   MI_IS_WINDOW_COMBINED: タブの有効・無効を取得します
//   MI_WINDOW_COMBINE:     タブの有効・無効を設定します
//   MI_GET_DOC_COUNT:      開いている文書の数を取得します
//   MI_INDEX_TO_DOC:       文書のインデックスからハンドルに変換します
//   MI_DOC_TO_INDEX:       文書のハンドルからインデックスに変換します
//   MI_GET_ACTIVE_INDEX:   アクティブな文書のインデックスを取得します
//   MI_SET_ACTIVE_INDEX:   インデックスを指定して文書をアクティブにします
//   MI_GET_ACTIVE_DOC:     アクティブな文書のハンドルを取得します
//   MI_SET_ACTIVE_DOC:     ハンドルを指定して文書をアクティブにします
//   MI_CLOSE_DOC:          文書を閉じます
//   MI_SAVE_DOC:           文書を保存します
//   MI_GET_FONT_NAME:      フォント名を取得します
//   MI_GET_FONT_CHARSET:   フォントの文字セットを取得します
//   MI_GET_FONT_SIZE:      フォントのサイズを取得します
//   MI_GET_TEXT_COLOR:     文字の色を取得します
//   MI_GET_BACK_COLOR:     背景の色を取得します

inline LRESULT Editor_Info(HWND hwnd, WPARAM nCmd, LPARAM lParam)
{
	return (LRESULT)SendMessage(hwnd, ME_INFO, (WPARAM)nCmd, (LPARAM)lParam);
}

// -----------------------------------------------------------------------------
// Editor_GetStatus
//   ステータスバーに表示されている文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   szStatus:    文字列を取得するバッファ
//   nBufferSize: 文字列を取得するバッファのサイズ
// 戻り値
//   文字列を取得するのに必要なバッファのサイズ

inline UINT_PTR Editor_GetStatus(HWND hwnd, LPCWSTR szStatus, UINT_PTR nBufSize)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_STATUS, (WPARAM)nBufSize, (LPARAM)(LPCWSTR)(szStatus));
}

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   カスタムバーを開きます
// パラメータ
//   hwnd:           ウィンドウのハンドル
//   pCustomBarInfo: CUSTOM_BAR_INFO構造体へのポインタ
// 戻り値
//   成功するとカスタムバーのIDを返します

inline UINT Editor_CustomBarOpen(HWND hwnd, CUSTOM_BAR_INFO* pCustomBarInfo)
{
	return (UINT)SendMessage(hwnd, ME_CUSTOM_BAR_OPEN, 0, (LPARAM)pCustomBarInfo);
}

// -----------------------------------------------------------------------------
// Editor_CustomBarClose
//   カスタムバーを閉じます
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   nCustomBarID: カスタムバーのID
// 戻り値
//   使用されません

inline BOOL Editor_CustomBarClose(HWND hwnd, UINT nCustomBarID)
{
	return (BOOL)SendMessage(hwnd, ME_CUSTOM_BAR_CLOSE, (WPARAM)nCustomBarID, 0);
}

// -----------------------------------------------------------------------------
// Editor_MatchRegEx
//   正規表現で指定した文字列が一致するかどうかを調べます
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   pMatchRegExInfo: MATCH_REGEX_INFO構造体へのポインタ
// 戻り値
//   指定する文字列が一致する場合はTrueを返します

inline BOOL Editor_MatchRegex(HWND hwnd, MATCH_REGEX_INFO* pMatchRegexInfo)
{
	return (BOOL)SendMessage(hwnd, ME_MATCH_REGEX, (WPARAM)0, (LPARAM)pMatchRegexInfo);
}

// -----------------------------------------------------------------------------
// Editor_FindRegEx
//   正規表現を指定した文字列から検索します
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   pMatchRegExInfo: FIND_REGEX_INFO構造体へのポインタ
// 戻り値
//   指定する文字列が一致する文字列が見つかった場合はTrueを返します

inline BOOL Editor_FindRegex(HWND hwnd, FIND_REGEX_INFO* pFindRegexInfo)
{
	return (BOOL)SendMessage(hwnd, ME_FIND_REGEX, (WPARAM)0, (LPARAM)pFindRegexInfo);
}

// -----------------------------------------------------------------------------
// Editor_EnumMode
//   編集モードの一覧を取得します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pBuf:   文字列を取得するバッファへのポインタ
//   cchBuf: 終端文字を含むバッファのサイズ
// 戻り値
//   cchBufが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline size_t Editor_EnumConfig(HWND hwnd, LPWSTR pBuf, size_t cchBuf)
{
	return (size_t)SendMessage(hwnd, ME_ENUM_MODE, (WPARAM)cchBuf, (LPARAM)pBuf);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarOpen
//   ツールバーを開きます
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   pToolBarInfo: TOOL_BAR_INFO構造体へのポインタ
// 戻り値
//   成功するとツールバーのIDを返します

inline UINT Editor_ToolBarOpen(HWND hwnd, TOOLBAR_INFO* pToolBarInfo)
{
	return (UINT)SendMessage(hwnd, ME_TOOL_BAR_OPEN, 0, (LPARAM)pToolBarInfo);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarClose
//   ツールバーを閉じます
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nToolBarID: ツールバーのID
// 戻り値
//   使用されません

inline BOOL Editor_ToolBarClose(HWND hwnd, UINT nToolBarID)
{
	return (BOOL)SendMessage(hwnd, ME_TOOL_BAR_CLOSE, (WPARAM)nToolBarID, 0);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarShow
//   ツールバーの表示/非表示を切り替えます
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nToolBarID: ツールバーのID
//   bVisible:   表示の状態
// 戻り値
//   使用されません

inline BOOL Editor_ToolBarShow(HWND hwnd, UINT nToolBarID, BOOL bVisible)
{
	return (BOOL)SendMessage(hwnd, ME_TOOL_BAR_SHOW, (WPARAM)nToolBarID, (LPARAM)bVisible);
}