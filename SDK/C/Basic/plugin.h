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
// 2.6.9
#define COLOR_CHANGED_LINE_NUMBERS 43
#define COLOR_SPELL 44
#define COLOR_AUTO_MARKER 45
#define COLOR_MARKER_1 46
#define COLOR_MARKER_2 47
#define COLOR_MARKER_3 48
#define COLOR_MARKER_4 49
#define COLOR_MARKER_5 50
#define COLOR_MARKER_6 51
#define COLOR_MARKER_7 52
#define COLOR_MARKER_8 53
#define COLOR_INDICATOR_MODIFIED 54
#define COLOR_INDICATOR_SAVED 55

// 2.5.0
#define DWRITE_GAMMA 256
#define DWRITE_ENHANCED_CONTRAST 257
#define DWRITE_CLEAR_TYPE_LEVEL 258
#define DWRITE_RENDERING_MODE 259

// 2.6.10
#define ENCODING_NONE 0
#define ENCODING_UTF16LE 65537
#define ENCODING_UTF16LEBOM 655371
#define ENCODING_UTF16LENOBOM 655370
#define ENCODING_UTF16BE 65538
#define ENCODING_UTF16BEBOM 655381
#define ENCODING_UTF16BENOBOM 655380
#define ENCODING_UTF8 65001
#define ENCODING_UTF8BOM 650011
#define ENCODING_UTF8NOBOM 650010
#define ENCODING_UTF7 65000
#define ENCODING_ARABIC 1256
#define ENCODING_BALTIC 1257
#define ENCODING_CENTRALEUROPEAN 1250
#define ENCODING_CHINESESIMPLIFIED 936
#define ENCODING_CHINESETRADITIONAL 950
#define ENCODING_CYRILLIC 1251
#define ENCODING_GREEK 1253
#define ENCODING_HEBREW 1255
#define ENCODING_EUC 51932
#define ENCODING_JIS 50222
#define ENCODING_SHIFTJIS 932
#define ENCODING_KOREAN 949
#define ENCODING_THAI 874
#define ENCODING_TURKISH 1254
#define ENCODING_VIETNAMESE 1258
#define ENCODING_WESTERNEUROPEAN 1252

#define LINE_ENDING_CRLF 0
#define LINE_ENDING_CR 1
#define LINE_ENDING_LF 2

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
// 2.3.0
#define EVENT_FILE_SAVING 0x00800000
// 2.4.0
#define EVENT_DPI_CHANGED 0x01000000

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
#define ME_OUTPUT_STRING (ME_FIRST + 48)
#define ME_GET_OUTPUT_STRING (ME_FIRST + 49)
// 2.5.0
#define ME_DO_IDLE (ME_FIRST + 50)
// 2.6.10
#define ME_GET_TEXT (ME_FIRST + 51)
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
#define MI_GET_INVERT_COLOR 274
// 2.5.0
#define MI_GET_DWRITE_ENABLED 275
#define MI_GET_DWRITE_RENDERING_PARAMS 276
#define MI_GET_COLOR_FONT_ENABLED 277
// 2.5.5
#define MI_GET_GDI_COMPATIBLE 278
// 2.6.6
#define MI_GET_VERTICAL 279
// 2.6.10
#define MI_GET_ENCODE 280
#define MI_SET_ENCODE 281
#define MI_GET_LINE_ENDING 282
#define MI_SET_LINE_ENDING 283

#define OVERWRITE_PER_PROP 0
#define OVERWRITE_INSERT 1
#define OVERWRITE_OVERWRITE 2
#define OVERWRITE_MASK 3

#define FLAG_OPEN_OUTPUT 1
#define FLAG_CLOSE_OUTPUT 2
#define FLAG_FOCUS_OUTPUT 4
#define FLAG_CLEAR_OUTPUT 8

#define POS_VIEW 0
#define POS_LOGICAL 1
#define POS_DEV 2
#define MAX_LINE_COLUMN_MODE 4
#define SEL_TYPE_NONE 0
#define SEL_TYPE_CHAR 1
#define SEL_TYPE_BOX 2
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
#define FLAG_WITH_CRLF 2
#define FLAG_GET_CRLF_BYTE 4
#define FLAG_CR_ONLY 1
#define FLAG_LF_ONLY 2

#define MP_FIRST (WM_USER + 0x0500)
#define MP_QUERY_PROPERTIES (MP_FIRST + 0)
#define MP_SET_PROPERTIES (MP_FIRST + 1)
#define MP_GET_NAME (MP_FIRST + 2)
#define MP_GET_VERSION (MP_FIRST + 3)
#define MP_PRE_TRANSLATE_MSG (MP_FIRST + 4)
#define MP_LAST (MP_FIRST + 50)

