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
  SEL_TYPE_SELECTED = $0020;
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
  MEID_EDIT_PASTE = 2102;
  MEID_EDIT_COPY_QUOTES = 2103;
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
  MEID_TOOLS_SQL_FORMAT = 2179;
  MEID_TOOLS_XML_FORMAT = 2180;
  MEID_TOOLS_PLUGIN_CUSTOMIZE = 2181;
  MEID_TOOLS_TOOL_CUSTOMIZE = 2182;
  MEID_TOOLS_TERMINATE_TOOL = 2183;
  MEID_TOOLS_POPUP_MENU_CUSTOMIZE = 2184;
  MEID_WINDOW_ALWAYS_TOP = 2185;
  MEID_WINDOW_SPLIT = 2186;
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

  MEID_MY_DICTS = 4096;
  MEID_MY_MODES = 5120;
  MEID_MY_MACROS = 6144;
  MEID_MY_PLUGINS = 7168;
  MEID_MY_TOOLS = 8192;

type
  TGetLineInfo = record
    cch: NativeUInt;
    flags: NativeUInt;
    yLine: NativeUInt;
    byteCrLf: Byte;
  end;

  PGetLineInfo = ^TGetLineInfo;

type
  TMatchRegExInfo = record
    cbSize: NativeUInt;
    nFlags: NativeUInt;
    pszRegEx: PChar;
    pszText: PChar;
    pszReplace: PChar;
    pszResult: PChar;
    cchResult: NativeInt;
  end;

  PMatchRegExInfo = ^TMatchRegExInfo;

type
  TFindRegExInfo = record
    cbSize: NativeUInt;
    nFlags: NativeUInt;
    pszRegEx: PChar;
    pszText: PChar;
    ppszStart: PPChar;
    ppszEnd: PPChar;
    ppszNext: PPChar;
  end;

  PFindRegExInfo = ^TFindRegExInfo;

type
  TCustomBarInfo = record
    cbSize: NativeUInt;
    hwndCustomBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    iPos: NativeInt;
  end;

  PCustomBarInfo = ^TCustomBarInfo;

type
  TCustomBarCloseInfo = record
    nID: NativeUInt;
    iPos: NativeInt;
    dwFlags: DWORD;
  end;

  PCustomBarCloseInfo = ^TCustomBarCloseInfo;

type
  TToolBarInfo = record
    cbSize: NativeUInt;
    hwndToolBar: THandle;
    hwndClient: THandle;
    pszTitle: PChar;
    nID: NativeUInt;
    nFlags: NativeUInt;
    bVisible: Boolean;
  end;

  PToolBarInfo = ^TToolBarInfo;

