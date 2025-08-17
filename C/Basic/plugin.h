// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

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
// 3.0.0
#define COLOR_MULTI_SELECTION 56
// 3.5.6
#define COLOR_INDENT_GUIDES 57
// 3.7.13
#define COLOR_COLOR_STRING 58

// 2.5.0
#define DWRITE_GAMMA 256
#define DWRITE_ENHANCED_CONTRAST 257
#define DWRITE_CLEAR_TYPE_LEVEL 258
#define DWRITE_RENDERING_MODE 259

// 3.1.0
#define DWRITE_TEXT_ANTIALIAS_MODE 260

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
#define ENCODING_GB18030 54936
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

// 2.8.7
#define INDENT_STYLE_UNSET 0
#define INDENT_STYLE_TAB 1
#define INDENT_STYLE_SPACE 2

// 2.8.7
#define TRIBOOL_FALSE 0
#define TRIBOOL_TRUE 1
#define TRIBOOL_UNKNOWN 2

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
// 2.8.1
#define EVENT_TOOL_BAR_CHANGED 0x02000000
// 3.2.0
#define EVENT_APP_MODE_CHANGED 0x04000000
// 3.4.0
#define EVENT_CUSTOM_BAR_DROP_TEXT = 0x08000000;
#define EVENT_TOOL_BAR_DROP_TEXT = 0x10000000;

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
// 3.3.2
#define ME_ADD_UNDO (ME_FIRST + 52)
#define ME_BEGIN_UNDO_GROUP (ME_FIRST + 53)
#define ME_END_UNDO_GROUP (ME_FIRST + 54)
#define ME_RUN_MACRO (ME_FIRST + 55)
#define ME_GET_MULTI_SEL (ME_FIRST + 56)
#define ME_SET_MULTI_SEL (ME_FIRST + 57)
// 3.4.0
#define ME_GET_DROPPED_TEXT (ME_FIRST + 58)
// 3.7.2
#define ME_GET_PAGE_SIZE (ME_FIRST + 59)
#define ME_DEV_TO_VIEW (ME_FIRST + 60)
#define ME_VIEW_TO_DEV (ME_FIRST + 61)
// 3.7.7
#define ME_GET_ATTR (ME_FIRST + 62)
// 3.7.14
#define ME_SHOW_TIP (ME_FIRST + 63)
// 3.7.18
#define ME_FIND_IN_FILES (ME_FIRST + 64)
#define ME_REPLACE_IN_FILES (ME_FIRST + 65)
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
// 2.8.7
#define MI_GET_INDENT_STYLE 284
#define MI_SET_INDENT_STYLE 285
#define MI_GET_INDENT_SIZE 286
#define MI_SET_INDENT_SIZE 287
#define MI_GET_TRIM_TRAILING_WHITESPACE 288
#define MI_SET_TRIM_TRAILING_WHITESPACE 289
#define MI_GET_INSERT_FINAL_NEWLINE 290
#define MI_SET_INSERT_FINAL_NEWLINE 291
// 3.1.0
#define MI_GET_DWRITE_AUTODETECT 292
#define MI_GET_MAX_LINE_LENGTH 293
#define MI_SET_MAX_LINE_LENGTH 294
// 3.2.0
#define MI_GET_DARK_MODE 295
// 3.3.0
#define MI_GET_LIGATURES_ENABLED 296
// 3.3.1
#define MI_GET_HALF_WIDTH_ENABLED 297
// 3.3.2
#define MI_GET_READ_ONLY 298
// 3.5.9
#define MI_GET_FONT_HEIGHT 299
// 3.7.0
#define MI_GET_USE_MICA 300
// 3.7.7
#define MI_GET_NEXT_BOOKMARK 301
#define MI_GET_PREV_BOOKMARK 302
#define MI_GET_BOOKMARK_COUNT 303
#define MI_ADD_BOOKMARK 304
#define MI_REMOVE_BOOKMARK 305
#define MI_CLEAR_BOOKMARK 306

#define RUN_FILE 0
#define RUN_TEXT 1

#define MACRO_LANG_JSCRIPT 0
#define MACRO_LANG_VBSCRIPT 1
#define MACRO_LANG_CHAKRA 2
// 3.7.13
#define MACRO_LANG_V8 3
#define MACRO_LANG_UNKNOWN 0xFF
// 3.7.13
#define MACRO_ASYNC 0x200

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
// 3.0.0
#define SEL_TYPE_MULTI 3

#define FLAG_MAKE_LOWER 0
#define FLAG_MAKE_UPPER 1
#define FLAG_HAN_TO_ZEN 2
#define FLAG_ZEN_TO_HAN 3
#define FLAG_CAPITALIZE 4

#define FLAG_CONVERT_SELECT_ALL 0x0100

#define FLAG_FIND_NEXT 0x00000001
#define FLAG_REPLACE_ALL 0x00000002
#define FLAG_FIND_OPEN_DOC 0x00000004 // Reserved for future use
#define FLAG_FIND_MATCH_CASE 0x00000008
#define FLAG_FIND_RECURSIVE 0x00000010
#define FLAG_FIND_REG_EX 0x00000020
#define FLAG_FIND_WHOLE_WORD 0x00000040
#define FLAG_FIND_AROUND 0x00000080
#define FLAG_REPLACE_SEL_ONLY 0x00000100
#define FLAG_FIND_CLOSE 0x00000200
#define FLAG_FIND_FILENAMES_ONLY 0x00000400
#define FLAG_REPLACE_BACKUP 0x00000800
#define FLAG_FIND_MIGEMO 0x00001000
// 3.5.0
#define FLAG_FIND_FUZZY 0x00002000
// 3.5.1
#define FLAG_FIND_SEL_ONLY FLAG_REPLACE_SEL_ONLY
// 3.7.4
#define FLAG_FIND_ALL 0x00004000
#define FLAG_FIND_NOT_BOL 0x00008000
#define FLAG_FIND_NOT_EOL 0x00010000
#define FLAG_FIND_KEEP_OPTIONS 0x00020000