#define MEID_NEW 2048
#define MEID_NEW_PASTE 2049
#define MEID_NEW_PASTE_QUOTES 2050
#define MEID_OPEN 2051
#define MEID_FIND_IN_FILES 2052
#define MEID_SAVE_ALL 2053
#define MEID_SAVE_CLOSE_ALL 2054
#define MEID_CLOSE_ALL 2055
#define MEID_CASCADE 2056
#define MEID_TILE_HORZ 2057
#define MEID_TILE_VERT 2058
#define MEID_MINIMIZE_ALL 2059
#define MEID_CLOSE_TRAY_ICON 2060
#define MEID_FILE_NEW 2061
#define MEID_FILE_OPEN 2062
#define MEID_FILE_CLOSE_OPEN 2063
#define MEID_FILE_SAVE 2064
#define MEID_FILE_SAVE_AS 2065
#define MEID_FILE_SAVE_ALL 2066
#define MEID_FILE_INSERT 2067
#define MEID_FILE_RELOAD_AUTO_SELECT 2068
#define MEID_FILE_RELOAD_UTF16LE 2069
#define MEID_FILE_RELOAD_UTF16BE 2070
#define MEID_FILE_RELOAD_UTF8 2071
#define MEID_FILE_RELOAD_UTF7 2072
#define MEID_FILE_RELOAD_ARABIC 2073
#define MEID_FILE_RELOAD_BALTIC 2074
#define MEID_FILE_RELOAD_CENTRAL_EUROPEAN 2075
#define MEID_FILE_RELOAD_CHINESE_SIMPLIFIED 2076
#define MEID_FILE_RELOAD_CHINESE_TRADITIONAL 2077
#define MEID_FILE_RELOAD_CYRILLIC 2078
#define MEID_FILE_RELOAD_GREEK 2079
#define MEID_FILE_RELOAD_HEBREW 2080
#define MEID_FILE_RELOAD_EUC 2081
#define MEID_FILE_RELOAD_JIS 2082
#define MEID_FILE_RELOAD_SHIFTJIS 2083
#define MEID_FILE_RELOAD_KOREAN 2084
#define MEID_FILE_RELOAD_THAI 2085
#define MEID_FILE_RELOAD_TURKISH 2086
#define MEID_FILE_RELOAD_VIETNAMESE 2087
#define MEID_FILE_RELOAD_WESTERN_EUROPEAN 2088
#define MEID_FILE_LINE_ENDING_CRLF 2089
#define MEID_FILE_LINE_ENDING_CR 2090
#define MEID_FILE_LINE_ENDING_LF 2091
#define MEID_FILE_PRINT 2092
#define MEID_FILE_PRINT_PREVIEW 2093
#define MEID_FILE_SAVE_CLOSE 2094
#define MEID_FILE_CLOSE 2095
#define MEID_FILE_SAVE_CLOSE_ALL 2096
#define MEID_FILE_CLOSE_ALL 2097
#define MEID_EDIT_UNDO 2098
#define MEID_EDIT_REDO 2099
#define MEID_EDIT_CUT 2100
#define MEID_EDIT_COPY 2101
#define MEID_EDIT_COPY_QUOTES 2102
#define MEID_EDIT_PASTE 2103
#define MEID_EDIT_DELETE 2104
#define MEID_EDIT_SELECT_ALL 2105
#define MEID_EDIT_DATE_TIME 2106
#define MEID_EDIT_GO_TO_LINE 2107
#define MEID_EDIT_GO_TO_FILE 2108
#define MEID_EDIT_READ_ONLY 2109
#define MEID_EDIT_INSERT_NEW_LINES 2110
#define MEID_EDIT_REMOVE_NEW_LINES 2111
#define MEID_EDIT_SPLIT_LINES 2112
#define MEID_EDIT_JOIN_LINES 2113
#define MEID_EDIT_UPPER_CASE 2114
#define MEID_EDIT_LOWER_CASE 2115
#define MEID_EDIT_CAPITALIZE 2116
#define MEID_EDIT_HALF_WIDTH 2117
#define MEID_EDIT_FULL_WIDTH 2118
#define MEID_EDIT_TABIFY 2119
#define MEID_EDIT_UNTABIFY 2120
#define MEID_EDIT_INDENT 2121
#define MEID_EDIT_UNINDENT 2122
#define MEID_EDIT_RECONVERT 2123
#define MEID_EDIT_BASE64_DECODE 2124
#define MEID_EDIT_INSERT 2125
#define MEID_EDIT_TOGGLE_BOOKMARK 2126
#define MEID_EDIT_NEXT_BOOKMARK 2127
#define MEID_EDIT_PREV_BOOKMARK 2128
#define MEID_EDIT_CLEAR_BOOKMARK 2129
#define MEID_EDIT_TOGGLE_SPELL 2130
#define MEID_EDIT_NEXT_SPELL 2131
#define MEID_EDIT_PREV_SPELL 2132
#define MEID_SEARCH_FIND 2133
#define MEID_SEARCH_NEXT 2134
#define MEID_SEARCH_PREV 2135
#define MEID_SEARCH_NEXT_WORD 2136
#define MEID_SEARCH_PREV_WORD 2137
#define MEID_SEARCH_REPLACE 2138
#define MEID_SEARCH_ERASE_FIND_HIGHLIGHT 2139
#define MEID_SEARCH_FIND_IN_FILES 2140
#define MEID_SEARCH_REPLACE_IN_FILES 2141
#define MEID_SEARCH_GOOGLE 2142
#define MEID_SEARCH_WIKIPEDIA 2143
#define MEID_VIEW_MODE_CUSTOMIZE 2144
#define MEID_VIEW_INVERT_COLOR 2145
#define MEID_VIEW_WRAP_NONE 2146
#define MEID_VIEW_WRAP_BY_CHAR 2147
#define MEID_VIEW_WRAP_BY_WINDOW 2148
#define MEID_VIEW_SHOW_LINE_NUMBERS 2149
#define MEID_VIEW_SHOW_RULER 2150
#define MEID_VIEW_SHOW_CRLF 2151
#define MEID_VIEW_SHOW_WRAP 2152
#define MEID_VIEW_SHOW_EOF 2153
#define MEID_VIEW_SHOW_TABS 2154
#define MEID_VIEW_SHOW_SB_SPACES 2155
#define MEID_VIEW_SHOW_DB_SPACES 2156
#define MEID_VIEW_CRLF_DIFFERENT 2157
#define MEID_VIEW_STANDARD_BAR 2158
#define MEID_VIEW_MACROS_BAR 2159
#define MEID_VIEW_PLUGINS_BAR 2160
#define MEID_VIEW_TOOLS_BAR 2161
#define MEID_VIEW_TOOL_BAR_TITLES 2162
#define MEID_VIEW_LOCK_TOOL_BARS 2163
#define MEID_VIEW_TOOL_BAR_CUSTOMIZE 2164
#define MEID_VIEW_STATUS_BAR 2165
#define MEID_VIEW_OUTPUT_BAR 2166
#define MEID_VIEW_INC_FONT_SIZE 2167
#define MEID_VIEW_DEC_FONT_SIZE 2168
#define MEID_VIEW_FONT_CUSTOMIZE 2169
#define MEID_MACROS_RECORD 2170
#define MEID_MACROS_RUN 2171
#define MEID_MACROS_SAVE 2172
#define MEID_MACROS_EDIT 2173
#define MEID_MACROS_SELECT 2174
#define MEID_MACROS_SELECT_THIS 2175
#define MEID_MACROS_CUSTOMIZE 2176
#define MEID_TOOLS_OPTIONS 2177
#define MEID_TOOLS_COMPLETION 2178
#define MEID_TOOLS_SQL_FORMAT 2179
#define MEID_TOOLS_XML_FORMAT 2180
#define MEID_TOOLS_PLUGIN_CUSTOMIZE 2181
#define MEID_TOOLS_TOOL_CUSTOMIZE 2182
#define MEID_TOOLS_TERMINATE_TOOL 2183
#define MEID_TOOLS_POPUP_MENU_CUSTOMIZE 2184
#define MEID_WINDOW_ALWAYS_TOP 2185
#define MEID_WINDOW_SPLIT_HORZ 2186
#define MEID_WINDOW_NEXT_PANE 2187
#define MEID_WINDOW_PREV_PANE 2188
#define MEID_WINDOW_ACTIVE_PANE 2189
#define MEID_WINDOW_COMBINE 2190
#define MEID_WINDOW_CASCADE 2191
#define MEID_WINDOW_TILE_HORZ 2192
#define MEID_WINDOW_TILE_VERT 2193
#define MEID_WINDOW_MINIMIZE_ALL 2194
#define MEID_WINDOW_NEXT 2195
#define MEID_WINDOW_PREV 2196
#define MEID_HELP_ONLINE 2197
#define MEID_HELP_KEYBOARD_MAP 2198
#define MEID_HELP_ABOUT 2199
// 2.2.5
#define MEID_EDIT_PASTE_QUOTES 2200
#define MEID_EDIT_COPY_LINK 2201
#define MEID_EDIT_OPEN_LINK 2202
// 2.4.0
#define MEID_VIEW_FULL_SCREEN 2203
#define MEID_MACROS_RUN_OPTIONS 2204
// 2.4.1
#define MEID_VIEW_RESET_FONT_SIZE 2205
#define MEID_VIEW_SET_DEFAULT_FONT_SIZE 2206
// 2.4.3
#define MEID_EDIT_SPELL_ALL 2207
#define MEID_EDIT_SPELL_SINGLE_QUOTES 2208
#define MEID_EDIT_SPELL_DOUBLE_QUOTES 2209
#define MEID_EDIT_SPELL_COMMENTS 2210
#define MEID_EDIT_SPELL_SCRIPT 2211
#define MEID_EDIT_SPELL_TAGS 2212
#define MEID_EDIT_SPELL_HIGHLIGHT 2213
#define MEID_EDIT_SPELL_HYPERLINK 2214
#define MEID_EDIT_SPELL_OTHER 2215
// 2.4.8
#define MEID_REPLACE_IN_FILES 2216
// 2.5.0
#define MEID_EDIT_CUT_LINE 2217
#define MEID_EDIT_COPY_LINE 2218
#define MEID_EDIT_DELETE_LINE 2219
#define MEID_EDIT_DELETE_RIGHT_LINE 2220
#define MEID_EDIT_DELETE_LEFT_LINE 2221
#define MEID_EDIT_DELETE_WORD 2222
#define MEID_EDIT_DELETE_RIGHT_WORD 2223
#define MEID_EDIT_DELETE_LEFT_WORD 2224
#define MEID_TOOLS_HTML_CHECK_ERRORS 2225
#define MEID_WINDOW_SPLIT_VERT 2226
// 2.6.1
#define MEID_VIEW_MARKERS_BAR 2227
#define MEID_VIEW_SMALL_ICONS 2228
#define MEID_VIEW_MEDIUM_ICONS 2229
#define MEID_VIEW_LARGE_ICONS 2230
#define MEID_VIEW_EXTRA_LARGE_ICONS 2231
#define MEID_VIEW_ADD_REMOVE_MARKER 2232
#define MEID_VIEW_MARKER_ENABLE_ALL 2233
#define MEID_VIEW_MARKER_DISABLE_ALL 2234
#define MEID_VIEW_MARKER_DELETE_ALL 2235
#define MEID_VIEW_TOGGLE_AUTO_MARKER 2236
#define MEID_VIEW_MARKER_CUSTOMIZE 2237
// 2.6.5
#define MEID_VIEW_VERTICAL 2238
// 2.6.6
#define MEID_EDIT_BASE64_ENCODE 2239
// 2.6.9
#define MEID_FILE_AUTO_SAVE 2240
#define MEID_EDIT_GO_TO_CHANGED 2241
#define MEID_VIEW_SHOW_CHANGED 2242
// 2.6.12
#define MEID_EDIT_NEXT_CHANGED 2243
#define MEID_EDIT_PREV_CHANGED 2244
// 2.6.13
#define MEID_EDIT_TOGGLE_CHARACTER_CODE 2245
// 2.6.15
#define MEID_VIEW_ZEN_MODE 2246
#define MEID_VIEW_TYPEWRITER_SCROLL 2247
// 2.7.0
#define MEID_WINDOW_SHOW_MARKERS 2248