function Editor_New(hwnd: THandle): NativeUInt;
function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): NativeUInt;
function Editor_QueryStatus(hwnd: THandle; nCmdID: NativeUInt; pbChecked: PBoolean): Boolean;
function Editor_GetSelText(hwnd: THandle; nBufferSize: NativeUInt; szBuffer: PChar): NativeUInt;
function Editor_GetLines(hwnd: THandle; nLogical: NativeInt): NativeUInt;
function Editor_DocGetLines(hwnd: THandle; iDoc: NativeInt; nLogical: NativeInt): NativeUInt;
function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): NativeUInt;
procedure Editor_GetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
function Editor_LineFromChar(hwnd: THandle; nLogical: NativeInt; nSerialIndex: NativeUInt): NativeUInt;
function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: NativeUInt): NativeUInt;
function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): NativeUInt;
procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
function Editor_SaveFile(hwnd: THandle; szFileName: PChar): Boolean;
function Editor_DocSaveFile(hwnd: THandle; iDoc: NativeInt; szFileName: PChar): Boolean;
procedure Editor_SerialToLogical(hwnd: THandle; nSerial: NativeUInt; pptLogical: PPoint);
procedure Editor_SetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint; bExtend: Boolean);
procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
procedure Editor_ExecCommand(hwnd: THandle; nCmdID: NativeUInt);
function Editor_GetModified(hwnd: THandle): Boolean;
function Editor_DocGetModified(hwnd: THandle; iDoc: NativeInt): Boolean;
procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
procedure Editor_GetSelStart(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_GetSelEnd(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
procedure Editor_SetSelLength(hwnd: THandle; nLen: NativeUInt);
procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_DocGetMode(hwnd: THandle; iDoc: NativeInt; szModeName: PChar);
procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
procedure Editor_DocSetMode(hwnd: THandle; iDoc: NativeInt; szModeName: PChar);
procedure Editor_EmptyUndoBuffer(hwnd: THandle);
procedure Editor_InsertString(hwnd: THandle; szString: PChar);
procedure Editor_Insert(hwnd: THandle; szString: PChar);
procedure Editor_Overwrite(hwnd: THandle; szString: PChar);
procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
function Editor_Find(hwnd: THandle; nFlags: NativeUInt; szFind: PChar): Boolean;
function Editor_Replace(hwnd: THandle; nFlags: NativeUInt; szFindReplace: PChar): Boolean;
procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
function Editor_Convert(hwnd: THandle; nFlags: NativeUInt): Boolean;
function Editor_GetMargin(hwnd: THandle): NativeUInt;
function Editor_GetVersion(hwnd: THandle): NativeUInt;
function Editor_GetVersionEx(hwnd: THandle; pnProductType: NativeUInt): NativeUInt;
procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
function Editor_GetSelType(hwnd: THandle): NativeInt;
function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): NativeInt;
function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): NativeInt;
function Editor_DocInfo(hwnd: THandle; iDoc: NativeInt; nCmd: WPARAM; lParam: LPARAM): NativeInt;
function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: NativeUInt): NativeUInt;
function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): NativeUInt;
function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: NativeUInt): Boolean;
function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: NativeUInt): NativeUInt;
function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): NativeUInt;
function Editor_ToolBarClose(hwnd: THandle; nToolBarID: NativeUInt): Boolean;
function Editor_ToolBarShow(hwnd: THandle; nToolBarID: NativeUInt; bVisible: Boolean): Boolean;
function Editor_OutputString(hwnd: THandle; szString: PChar; nFlags: NativeUInt): Boolean;
function Editor_GetOutputString(hwnd: THandle; cchBuf: NativeUInt; pBuf: PChar): NativeUInt;

{$R *.RES}

implementation

// -----------------------------------------------------------------------------
// Editor_New
//   新規にファイルを作成します
// パラメータ
//   hwnd:      ウィンドウのハンドル
// 戻り値
//   ウィンドウのハンドル

function Editor_New(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_NEW, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetCmdID
//   プラグインのコマンドIDを取得します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   hInstance: プラグインのインスタンスのハンドル
// 戻り値
//   プラグインを実行するためのコマンドID

function Editor_GetCmdID(hwnd: THandle; hInstance: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_CMD_ID, 0, hInstance);
end;

// -----------------------------------------------------------------------------
// Editor_QueryStatus
//   プラグインが実行可能か、またはチェックされた状態かを調べます
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   nCmdID:    実行するプラグインのコマンドID
//   pbChecked: チェックの状態
// 戻り値
//   実行可能であればTrueを返します

function Editor_QueryStatus(hwnd: THandle; nCmdID: NativeUInt; pbChecked: PBoolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_QUERY_STATUS, WPARAM(nCmdID), LPARAM(pbChecked)));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelText
//   選択されている文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   nBufferSize: 終端文字を含むバッファのサイズ
//   szBuffer:    文字列を取得するバッファへのポインタ
// 戻り値
//   nBufferSizeが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

function Editor_GetSelText(hwnd: THandle; nBufferSize: NativeUInt; szBuffer: PChar): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_SEL_TEXT, WPARAM(nBufferSize), LPARAM(szBuffer));
end;

// -----------------------------------------------------------------------------
// Editor_GetLines
//   文書の行数を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
// 戻り値
//   文書の行数を返します

function Editor_GetLines(hwnd: THandle; nLogical: NativeInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_LINES, WPARAM(nLogical), 0);
end;

// -----------------------------------------------------------------------------
// Editor_DocGetLines
//   指定する文書の行数を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   iDoc:     対象となる文書の0を基底とするインデックス
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
// 戻り値
//   文書の行数を返します

