unit mPlugin;

interface

uses
{$IF CompilerVersion > 22.9}
  Winapi.Windows, Winapi.Messages;
{$ELSE}
  Windows, Messages;
{$IFEND}


const
  MAX_MODE_NAME = 260;
  MAX_THEME_NAME = 32;

  COLOR_GENERAL = 0;
  COLOR_SELECTION = 1;
  COLOR_CURRENT_LINE = 2;
  COLOR_HYPERLINK = 3;
  COLOR_STRING = 4;
  COLOR_COMMENT = 5;
  COLOR_SCRIPT = 6;
  COLOR_BRACKET = 7;
  COLOR_TAG = 8;
  COLOR_KEYWORD_1 = 9;
  COLOR_KEYWORD_2 = 10;
  COLOR_KEYWORD_3 = 11;
  COLOR_KEYWORD_4 = 12;
  COLOR_KEYWORD_5 = 13;
  COLOR_KEYWORD_6 = 14;
  COLOR_KEYWORD_7 = 15;
  COLOR_KEYWORD_8 = 16;
  COLOR_CRLF = 17;
  COLOR_WRAP = 18;
  COLOR_TAB = 19;
  COLOR_EOF = 20;
  COLOR_CARET_LINE = 21;
  COLOR_LINE_NUMBERS = 22;
  COLOR_RULER = 23;
  COLOR_VERTICAL_LINE = 24;
  COLOR_SB_ALPHABETIC = 25;
  COLOR_SB_NUMBER = 26;
  COLOR_SB_SYMBOL = 27;
  COLOR_SB_KATAKANA = 28;
  COLOR_SB_SPACE = 29;
  COLOR_DB_ALPHABET = 30;
  COLOR_DB_NUMBER = 31;
  COLOR_DB_SYMBOL = 32;
  COLOR_DB_HIRAGANA = 33;
  COLOR_DB_KATAKANA = 34;
  COLOR_DB_KANJI = 35;
  COLOR_DB_SPACE = 36;
  COLOR_BOOKMARK = 37;
  COLOR_SEARCH_STRING = 38;
  COLOR_FOREIGN = 39;
  COLOR_OTHER = 40;
  COLOR_CONTROL = 41;
  COLOR_INVALID = 42;

  // 2.5.0
  DWRITE_GAMMA = 256;
  DWRITE_ENHANCED_CONTRAST = 257;
  DWRITE_CLEAR_TYPE_LEVEL = 258;
  DWRITE_RENDERING_MODE = 259;

  CUSTOM_BAR_LEFT = 0;
  CUSTOM_BAR_TOP = 1;
  CUSTOM_BAR_RIGHT = 2;
  CUSTOM_BAR_BOTTOM = 3;
  MAX_CUSTOM_BAR = 4;

  EVENT_CREATE = $00000001;
  EVENT_CLOSE = $00000002;
  EVENT_CREATE_FRAME = $00000004;
  EVENT_CLOSE_FRAME = $00000008;
  EVENT_SET_FOCUS = $00000010;
  EVENT_KILL_FOCUS = $00000020;
  EVENT_FILE_OPENED = $00000040;
  EVENT_FILE_SAVED = $00000080;
  EVENT_MODIFIED = $00000100;
  EVENT_CARET_MOVED = $00000200;
  EVENT_SCROLL = $00000400;
  EVENT_SEL_CHANGED = $00000800;
  EVENT_CHANGED = $00001000;
  EVENT_CHAR = $00002000;
  EVENT_MODE_CHANGED = $00004000;
  EVENT_DOC_SEL_CHANGED = $00008000;
  EVENT_DOC_CLOSE = $00010000;
  EVENT_TAB_MOVED = $00020000;
  EVENT_CUSTOM_BAR_CLOSING = $00040000;
  EVENT_CUSTOM_BAR_CLOSED = $00080000;
  EVENT_TOOL_BAR_CLOSED = $00100000;
  EVENT_TOOL_BAR_SHOW = $00200000;
  EVENT_IDLE = $00400000;
  // 2.3.0
  EVENT_FILE_SAVING = $00800000;
  // 2.4.0
  EVENT_DPI_CHANGED = $01000000;

  CLOSED_FRAME_WINDOW = 1;
  CLOSED_ANOTHER_CUSTOM_BAR = 2;

  ME_FIRST = WM_USER + $0400;
  ME_NEW = ME_FIRST + 0;
  ME_GET_CMD_ID = ME_FIRST + 1;
  ME_QUERY_STATUS = ME_FIRST + 2;
  ME_GET_SEL_TEXT = ME_FIRST + 3;
  ME_GET_LINES = ME_FIRST + 4;
  ME_GET_LINE = ME_FIRST + 5;
  ME_GET_CARET_POS = ME_FIRST + 6;
  ME_GET_SCROLL_POS = ME_FIRST + 7;
  ME_LINE_FROM_CHAR = ME_FIRST + 8;
  ME_LINE_INDEX = ME_FIRST + 9;
  ME_LOAD_FILE = ME_FIRST + 10;
  ME_LOGICAL_TO_SERIAL = ME_FIRST + 11;
  ME_LOGICAL_TO_VIEW = ME_FIRST + 12;
  ME_SAVE_FILE = ME_FIRST + 13;
  ME_SERIAL_TO_LOGICAL = ME_FIRST + 14;
  ME_SET_CARET_POS = ME_FIRST + 15;
  ME_SET_SCROLL_POS = ME_FIRST + 16;
  ME_VIEW_TO_LOGICAL = ME_FIRST + 17;
  ME_EXEC_COMMAND = ME_FIRST + 18;
  ME_GET_MODIFIED = ME_FIRST + 19;
  ME_SET_MODIFIED = ME_FIRST + 20;
  ME_GET_SEL_START = ME_FIRST + 21;
  ME_GET_SEL_END = ME_FIRST + 22;
  ME_SET_SEL_LENGTH = ME_FIRST + 23;
  ME_GET_MODE = ME_FIRST + 24;
  ME_SET_MODE = ME_FIRST + 25;
  ME_EMPTY_UNDO_BUFFER = ME_FIRST + 26;
  ME_INSERT_STRING = ME_FIRST + 27;
  ME_SET_SEL_VIEW = ME_FIRST + 28;
  ME_FIND = ME_FIRST + 29;
  ME_REPLACE = ME_FIRST + 30;
  ME_SET_STATUS = ME_FIRST + 31;
  ME_CONVERT = ME_FIRST + 32;
  ME_GET_MARGIN = ME_FIRST + 33;
  ME_GET_VERSION = ME_FIRST + 34;
  ME_REDRAW = ME_FIRST + 35;
  ME_GET_SEL_TYPE = ME_FIRST + 36;
  ME_IS_CHAR_HALF_OR_FULL = ME_FIRST + 37;
  ME_INFO = ME_FIRST + 38;
  ME_GET_STATUS = ME_FIRST + 39;
  ME_CUSTOM_BAR_OPEN = ME_FIRST + 40;
  ME_CUSTOM_BAR_CLOSE = ME_FIRST + 41;
  ME_MATCH_REGEX = ME_FIRST + 42;
  ME_FIND_REGEX = ME_FIRST + 43;
  ME_ENUM_MODE = ME_FIRST + 44;
  ME_TOOL_BAR_OPEN = ME_FIRST + 45;
  ME_TOOL_BAR_CLOSE = ME_FIRST + 46;
  ME_TOOL_BAR_SHOW = ME_FIRST + 47;
  ME_OUTPUT_STRING = ME_FIRST + 48;
  ME_GET_OUTPUT_STRING = ME_FIRST + 49;
  // 2.5.0
  ME_DO_IDLE = ME_FIRST + 50;
  ME_LAST = ME_FIRST + 255;

  MI_GET_FILE_NAME = 256;
  MI_GET_APP_VERSION = 257;
  MI_IS_WINDOW_COMBINED = 258;
  MI_WINDOW_COMBINE = 259;
  MI_GET_DOC_COUNT = 260;
  MI_INDEX_TO_DOC = 261;
  MI_DOC_TO_INDEX = 262;
  MI_GET_ACTIVE_INDEX = 263;
  MI_SET_ACTIVE_INDEX = 264;
  MI_GET_ACTIVE_DOC = 265;
  MI_SET_ACTIVE_DOC = 266;
  MI_CLOSE_DOC = 267;
  MI_SAVE_DOC = 268;
  MI_GET_FONT_NAME = 269;
  MI_GET_FONT_CHARSET = 270;
  MI_GET_FONT_SIZE = 271;
  MI_GET_TEXT_COLOR = 272;
  MI_GET_BACK_COLOR = 273;
  MI_GET_INVERT_COLOR = 274;
  // 2.5.0
  MI_GET_DWRITE_ENABLED = 275;
  MI_GET_DWRITE_RENDERING_PARAMS = 276;
  MI_GET_COLOR_FONT_ENABLED = 277;
  // 2.5.5
  MI_GET_GDI_COMPATIBLE = 278;

  OVERWRITE_PER_PROP = 0;
  OVERWRITE_INSERT = 1;
  OVERWRITE_OVERWRITE = 2;
  OVERWRITE_MASK = 3;

  FLAG_OPEN_OUTPUT = 1;
  FLAG_CLOSE_OUTPUT = 2;
  FLAG_FOCUS_OUTPUT = 4;
  FLAG_CLEAR_OUTPUT = 8;

  POS_VIEW = 0;
  POS_LOGICAL = 1;
  POS_DEV = 2;
  MAX_LINE_COLUMN_MODE = 4;
  SEL_TYPE_NONE = 0;
  SEL_TYPE_CHAR = 1;
  SEL_TYPE_BOX = 2;
  FLAG_MAKE_LOWER = 0;
  FLAG_MAKE_UPPER = 1;
  FLAG_HAN_TO_ZEN = 2;
  FLAG_ZEN_TO_HAN = 3;
  FLAG_CAPITALIZE = 4;
  FLAG_CONVERT_SELECT_ALL = $0100;
  FLAG_FIND_NEXT = $00000001;
  FLAG_REPLACE_ALL = $00000002;
  FLAG_FIND_OPEN_DOC = $00000004;
  FLAG_FIND_MATCH_CASE = $00000008;
  FLAG_FIND_RECURSIVE = $00000010;
  FLAG_FIND_REG_EX = $00000020;
  FLAG_FIND_WHOLE_WORD = $00000040;
  FLAG_FIND_AROUND = $00000080;
  FLAG_REPLACE_SEL_ONLY = $00000100;
  FLAG_FIND_CLOSE = $00000200;
  FLAG_FIND_FILENAMES_ONLY = $00000400;
  FLAG_REPLACE_BACKUP = $00000800;
  FLAG_LOGICAL = 1;
  FLAG_WITH_CRLF = 2;
  FLAG_GET_CRLF_BYTE = 4;
  FLAG_CR_ONLY = 1;
  FLAG_LF_ONLY = 2;

  MP_FIRST = WM_USER + $0500;
  MP_QUERY_PROPERTIES = MP_FIRST + 0;
  MP_SET_PROPERTIES = MP_FIRST + 1;
  MP_GET_NAME = MP_FIRST + 2;
  MP_GET_VERSION = MP_FIRST + 3;
  MP_PRE_TRANSLATE_MSG = MP_FIRST + 4;
  MP_LAST = MP_FIRST + 50;

  MEID_NEW = 2048;
  MEID_NEW_PASTE = 2049;
  MEID_NEW_PASTE_QUOTES = 2050;
  MEID_OPEN = 2051;
  MEID_FIND_IN_FILES = 2052;
  MEID_SAVE_ALL = 2053;
  MEID_SAVE_CLOSE_ALL = 2054;
  MEID_CLOSE_ALL = 2055;
  MEID_CASCADE = 2056;
  MEID_TILE_HORZ = 2057;
  MEID_TILE_VERT = 2058;
  MEID_MINIMIZE_ALL = 2059;
  MEID_CLOSE_TRAY_ICON = 2060;
  MEID_FILE_NEW = 2061;
  MEID_FILE_OPEN = 2062;
  MEID_FILE_CLOSE_OPEN = 2063;
  MEID_FILE_SAVE = 2064;
  MEID_FILE_SAVE_AS = 2065;
  MEID_FILE_SAVE_ALL = 2066;
  MEID_FILE_INSERT = 2067;
  MEID_FILE_RELOAD_AUTO_SELECT = 2068;
  MEID_FILE_RELOAD_UTF16LE = 2069;
  MEID_FILE_RELOAD_UTF16BE = 2070;
  MEID_FILE_RELOAD_UTF8 = 2071;
  MEID_FILE_RELOAD_UTF7 = 2072;
  MEID_FILE_RELOAD_ARABIC = 2073;
  MEID_FILE_RELOAD_BALTIC = 2074;
  MEID_FILE_RELOAD_CENTRAL_EUROPEAN = 2075;
  MEID_FILE_RELOAD_CHINESE_SIMPLIFIED = 2076;
  MEID_FILE_RELOAD_CHINESE_TRADITIONAL = 2077;
  MEID_FILE_RELOAD_CYRILLIC = 2078;
  MEID_FILE_RELOAD_GREEK = 2079;
  MEID_FILE_RELOAD_HEBREW = 2080;
  MEID_FILE_RELOAD_EUC = 2081;
  MEID_FILE_RELOAD_JIS = 2082;
  MEID_FILE_RELOAD_SHIFTJIS = 2083;
  MEID_FILE_RELOAD_KOREAN = 2084;
  MEID_FILE_RELOAD_THAI = 2085;
  MEID_FILE_RELOAD_TURKISH = 2086;
  MEID_FILE_RELOAD_VIETNAMESE = 2087;
  MEID_FILE_RELOAD_WESTERN_EUROPEAN = 2088;
  MEID_FILE_LINE_ENDING_CRLF = 2089;
  MEID_FILE_LINE_ENDING_CR = 2090;
  MEID_FILE_LINE_ENDING_LF = 2091;
  MEID_FILE_PRINT = 2092;
  MEID_FILE_PRINT_PREVIEW = 2093;
  MEID_FILE_SAVE_CLOSE = 2094;
  MEID_FILE_CLOSE = 2095;
  MEID_FILE_SAVE_CLOSE_ALL = 2096;
  MEID_FILE_CLOSE_ALL = 2097;
  MEID_EDIT_UNDO = 2098;
  MEID_EDIT_REDO = 2099;
  MEID_EDIT_CUT = 2100;
  MEID_EDIT_COPY = 2101;
  MEID_EDIT_COPY_QUOTES = 2102;
  MEID_EDIT_PASTE = 2103;
  MEID_EDIT_DELETE = 2104;
  MEID_EDIT_SELECT_ALL = 2105;
  MEID_EDIT_DATE_TIME = 2106;
  MEID_EDIT_GO_TO_LINE = 2107;
  MEID_EDIT_GO_TO_FILE = 2108;
  MEID_EDIT_READ_ONLY = 2109;
  MEID_EDIT_INSERT_NEW_LINES = 2110;
  MEID_EDIT_REMOVE_NEW_LINES = 2111;
  MEID_EDIT_SPLIT_LINES = 2112;
  MEID_EDIT_JOIN_LINES = 2113;
  MEID_EDIT_UPPER_CASE = 2114;
  MEID_EDIT_LOWER_CASE = 2115;
  MEID_EDIT_CAPITALIZE = 2116;
  MEID_EDIT_HALF_WIDTH = 2117;
  MEID_EDIT_FULL_WIDTH = 2118;
  MEID_EDIT_TABIFY = 2119;
  MEID_EDIT_UNTABIFY = 2120;
  MEID_EDIT_INDENT = 2121;
  MEID_EDIT_UNINDENT = 2122;
  MEID_EDIT_RECONVERT = 2123;
  MEID_EDIT_BASE64_DECODE = 2124;
  MEID_EDIT_INSERT = 2125;
  MEID_EDIT_TOGGLE_BOOKMARK = 2126;
  MEID_EDIT_NEXT_BOOKMARK = 2127;
  MEID_EDIT_PREV_BOOKMARK = 2128;
  MEID_EDIT_CLEAR_BOOKMARK = 2129;
  MEID_EDIT_TOGGLE_SPELL = 2130;
  MEID_EDIT_NEXT_SPELL = 2131;
  MEID_EDIT_PREV_SPELL = 2132;
  MEID_SEARCH_FIND = 2133;
  MEID_SEARCH_NEXT = 2134;
  MEID_SEARCH_PREV = 2135;
  MEID_SEARCH_NEXT_WORD = 2136;
  MEID_SEARCH_PREV_WORD = 2137;
  MEID_SEARCH_REPLACE = 2138;
  MEID_SEARCH_ERASE_FIND_HIGHLIGHT = 2139;
  MEID_SEARCH_FIND_IN_FILES = 2140;
  MEID_SEARCH_REPLACE_IN_FILES = 2141;
  MEID_SEARCH_GOOGLE = 2142;
  MEID_SEARCH_WIKIPEDIA = 2143;
  MEID_VIEW_MODE_CUSTOMIZE = 2144;
  MEID_VIEW_INVERT_COLOR = 2145;
  MEID_VIEW_WRAP_NONE = 2146;
  MEID_VIEW_WRAP_BY_CHAR = 2147;
  MEID_VIEW_WRAP_BY_WINDOW = 2148;
  MEID_VIEW_SHOW_LINE_NUMBERS = 2149;
  MEID_VIEW_SHOW_RULER = 2150;
  MEID_VIEW_SHOW_CRLF = 2151;
  MEID_VIEW_SHOW_WRAP = 2152;
  MEID_VIEW_SHOW_EOF = 2153;
  MEID_VIEW_SHOW_TABS = 2154;
  MEID_VIEW_SHOW_SB_SPACES = 2155;
  MEID_VIEW_SHOW_DB_SPACES = 2156;
  MEID_VIEW_CRLF_DIFFERENT = 2157;
  MEID_VIEW_STANDARD_BAR = 2158;
  MEID_VIEW_MACROS_BAR = 2159;
  MEID_VIEW_PLUGINS_BAR = 2160;
  MEID_VIEW_TOOLS_BAR = 2161;
  MEID_VIEW_TOOL_BAR_TITLES = 2162;
  MEID_VIEW_LOCK_TOOL_BARS = 2163;
  MEID_VIEW_TOOL_BAR_CUSTOMIZE = 2164;
  MEID_VIEW_STATUS_BAR = 2165;
  MEID_VIEW_OUTPUT_BAR = 2166;
  MEID_VIEW_INC_FONT_SIZE = 2167;
  MEID_VIEW_DEC_FONT_SIZE = 2168;
  MEID_VIEW_FONT_CUSTOMIZE = 2169;
  MEID_MACROS_RECORD = 2170;
  MEID_MACROS_RUN = 2171;
  MEID_MACROS_SAVE = 2172;
  MEID_MACROS_EDIT = 2173;
  MEID_MACROS_SELECT = 2174;
  MEID_MACROS_SELECT_THIS = 2175;
  MEID_MACROS_CUSTOMIZE = 2176;
  MEID_TOOLS_OPTIONS = 2177;
  MEID_TOOLS_COMPLETION = 2178;
  MEID_TOOLS_HTML_FORMAT = 2179;
  MEID_TOOLS_SQL_FORMAT = 2180;
  MEID_TOOLS_PLUGIN_CUSTOMIZE = 2181;
  MEID_TOOLS_TOOL_CUSTOMIZE = 2182;
  MEID_TOOLS_TERMINATE_TOOL = 2183;
  MEID_TOOLS_POPUP_MENU_CUSTOMIZE = 2184;
  MEID_WINDOW_ALWAYS_TOP = 2185;
  MEID_WINDOW_SPLIT_HORZ = 2186;
  MEID_WINDOW_NEXT_PANE = 2187;
  MEID_WINDOW_PREV_PANE = 2188;
  MEID_WINDOW_ACTIVE_PANE = 2189;
  MEID_WINDOW_COMBINE = 2190;
  MEID_WINDOW_CASCADE = 2191;
  MEID_WINDOW_TILE_HORZ = 2192;
  MEID_WINDOW_TILE_VERT = 2193;
  MEID_WINDOW_MINIMIZE_ALL = 2194;
  MEID_WINDOW_NEXT = 2195;
  MEID_WINDOW_PREV = 2196;
  MEID_HELP_ONLINE = 2197;
  MEID_HELP_KEYBOARD_MAP = 2198;
  MEID_HELP_ABOUT = 2199;
  // 2.2.5
  MEID_EDIT_PASTE_QUOTES = 2200;
  MEID_EDIT_COPY_LINK = 2201;
  MEID_EDIT_OPEN_LINK = 2202;
  // 2.4.0
  MEID_VIEW_FULL_SCREEN = 2203;
  MEID_MACROS_RUN_OPTIONS = 2204;
  // 2.4.1
  MEID_VIEW_RESET_FONT_SIZE = 2205;
  MEID_VIEW_SET_DEFAULT_FONT_SIZE = 2206;
  // 2.4.3
  MEID_EDIT_SPELL_ALL = 2207;
  MEID_EDIT_SPELL_SINGLE_QUOTES = 2208;
  MEID_EDIT_SPELL_DOUBLE_QUOTES = 2209;
  MEID_EDIT_SPELL_COMMENTS = 2210;
  MEID_EDIT_SPELL_SCRIPT = 2211;
  MEID_EDIT_SPELL_TAGS = 2212;
  MEID_EDIT_SPELL_HIGHLIGHT = 2213;
  MEID_EDIT_SPELL_HYPERLINK = 2214;
  MEID_EDIT_SPELL_OTHER = 2215;
  // 2.4.8
  MEID_REPLACE_IN_FILES = 2216;
  // 2.5.0
  MEID_EDIT_CUT_LINE = 2217;
  MEID_EDIT_COPY_LINE = 2218;
  MEID_EDIT_DELETE_LINE = 2219;
  MEID_EDIT_DELETE_RIGHT_LINE = 2220;
  MEID_EDIT_DELETE_LEFT_LINE = 2221;
  MEID_EDIT_DELETE_WORD = 2222;
  MEID_EDIT_DELETE_RIGHT_WORD = 2223;
  MEID_EDIT_DELETE_LEFT_WORD = 2224;
  MEID_TOOLS_HTML_CHECK_ERRORS = 2225;
  MEID_WINDOW_SPLIT_VERT = 2226;
  // 2.6.1
  MEID_VIEW_MARKERS_BAR = 2227;
  MEID_VIEW_SMALL_ICONS = 2228;
  MEID_VIEW_MEDIUM_ICONS = 2229;
  MEID_VIEW_LARGE_ICONS = 2230;
  MEID_VIEW_EXTRA_LARGE_ICONS = 2231;
  MEID_VIEW_ADD_REMOVE_MARKER = 2232;
  MEID_VIEW_MARKER_ENABLE_ALL = 2233;
  MEID_VIEW_MARKER_DISABLE_ALL = 2234;
  MEID_VIEW_MARKER_DELETE_ALL = 2235;
  MEID_VIEW_TOGGLE_AUTO_MARKER = 2236;
  MEID_VIEW_MARKER_CUSTOMIZE = 2237;

  MEID_DICTS = 4096;
  MEID_MODES = 5120;
  MEID_MACROS = 6144;
  MEID_PLUGINS = 7168;
  MEID_TOOLS = 8192;