#define MEID_DICTS 4096
#define MEID_MODES 5120
#define MEID_MACROS 6144
#define MEID_PLUGINS 7168
#define MEID_TOOLS 8192

typedef struct _GET_LINE_INFO
{
	UINT cch;
	UINT flags;
	UINT yLine;
} GET_LINE_INFO;

typedef struct _MATCH_REGEX_INFO
{
	UINT cbSize;
	UINT nFlags;
	LPCWSTR pszRegex;
	LPCWSTR pszText;
	LPCWSTR pszReplace;
	LPWSTR pszResult;
	UINT cchResult;
} MATCH_REGEX_INFO;

typedef struct _FIND_REGEX_INFO
{
	UINT cbSize;
	UINT nFlags;
	LPCWSTR pszRegex;
	LPCWSTR pszText;
	LPCWSTR* ppszStart;
	LPCWSTR* ppszEnd;
	LPCWSTR* ppszNext;
} FIND_REGEX_INFO;

typedef struct _CUSTOM_BAR_INFO
{
	UINT cbSize;
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

typedef struct _TOOLBAR_INFO
{
	UINT cbSize;
	HWND hwndToolBar;
	HWND hwndClient;
	LPCTSTR pszTitle;
	UINT nID;
	UINT nFlags;
	BOOL bVisible;
} TOOLBAR_INFO;

// -----------------------------------------------------------------------------
// Editor_New
//   �V�K�Ƀt�@�C�����쐬���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
// �߂�l
//   �E�B���h�E�̃n���h��

inline HWND Editor_New(HWND hwnd)
{
	return (HWND)SendMessage(hwnd, ME_NEW, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   �v���O�C���̃R�}���hID���擾���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   hInstance: �v���O�C���̃C���X�^���X�̃n���h��
// �߂�l
//   �v���O�C�������s���邽�߂̃R�}���hID

inline UINT Editor_GetCmdID(HWND hwnd, HINSTANCE hInstance)
{
	return (UINT)SendMessage(hwnd, ME_GET_CMD_ID, 0, (LPARAM)hInstance);
}

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   �v���O�C�������s�\���A�܂��̓`�F�b�N���ꂽ��Ԃ��𒲂ׂ܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   nCmdID:    ���s����v���O�C���̃R�}���hID
//   pbChecked: �`�F�b�N�̏��
// �߂�l
//   ���s�\�ł����True��Ԃ��܂�

inline BOOL Editor_QueryStatus(HWND hwnd, UINT nCmdID, BOOL* pbChecked)
{
	return (BOOL)SendMessage(hwnd, ME_QUERY_STATUS, (WPARAM)nCmdID, (LPARAM)pbChecked);
}

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   �I������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   nBufferSize: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   szBuffer:    ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   nBufferSize��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

inline UINT Editor_GetSelText(HWND hwnd, UINT nBufferSize, LPWSTR szBuffer)
{
	return (UINT)SendMessage(hwnd, ME_GET_SEL_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   ���ׂĂ̕�������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   nBufferSize: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   szBuffer:    ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   nBufferSize��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

inline UINT Editor_GetText(HWND hwnd, UINT nBufferSize, LPWSTR szBuffer)
{
	return (UINT)SendMessage(hwnd, ME_GET_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetLines
//   �����̍s�����擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
// �߂�l
//   �����̍s����Ԃ��܂�

inline UINT Editor_GetLines(HWND hwnd, int nLogical)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINES, (WPARAM)(int)(nLogical), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetDocLines
//   �w�肷�镶���̍s�����擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   iDoc:     �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
// �߂�l
//   �����̍s����Ԃ��܂�

inline UINT Editor_GetDocLines(HWND hwnd, int iDoc, int nLogical)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINES, MAKEWPARAM(nLogical, iDoc + 1), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetLine
//   �w�肵���s�̕�������擾���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pGetLineInfo: GET_LINE_INFO�\���̂ւ̃|�C���^
//   szString:     ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   pGetLineInfo->cch��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

inline UINT Editor_GetLine(HWND hwnd, GET_LINE_INFO* pGetLineInfo, LPWSTR szString)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINE, (WPARAM)(GET_LINE_INFO*)(pGetLineInfo), (LPARAM)(LPWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_GetCaretPos
//   �J�[�\���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_GetCaretPos(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_CARET_POS, (WPARAM)nLogical, (LPARAM)pptPos);
}

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   �X�N���[���o�[�̈ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   pptPos:   �X�N���[���o�[�̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_GetScrollPos(HWND hwnd, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_LineFromChar
//   �w�肵���V���A���ʒu�̍s�ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nLogical:     POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   nSerialIndex: �V���A���ʒu(-1���w�肵���ꍇ�̓J�[�\���ʒu)
// �߂�l
//   �s�ԍ���Ԃ��܂�

inline UINT Editor_LineFromChar(HWND hwnd, int nLogical, UINT nSerialIndex)
{
	return (UINT)SendMessage(hwnd, ME_LINE_FROM_CHAR, (WPARAM)(int)(nLogical), (LPARAM)(UINT)(nSerialIndex));
}

// -----------------------------------------------------------------------------
// Editor_LineIndex
//   �w�肵���s�ԍ��̃V���A���ʒu��Ԃ��܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   yLine:    �s�ԍ�(-1���w�肵���ꍇ�̓J�[�\���s)
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

inline UINT Editor_LineIndex(HWND hwnd, BOOL bLogical, UINT yLine)
{
	return (UINT)SendMessage(hwnd, ME_LINE_INDEX, (WPARAM)(BOOL)(bLogical), (LPARAM)(UINT)(yLine));
}

// -----------------------------------------------------------------------------
// Editor_LoadFile
//   �t�@�C�����J���܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   bAllowNewWindow: �V�����E�B���h�E�ŊJ���܂�
//   szFileName:      �ǂݍ��ރt�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

inline BOOL Editor_LoadFile(HWND hwnd, LPCWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_LOAD_FILE, (WPARAM)0, (LPARAM)(LPCWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_LogicalToSerial
//   �_�����W���V���A���ʒu�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

inline UINT Editor_LogicalToSerial(HWND hwnd, POINT* pptLogical)
{
	return (UINT)SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, (WPARAM)0, (LPARAM)(POINT*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_LogicalToView
//   �_�����W��\�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_LogicalToView(HWND hwnd, POINT* pptLogical, POINT* pptView)
{
	SendMessage(hwnd, ME_LOGICAL_TO_VIEW, (WPARAM)(POINT*)(pptLogical), (LPARAM)(POINT*)(pptView));
}

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   �t�@�C���ɕۑ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   szFileName: �ۑ�����t�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

inline BOOL Editor_SaveFile(HWND hwnd, LPWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_SAVE_FILE, 0, (LPARAM)(LPWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_DocSaveFile
//   �w�肷�镶�����t�@�C���ɕۑ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szFileName: �ۑ�����t�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

inline BOOL Editor_DocSaveFile(HWND hwnd, int iDoc, LPWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_SAVE_FILE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_SerialToLogical
//   �V���A���ʒu��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nSerial:    �V���A���ʒu
//   pptLogical: �_�����W���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_SerialToLogical(HWND hwnd, UINT nSerial, POINT* pptLogical)
{
	SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, (WPARAM)(UINT)(nSerial), (LPARAM)(POINT*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_SetCaretPos
//   �J�[�\���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_SetCaretPos(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_SET_CARET_POS, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetCaretPosEx
//   �J�[�\���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   nLogical:  POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:    �J�[�\���ʒu���w�肵���\���̂ւ̃|�C���^
//   bExtend:   �I��͈͂�L�k���邩�ǂ���
// �߂�l
//   �g�p����܂���

inline void Editor_SetCaretPosEx(HWND hwnd, int nLogical, POINT* pptPos, BOOL bExtend)
{
	SendMessage(hwnd, ME_SET_CARET_POS, MAKEWPARAM(nLogical, bExtend), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   �X�N���[���o�[�̈ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptPos: �X�N���[���o�[�̈ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_SetScrollPos(HWND hwnd, POINT* pptPos)
{
	SendMessage(hwnd, ME_SET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   �\�����W��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_ViewToLogical(HWND hwnd, POINT* pptView, POINT* pptLogical)
{
	SendMessage(hwnd, ME_VIEW_TO_LOGICAL, (WPARAM)(POINT*)(pptView), (LPARAM)(POINT*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   �w�肷��R�}���hID�����s���܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   pptView: ���s����R�}���hID
// �߂�l
//   �g�p����܂���

inline void Editor_ExecCommand(HWND hwnd, UINT nCmdID)
{
	SendMessage(hwnd, ME_EXEC_COMMAND, (WPARAM)(UINT)(nCmdID), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetModified
//   �������X�V����Ă��邩�ǂ������擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �X�V����Ă���ꍇ��True��Ԃ��܂�

inline BOOL Editor_GetModified(HWND hwnd)
{
	return (BOOL)SendMessage(hwnd, ME_GET_MODIFIED, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_DocGetModified
//   �w�肷�镶�����X�V����Ă��邩�ǂ������擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   iDoc: �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
// �߂�l
//   �X�V����Ă���ꍇ��True��Ԃ��܂�

inline BOOL Editor_GetModified(HWND hwnd, int iDoc)
{
	return (BOOL)SendMessage(hwnd, ME_GET_MODIFIED, MAKEWPARAM(0, iDoc + 1), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_SetModified
//   �������X�V����Ă��邩�ǂ�����ݒ肵�܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   bModified: �X�V�̏��
// �߂�l
//   �g�p����܂���

inline void Editor_SetModified(HWND hwnd, BOOL bModified)
{
	(void)SendMessage(hwnd, ME_SET_MODIFIED, (WPARAM)(BOOL)(bModified), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetSelStart
//   �I�𕶎���̊J�n�ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̊J�n�ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_GetSelStart(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_START, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_GetSelEnd
//   �I�𕶎���̏I���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̏I���ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_GetSelEnd(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_END, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   �I�𕶎���̒�����ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   nLen: �I�𕶎���̒���
// �߂�l
//   �g�p����܂���

inline void Editor_SetSelLength(HWND hwnd, UINT nLen)
{
	(void)SendMessage(hwnd, ME_SET_SEL_LENGTH, (WPARAM)(UINT)(nLen), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetMode
//   �ҏW���[�h�𕶎���Ŏ擾���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   szModeName: ���̂��擾����o�b�t�@(MAX_MODE_NAME�̕�����)
// �߂�l
//   �g�p����܂���

inline void Editor_GetMode(HWND hwnd, LPWSTR szModeName)
{
	SendMessage(hwnd, ME_GET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_DocGetMode
//   �w�肷�镶���̕ҏW���[�h�𕶎���Ŏ擾���܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szModeName: ���̂��擾����o�b�t�@(MAX_MODE_NAME�̕�����)
// �߂�l
//   �g�p����܂���

inline void Editor_DocGetMode(HWND hwnd, int iDoc, LPWSTR szModeName)
{
	SendMessage(hwnd, ME_GET_MODE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_SetMode
//   �ҏW���[�h�𕶎���Őݒ肵�܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   szModeName: �ҏW���[�h�̖���
// �߂�l
//   �g�p����܂���

inline BOOL Editor_SetMode(HWND hwnd, LPWSTR szModeName)
{
	return (BOOL)SendMessage(hwnd, ME_SET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_DocSetMode
//   �w�肷�镶���̕ҏW���[�h�𕶎���Őݒ肵�܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szModeName: �ҏW���[�h�̖���
// �߂�l
//   �g�p����܂���

inline BOOL Editor_DocSetMode(HWND hwnd, int iDoc, LPWSTR szModeName)
{
	return (BOOL)SendMessage(hwnd, ME_SET_MODE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_EmptyUndoBuffer
//   ���ɖ߂��A��蒼���̃o�b�t�@����ɂ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �g�p����܂���

inline void Editor_EmptyUndoBuffer(HWND hwnd)
{
	SendMessage(hwnd, ME_EMPTY_UNDO_BUFFER, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_InsertString
//   �J�[�\���ʒu�ɕ������}���܂��͏㏑�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

inline void Editor_InsertString(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_PER_PROP, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_Insert
//   �J�[�\���ʒu�ɕ������}�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

inline void Editor_Insert(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_INSERT, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_Overwrite
//   �J�[�\���ʒu�ɕ�������㏑�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

inline void Editor_Overwrite(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_OVERWRITE, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_SetSelView
//   �I�𕶎���̊J�n�ʒu�ƏI���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   pptSelStart: �I�𕶎���̊J�n�ʒu��\���\���̂ւ̃|�C���^
//   pptSelEnd:   �I�𕶎���̏I���ʒu��\���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

inline void Editor_SetSelView(HWND hwnd, POINT* pptSelStart, POINT* pptSelEnd)
{
	SendMessage(hwnd, ME_SET_SEL_VIEW, (WPARAM)(POINT*)(pptSelStart), (LPARAM)(POINT*)(pptSelEnd));
}

// -----------------------------------------------------------------------------
// Editor_Find
//   ��������������܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
//   szFind: �������镶����
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_FIND_NEXT:      �������Ɍ������܂�
//   FLAG_FIND_CASE:      �啶���Ə���������ʂ��܂�
//   FLAG_FIND_ONLY_WORD: �P��̂݌������܂�
//   FLAG_FIND_AROUND:    �����܂Ō��������當���Ɉړ����܂�
//   FLAG_FIND_REG_EXP:   ���K�\�����g�p���܂�

inline BOOL Editor_Find(HWND hwnd, UINT nFlags, LPCWSTR szFind)
{
	return (BOOL)SendMessage(hwnd, ME_FIND, (WPARAM)(UINT)(nFlags), (LPARAM)(LPCWSTR)(szFind));
}

// -----------------------------------------------------------------------------
// Editor_Replace
//   �������u�����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
//   szFind: �������镶����ƒu�����镶����(��؂�A�I�[��#0���w��)
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_FIND_CASE:        �啶���Ə���������ʂ��܂�
//   FLAG_FIND_ONLY_WORD:   �P��̂݌������܂�
//   FLAG_FIND_REG_EXP:     ���K�\�����g�p���܂�
//   FLAG_REPLACE_SEL_ONLY: �I�������͈݂͂̂�ΏۂƂ��܂�

inline BOOL Editor_Replace(HWND hwnd, UINT nFlags, LPCWSTR szFindReplace)
{
	return (BOOL)SendMessage(hwnd, ME_REPLACE, (WPARAM)(UINT)(nFlags), (LPARAM)(LPCWSTR)(szFindReplace));
}

// -----------------------------------------------------------------------------
// Editor_SetStatus
//   �X�e�[�^�X�o�[�ɕ\�����镶�����ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szStatus: �X�e�[�^�X�o�[�ɕ\�����镶����
// �߂�l
//   �g�p����܂���

inline void Editor_SetStatus(HWND hwnd, LPCWSTR szStatus)
{
	SendMessage(hwnd, ME_SET_STATUS, (WPARAM)0, (LPARAM)(LPCWSTR)(szStatus));
}

// -----------------------------------------------------------------------------
// Editor_Convert
//   �������ϊ����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   nFlags: �t���O
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_MAKE_LOWER:         �������ɕϊ����܂�
//   FLAG_MAKE_UPPER:         �啶���ɕϊ����܂�
//   FLAG_HAN_TO_ZEN:         �S�p�ɕϊ����܂�
//   FLAG_ZEN_TO_HAN:         ���p�ɕϊ����܂�
//   FLAG_CONVERT_SELECT_ALL: �����S�̂�ΏۂƂ��܂�

inline BOOL Editor_Convert(HWND hwnd, UINT nFlags)
{
	return (BOOL)SendMessage(hwnd, ME_CONVERT, (WPARAM)(UINT)(nFlags), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetMargin
//   �܂�Ԃ�������Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �܂�Ԃ�������Ԃ��܂�

inline UINT Editor_GetMargin(HWND hwnd)
{
	return (UINT)SendMessage(hwnd, ME_GET_MARGIN, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetVersion
//   �o�[�W�����ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �o�[�W�����ԍ���Ԃ��܂�

inline UINT Editor_GetVersion(HWND hwnd)
{
	return (UINT)SendMessage(hwnd, ME_GET_VERSION, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetVersionEx
//   �������Ă��܂���

inline UINT Editor_GetVersionEx(HWND hwnd, UINT* pnProductType)
{
	return (UINT)SendMessage(hwnd, ME_GET_VERSION, (WPARAM)pnProductType, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_Redraw
//   �E�B���h�E�̍ĕ`����s�����ǂ������w�肵�܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   bRedraw: False���w�肷��ƁA����True���w�肷��܂ōĕ`����s���܂���
// �߂�l
//   �g�p����܂���

inline void Editor_Redraw(HWND hwnd, BOOL bRedraw)
{
	SendMessage(hwnd, ME_REDRAW, (WPARAM)bRedraw, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetSelType
//   �I����Ԃ̎�ނ��擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   SEL_TYPE_NONE: �I������Ă��܂���
//   SEL_TYPE_CHAR: �ʏ�I������Ă��܂�
//   SEL_TYPE_BOX:  ��`�I������Ă��܂�

inline int Editor_GetSelType(HWND hwnd)
{
	return (int)SendMessage(hwnd, ME_GET_SEL_TYPE, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_IsCharHalfOrFull
//   �w�肷�镶�������p���S�p���𒲂ׂ܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   ch:   ���ׂ�������
// �߂�l
//   ���p�̏ꍇ��1�A�S�p�̏ꍇ��2��Ԃ��܂�

inline int Editor_IsCharHalfOrFull(HWND hwnd, WCHAR ch)
{
	return (int)SendMessage(hwnd, ME_IS_CHAR_HALF_OR_FULL, (WPARAM)ch, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_Info
//   �����̏����擾�E�ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   nCmd: �擾�E�ݒ肷����̎��
// �߂�l
//   nCmd�ɂ��قȂ�܂�
// ���l
//   MI_GET_FILE_NAME:      �J���Ă���t�@�C�������擾���܂�
//   MI_GET_APP_VERSION:    �o�[�W�������擾���܂�
//   MI_IS_WINDOW_COMBINED: �^�u�̗L���E�������擾���܂�
//   MI_WINDOW_COMBINE:     �^�u�̗L���E������ݒ肵�܂�
//   MI_GET_DOC_COUNT:      �J���Ă��镶���̐����擾���܂�
//   MI_INDEX_TO_DOC:       �����̃C���f�b�N�X����n���h���ɕϊ����܂�
//   MI_DOC_TO_INDEX:       �����̃n���h������C���f�b�N�X�ɕϊ����܂�
//   MI_GET_ACTIVE_INDEX:   �A�N�e�B�u�ȕ����̃C���f�b�N�X���擾���܂�
//   MI_SET_ACTIVE_INDEX:   �C���f�b�N�X���w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_GET_ACTIVE_DOC:     �A�N�e�B�u�ȕ����̃n���h�����擾���܂�
//   MI_SET_ACTIVE_DOC:     �n���h�����w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_CLOSE_DOC:          ��������܂�
//   MI_SAVE_DOC:           ������ۑ����܂�
//   MI_GET_FONT_NAME:      �t�H���g�����擾���܂�
//   MI_GET_FONT_CHARSET:   �t�H���g�̕����Z�b�g���擾���܂�
//   MI_GET_FONT_SIZE:      �t�H���g�̃T�C�Y���擾���܂�
//   MI_GET_TEXT_COLOR:     �����̐F���擾���܂�
//   MI_GET_BACK_COLOR:     �w�i�̐F���擾���܂�

inline LRESULT Editor_Info(HWND hwnd, WPARAM nCmd, LPARAM lParam)
{
	return (LRESULT)SendMessage(hwnd, ME_INFO, (WPARAM)nCmd, (LPARAM)lParam);
}

// -----------------------------------------------------------------------------
// Editor_DocInfo
//   �w�肷�镶���̏����擾�E�ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   iDoc: 0�����Ƃ��镶���̃C���f�b�N�X
//   nCmd: �擾�E�ݒ肷����̎��
// �߂�l
//   nCmd�ɂ��قȂ�܂�
// ���l
//   MI_GET_FILE_NAME:      �J���Ă���t�@�C�������擾���܂�
//   MI_GET_APP_VERSION:    �o�[�W�������擾���܂�
//   MI_IS_WINDOW_COMBINED: �^�u�̗L���E�������擾���܂�
//   MI_WINDOW_COMBINE:     �^�u�̗L���E������ݒ肵�܂�
//   MI_GET_DOC_COUNT:      �J���Ă��镶���̐����擾���܂�
//   MI_INDEX_TO_DOC:       �����̃C���f�b�N�X����n���h���ɕϊ����܂�
//   MI_DOC_TO_INDEX:       �����̃n���h������C���f�b�N�X�ɕϊ����܂�
//   MI_GET_ACTIVE_INDEX:   �A�N�e�B�u�ȕ����̃C���f�b�N�X���擾���܂�
//   MI_SET_ACTIVE_INDEX:   �C���f�b�N�X���w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_GET_ACTIVE_DOC:     �A�N�e�B�u�ȕ����̃n���h�����擾���܂�
//   MI_SET_ACTIVE_DOC:     �n���h�����w�肵�ĕ������A�N�e�B�u�ɂ��܂�
//   MI_CLOSE_DOC:          ��������܂�
//   MI_SAVE_DOC:           ������ۑ����܂�
//   MI_GET_FONT_NAME:      �t�H���g�����擾���܂�
//   MI_GET_FONT_CHARSET:   �t�H���g�̕����Z�b�g���擾���܂�
//   MI_GET_FONT_SIZE:      �t�H���g�̃T�C�Y���擾���܂�
//   MI_GET_TEXT_COLOR:     �����̐F���擾���܂�
//   MI_GET_BACK_COLOR:     �w�i�̐F���擾���܂�

inline LRESULT Editor_DocInfo(HWND hwnd, int iDoc, WPARAM nCmd, LPARAM lParam)
{
	return (LRESULT)SendMessage(hwnd, ME_INFO, MAKEWPARAM(nCmd, iDoc + 1), (LPARAM)lParam);
}

// -----------------------------------------------------------------------------
// Editor_GetStatus
//   �X�e�[�^�X�o�[�ɕ\������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   szStatus:    ��������擾����o�b�t�@
//   nBufferSize: ��������擾����o�b�t�@�̃T�C�Y
// �߂�l
//   ��������擾����̂ɕK�v�ȃo�b�t�@�̃T�C�Y

inline UINT Editor_GetStatus(HWND hwnd, LPCWSTR szStatus, UINT nBufSize)
{
	return (UINT)SendMessage(hwnd, ME_GET_STATUS, (WPARAM)nBufSize, (LPARAM)(LPCWSTR)(szStatus));
}

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   �J�X�^���o�[���J���܂�
// �p�����[�^
//   hwnd:           �E�B���h�E�̃n���h��
//   pCustomBarInfo: CUSTOM_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃJ�X�^���o�[��ID��Ԃ��܂�

inline UINT Editor_CustomBarOpen(HWND hwnd, CUSTOM_BAR_INFO* pCustomBarInfo)
{
	return (UINT)SendMessage(hwnd, ME_CUSTOM_BAR_OPEN, 0, (LPARAM)pCustomBarInfo);
}

// -----------------------------------------------------------------------------
// Editor_CustomBarClose
//   �J�X�^���o�[����܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nCustomBarID: �J�X�^���o�[��ID
// �߂�l
//   �g�p����܂���

inline BOOL Editor_CustomBarClose(HWND hwnd, UINT nCustomBarID)
{
	return (BOOL)SendMessage(hwnd, ME_CUSTOM_BAR_CLOSE, (WPARAM)nCustomBarID, 0);
}

// -----------------------------------------------------------------------------
// Editor_MatchRegEx
//   ���K�\���Ŏw�肵�������񂪈�v���邩�ǂ����𒲂ׂ܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: MATCH_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v����ꍇ��True��Ԃ��܂�

inline BOOL Editor_MatchRegex(HWND hwnd, MATCH_REGEX_INFO* pMatchRegexInfo)
{
	return (BOOL)SendMessage(hwnd, ME_MATCH_REGEX, (WPARAM)0, (LPARAM)pMatchRegexInfo);
}

// -----------------------------------------------------------------------------
// Editor_FindRegEx
//   ���K�\�����w�肵�������񂩂猟�����܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: FIND_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v���镶���񂪌��������ꍇ��True��Ԃ��܂�

inline BOOL Editor_FindRegex(HWND hwnd, FIND_REGEX_INFO* pFindRegexInfo)
{
	return (BOOL)SendMessage(hwnd, ME_FIND_REGEX, (WPARAM)0, (LPARAM)pFindRegexInfo);
}

// -----------------------------------------------------------------------------
// Editor_EnumMode
//   �ҏW���[�h�̈ꗗ���擾���܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pBuf:   ��������擾����o�b�t�@�ւ̃|�C���^
//   cchBuf: �I�[�������܂ރo�b�t�@�̃T�C�Y
// �߂�l
//   cchBuf��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

inline size_t Editor_EnumConfig(HWND hwnd, LPWSTR pBuf, size_t cchBuf)
{
	return (size_t)SendMessage(hwnd, ME_ENUM_MODE, (WPARAM)cchBuf, (LPARAM)pBuf);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarOpen
//   �c�[���o�[���J���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pToolBarInfo: TOOL_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃc�[���o�[��ID��Ԃ��܂�

inline UINT Editor_ToolBarOpen(HWND hwnd, TOOLBAR_INFO* pToolBarInfo)
{
	return (UINT)SendMessage(hwnd, ME_TOOL_BAR_OPEN, 0, (LPARAM)pToolBarInfo);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarClose
//   �c�[���o�[����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
// �߂�l
//   �g�p����܂���

inline BOOL Editor_ToolBarClose(HWND hwnd, UINT nToolBarID)
{
	return (BOOL)SendMessage(hwnd, ME_TOOL_BAR_CLOSE, (WPARAM)nToolBarID, 0);
}

// -----------------------------------------------------------------------------
// Editor_ToolBarShow
//   �c�[���o�[�̕\��/��\����؂�ւ��܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
//   bVisible:   �\���̏��
// �߂�l
//   �g�p����܂���

inline BOOL Editor_ToolBarShow(HWND hwnd, UINT nToolBarID, BOOL bVisible)
{
	return (BOOL)SendMessage(hwnd, ME_TOOL_BAR_SHOW, (WPARAM)nToolBarID, (LPARAM)bVisible);
}

// -----------------------------------------------------------------------------
// Editor_OutputString
//   �A�E�g�v�b�g�o�[�ɕ������ǉ����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �ǉ����镶����
//   nFlags:   �t���O
// �߂�l
//   ���������True��Ԃ��܂�
// ���l
//   FLAG_OPEN_OUTPUT:  �A�E�g�v�b�g�o�[���J���܂�
//   FLAG_CLOSE_OUTPUT: �A�E�g�v�b�g�o�[����܂�
//   FLAG_FOCUS_OUTPUT: �A�E�g�v�b�g�o�[�Ƀt�H�[�J�X��ݒ肵�܂�
//   FLAG_CLEAR_OUTPUT: �A�E�g�v�b�g�o�̕�������N���A���܂�

inline BOOL Editor_OutputString(HWND hwnd, LPCWSTR szString, UINT nFlags)
{
	return (BOOL)SendMessage(hwnd, ME_OUTPUT_STRING, (WPARAM)nFlags, (LPARAM)szString);
}

// -----------------------------------------------------------------------------
// Editor_GetOutputString
//   �A�E�g�v�b�g�o�[�̕�������擾���܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   cchBuf: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   pBuf:   ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   cchBuf��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

inline UINT Editor_GetOutputString(HWND hwnd, UINT cchBuf, LPWSTR pBuf)
{
	return (UINT)SendMessage(hwnd, ME_GET_OUTPUT_STRING, (WPARAM)cchBuf, (LPARAM)pBuf);
}

// -----------------------------------------------------------------------------
// Editor_DoIdle
//   �\���X�V���s���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �g�p����܂���

inline void Editor_DoIdle(HWND hwnd)
{
	SendMessage(hwnd, ME_DO_IDLE, (WPARAM)0, (LPARAM)0);
}