#define FLAG_LOGICAL 1
#define FLAG_WITH_CRLF 2
#define FLAG_GET_CRLF_BYTE 4

#define FLAG_CR_ONLY 1
#define FLAG_LF_ONLY 2

// 3.3.6
#define POS_SCROLL_DONT_CARE 0x0000000
#define POS_SCROLL_CENTER 0x0000010
#define POS_SCROLL_TOP 0x0000020
#define POS_SCROLL_ALWAYS 0x0000040

// 3.5.5
#define MAX_MRU_FILE_COUNT 256
#define MAX_PINNED_FILE_COUNT 256

// 3.7.7
#define ATTR_NONE 0x00
#define ATTR_COMMENT 0x10
#define ATTR_DOUBLE_QUOTE 0x20
#define ATTR_SINGLE_QUOTE 0x40
#define ATTR_TAG 0x80

#define AI_NEED_CONFIG_SCOPE 0x01
#define AI_NEED_CONFIG_DOC 0x02
#define AI_NEED_ATTR_SUB 0x04
#define AI_NEED_ALL 0x07

// 3.7.14
#define SHOW_TIP_POS_CARET 0
#define SHOW_TIP_POS_MOUSE 1
#define SHOW_TIP_HIDE 2

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
#define MEID_TOOLS_HTML_FORMAT 2179
#define MEID_TOOLS_SQL_FORMAT 2180
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
// 2.7.5
#define MEID_FILE_CLOSE_OTHERS 2249
#define MEID_FILE_CLOSE_LEFT 2250
#define MEID_FILE_CLOSE_RIGHT 2251
// 2.7.9
#define MEID_VIEW_MACROS_BAR_LABELS 2252
// 2.8.7
#define MEID_WINDOW_NEW_GROUP 2253
// 3.0.0
#define MEID_EDIT_SPLIT_SEL_INTO_LINES 2254
#define MEID_EDIT_ADD_CURSOR_TO_NEXT_LINE 2255
#define MEID_EDIT_ADD_CURSOR_TO_PREV_LINE 2256
#define MEID_SEARCH_FIND_ALL_AND_SELECT 2257
#define MEID_SEARCH_ADD_NEXT_MATCH 2258
#define MEID_SEARCH_SKIP_CURRENT_MATCH 2259
#define MEID_SEARCH_UNDO_SELECTION 2260
#define MEID_SEARCH_REDO_SELECTION 2261
// 3.1.0
#define MEID_WINDOW_RIGHT 2262
#define MEID_WINDOW_LEFT 2263
// 3.3.6
#define MEID_EDIT_TOGGLE_IME 2264
// 3.3.7
#define MEID_FILE_SAVE_CLOSE_ALL_DESKTOP 2265
#define MEID_FILE_CLOSE_ALL_DESKTOP 2266
#define MEID_WINDOW_NEW_GROUP_HORZ 2267
#define MEID_WINDOW_NEW_GROUP_VERT 2268
// 3.4.1
#define MEID_MACROS_STOP 2269
#define MEID_WINDOW_MOVE_NEXT_GROUP 2270
#define MEID_WINDOW_MOVE_PREV_GROUP 2271
#define MEID_WINDOW_MOVE_NEXT 2272
#define MEID_WINDOW_MOVE_PREV 2273
// 3.5.4
#define MEID_VIEW_MARKERS_BAR_TEXT 2274
// 3.5.5
#define MEID_FILE_MRU_FILE1 2275 // to MEID_FILE_MRU_FILE1 + 255 (2530)
#define MEID_FILE_PINNED_FILE1 2531 // to MEID_FILE_PINNED_FILE1 + 255 (2786)
// 3.5.6
#define MEID_VIEW_SHOW_WRAP_LINE 2787
#define MEID_VIEW_SHOW_INDENT_GUIDES 2788
#define MEID_VIEW_SHOW_CARET_LINE 2789
#define MEID_VIEW_AUTO_INDENT 2790
#define MEID_VIEW_WRAP_INDENT 2791
// 3.5.9
#define MEID_EDIT_CREATE_GUID 2792
// 3.6.1
#define MEID_EDIT_DELETE_LEFT 2793
#define MEID_EDIT_CHAR_RIGHT 2794
#define MEID_EDIT_CHAR_LEFT 2795
#define MEID_EDIT_WORD_RIGHT 2796
#define MEID_EDIT_WORD_LEFT 2797
#define MEID_EDIT_LINE_UP 2798
#define MEID_EDIT_LINE_DOWN 2799
#define MEID_EDIT_PAGE_UP 2800
#define MEID_EDIT_PAGE_DOWN 2801
#define MEID_EDIT_LINE_START 2802
#define MEID_EDIT_TEXT_START 2803
#define MEID_EDIT_LINE_END 2804
#define MEID_EDIT_DOCUMENT_START 2805
#define MEID_EDIT_DOCUMENT_END 2806
#define MEID_EDIT_GO_TO_BRACKET 2807
#define MEID_EDIT_SELECT_CHAR 2808
#define MEID_EDIT_SELECT_BOX 2809
#define MEID_EDIT_CHAR_RIGHT_EXTEND 2810
#define MEID_EDIT_CHAR_LEFT_EXTEND 2811
#define MEID_EDIT_WORD_RIGHT_EXTEND 2812
#define MEID_EDIT_WORD_LEFT_EXTEND 2813
#define MEID_EDIT_LINE_UP_EXTEND 2814
#define MEID_EDIT_LINE_DOWN_EXTEND 2815
#define MEID_EDIT_PAGE_UP_EXTEND 2816
#define MEID_EDIT_PAGE_DOWN_EXTEND 2817
#define MEID_EDIT_LINE_START_EXTEND 2818
#define MEID_EDIT_TEXT_START_EXTEND 2819
#define MEID_EDIT_LINE_END_EXTEND 2820
#define MEID_EDIT_DOCUMENT_START_EXTEND 2821
#define MEID_EDIT_DOCUMENT_END_EXTEND 2822
#define MEID_EDIT_GO_TO_BRACKET_EXTEND 2823
#define MEID_EDIT_CHAR_RIGHT_EXTEND_BOX 2824
#define MEID_EDIT_CHAR_LEFT_EXTEND_BOX 2825
#define MEID_EDIT_WORD_RIGHT_EXTEND_BOX 2826
#define MEID_EDIT_WORD_LEFT_EXTEND_BOX 2827
#define MEID_EDIT_LINE_UP_EXTEND_BOX 2828
#define MEID_EDIT_LINE_DOWN_EXTEND_BOX 2829
#define MEID_EDIT_PAGE_UP_EXTEND_BOX 2830
#define MEID_EDIT_PAGE_DOWN_EXTEND_BOX 2831
#define MEID_EDIT_LINE_START_EXTEND_BOX 2832
#define MEID_EDIT_TEXT_START_EXTEND_BOX 2833
#define MEID_EDIT_LINE_END_EXTEND_BOX 2834
#define MEID_EDIT_DOCUMENT_START_EXTEND_BOX 2835
#define MEID_EDIT_DOCUMENT_END_EXTEND_BOX 2836
#define MEID_EDIT_CANCEL_SELECTION 2837
#define MEID_EDIT_DUPLICATE_LINE 2838
#define MEID_VIEW_MODE_SELECT 2839
#define MEID_TOOLS_IMPORT_SETTINGS 2840
#define MEID_TOOLS_EXPORT_SETTINGS 2841
#define MEID_TOOLS_RESET_SETTINGS 2842
#define MEID_WINDOW_SCROLL_LINE_UP 2843
#define MEID_WINDOW_SCROLL_LINE_DOWN 2844
// 3.6.2
#define MEID_EDIT_LOGICAL_LINE_START 2845
#define MEID_EDIT_LOGICAL_LINE_END 2846
#define MEID_EDIT_LOGICAL_LINE_START_EXTEND 2847
#define MEID_EDIT_LOGICAL_LINE_END_EXTEND 2848
// 3.7.1
#define MEID_FILE_RECENT_CLOSED_FILE1 2849 // to MEID_FILE_RECENT_CLOSED_FILE1 + 255 (3104)
#define MEID_FILE_OPEN_RECENT_CLOSED_FILE 3105
// 3.7.2
#define MEID_FILE_OPEN_IN_EXPLORER 3106
#define MEID_FILE_COPY_PATH 3107
// 3.7.3
#define MEID_VIEW_LINE_NUMBERS_ABSOLUTE 3108
#define MEID_VIEW_LINE_NUMBERS_RELATIVE 3109
#define MEID_VIEW_LINE_NUMBERS_INTERVAL 3110
#define MEID_VIEW_LINE_NUMBERS_LOGICAL 3111
#define MEID_VIEW_SHOW_LINE_NUMBERS_LINE 3112
// 3.7.14
#define MEID_FILE_RELOAD_GB18030 3113
#define MEID_EDIT_SELECT_LINE 3114
#define MEID_EDIT_SELECT_WORD 3115
// 3.7.16
#define MEID_FILE_RELOAD 3116