type
  TGetLineInfo = record
    cch: Cardinal;
    flags: Cardinal;
    yLine: Cardinal;
    byteCrLf: Byte;
  end;

  PGetLineInfo = ^TGetLineInfo;

type
  TMatchRegExInfo = record
    cbSize: Cardinal;
    nFlags: Cardinal;
    pszRegEx: PChar;
    pszText: PChar;
    pszReplace: PChar;
    pszResult: PChar;
    cchResult: Cardinal;
  end;

  PMatchRegExInfo = ^TMatchRegExInfo;

type
  TFindRegExInfo = record
    cbSize: Cardinal;
    nFlags: Cardinal;
    pszRegEx: PChar;
    pszText: PChar;
    ppszStart: PPChar;
    ppszEnd: PPChar;
    ppszNext: PPChar;
  end;

  PFindRegExInfo = ^TFindRegExInfo;

type
  TCustomBarInfo = record
    cbSize: Cardinal;
    hwndCustomBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    iPos: Integer;
  end;

  PCustomBarInfo = ^TCustomBarInfo;

type
  TCustomBarCloseInfo = record
    nID: Cardinal;
    iPos: Integer;
    dwFlags: DWORD;
  end;

  PCustomBarCloseInfo = ^TCustomBarCloseInfo;

type
  TToolBarInfo = record
    cbSize: Cardinal;
    hwndToolBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    nID: Cardinal;
    nFlags: Cardinal;
    bVisible: Boolean;
  end;

  PToolBarInfo = ^TToolBarInfo;