function Editor_DocGetLines(hwnd: THandle; iDoc: NativeInt; nLogical: NativeInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_LINES, MakeWParam(nLogical, iDoc + 1), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetLine
//   指定した行の文字列を取得します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   pGetLineInfo: GET_LINE_INFO構造体へのポインタ
//   szString:     文字列を取得するバッファへのポインタ
// 戻り値
//   pGetLineInfo->cchが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

function Editor_GetLine(hwnd: THandle; PGetLineInfo: PGetLineInfo; szString: PChar): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_LINE, WPARAM(PGetLineInfo), LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_GetCaretPos
//   カーソル位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   カーソルの位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_GetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_CARET_POS, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetScrollPos
//   スクロールバーの位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   pptPos:   スクロールバーの位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_GetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_LineFromChar
//   指定したシリアル位置の行番号を返します
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   nLogical:     POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   nSerialIndex: シリアル位置(-1を指定した場合はカーソル位置)
// 戻り値
//   行番号を返します

function Editor_LineFromChar(hwnd: THandle; nLogical: NativeInt; nSerialIndex: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LINE_FROM_CHAR, WPARAM(nLogical), LPARAM(nSerialIndex));
end;

// -----------------------------------------------------------------------------
// Editor_LineIndex
//   指定した行番号のシリアル位置を返します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   yLine:    行番号(-1を指定した場合はカーソル行)
// 戻り値
//   シリアル位置を返します

function Editor_LineIndex(hwnd: THandle; bLogical: Boolean; yLine: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LINE_INDEX, WPARAM(bLogical), LPARAM(yLine));
end;

// -----------------------------------------------------------------------------
// Editor_LoadFile
//   ファイルを開きます
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   bAllowNewWindow: 新しいウィンドウで開きます
//   szFileName:      読み込むファイル名
// 戻り値
//   成功するとTrueを返します

function Editor_LoadFile(hwnd: THandle; bAllowNewWindow: Boolean; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_LOAD_FILE, WPARAM(bAllowNewWindow), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToSerial
//   論理座標をシリアル位置に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   pptLogical: 論理座標を指定した構造体へのポインタ
// 戻り値
//   シリアル位置を返します

function Editor_LogicalToSerial(hwnd: THandle; pptLogical: PPoint): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_LOGICAL_TO_SERIAL, 0, LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_LogicalToView
//   論理座標を表示座標に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   pptLogical: 論理座標を指定した構造体へのポインタ
//   pptView:    表示座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_LogicalToView(hwnd: THandle; pptLogical, pptView: PPoint);
begin
  SendMessage(hwnd, ME_LOGICAL_TO_VIEW, WPARAM(pptLogical), LPARAM(pptView));
end;

// -----------------------------------------------------------------------------
// Editor_SaveFile
//   ファイルに保存します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szFileName: 保存するファイル名
// 戻り値
//   成功するとTrueを返します

function Editor_SaveFile(hwnd: THandle; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_SAVE_FILE, 0, LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_DocSaveFile
//   指定する文書をファイルに保存します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szFileName: 保存するファイル名
// 戻り値
//   成功するとTrueを返します

function Editor_DocSaveFile(hwnd: THandle; iDoc: NativeInt; szFileName: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_SAVE_FILE, MakeWParam(0, iDoc + 1), LPARAM(szFileName)));
end;

// -----------------------------------------------------------------------------
// Editor_SerialToLogical
//   シリアル位置を論理座標に変換します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nSerial:    シリアル位置
//   pptLogical: 論理座標を格納するための構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_SerialToLogical(hwnd: THandle; nSerial: NativeUInt; pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_SERIAL_TO_LOGICAL, WPARAM(nSerial), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_SetCaretPos
//   カーソル位置を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   カーソル位置を指定した構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_SetCaretPos(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, NativeUInt(False)), LPARAM(pptPos));
end;

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

procedure Editor_SetCaretPosEx(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint; bExtend: Boolean);
begin
  SendMessage(hwnd, ME_SET_CARET_POS, MakeWParam(nLogical, NativeUInt(bExtend)), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetScrollPos
//   スクロールバーの位置を設定します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptPos: スクロールバーの位置を指定した構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_SetScrollPos(hwnd: THandle; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_SET_SCROLL_POS, 0, LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_ViewToLogical
//   表示座標を論理座標に変換します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pptView:    表示座標を指定した構造体へのポインタ
//   pptLogical: 論理座標を指定した構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_ViewToLogical(hwnd: THandle; pptView, pptLogical: PPoint);
begin
  SendMessage(hwnd, ME_VIEW_TO_LOGICAL, WPARAM(pptView), LPARAM(pptLogical));
end;

// -----------------------------------------------------------------------------
// Editor_ExecCommand
//   指定するコマンドIDを実行します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   pptView: 実行するコマンドID
// 戻り値
//   使用されません

procedure Editor_ExecCommand(hwnd: THandle; nCmdID: NativeUInt);
begin
  SendMessage(hwnd, ME_EXEC_COMMAND, WPARAM(nCmdID), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetModified
//   文書が更新されているかどうかを取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   更新されている場合はTrueを返します

function Editor_GetModified(hwnd: THandle): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_GET_MODIFIED, 0, 0));
end;

// -----------------------------------------------------------------------------
// Editor_DocGetModified
//   指定する文書が更新されているかどうかを取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   iDoc: 対象となる文書の0を基底とするインデックス
// 戻り値
//   更新されている場合はTrueを返します

function Editor_DocGetModified(hwnd: THandle; iDoc: NativeInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_GET_MODIFIED, MakeWParam(0, iDoc + 1), 0));
end;

// -----------------------------------------------------------------------------
// Editor_SetModified
//   文書が更新されているかどうかを設定します
// パラメータ
//   hwnd:      ウィンドウのハンドル
//   bModified: 更新の状態
// 戻り値
//   使用されません

procedure Editor_SetModified(hwnd: THandle; bModified: Boolean);
begin
  SendMessage(hwnd, ME_SET_MODIFIED, WPARAM(bModified), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelStart
//   選択文字列の開始位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   選択文字列の開始位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_GetSelStart(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_START, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_GetSelEnd
//   選択文字列の終了位置を取得します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   nLogical: POS_VIEW(表示座標)またはPOS_LOGICAL(論理座標)
//   pptPos:   選択文字列の終了位置を格納するための構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_GetSelEnd(hwnd: THandle; nLogical: NativeInt; pptPos: PPoint);
begin
  SendMessage(hwnd, ME_GET_SEL_END, WPARAM(nLogical), LPARAM(pptPos));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelLength
//   選択文字列の長さを設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   nLen: 選択文字列の長さ
// 戻り値
//   使用されません

procedure Editor_SetSelLength(hwnd: THandle; nLen: NativeUInt);
begin
  SendMessage(hwnd, ME_SET_SEL_LENGTH, WPARAM(nLen), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetMode
//   編集モードを文字列で取得します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szModeName: 名称を取得するバッファ(MAX_MODE_NAMEの文字数)
// 戻り値
//   使用されません

procedure Editor_GetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_GET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_DocGetMode
//   指定する文書の編集モードを文字列で取得します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szModeName: 名称を取得するバッファ(MAX_MODE_NAMEの文字数)
// 戻り値
//   使用されません

procedure Editor_DocGetMode(hwnd: THandle; iDoc: NativeInt; szModeName: PChar);
begin
  SendMessage(hwnd, ME_GET_MODE, MakeWParam(0, iDoc + 1), LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_SetMode
//   編集モードを文字列で設定します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   szModeName: 編集モードの名称
// 戻り値
//   使用されません

procedure Editor_SetMode(hwnd: THandle; szModeName: PChar);
begin
  SendMessage(hwnd, ME_SET_MODE, 0, LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_DocSetMode
//   指定する文書の編集モードを文字列で設定します
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   iDoc:       対象となる文書の0を基底とするインデックス
//   szModeName: 編集モードの名称
// 戻り値
//   使用されません

procedure Editor_DocSetMode(hwnd: THandle; iDoc: NativeInt; szModeName: PChar);
begin
  SendMessage(hwnd, ME_SET_MODE, MakeWParam(0, iDoc + 1), LPARAM(szModeName));
end;

// -----------------------------------------------------------------------------
// Editor_EmptyUndoBuffer
//   元に戻す、やり直しのバッファを空にします
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   使用されません

procedure Editor_EmptyUndoBuffer(hwnd: THandle);
begin
  SendMessage(hwnd, ME_EMPTY_UNDO_BUFFER, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_InsertString
//   カーソル位置に文字列を挿入または上書きします
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

procedure Editor_InsertString(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_PER_PROP, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_Insert
//   カーソル位置に文字列を挿入します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

procedure Editor_Insert(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_INSERT, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_Overwrite
//   カーソル位置に文字列を上書きします
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szString: 挿入する文字列
// 戻り値
//   使用されません

procedure Editor_Overwrite(hwnd: THandle; szString: PChar);
begin
  SendMessage(hwnd, ME_INSERT_STRING, OVERWRITE_OVERWRITE, LPARAM(szString));
end;

// -----------------------------------------------------------------------------
// Editor_SetSelView
//   選択文字列の開始位置と終了位置を設定します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   pptSelStart: 選択文字列の開始位置を表す構造体へのポインタ
//   pptSelEnd:   選択文字列の終了位置を表す構造体へのポインタ
// 戻り値
//   使用されません

procedure Editor_SetSelView(hwnd: THandle; pptSelStart, pptSelEnd: PPoint);
begin
  SendMessage(hwnd, ME_SET_SEL_VIEW, WPARAM(pptSelStart), LPARAM(pptSelEnd));
end;

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

function Editor_Find(hwnd: THandle; nFlags: NativeUInt; szFind: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND, WPARAM(nFlags), LPARAM(szFind)));
end;

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

function Editor_Replace(hwnd: THandle; nFlags: NativeUInt; szFindReplace: PChar): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_REPLACE, WPARAM(nFlags), LPARAM(szFindReplace)));
end;

// -----------------------------------------------------------------------------
// Editor_SetStatus
//   ステータスバーに表示する文字列を設定します
// パラメータ
//   hwnd:     ウィンドウのハンドル
//   szStatus: ステータスバーに表示する文字列
// 戻り値
//   使用されません

procedure Editor_SetStatus(hwnd: THandle; szStatus: PChar);
begin
  SendMessage(hwnd, ME_SET_STATUS, 0, LPARAM(szStatus));
end;

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

function Editor_Convert(hwnd: THandle; nFlags: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CONVERT, WPARAM(nFlags), 0));
end;

// -----------------------------------------------------------------------------
// Editor_GetMargin
//   折り返し桁数を返します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   折り返し桁数を返します

function Editor_GetMargin(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_MARGIN, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetVersion
//   バージョン番号を返します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   バージョン番号を返します

function Editor_GetVersion(hwnd: THandle): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_VERSION, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetVersionEx
//   実装していません

function Editor_GetVersionEx(hwnd: THandle; pnProductType: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_VERSION, WPARAM(pnProductType), 0);
end;

// -----------------------------------------------------------------------------
// Editor_Redraw
//   ウィンドウの再描画を行うかどうかを指定します
// パラメータ
//   hwnd:    ウィンドウのハンドル
//   bRedraw: Falseを指定すると、次にTrueを指定するまで再描画を行いません
// 戻り値
//   使用されません

procedure Editor_Redraw(hwnd: THandle; bRedraw: Boolean);
begin
  SendMessage(hwnd, ME_REDRAW, WPARAM(bRedraw), 0);
end;

// -----------------------------------------------------------------------------
// Editor_GetSelType
//   選択状態の種類を取得します
// パラメータ
//   hwnd: ウィンドウのハンドル
// 戻り値
//   SEL_TYPE_NONE: 選択されていません
//   SEL_TYPE_CHAR: 通常選択されています
//   SEL_TYPE_BOX:  矩形選択されています

function Editor_GetSelType(hwnd: THandle): NativeInt;
begin
  Result := SendMessage(hwnd, ME_GET_SEL_TYPE, 0, 0);
end;

// -----------------------------------------------------------------------------
// Editor_IsCharHalfOrFull
//   指定する文字が半角か全角かを調べます
// パラメータ
//   hwnd: ウィンドウのハンドル
//   ch:   調べたい文字
// 戻り値
//   半角の場合は1、全角の場合は2を返します

function Editor_IsCharHalfOrFull(hwnd: THandle; ch: Char): NativeInt;
begin
  Result := SendMessage(hwnd, ME_IS_CHAR_HALF_OR_FULL, WPARAM(ch), 0);
end;

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

function Editor_Info(hwnd: THandle; nCmd: WPARAM; lParam: LPARAM): NativeInt;
begin
  Result := SendMessage(hwnd, ME_INFO, nCmd, lParam);
end;

// -----------------------------------------------------------------------------
// Editor_DocInfo
//   指定する文書の情報を取得・設定します
// パラメータ
//   hwnd: ウィンドウのハンドル
//   iDoc: 0を基底とする文書のインデックス
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

function Editor_DocInfo(hwnd: THandle; iDoc: NativeInt; nCmd: WPARAM; lParam: LPARAM): NativeInt;
begin
  Result := SendMessage(hwnd, ME_INFO, MakeWParam(nCmd, iDoc + 1), lParam);
end;

// -----------------------------------------------------------------------------
// Editor_GetStatus
//   ステータスバーに表示されている文字列を取得します
// パラメータ
//   hwnd:        ウィンドウのハンドル
//   szStatus:    文字列を取得するバッファ
//   nBufferSize: 文字列を取得するバッファのサイズ
// 戻り値
//   文字列を取得するのに必要なバッファのサイズ

function Editor_GetStatus(hwnd: THandle; szStatus: PChar; nBufferSize: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_STATUS, WPARAM(nBufferSize), LPARAM(nBufferSize));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarOpen
//   カスタムバーを開きます
// パラメータ
//   hwnd:           ウィンドウのハンドル
//   pCustomBarInfo: CUSTOM_BAR_INFO構造体へのポインタ
// 戻り値
//   成功するとカスタムバーのIDを返します

function Editor_CustomBarOpen(hwnd: THandle; PCustomBarInfo: PCustomBarInfo): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_CUSTOM_BAR_OPEN, 0, LPARAM(PCustomBarInfo));
end;

// -----------------------------------------------------------------------------
// Editor_CustomBarClose
//   カスタムバーを閉じます
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   nCustomBarID: カスタムバーのID
// 戻り値
//   使用されません

function Editor_CustomBarClose(hwnd: THandle; nCustomBarID: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_CUSTOM_BAR_CLOSE, WPARAM(nCustomBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_MatchRegEx
//   正規表現で指定した文字列が一致するかどうかを調べます
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   pMatchRegExInfo: MATCH_REGEX_INFO構造体へのポインタ
// 戻り値
//   指定する文字列が一致する場合はTrueを返します

function Editor_MatchRegEx(hwnd: THandle; PMatchRegExInfo: PMatchRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_MATCH_REGEX, 0, LPARAM(PMatchRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_FindRegEx
//   正規表現を指定した文字列から検索します
// パラメータ
//   hwnd:            ウィンドウのハンドル
//   pMatchRegExInfo: FIND_REGEX_INFO構造体へのポインタ
// 戻り値
//   指定する文字列が一致する文字列が見つかった場合はTrueを返します

function Editor_FindRegEx(hwnd: THandle; PFindRegExInfo: PFindRegExInfo): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_FIND_REGEX, 0, LPARAM(PFindRegExInfo)));
end;

// -----------------------------------------------------------------------------
// Editor_EnumMode
//   編集モードの一覧を取得します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   pBuf:   文字列を取得するバッファへのポインタ
//   cchBuf: 終端文字を含むバッファのサイズ
// 戻り値
//   cchBufが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

function Editor_EnumMode(hwnd: THandle; pBuf: PChar; cchBuf: NativeUInt): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_ENUM_MODE, WPARAM(cchBuf), LPARAM(pBuf));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarOpen
//   ツールバーを開きます
// パラメータ
//   hwnd:         ウィンドウのハンドル
//   pToolBarInfo: TOOL_BAR_INFO構造体へのポインタ
// 戻り値
//   成功するとツールバーのIDを返します

function Editor_ToolBarOpen(hwnd: THandle; PToolBarInfo: PToolBarInfo): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_TOOL_BAR_OPEN, 0, LPARAM(PToolBarInfo));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarClose
//   ツールバーを閉じます
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nToolBarID: ツールバーのID
// 戻り値
//   使用されません

function Editor_ToolBarClose(hwnd: THandle; nToolBarID: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_CLOSE, WPARAM(nToolBarID), 0));
end;

// -----------------------------------------------------------------------------
// Editor_ToolBarShow
//   ツールバーの表示/非表示を切り替えます
// パラメータ
//   hwnd:       ウィンドウのハンドル
//   nToolBarID: ツールバーのID
//   bVisible:   表示の状態
// 戻り値
//   使用されません

function Editor_ToolBarShow(hwnd: THandle; nToolBarID: NativeUInt; bVisible: Boolean): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_TOOL_BAR_SHOW, WPARAM(nToolBarID), LPARAM(bVisible)));
end;

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

function Editor_OutputString(hwnd: THandle; szString: PChar; nFlags: NativeUInt): Boolean;
begin
  Result := Boolean(SendMessage(hwnd, ME_OUTPUT_STRING, WPARAM(nFlags), LPARAM(szString)));
end;

// -----------------------------------------------------------------------------
// Editor_GetOutputString
//   アウトプットバーの文字列を取得します
// パラメータ
//   hwnd:   ウィンドウのハンドル
//   cchBuf: 終端文字を含むバッファのサイズ
//   pBuf:   文字列を取得するバッファへのポインタ
// 戻り値
//   cchBufが0の場合はバッファに必要なサイズ、0以外の場合は使用されません

function Editor_GetOutputString(hwnd: THandle; cchBuf: NativeUInt; pBuf: PChar): NativeUInt;
begin
  Result := SendMessage(hwnd, ME_GET_OUTPUT_STRING, WPARAM(cchBuf), LPARAM(pBuf));
end;

end.