#define MEID_DICTS 4096
#define MEID_MODES 5120
#define MEID_MACROS 6144
#define MEID_PLUGINS 7168
#define MEID_TOOLS 8192
#define MEID_SUGGEST 9216

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
	BYTE bVisible;
	int iIndex;
	BYTE bBreak;
	int iWidth;
} TOOLBAR_INFO;

typedef struct tagSIZE_PTR
{
	int  cx;
	int  cy;
} SIZE_PTR, * PSIZE_PTR;

typedef struct tagPOINT_PTR
{
	int  x;
	int  y;
} POINT_PTR, * PPOINT_PTR;

typedef struct _RUN_MACRO_INFO {
	UINT  cbSize;
	LPCWSTR pszMacroFile;
	LPCWSTR pszText;
	UINT nFlags;
	UINT nDefMacroLang;
	POINT_PTR ptErrorPos;
} RUN_MACRO_INFO;

typedef struct _SEL_INFO {
	UINT cbSize;
	POINT_PTR ptStart;
	POINT_PTR ptEnd;
} SEL_INFO;

typedef struct _ATTR_INFO {
	UINT cbSize;
	POINT_PTR ptLogical;
	UINT nFlags;
	UINT nAttr;
	WCHAR szConfigScope[MAX_MODE_NAME];
	WCHAR szConfigDoc[MAX_MODE_NAME];
} ATTR_INFO;