function Editor_New(hwnd: THandle): THandle;
function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): Cardinal;
function Editor_QueryStatus(hwnd: THandle; nCmdID: Cardinal; pbChecked: PBoolean): Boolean;
function Editor_GetSelText(hwnd: THandle; nBufferSize: Cardinal; szBuffer: PChar): Cardinal;
function Editor_GetLines(hwnd: THandle; nLogical: Integer): Cardinal;
function Editor_DocGetLines(hwnd: THandle; iDoc: Integer; nLogical: Integer): Cardinal;
function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): Cardinal;
procedure Editor_GetCaretPos(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
function Editor_LineFromChar(hwnd: THandle; nLogical: Integer; nSerialIndex: Cardinal): Cardinal;
function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: Cardinal): Cardinal;
function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): Cardinal;
procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
function Editor_SaveFile(hwnd: THandle; szFileName: PChar): Boolean;
function Editor_DocSaveFile(hwnd: THandle; iDoc: Integer; szFileName: PChar): Boolean;
procedure Editor_SerialToLogical(hwnd: THandle; nSerial: Cardinal; pptLogical: PPoint);
procedure Editor_SetCaretPos(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: Integer; pptPos: PPoint; bExtend: Boolean);
procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
procedure Editor_ExecCommand(hwnd: THandle; nCmdID: Cardinal);
function Editor_GetModified(hwnd: THandle): Boolean;
function Editor_DocGetModified(hwnd: THandle; iDoc: Integer): Boolean;
procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
procedure Editor_GetSelStart(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
procedure Editor_GetSelEnd(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
procedure Editor_SetSelLength(hwnd: THandle; nLen: Cardinal);
procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_DocGetMode(hwnd: THandle; iDoc: Integer; szModeName: PChar);
procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_DocSetMode(hwnd: THandle; iDoc: Integer; szModeName: PChar);
procedure Editor_EmptyUndoBuffer(hwnd: THandle);
procedure Editor_InsertString(hwnd: THandle; szString: PChar);
procedure Editor_Insert(hwnd: THandle; szString: PChar);
procedure Editor_Overwrite(hwnd: THandle; szString: PChar);
procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
function Editor_Find(hwnd: THandle; nFlags: Cardinal; szFind: PChar): Boolean;
function Editor_Replace(hwnd: THandle; nFlags: Cardinal; szFindReplace: PChar): Boolean;
procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
function Editor_Convert(hwnd: THandle; nFlags: Cardinal): Boolean;
function Editor_GetMargin(hwnd: THandle): Cardinal;
function Editor_GetVersion(hwnd: THandle): Cardinal;
procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
function Editor_GetSelType(hwnd: THandle): Integer;
function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): Integer;
function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): LRESULT;
function Editor_DocInfo(hwnd: THandle; iDoc: Integer; nCmd: WPARAM; lParam: LPARAM): LRESULT;
function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: Cardinal): Cardinal;
function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): Cardinal;
function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: Cardinal): Boolean;
function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: Cardinal): Cardinal;
function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): Cardinal;
function Editor_ToolBarClose(hwnd: THandle; nToolBarID: Cardinal): Boolean;
function Editor_ToolBarShow(hwnd: THandle; nToolBarID: Cardinal; bVisible: Boolean): Boolean;
function Editor_OutputString(hwnd: THandle; szString: PChar; nFlags: Cardinal): Boolean;
function Editor_GetOutputString(hwnd: THandle; cchBuf: Cardinal; pBuf: PChar): Cardinal;
procedure Editor_DoIdle(hwnd: THandle);

implementation

// -----------------------------------------------------------------------------
// Editor_New
//   �V�K�Ƀt�@�C�����쐬���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
// �߂�l
//   �E�B���h�E�̃n���h��

function Editor_New(hwnd: THandle): THandle;
begin
  Result := THandle(SendMessage(hwnd, ME_NEW, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   �v���O�C���̃R�}���hID���擾���܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   hInstance: �v���O�C���̃C���X�^���X�̃n���h��
// �߂�l
//   �v���O�C�������s���邽�߂̃R�}���hID

function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_CMD_ID, 0, hInstance));
end;

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   �v���O�C�������s�\���A�܂��̓`�F�b�N���ꂽ��Ԃ��𒲂ׂ܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   nCmdID:    ���s����v���O�C���̃R�}���hID
//   pbChecked: �`�F�b�N�̏��
// �߂�l
//   ���s�\�ł����True��Ԃ��܂�

function Editor_QueryStatus(hwnd: THandle; nCmdID: Cardinal; pbChecked: PBoolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_QUERY_STATUS, WPARAM(nCmdID), LPARAM(pbChecked)));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   �I������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   nBufferSize: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   szBuffer:    ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   nBufferSize��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_GetSelText(hwnd: THandle; nBufferSize: Cardinal; szBuffer: PChar): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_SEL_TEXT, WPARAM(nBufferSize), LPARAM(szBuffer)));
end;