typedef struct _TIP_INFO {
	UINT cbSize;
	LPCWSTR pszTip;
	UINT nFlags;
} TIP_INFO;

typedef struct _GREP_INFO {
	UINT cbSize;
	UINT nCP;
	UINT nFlags;
	LPCWSTR pszFind;
	LPCWSTR pszReplace;
	LPCWSTR pszPath;
} GREP_INFO;

// -----------------------------------------------------------------------------
// Editor_New
//   文書を新規作成します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   ウィンドウのハンドル

inline HWND Editor_New(HWND hwnd)
{
	return (HWND)SendMessage(hwnd, ME_NEW, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   プラグインのコマンドIDを取得します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   hInstance: プラグインのインスタンスのハンドル
// 戻り値
//   プラグインを実行するためのコマンドIDを返します

inline UINT Editor_GetCmdID(HWND hwnd, HINSTANCE hInstance)
{
	return (UINT)SendMessage(hwnd, ME_GET_CMD_ID, 0, (LPARAM)hInstance);
}

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   コマンドが実行可能か、またはチェックされた状態かを取得します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   nCmdID:    コマンドID
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

inline UINT Editor_GetSelText(HWND hwnd, UINT nBufferSize, LPWSTR szBuffer)
{
	return (UINT)SendMessage(hwnd, ME_GET_SEL_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetText
//   すべての文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   nBufferSize: 終端文字を含むバッファのサイズ
//   szBuffer:    文字列を取得するバッファへのポインタ
// 戻り値
//   nBufferSizeが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline UINT Editor_GetText(HWND hwnd, UINT nBufferSize, LPWSTR szBuffer)
{
	return (UINT)SendMessage(hwnd, ME_GET_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetLines
//   文書の行数を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
// 戻り値
//   文書の行数を返します

inline UINT Editor_GetLines(HWND hwnd, int nLogical)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINES, (WPARAM)(int)(nLogical), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_DocGetLines
//   指定する文書の行数を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   iDoc:     対象となる文書の0を基底とするインデックス
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
// 戻り値
//   文書の行数を返します

inline UINT Editor_GetDocLines(HWND hwnd, int iDoc, int nLogical)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINES, MAKEWPARAM(nLogical, iDoc + 1), (LPARAM)0);
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

inline UINT Editor_GetLine(HWND hwnd, GET_LINE_INFO* pGetLineInfo, LPWSTR szString)
{
	return (UINT)SendMessage(hwnd, ME_GET_LINE, (WPARAM)(GET_LINE_INFO*)(pGetLineInfo), (LPARAM)(LPWSTR)(szString));
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

inline void Editor_GetCaretPos(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_CARET_POS, (WPARAM)nLogical, (LPARAM)pptPos);
}

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   スクロールバーの位置を取得します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptPos: スクロールバーの位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetScrollPos(HWND hwnd, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT*)(pptPos));
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

inline UINT Editor_LineFromChar(HWND hwnd, int nLogical, UINT nSerialIndex)
{
	return (UINT)SendMessage(hwnd, ME_LINE_FROM_CHAR, (WPARAM)(int)(nLogical), (LPARAM)(UINT)(nSerialIndex));
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

inline UINT Editor_LineIndex(HWND hwnd, BOOL bLogical, UINT yLine)
{
	return (UINT)SendMessage(hwnd, ME_LINE_INDEX, (WPARAM)(BOOL)(bLogical), (LPARAM)(UINT)(yLine));
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

inline UINT Editor_LogicalToSerial(HWND hwnd, POINT* pptLogical)
{
	return (UINT)SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, (WPARAM)0, (LPARAM)(POINT*)(pptLogical));
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

inline void Editor_LogicalToView(HWND hwnd, POINT* pptLogical, POINT* pptView)
{
	SendMessage(hwnd, ME_LOGICAL_TO_VIEW, (WPARAM)(POINT*)(pptLogical), (LPARAM)(POINT*)(pptView));
}

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   ファイルに保存します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szFileName: 保存するファイル名
// 戻り値
//   成功するとTrueを返します

inline BOOL Editor_SaveFile(HWND hwnd, LPWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_SAVE_FILE, 0, (LPARAM)(LPWSTR)(szFileName));
}

// -----------------------------------------------------------------------------
// Editor_DocSaveFile
//   指定する文書をファイルに保存します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szFileName: 保存するファイル名
// 戻り値
//   成功するとTrueを返します

inline BOOL Editor_DocSaveFile(HWND hwnd, int iDoc, LPWSTR szFileName)
{
	return (BOOL)SendMessage(hwnd, ME_SAVE_FILE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szFileName));
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

inline void Editor_SerialToLogical(HWND hwnd, UINT nSerial, POINT* pptLogical)
{
	SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, (WPARAM)(UINT)(nSerial), (LPARAM)(POINT*)(pptLogical));
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

inline void Editor_SetCaretPos(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_SET_CARET_POS, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetCaretPosEx
//   カーソル位置を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   カーソル位置を指定した構造体へのポインタ
//   bExtend:  選択範囲を伸縮するかどうか
// 戻り値
//   使用されません

inline void Editor_SetCaretPosEx(HWND hwnd, int nLogical, POINT* pptPos, BOOL bExtend)
{
	SendMessage(hwnd, ME_SET_CARET_POS, MAKEWPARAM(nLogical, bExtend), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   スクロールバーの位置を設定します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptPos: スクロールバーの位置を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_SetScrollPos(HWND hwnd, POINT* pptPos)
{
	SendMessage(hwnd, ME_SET_SCROLL_POS, (WPARAM)0, (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   表示座標を論理座標に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   pptView:    表示座標を指定した構造体へのポインタ
//   pptLogical: 論理座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_ViewToLogical(HWND hwnd, POINT* pptView, POINT* pptLogical)
{
	SendMessage(hwnd, ME_VIEW_TO_LOGICAL, (WPARAM)(POINT*)(pptView), (LPARAM)(POINT*)(pptLogical));
}

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   指定するコマンドIDを実行します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   nCmdID: 実行するコマンドID
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
// Editor_DocGetModified
//   指定する文書が更新されているかどうかを取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   iDoc: 対象となる文書の0を基底とするインデックス
// 戻り値
//   更新されている場合はTrueを返します

inline BOOL Editor_GetModified(HWND hwnd, int iDoc)
{
	return (BOOL)SendMessage(hwnd, ME_GET_MODIFIED, MAKEWPARAM(0, iDoc + 1), (LPARAM)0);
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

inline void Editor_GetSelStart(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_START, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
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

inline void Editor_GetSelEnd(HWND hwnd, int nLogical, POINT* pptPos)
{
	SendMessage(hwnd, ME_GET_SEL_END, (WPARAM)(int)(nLogical), (LPARAM)(POINT*)(pptPos));
}

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   選択文字列の長さを設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   nLen: 選択文字列の長さ
// 戻り値
//   使用されません

inline void Editor_SetSelLength(HWND hwnd, UINT nLen)
{
	(void)SendMessage(hwnd, ME_SET_SEL_LENGTH, (WPARAM)(UINT)(nLen), (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_GetMode
//   編集モードを文字列で取得します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szModeName: 名称を取得するバッファ(MAX_MODE_NAMEの文字数)
// 戻り値
//   使用されません

inline void Editor_GetMode(HWND hwnd, LPWSTR szModeName)
{
	SendMessage(hwnd, ME_GET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_DocGetMode
//   指定する文書の編集モードを文字列で取得します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szModeName: 名称を取得するバッファ(MAX_MODE_NAMEの文字数)
// 戻り値
//   使用されません

inline void Editor_DocGetMode(HWND hwnd, int iDoc, LPWSTR szModeName)
{
	SendMessage(hwnd, ME_GET_MODE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_SetMode
//   編集モードを文字列で設定します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szModeName: 編集モードの名称
// 戻り値
//   使用されません

inline BOOL Editor_SetMode(HWND hwnd, LPWSTR szModeName)
{
	return (BOOL)SendMessage(hwnd, ME_SET_MODE, (WPARAM)0, (LPARAM)(LPWSTR)(szModeName));
}

// -----------------------------------------------------------------------------
// Editor_DocSetMode
//   指定する文書の編集モードを文字列で設定します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szModeName: 編集モードの名称
// 戻り値
//   使用されません

inline BOOL Editor_DocSetMode(HWND hwnd, int iDoc, LPWSTR szModeName)
{
	return (BOOL)SendMessage(hwnd, ME_SET_MODE, MAKEWPARAM(0, iDoc + 1), (LPARAM)(LPWSTR)(szModeName));
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

inline void Editor_InsertString(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_PER_PROP, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_Insert
//   カーソル位置に文字列を挿入します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

inline void Editor_Insert(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_INSERT, (LPARAM)(LPCWSTR)(szString));
}

// -----------------------------------------------------------------------------
// Editor_Overwrite
//   カーソル位置に文字列を上書きします
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

inline void Editor_Overwrite(HWND hwnd, LPCWSTR szString)
{
	SendMessage(hwnd, ME_INSERT_STRING, (WPARAM)OVERWRITE_OVERWRITE, (LPARAM)(LPCWSTR)(szString));
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

inline void Editor_SetSelView(HWND hwnd, POINT* pptSelStart, POINT* pptSelEnd)
{
	SendMessage(hwnd, ME_SET_SEL_VIEW, (WPARAM)(POINT*)(pptSelStart), (LPARAM)(POINT*)(pptSelEnd));
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
//   FLAG_FIND_NEXT:         次を検索します
//   FLAG_FIND_MATCH_CASE:   大文字と小文字を区別します
//   FLAG_FIND_REG_EX:       正規表現を使用します
//   FLAG_FIND_WHOLE_WORD:   単語のみ検索します
//   FLAG_FIND_AROUND:       文末まで検索したら文頭に移動します
//   FLAG_FIND_MIGEMO:       ローマ字検索を使用します
//   FLAG_FIND_FUZZY:        あいまい検索を使用します
//   FLAG_FIND_SEL_ONLY:     選択した範囲のみ検索します
//   FLAG_FIND_ALL:          すべて検索します
//   FLAG_FIND_NOT_BOL:      選択範囲の先頭を行頭とみなしません
//   FLAG_FIND_NOT_EOL:      選択範囲の終端を行末とみなしません
//   FLAG_FIND_KEEP_OPTIONS: 検索オプションを維持します

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
//   FLAG_FIND_MATCH_CASE:   大文字と小文字を区別します
//   FLAG_FIND_REG_EX:       正規表現を使用します
//   FLAG_FIND_WHOLE_WORD:   単語のみ検索します
//   FLAG_FIND_AROUND:       文末まで検索したら文頭に移動します
//   FLAG_FIND_MIGEMO:       ローマ字検索を使用します
//   FLAG_FIND_FUZZY:        あいまい検索を使用します
//   FLAG_FIND_SEL_ONLY:     選択した範囲のみ検索します
//   FLAG_REPLACE_ALL:       すべて置換します
//   FLAG_FIND_NOT_BOL:      選択範囲の先頭を行頭とみなしません
//   FLAG_FIND_NOT_EOL:      選択範囲の終端を行末とみなしません
//   FLAG_FIND_KEEP_OPTIONS: 検索オプションを維持します

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
//   FLAG_CAPITALIZE:         単語の最初の文字を大文字に変換します
//   FLAG_CONVERT_SELECT_ALL: すべて選択して変換します

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

inline UINT Editor_GetMargin(HWND hwnd)
{
	return (UINT)SendMessage(hwnd, ME_GET_MARGIN, (WPARAM)0, (LPARAM)0);
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
//   SEL_TYPE_NONE:  選択されていません
//   SEL_TYPE_CHAR:  通常選択されています
//   SEL_TYPE_BOX:   矩形選択されています
//   SEL_TYPE_MULTI: 複数選択されています

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
//   文書の情報を取得/設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   nCmd: 取得/設定する情報の種類
// 戻り値
//   nCmdにより異なります
// 備考
//   MI_GET_FILE_NAME:                開いているファイル名を取得します
//   MI_GET_APP_VERSION:              バージョンを取得します
//   MI_IS_WINDOW_COMBINED:           タブの有効/無効を取得します
//   MI_WINDOW_COMBINE:               タブの有効/無効を設定します
//   MI_GET_DOC_COUNT:                開いている文書の数を取得します
//   MI_INDEX_TO_DOC:                 文書のインデックスからハンドルに変換します
//   MI_DOC_TO_INDEX:                 文書のハンドルからインデックスに変換します
//   MI_GET_ACTIVE_INDEX:             アクティブな文書のインデックスを取得します
//   MI_SET_ACTIVE_INDEX:             インデックスを指定して文書をアクティブにします
//   MI_GET_ACTIVE_DOC:               アクティブな文書のハンドルを取得します
//   MI_SET_ACTIVE_DOC:               ハンドルを指定して文書をアクティブにします
//   MI_CLOSE_DOC:                    文書を閉じます
//   MI_SAVE_DOC:                     文書を保存します
//   MI_GET_FONT_NAME:                フォント名を取得します
//   MI_GET_FONT_CHARSET:             フォントの文字セットを取得します
//   MI_GET_FONT_SIZE:                フォントのサイズを取得します
//   MI_GET_TEXT_COLOR:               文字の色を取得します
//   MI_GET_BACK_COLOR:               背景の色を取得します
//   MI_GET_INVERT_COLOR:             色の反転の有効/無効を取得します
//   MI_GET_DWRITE_ENABLED:           DirectWriteの有効/無効を取得します
//   MI_GET_DWRITE_RENDERING_PARAMS:  DirectWriteのレンダリングパラメーターを取得します
//     DWRITE_GAMMA:                  ガンマ
//     DWRITE_ENHANCED_CONTRAST:      コントラスト
//     DWRITE_CLEAR_TYPE_LEVEL:       ClearTypeレベル
//     DWRITE_RENDERING_MODE:         レンダリングモード
//     DWRITE_TEXT_ANTIALIAS_MODE:    アンチエイリアスモード
//   MI_GET_COLOR_FONT_ENABLED:       カラーフォントの有効/無効を取得します
//   MI_GET_GDI_COMPATIBLE:           GDI互換モードの有効/無効を取得します
//   MI_GET_VERTICAL:                 縦書きの有効/無効を取得します
//   MI_GET_ENCODING:                 エンコードを取得します
//   MI_SET_ENCODING:                 エンコードを設定します
//   MI_GET_LINE_ENDING:              改行コードを取得します
//   MI_SET_LINE_ENDING:              改行コードを設定します
//   MI_GET_INDENT_STYLE:             インデントスタイルを取得します
//   MI_SET_INDENT_STYLE:             インデントスタイルを設定します
//   MI_GET_INDENT_SIZE:              インデントサイズを取得します
//   MI_SET_INDENT_SIZE:              インデントサイズを設定します
//   MI_GET_TRIM_TRAILING_WHITESPACE: 保存する前に改行文字の前にある空白文字を削除するかどうかを取得します
//   MI_SET_TRIM_TRAILING_WHITESPACE: 保存する前に改行文字の前にある空白文字を削除するかどうかを設定します
//   MI_GET_INSERT_FINAL_NEWLINE:     保存する前にファイルが改行で終了するようにするかどうかを取得します
//   MI_SET_INSERT_FINAL_NEWLINE:     保存する前にファイルが改行で終了するようにするかどうかを設定します
//   MI_GET_DWRITE_AUTODETECT:        DirectWriteの自動設定の有効/無効を取得します
//   MI_GET_MAX_LINE_LENGTH:          行の折り返し文字数を取得します
//   MI_SET_MAX_LINE_LENGTH:          行の折り返し文字数を設定します
//   MI_GET_DARK_MODE:                ダークモードの有効/無効を取得します
//   MI_GET_LIGATURES_ENABLED:        DirectWriteの合字の有効/無効を取得します
//   MI_GET_HALF_WIDTH_ENABLED:       DirectWriteの等幅半角字形の有効/無効を取得します
//   MI_GET_READ_ONLY:                書き換え禁止の有効/無効を取得します
//   MI_GET_FONT_HEIGHT:              フォントの高さを取得します
//   MI_GET_USE_MICA:                 マイカの有効/無効を取得します
//   MI_GET_NEXT_BOOKMARK:            次のブックマーク位置を取得します
//   MI_GET_PREV_BOOKMARK:            前のブックマーク位置を取得します
//   MI_GET_BOOKMARK_COUNT:           ブックマークの数を取得します
//   MI_ADD_BOOKMARK:                 指定した行にブックマークを設定します
//   MI_REMOVE_BOOKMARK:              指定した行のブックマークを解除します
//   MI_CLEAR_BOOKMARK:               すべてのブックマークを解除します

inline LRESULT Editor_Info(HWND hwnd, WPARAM nCmd, LPARAM lParam)
{
	return (LRESULT)SendMessage(hwnd, ME_INFO, (WPARAM)nCmd, (LPARAM)lParam);
}

// -----------------------------------------------------------------------------
// Editor_DocInfo
//   指定する文書の情報を取得/設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   iDoc: 0を基底とする文書のインデックス
//   nCmd: 取得/設定する情報の種類
// 戻り値
//   nCmdにより異なります

inline LRESULT Editor_DocInfo(HWND hwnd, int iDoc, WPARAM nCmd, LPARAM lParam)
{
	return (LRESULT)SendMessage(hwnd, ME_INFO, MAKEWPARAM(nCmd, iDoc + 1), (LPARAM)lParam);
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

inline UINT Editor_GetStatus(HWND hwnd, LPCWSTR szStatus, UINT nBufSize)
{
	return (UINT)SendMessage(hwnd, ME_GET_STATUS, (WPARAM)nBufSize, (LPARAM)(LPCWSTR)(szStatus));
}

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   カスタムバーを開きます
// パラメータ
//   hwnd:           ウィンドウのハンドル
//   pCustomBarInfo: TCustomBarInfo構造体へのポインタ
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

// -----------------------------------------------------------------------------
// Editor_OutputString
//   アウトプットバーに文字列を追加します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 追加する文字列
//   nFlags:   フラグ
// 戻り値
//   成功するとTrueを返します
// 備考
//   FLAG_OPEN_OUTPUT:  アウトプットバーを開きます
//   FLAG_CLOSE_OUTPUT: アウトプットバーを閉じます
//   FLAG_FOCUS_OUTPUT: アウトプットバーにフォーカスを設定します
//   FLAG_CLEAR_OUTPUT: アウトプットバの文字列をクリアします

inline BOOL Editor_OutputString(HWND hwnd, LPCWSTR szString, UINT nFlags)
{
	return (BOOL)SendMessage(hwnd, ME_OUTPUT_STRING, (WPARAM)nFlags, (LPARAM)szString);
}

// -----------------------------------------------------------------------------
// Editor_GetOutputString
//   アウトプットバーの文字列を取得します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   cchBuf: 終端文字を含むバッファのサイズ
//   pBuf:   文字列を取得するバッファへのポインタ
// 戻り値
//   cchBufが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline UINT Editor_GetOutputString(HWND hwnd, UINT cchBuf, LPWSTR pBuf)
{
	return (UINT)SendMessage(hwnd, ME_GET_OUTPUT_STRING, (WPARAM)cchBuf, (LPARAM)pBuf);
}

// -----------------------------------------------------------------------------
// Editor_DoIdle
//   表示更新を行います
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

inline void Editor_DoIdle(HWND hwnd)
{
	SendMessage(hwnd, ME_DO_IDLE, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_AddUndo
//   元に戻す情報を追加します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

inline void Editor_AddUndo(HWND hwnd)
{
	SendMessage(hwnd, ME_ADD_UNDO, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_BeginUndoGroup
//   元に戻すグループを開始します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

inline void Editor_BeginUndoGroup(HWND hwnd)
{
	SendMessage(hwnd, ME_BEGIN_UNDO_GROUP, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_EndUndoGroup
//   元に戻すグループを終了します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

inline void Editor_EndUndoGroup(HWND hwnd)
{
	SendMessage(hwnd, ME_END_UNDO_GROUP, (WPARAM)0, (LPARAM)0);
}

// -----------------------------------------------------------------------------
// Editor_RunMacro
//   マクロを実行します
// パラメータ
//   hwnd:          ウィンドウのハンドル
//   nFlags:        RUN_FILE, RUN_TEXT
//   nDefMacroLang: MACRO_LANG_JSCRIPT, MACRO_LANG_VBSCRIPT, MACRO_LANG_UNKNOWN
//   pszMacroFile:  マクロファイルのパス
//   pszText:       マクロテキスト
//   pptErrorPos:   マクロのエラー位置
// 戻り値
//   S_OK:    操作に成功しました
//   S_FALSE: マクロエラーが発生しました
//   E_FAIL:  致命的なエラーが発生しました

inline HRESULT Editor_RunMacro(HWND hwnd, UINT nFlags, UINT nDefMacroLang, LPCWSTR pszMacroFile, LPCWSTR pszText, POINT_PTR* pptErrorPos)
{
	RUN_MACRO_INFO rmi = { 0 };
	rmi.cbSize = sizeof(rmi);
	rmi.pszMacroFile = pszMacroFile;
	rmi.pszText = pszText;
	rmi.nFlags = nFlags;
	rmi.nDefMacroLang = nDefMacroLang;
	rmi.ptErrorPos.x = rmi.ptErrorPos.y = -1;
	HRESULT hr = (HRESULT)SendMessage(hwnd, ME_RUN_MACRO, 0, (LPARAM)&rmi);
	if (pptErrorPos) {
		pptErrorPos->x = rmi.ptErrorPos.x;
		pptErrorPos->y = rmi.ptErrorPos.y;
	}
	return hr;
}

// -----------------------------------------------------------------------------
// Editor_GetMultiSel
//   複数選択を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   iSel:     選択範囲のインデックス
//   pSelInfo: SEL_INFO構造体へのポインタ
// 戻り値
//   iSel に -1 を指定した場合は選択範囲の数、それ以外の場合は選択範囲に関する情報と True、複数選択でない場合やエラーが発生した場合は False を返します

inline UINT_PTR Editor_GetMultiSel(HWND hwnd, int iSel, SEL_INFO* pSelInfo)
{
	return (UINT_PTR)SendMessage(hwnd, ME_GET_MULTI_SEL, (WPARAM)iSel, (LPARAM)pSelInfo);
}

// -----------------------------------------------------------------------------
// Editor_SetMultiSel
//   複数選択を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   iSel:     選択範囲のインデックス
//   pSelInfo: SEL_INFO構造体へのポインタ
// 戻り値
//   選択範囲に関する情報を設定した場合は True、複数選択でない場合やエラーが発生した場合は False を返します

inline UINT_PTR Editor_SetMultiSel(HWND hwnd, int iSel, const SEL_INFO* pSelInfo)
{
	return (UINT_PTR)SendMessage(hwnd, ME_SET_MULTI_SEL, (WPARAM)iSel, (LPARAM)pSelInfo);
}

// -----------------------------------------------------------------------------
// Editor_GetDroppedText
//   ドロップされた文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   nBufferSize: 終端文字を含むバッファのサイズ
//   szBuffer:    文字列を取得するバッファへのポインタ
// 戻り値
//   nBufferSizeが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

inline UINT Editor_GetDroppedText(HWND hwnd, UINT nBufferSize, LPWSTR szBuffer)
{
	return (UINT)SendMessage(hwnd, ME_GET_DROPPED_TEXT, (WPARAM)nBufferSize, (LPARAM)szBuffer);
}

// -----------------------------------------------------------------------------
// Editor_GetPageSize
//   1ページのサイズを取得します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   psizePage: 1ページに表示できる桁数と行数を表す構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_GetPageSize(HWND hwnd, SIZE_PTR* psizePage)
{
	SendMessage(hwnd, ME_GET_PAGE_SIZE, (WPARAM)0, (LPARAM)(SIZE_PTR*)(psizePage));
}

// -----------------------------------------------------------------------------
// Editor_DevToView
//   デバイス座標を表示座標に変換します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   pptDev:  デバイス座標を指定した構造体へのポインタ
//   pptView: 表示座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_DevToView(HWND hwnd, POINT_PTR* pptDev, POINT_PTR* pptView)
{
	SendMessage(hwnd, ME_DEV_TO_VIEW, (WPARAM)(POINT_PTR*)(pptDev), (LPARAM)(POINT_PTR*)(pptView));
}

// -----------------------------------------------------------------------------
// Editor_ViewToDev
//   表示座標をデバイス座標に変換します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   pptView: 表示座標を指定した構造体へのポインタ
//   pptDev:  デバイス座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_ViewToDev(HWND hwnd, POINT_PTR* pptView, POINT_PTR* pptDev)
{
	SendMessage(hwnd, ME_VIEW_TO_DEV, (WPARAM)(POINT_PTR*)(pptView), (LPARAM)(POINT_PTR*)(pptDev));
}

// -----------------------------------------------------------------------------
// Editor_GetAttr
//   指定した位置の属性を取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   pAI:  ATTR_INFO構造体へのポインタ
// 戻り値
//   成功するとTrueを返します

inline BOOL Editor_GetAttr(HWND hwnd, ATTR_INFO* pAI)
{
	return (BOOL)SendMessage(hwnd, ME_GET_ATTR, (WPARAM)0, (LPARAM)pAI);
}

// -----------------------------------------------------------------------------
// Editor_ShowTip
//   ツールチップを表示します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   pTI:  TIP_INFO構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_ShowTip(HWND hwnd, TIP_INFO* pTI)
{
	SendMessage(hwnd, ME_SHOW_TIP, (WPARAM)0, (LPARAM)pTI);
}

// -----------------------------------------------------------------------------
// Editor_FindInFiles
//   ファイルから検索します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   pGI:  GREP_INFO構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_FindInFiles(HWND hwnd, GREP_INFO* pGI)
{
	SendMessage(hwnd, ME_FIND_IN_FILES, (WPARAM)0, (LPARAM)pGI);
}

// -----------------------------------------------------------------------------
// Editor_ReplaceInFiles
//   ファイルから置換します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   pGI:  GREP_INFO構造体へのポインタ
// 戻り値
//   使用されません

inline void Editor_ReplaceInFiles(HWND hwnd, GREP_INFO* pGI)
{
	SendMessage(hwnd, ME_REPLACE_IN_FILES, (WPARAM)0, (LPARAM)pGI);
}