// -----------------------------------------------------------------------------
// Editor_GetLines
//   �����̍s�����擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
// �߂�l
//   �����̍s����Ԃ��܂�

function Editor_GetLines(hwnd: THandle; nLogical: Integer): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_LINES, WPARAM(nLogical), 0));
end;

// -----------------------------------------------------------------------------
// Editor_DocGetLines
//   �w�肷�镶���̍s�����擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   iDoc:     �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
// �߂�l
//   �����̍s����Ԃ��܂�

function Editor_DocGetLines(hwnd: THandle; iDoc: Integer; nLogical: Integer): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_LINES, MakeWParam(nLogical, iDoc + 1), 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetLine
//   �w�肵���s�̕�������擾���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pGetLineInfo: GET_LINE_INFO�\���̂ւ̃|�C���^
//   szString:     ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   pGetLineInfo->cch��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_LINE, WPARAM(PGetLineInfo), LPARAM(szString)));
end;

// -----------------------------------------------------------------------------
// Editor_GetCaretPos
//   �J�[�\���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetCaretPos(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_CARET_POS, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   �X�N���[���o�[�̈ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   pptPos:   �X�N���[���o�[�̈ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_LineFromChar
//   �w�肵���V���A���ʒu�̍s�ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nLogical:     POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   nSerialIndex: �V���A���ʒu(-1���w�肵���ꍇ�̓J�[�\���ʒu)
// �߂�l
//   �s�ԍ���Ԃ��܂�

function Editor_LineFromChar(hwnd: THandle; nLogical: Integer; nSerialIndex: Cardinal): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_LINE_FROM_CHAR, WPARAM(nLogical), LPARAM(nSerialIndex)));
end;

// -----------------------------------------------------------------------------
// Editor_LineIndex
//   �w�肵���s�ԍ��̃V���A���ʒu��Ԃ��܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   yLine:    �s�ԍ�(-1���w�肵���ꍇ�̓J�[�\���s)
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: Cardinal): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_LINE_INDEX, WPARAM(bLogical), LPARAM(yLine)));
end;

// -----------------------------------------------------------------------------
// Editor_LoadFile
//   �t�@�C�����J���܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   bAllowNewWindow: �V�����E�B���h�E�ŊJ���܂�
//   szFileName:      �ǂݍ��ރt�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_LOAD_FILE, WPARAM(bAllowNewWindow), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToSerial
//   �_�����W���V���A���ʒu�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �V���A���ʒu��Ԃ��܂�

function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, 0, LPARAM(pptLogical)));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToView
//   �_�����W��\�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
begin
  SendMessage(hwnd, ME_LOGICAL_TO_VIEW, WPARAM(pptLogical), LPARAM(pptView));
end;

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   �t�@�C���ɕۑ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   szFileName: �ۑ�����t�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

function Editor_SaveFile(hwnd: THandle; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_SAVE_FILE, 0, LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_DocSaveFile
//   �w�肷�镶�����t�@�C���ɕۑ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szFileName: �ۑ�����t�@�C����
// �߂�l
//   ���������True��Ԃ��܂�

function Editor_DocSaveFile(hwnd: THandle; iDoc: Integer; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_SAVE_FILE, MakeWParam(0, iDoc + 1), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_SerialToLogical
//   �V���A���ʒu��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nSerial:    �V���A���ʒu
//   pptLogical: �_�����W���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SerialToLogical(hwnd: THandle; nSerial: Cardinal; pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, WPARAM(nSerial), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_SetCaretPos
//   �J�[�\���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �J�[�\���ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetCaretPos(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, Cardinal(False)), LPARAM(pptPos));
end;

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

procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: Integer; pptPos: PPoint; bExtend: Boolean);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, Cardinal(bExtend)), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   �X�N���[���o�[�̈ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptPos: �X�N���[���o�[�̈ʒu���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   �\�����W��_�����W�ɕϊ����܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pptView:    �\�����W���w�肵���\���̂ւ̃|�C���^
//   pptLogical: �_�����W���w�肵���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_VIEW_TO_LOGICAL, WPARAM(pptView), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   �w�肷��R�}���hID�����s���܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   pptView: ���s����R�}���hID
// �߂�l
//   �g�p����܂���

procedure Editor_ExecCommand(hwnd: THandle; nCmdID: Cardinal);
begin
  SendMessage(hwnd, ME_EXEC_COMMAND, WPARAM(nCmdID), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetModified
//   �������X�V����Ă��邩�ǂ������擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �X�V����Ă���ꍇ��True��Ԃ��܂�

function Editor_GetModified(hwnd: THandle): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_GET_MODIFIED, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_DocGetModified
//   �w�肷�镶�����X�V����Ă��邩�ǂ������擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   iDoc: �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
// �߂�l
//   �X�V����Ă���ꍇ��True��Ԃ��܂�

function Editor_DocGetModified(hwnd: THandle; iDoc: Integer): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_GET_MODIFIED, MakeWParam(0, iDoc + 1), 0));
end;

// -----------------------------------------------------------------------------
// Editor_SetModified
//   �������X�V����Ă��邩�ǂ�����ݒ肵�܂�
// �p�����[�^
//   hwnd:      �E�B���h�E�̃n���h��
//   bModified: �X�V�̏��
// �߂�l
//   �g�p����܂���

procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
begin
  SendMessage(hwnd, ME_SET_MODIFIED, WPARAM(bModified), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelStart
//   �I�𕶎���̊J�n�ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̊J�n�ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetSelStart(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_START, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelEnd
//   �I�𕶎���̏I���ʒu���擾���܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   nLogical: POS_VIEW(�\�����W)�܂���POS_LOGICAL(�_�����W)
//   pptPos:   �I�𕶎���̏I���ʒu���i�[���邽�߂̍\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_GetSelEnd(hwnd: THandle; nLogical: Integer; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_END, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   �I�𕶎���̒�����ݒ肵�܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   nLen: �I�𕶎���̒���
// �߂�l
//   �g�p����܂���

procedure Editor_SetSelLength(hwnd: THandle; nLen: Cardinal);
begin
  SendMessage(hwnd, ME_SET_SEL_LENGTH, WPARAM(nLen), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetMode
//   �ҏW���[�h�𕶎���Ŏ擾���܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   szModeName: ���̂��擾����o�b�t�@(MAX_MODE_NAME�̕�����)
// �߂�l
//   �g�p����܂���

procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_GET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_DocGetMode
//   �w�肷�镶���̕ҏW���[�h�𕶎���Ŏ擾���܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szModeName: ���̂��擾����o�b�t�@(MAX_MODE_NAME�̕�����)
// �߂�l
//   �g�p����܂���

procedure Editor_DocGetMode(hwnd: THandle; iDoc: Integer; szModeName: PChar);
begin
  SendMessage(hwnd, ME_GET_MODE, MakeWParam(0, iDoc + 1), LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_SetMode
//   �ҏW���[�h�𕶎���Őݒ肵�܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   szModeName: �ҏW���[�h�̖���
// �߂�l
//   �g�p����܂���

procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_SET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_DocSetMode
//   �w�肷�镶���̕ҏW���[�h�𕶎���Őݒ肵�܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   iDoc:       �ΏۂƂȂ镶����0�����Ƃ���C���f�b�N�X
//   szModeName: �ҏW���[�h�̖���
// �߂�l
//   �g�p����܂���

procedure Editor_DocSetMode(hwnd: THandle; iDoc: Integer; szModeName: PChar);
begin
  SendMessage(hwnd, ME_SET_MODE, MakeWParam(0, iDoc + 1), LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_EmptyUndoBuffer
//   ���ɖ߂��A��蒼���̃o�b�t�@����ɂ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �g�p����܂���

procedure Editor_EmptyUndoBuffer(hwnd: THandle);
begin
  SendMessage(hwnd, ME_EMPTY_UNDO_BUFFER, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_InsertString
//   �J�[�\���ʒu�ɕ������}���܂��͏㏑�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_InsertString(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_PER_PROP, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_Insert
//   �J�[�\���ʒu�ɕ������}�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_Insert(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_INSERT, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_Overwrite
//   �J�[�\���ʒu�ɕ�������㏑�����܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szString: �}�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_Overwrite(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_OVERWRITE, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelView
//   �I�𕶎���̊J�n�ʒu�ƏI���ʒu��ݒ肵�܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   pptSelStart: �I�𕶎���̊J�n�ʒu��\���\���̂ւ̃|�C���^
//   pptSelEnd:   �I�𕶎���̏I���ʒu��\���\���̂ւ̃|�C���^
// �߂�l
//   �g�p����܂���

procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
begin
  SendMessage(hwnd, ME_SET_SEL_VIEW, WPARAM(pptSelStart), LPARAM(pptSelEnd));
end;

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

function Editor_Find(hwnd: THandle; nFlags: Cardinal; szFind: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND, WPARAM(nFlags), LPARAM(szFind)));
end;

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

function Editor_Replace(hwnd: THandle; nFlags: Cardinal; szFindReplace: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_REPLACE, WPARAM(nFlags), LPARAM(szFindReplace)));
end;

// -----------------------------------------------------------------------------
// Editor_SetStatus
//   �X�e�[�^�X�o�[�ɕ\�����镶�����ݒ肵�܂�
// �p�����[�^
//   hwnd:     �E�B���h�E�̃n���h��
//   szStatus: �X�e�[�^�X�o�[�ɕ\�����镶����
// �߂�l
//   �g�p����܂���

procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
begin
  SendMessage(hwnd, ME_SET_STATUS, 0, LPARAM(szStatus));
end;

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

function Editor_Convert(hwnd: THandle; nFlags: Cardinal): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CONVERT, WPARAM(nFlags), 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetMargin
//   �܂�Ԃ�������Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �܂�Ԃ�������Ԃ��܂�

function Editor_GetMargin(hwnd: THandle): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_MARGIN, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetVersion
//   �o�[�W�����ԍ���Ԃ��܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �o�[�W�����ԍ���Ԃ��܂�

function Editor_GetVersion(hwnd: THandle): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_VERSION, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_Redraw
//   �E�B���h�E�̍ĕ`����s�����ǂ������w�肵�܂�
// �p�����[�^
//   hwnd:    �E�B���h�E�̃n���h��
//   bRedraw: False���w�肷��ƁA����True���w�肷��܂ōĕ`����s���܂���
// �߂�l
//   �g�p����܂���

procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
begin
  SendMessage(hwnd, ME_REDRAW, WPARAM(bRedraw), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelType
//   �I����Ԃ̎�ނ��擾���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   SEL_TYPE_NONE: �I������Ă��܂���
//   SEL_TYPE_CHAR: �ʏ�I������Ă��܂�
//   SEL_TYPE_BOX:  ��`�I������Ă��܂�

function Editor_GetSelType(hwnd: THandle): Integer;
begin
  Result := Integer(SendMessage(hwnd, ME_GET_SEL_TYPE, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_IsCharHalfOrFull
//   �w�肷�镶�������p���S�p���𒲂ׂ܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
//   ch:   ���ׂ�������
// �߂�l
//   ���p�̏ꍇ��1�A�S�p�̏ꍇ��2��Ԃ��܂�

function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): Integer;
begin
  Result := Integer(SendMessage(hwnd, ME_IS_CHAR_HALF_OR_FULL, WPARAM(ch), 0));
end;

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

function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): LRESULT;
begin
  Result := LRESULT(SendMessage(hwnd, ME_INFO, nCmd, lParam));
end;

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

function Editor_DocInfo(hwnd: THandle; iDoc: Integer; nCmd: WPARAM; lParam: LPARAM): LRESULT;
begin
  Result := LRESULT(SendMessage(hwnd, ME_INFO, MakeWParam(nCmd, iDoc + 1), lParam));
end;

// -----------------------------------------------------------------------------
// Editor_GetStatus
//   �X�e�[�^�X�o�[�ɕ\������Ă��镶������擾���܂�
// �p�����[�^
//   hwnd:        �E�B���h�E�̃n���h��
//   szStatus:    ��������擾����o�b�t�@
//   nBufferSize: ��������擾����o�b�t�@�̃T�C�Y
// �߂�l
//   ��������擾����̂ɕK�v�ȃo�b�t�@�̃T�C�Y

function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: Cardinal): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_STATUS, WPARAM(nBufferSize), LPARAM(nBufferSize)));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   �J�X�^���o�[���J���܂�
// �p�����[�^
//   hwnd:           �E�B���h�E�̃n���h��
//   pCustomBarInfo: CUSTOM_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃJ�X�^���o�[��ID��Ԃ��܂�

function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_CUSTOM_BAR_OPEN, 0, LPARAM(PCustomBarInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarClose
//   �J�X�^���o�[����܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   nCustomBarID: �J�X�^���o�[��ID
// �߂�l
//   �g�p����܂���

function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: Cardinal): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CUSTOM_BAR_CLOSE, WPARAM(nCustomBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_MatchRegEx
//   ���K�\���Ŏw�肵�������񂪈�v���邩�ǂ����𒲂ׂ܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: MATCH_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v����ꍇ��True��Ԃ��܂�

function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_MATCH_REGEX, 0, LPARAM(PMatchRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_FindRegEx
//   ���K�\�����w�肵�������񂩂猟�����܂�
// �p�����[�^
//   hwnd:            �E�B���h�E�̃n���h��
//   pMatchRegExInfo: FIND_REGEX_INFO�\���̂ւ̃|�C���^
// �߂�l
//   �w�肷�镶���񂪈�v���镶���񂪌��������ꍇ��True��Ԃ��܂�

function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND_REGEX, 0, LPARAM(PFindRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_EnumMode
//   �ҏW���[�h�̈ꗗ���擾���܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   pBuf:   ��������擾����o�b�t�@�ւ̃|�C���^
//   cchBuf: �I�[�������܂ރo�b�t�@�̃T�C�Y
// �߂�l
//   cchBuf��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: Cardinal): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_ENUM_MODE, WPARAM(cchBuf), LPARAM(pBuf)));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarOpen
//   �c�[���o�[���J���܂�
// �p�����[�^
//   hwnd:         �E�B���h�E�̃n���h��
//   pToolBarInfo: TOOL_BAR_INFO�\���̂ւ̃|�C���^
// �߂�l
//   ��������ƃc�[���o�[��ID��Ԃ��܂�

function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_TOOL_BAR_OPEN, 0, LPARAM(PToolBarInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarClose
//   �c�[���o�[����܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
// �߂�l
//   �g�p����܂���

function Editor_ToolBarClose(hwnd: THandle; nToolBarID: Cardinal): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_CLOSE, WPARAM(nToolBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarShow
//   �c�[���o�[�̕\��/��\����؂�ւ��܂�
// �p�����[�^
//   hwnd:       �E�B���h�E�̃n���h��
//   nToolBarID: �c�[���o�[��ID
//   bVisible:   �\���̏��
// �߂�l
//   �g�p����܂���

function Editor_ToolBarShow(hwnd: THandle; nToolBarID: Cardinal; bVisible: Boolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_SHOW, WPARAM(nToolBarID), LPARAM(bVisible)));
end;

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

function Editor_OutputString(hwnd: THandle; szString: PChar; nFlags: Cardinal): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_OUTPUT_STRING, WPARAM(nFlags), LPARAM(szString)));
end;

// -----------------------------------------------------------------------------
// Editor_GetOutputString
//   �A�E�g�v�b�g�o�[�̕�������擾���܂�
// �p�����[�^
//   hwnd:   �E�B���h�E�̃n���h��
//   cchBuf: �I�[�������܂ރo�b�t�@�̃T�C�Y
//   pBuf:   ��������擾����o�b�t�@�ւ̃|�C���^
// �߂�l
//   cchBuf��0�̏ꍇ�̓o�b�t�@�ɕK�v�ȃT�C�Y�A0�ȊO�̏ꍇ�͎g�p����܂���

function Editor_GetOutputString(hwnd: THandle; cchBuf: Cardinal; pBuf: PChar): Cardinal;
begin
  Result := Cardinal(SendMessage(hwnd, ME_GET_OUTPUT_STRING, WPARAM(cchBuf), LPARAM(pBuf)));
end;

// -----------------------------------------------------------------------------
// Editor_DoIdle
//   �\���X�V���s���܂�
// �p�����[�^
//   hwnd: �E�B���h�E�̃n���h��
// �߂�l
//   �g�p����܂���

procedure Editor_DoIdle(hwnd: THandle);
begin
  SendMessage(hwnd, ME_DO_IDLE, 0, 0);
end;

end.
