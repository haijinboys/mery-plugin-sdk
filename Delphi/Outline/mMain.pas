// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, Vcl.Themes,
  System.Generics.Collections, mPerMonitorDpi, DarkModeClasses;

const
  dcTreeView = $001E1E1E;

const
  MaxLineLength = 2000;
  MaxDepth = 8;
  WorkOutlineAll = 1;
  WorkTreeSel = 2;
  IndentSpaces = 0;
  IndentBraces = 1;
  IndentBrackets = 2;
  IndentCustom = 3;
  IndentCustomBeginEnd = 4;

type
  TMatch = array [0 .. MaxDepth - 1] of string;

  TReplace = array [0 .. MaxDepth - 1] of string;

  TRegEx = array [0 .. MaxDepth - 1] of Boolean;

  TDefaultLevel = (dlCollapse, dlLevel2, dlLevel3, dlLevel4, dlLevel5, dlLevel6,
    dlLevel7, dlExpand);

  TTextSize = (tsSmallest, tsSmaller, tsMedium, tsLarger, tsLargest);

  TDarkMode = (dmLight, dmDark, dmAuto);

  TSystemBackdrop = (sbNone, sbMicaAlt, sbMica, sbAcrylic);

  TProp = class(TPersistent)
  private
    { Private éŒ¾ }
    FCaption: string;
    FIndentType: Integer;
    FViewLevel: Integer;
    FDefaultLevel: TDefaultLevel;
    FComments: Boolean;
  public
    { Public éŒ¾ }
    Match: array [0 .. MaxDepth - 1] of string;
    Replace: array [0 .. MaxDepth - 1] of string;
    RegEx: array [0 .. MaxDepth - 1] of Boolean;
    constructor Create;
    procedure Assign(Source: TPersistent); override;
    procedure Reset;
    property Caption: string read FCaption write FCaption;
    property IndentType: Integer read FIndentType write FIndentType;
    property ViewLevel: Integer read FViewLevel write FViewLevel;
    property DefaultLevel: TDefaultLevel read FDefaultLevel write FDefaultLevel;
    property Comments: Boolean read FComments write FComments;
  end;

  TPropItem = class(TCollectionItem)
  private
    { Private éŒ¾ }
    FProp: TProp;
  protected
    { Protected éŒ¾ }
    function GetDisplayName: string; override;
  public
    { Public éŒ¾ }
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    { Published éŒ¾ }
    property Prop: TProp read FProp write FProp;
  end;

  TPropItems = class;

  TPropItemsEnumerator = class
  private
    { Private éŒ¾ }
    FIndex: Integer;
    FCollection: TPropItems;
  public
    { Public éŒ¾ }
    constructor Create(ACollection: TPropItems);
    function GetCurrent: TPropItem;
    function MoveNext: Boolean;
    property Current: TPropItem read GetCurrent;
  end;

  TPropItems = class(TCollection)
  private
    { Private éŒ¾ }
    function GetItem(Index: Integer): TPropItem;
    procedure SetItem(Index: Integer; Value: TPropItem);
  public
    { Public éŒ¾ }
    constructor Create;
    function Add: TPropItem;
    function GetEnumerator: TPropItemsEnumerator;
    function IndexOf(Item: TPropItem): Integer;
    property Items[Index: Integer]: TPropItem read GetItem write SetItem; default;
  end;

  TOutlineItem = class
  private
    { Private éŒ¾ }
    FNode: TTreeNode;
    FLineNum: Integer;
    FLevel: Integer;
    FLineStr: string;
  public
    { Public éŒ¾ }
    constructor Create(ALineNum: Integer; ALevel: Integer; ALineStr: string);
    property Node: TTreeNode read FNode write FNode;
    property LineNum: Integer read FLineNum write FLineNum;
    property Level: Integer read FLevel write FLevel;
    property LineStr: string read FLineStr write FLineStr;
  end;

  TOutlineList = class(TObjectList<TOutlineItem>)
  end;

  TMainForm = class(TScaledForm)
    PopupMenu: TPopupMenu;
    CopyMenuItem: TMenuItem;
    CopyAllMenuItem: TMenuItem;
    N1: TMenuItem;
    GoMenuItem: TMenuItem;
    SelectMenuItem: TMenuItem;
    N2: TMenuItem;
    MoveUpMenuItem: TMenuItem;
    MoveDownMenuItem: TMenuItem;
    N3: TMenuItem;
    CollapseAllMenuItem: TMenuItem;
    Level2MenuItem: TMenuItem;
    Level3MenuItem: TMenuItem;
    Level4MenuItem: TMenuItem;
    Level5MenuItem: TMenuItem;
    Level6MenuItem: TMenuItem;
    Level7MenuItem: TMenuItem;
    ExpandAllMenuItem: TMenuItem;
    N4: TMenuItem;
    TextSizeMenuItem: TMenuItem;
    N5: TMenuItem;
    TextSizeLargestMenuItem: TMenuItem;
    TextSizeLargerMenuItem: TMenuItem;
    TextSizeMediumMenuItem: TMenuItem;
    TextSizeSmallerMenuItem: TMenuItem;
    TextSizeSmallestMenuItem: TMenuItem;
    PropPopupMenuItem: TMenuItem;
    Timer: TTimer;
    TreeView: TTreeView;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure PopupMenuPopup(Sender: TObject);
    procedure CopyMenuItemClick(Sender: TObject);
    procedure CopyAllMenuItemClick(Sender: TObject);
    procedure GoMenuItemClick(Sender: TObject);
    procedure SelectMenuItemClick(Sender: TObject);
    procedure MoveUpMenuItemClick(Sender: TObject);
    procedure MoveDownMenuItemClick(Sender: TObject);
    procedure CollapseAllMenuItemClick(Sender: TObject);
    procedure Level2MenuItemClick(Sender: TObject);
    procedure ExpandAllMenuItemClick(Sender: TObject);
    procedure TextSizeLargestMenuItemClick(Sender: TObject);
    procedure PropPopupMenuItemClick(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure TreeViewClick(Sender: TObject);
    procedure TreeViewDblClick(Sender: TObject);
    procedure TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure TreeViewEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure TreeViewExpanded(Sender: TObject; Node: TTreeNode);
    procedure TreeViewKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private éŒ¾ }
    FPixelsPerInch: Integer;
    FEditor: THandle;
    FBarPos: Integer;
    FFontName: string;
    FFontSize: Integer;
    FAltGoToNode: Boolean;
    FTextSize: TTextSize;
    FForeColor: TColor;
    FBackColor: TColor;
    FDarkMode: TDarkMode;
    FProp: TProp;
    FStringBuilder: TStringBuilder;
    FList: TOutlineList;
    FPoint: TPoint;
    FDragSource: TTreeNode;
    FDragTarget: TTreeNode;
    FDragAfter: Boolean;
    FUpdateOutline: Boolean;
    FUpdateTreeSel: Boolean;
    FWorkFlag: Integer;
    FWorkThread: THandle;
    FAbortThread: Boolean;
    FQueEvent: THandle;
    FMutex: THandle;
    FTreeViewWndProc: TWndMethod;
    procedure ReadIni(Prop: TProp; const Mode: string); overload;
    procedure WriteIni(Prop: TProp); overload;
    procedure EraseSection;
    function CheckBright: Boolean;
    function Find(ALine: PChar; AFind: PChar; ARegEx: Boolean): PChar;
    function LineMatched(ALine: PChar; ABegin: PChar; ARegExBegin: Boolean;
      AEnd: PChar; ARegExEnd: Boolean): Integer;
    function Matched(ALine, AFind: PChar; ARegEx: Boolean;
      AStripPrefix: Boolean; AReplace: PChar): Boolean;
    function IsCommentLine(ALine: Integer; AText: PChar): Boolean;
    function CalcIndent(ALine: PChar; ALevel: Integer; var ApplyBefore: Boolean;
      var CustomBarLevel: Integer): Integer;
    function CalcOutlineCustom(ALine: PChar; AStripPrefix: Boolean): Integer;
    function GetCurrentLine: Integer;
    procedure UpdateTreeViewAll;
    procedure UpdateTreeViewString;
    procedure OutlineSelected(Node: TTreeNode; FocusView, Select: Boolean;
      ForceScroll: Boolean = True; Center: Boolean = False);
    procedure MoveNode(Node, Destination: TTreeNode; After: Boolean);
    procedure TreeMoveSub(Node: TTreeNode; Down: Boolean);
    procedure TreeViewWndProc(var Message: TMessage);
    procedure WMThemeChanged(var Message: TMessage); message WM_THEMECHANGED;
  public
    { Public éŒ¾ }
    procedure ReadIni; overload;
    procedure WriteIni; overload;
    procedure ResetThread;
    procedure OutlineAll;
    procedure UpdateTreeViewSel;
    procedure TreeCopy(Node: TTreeNode);
    procedure TreeMove(Node: TTreeNode; Down: Boolean);
    procedure TreeGoToNode(Down: Boolean; Center: Boolean = False);
    procedure SetFont;
    procedure SetScale(const Value: Integer);
    procedure SetAppMode;
    function SetProperties: Boolean;
    property BarPos: Integer read FBarPos write FBarPos;
    property AltGoToNode: Boolean read FAltGoToNode write FAltGoToNode;
    property UpdateOutline: Boolean read FUpdateOutline write FUpdateOutline;
    property UpdateTreeSel: Boolean read FUpdateTreeSel write FUpdateTreeSel;
    property Editor: THandle read FEditor write FEditor;
    property WorkHandle: THandle read FWorkThread write FWorkThread;
    property WorkFlag: Integer read FWorkFlag write FWorkFlag;
    property AbortThread: Boolean read FAbortThread write FAbortThread;
    property QueEvent: THandle read FQueEvent write FQueEvent;
    property Mutex: THandle read FMutex write FMutex;
  end;

function GetIniFileName(var FileName: string): Boolean;

var
  MainForm: TMainForm;
  FPropItems: TPropItems;

var
  UseMica: Boolean = False;

implementation

uses
  System.Types, System.StrUtils, System.Math, System.IniFiles, System.UITypes,
  Winapi.CommCtrl, Winapi.UxTheme, Vcl.Clipbrd, mCommon, mPlugin, mProp;

{$R *.dfm}


function GetIniFileName(var FileName: string): Boolean;
var
  S, T: string;
begin
  FileName := '';
  if GetAppIniFileName(S) then
  begin
    T := ChangeFileExt(ExtractFileName(GetModuleName(HInstance)), '');
    FileName := ExtractFilePath(S) + 'Plugins\' + T + '\' + T + '.ini';
    Result := ForceDirectories(ExtractFileDir(FileName));
  end
  else
    Result := False;
end;

function WaitMessageLoop(Count: LongWord; var Handles: THandle;
  Milliseconds: DWORD): Integer;
var
  Quit: Boolean;
  ExitCode: Integer;
  WaitResult: DWORD;
  Msg: TMsg;
begin
  Quit := False;
  ExitCode := 0;
  repeat
    while PeekMessage(Msg, 0, 0, 0, PM_REMOVE) do
    begin
      case Msg.message of
        WM_QUIT:
          begin
            Quit := True;
            ExitCode := Integer(Msg.wParam);
            Break;
          end;
        WM_MOUSEMOVE:
          ;
        WM_LBUTTONDOWN:
          ;
      else
        DispatchMessage(Msg);
      end;
    end;
    WaitResult := MsgWaitForMultipleObjects(Count, Handles, False, Milliseconds, QS_ALLINPUT);
  until WaitResult <> WAIT_OBJECT_0 + 1;
  if Quit then
    PostQuitMessage(ExitCode);
  Result := Integer(WaitResult - WAIT_OBJECT_0);
end;

{ TProp }

constructor TProp.Create;
begin
  Reset;
end;

procedure TProp.Assign(Source: TPersistent);
begin
  if Source is TProp then
    with TProp(Source) do
    begin
      Self.FCaption := Caption;
      Self.FIndentType := IndentType;
      Self.FViewLevel := ViewLevel;
      Self.FDefaultLevel := DefaultLevel;
      Self.FComments := Comments;
      Self.Match := Match;
      Self.Replace := Replace;
      Self.RegEx := RegEx;
    end
  else
    inherited;
end;

procedure TProp.Reset;
var
  I: Integer;
begin
  for I := 0 to MaxDepth - 1 do
  begin
    Match[I] := StringOfChar('.', I + 1);
    Replace[I] := '';
    RegEx[I] := False;
  end;
  FIndentType := IndentSpaces;
  FViewLevel := 8;
  FDefaultLevel := dlCollapse;
  FComments := False;
  if SameText(FCaption, 'Arduino') then
  begin
    IndentType := IndentBraces;
    ViewLevel := 1;
  end
  else if SameText(FCaption, 'Bat') then
    //
  else if SameText(FCaption, 'C#') then
  begin
    IndentType := IndentBraces;
    ViewLevel := 1;
  end
  else if SameText(FCaption, 'C++') then
  begin
    IndentType := IndentBraces;
    ViewLevel := 1;
  end
  else if SameText(FCaption, 'ColdFusion') then
    //
  else if SameText(FCaption, 'CSS') then
    //
  else if SameText(FCaption, 'Delphi') then
    //
  else if SameText(FCaption, 'HSP') then
    //
  else if SameText(FCaption, 'HTML') then
    //
  else if SameText(FCaption, 'INI') then
    //
  else if SameText(FCaption, 'Java') then
  begin
    IndentType := IndentBraces;
    ViewLevel := 1;
  end
  else if SameText(FCaption, 'JavaScript') then
  begin
    IndentType := IndentBraces;
    ViewLevel := 1;
  end
  else if SameText(FCaption, 'JSON') then
    //
  else if SameText(FCaption, 'JSP') then
    //
  else if SameText(FCaption, 'Markdown') then
  begin
    IndentType := IndentCustom;
    ViewLevel := 6;
    Match[0] := '# ';
    Match[1] := '## ';
    Match[2] := '### ';
    Match[3] := '#### ';
    Match[4] := '##### ';
    Match[5] := '###### ';
  end
  else if SameText(FCaption, 'Perl') then
    //
  else if SameText(FCaption, 'PHP') then
    //
  else if SameText(FCaption, 'PowerShell') then
    //
  else if SameText(FCaption, 'Python') then
    //
  else if SameText(FCaption, 'Ruby') then
    //
  else if SameText(FCaption, 'SQL') then
    //
  else if SameText(FCaption, 'TeX') then
  begin
    IndentType := IndentCustomBeginEnd;
    Match[0] := '\begin';
    Match[1] := '\end';
  end
  else if SameText(FCaption, 'Text') then
    //
  else if SameText(FCaption, 'UWSC') then
    //
  else if SameText(FCaption, 'VBScript') then
    //
  else if SameText(FCaption, 'VisualBasic') then
    //
  else if SameText(FCaption, 'Windows Script') then
    //
  else if SameText(FCaption, 'x86 Assembler') then
    //
  else if SameText(FCaption, 'XML') then
  begin
    IndentType := IndentCustomBeginEnd;
    Match[0] := '<[^/?].*?[^/]>';
    Match[1] := '</.*?>';
    RegEx[0] := True;
    RegEx[1] := True;
  end
  else
      ;
end;

{ TPropItem }

constructor TPropItem.Create(Collection: TCollection);
begin
  inherited;
  FProp := TProp.Create;
end;

destructor TPropItem.Destroy;
begin
  FProp.Free;
  inherited;
end;

procedure TPropItem.Assign(Source: TPersistent);
begin
  if Source is TPropItem then
    with TPropItem(Source) do
    begin
      Self.FProp.Assign(Prop);
    end
  else
    inherited;
end;

function TPropItem.GetDisplayName: string;
begin
  Result := FProp.Caption;
end;

{ TPropItemsEnumerator }

constructor TPropItemsEnumerator.Create(ACollection: TPropItems);
begin
  inherited Create;
  FIndex := -1;
  FCollection := ACollection;
end;

function TPropItemsEnumerator.GetCurrent: TPropItem;
begin
  Result := FCollection[FIndex];
end;

function TPropItemsEnumerator.MoveNext: Boolean;
begin
  Result := FIndex < FCollection.Count - 1;
  if Result then
    Inc(FIndex);
end;

{ TPropItems }

function TPropItems.Add: TPropItem;
begin
  Result := TPropItem(inherited Add);
end;

constructor TPropItems.Create;
begin
  inherited Create(TPropItem);
end;

function TPropItems.GetEnumerator: TPropItemsEnumerator;
begin
  Result := TPropItemsEnumerator.Create(Self);
end;

function TPropItems.GetItem(Index: Integer): TPropItem;
begin
  Result := TPropItem(inherited GetItem(Index));
end;

function TPropItems.IndexOf(Item: TPropItem): Integer;
begin
  for Result := 0 to Count - 1 do
    if Items[Result] = Item then
      Exit;
  Result := -1;
end;

procedure TPropItems.SetItem(Index: Integer; Value: TPropItem);
begin
  inherited SetItem(Index, Value);
end;

{ TOutlineItem }

constructor TOutlineItem.Create(ALineNum: Integer; ALevel: Integer;
  ALineStr: string);
  function TrimLine(const ALine: string): string;
  var
    I, Len: Integer;
  begin
    Result := Trim(ALine);
    Len := Length(Result);
    I := 1;
    while I <= Len do
    begin
      if Result[I] = #09 then
        Result[I] := ' ';
      Inc(I);
    end;
  end;

begin
  FNode := nil;
  FLineNum := ALineNum;
  FLevel := ALevel;
  FLineStr := TrimLine(ALineStr);
end;

{ TMainForm }

procedure TMainForm.FormCreate(Sender: TObject);
begin
  TScaledForm.DefaultFont.Assign(Font);
  FPixelsPerInch := PixelsPerInch;
  FEditor := ParentWindow;
  FFontName := '';
  FFontSize := 0;
  FAltGoToNode := False;
  FTextSize := tsMedium;
  FForeColor := clNone;
  FBackColor := clNone;
  FDarkMode := dmLight;
  FProp := TProp.Create;
  FStringBuilder := TStringBuilder.Create;
  FList := TOutlineList.Create;
  FPoint := Point(-1, -1);
  FDragSource := nil;
  FDragTarget := nil;
  FDragAfter := False;
  FUpdateOutline := False;
  FUpdateTreeSel := False;
  FWorkFlag := 0;
  FQueEvent := CreateEvent(nil, True, False, nil);
  FMutex := CreateMutex(nil, False, nil);
  FTreeViewWndProc := TreeView.WindowProc;
  TreeView.WindowProc := TreeViewWndProc;
  SetWindowTheme(TreeView.Handle, '', nil);
  ReadIni;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  ResetThread;
  if FQueEvent > 0 then
  begin
    CloseHandle(FQueEvent);
    FQueEvent := 0;
  end;
  if FMutex > 0 then
  begin
    CloseHandle(FMutex);
    FMutex := 0;
  end;
  WriteIni;
  if Assigned(FStringBuilder) then
    FreeAndNil(FStringBuilder);
  if Assigned(FList) then
    FreeAndNil(FList);
  if Assigned(FProp) then
    FreeAndNil(FProp);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  //
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //
end;

procedure TMainForm.PopupMenuPopup(Sender: TObject);
begin
  with TreeView do
  begin
    CopyMenuItem.Enabled := Selected <> nil;
    CopyAllMenuItem.Enabled := Items.Count > 0;
    GoMenuItem.Enabled := Selected <> nil;
    SelectMenuItem.Enabled := Selected <> nil;
    MoveDownMenuItem.Enabled := Selected <> nil;
    MoveUpMenuItem.Enabled := Selected <> nil;
  end;
  TextSizeLargestMenuItem.Checked := False;
  TextSizeLargerMenuItem.Checked := False;
  TextSizeMediumMenuItem.Checked := False;
  TextSizeSmallerMenuItem.Checked := False;
  TextSizeSmallestMenuItem.Checked := False;
  case FTextSize of
    tsSmallest:
      TextSizeSmallestMenuItem.Checked := True;
    tsSmaller:
      TextSizeSmallerMenuItem.Checked := True;
    tsLarger:
      TextSizeLargerMenuItem.Checked := True;
    tsLargest:
      TextSizeLargestMenuItem.Checked := True;
  else
    TextSizeMediumMenuItem.Checked := True;
  end;
end;

procedure TMainForm.CopyMenuItemClick(Sender: TObject);
begin
  TreeCopy(TreeView.Selected);
end;

procedure TMainForm.CopyAllMenuItemClick(Sender: TObject);
var
  LList: TStringList;
  LNode: TTreeNode;
begin
  LList := TStringList.Create;
  try
    with TreeView, Items do
    begin
      LNode := GetFirstNode;
      while LNode <> nil do
      begin
        LList.Add(DupeString(#09, LNode.Level) + LNode.Text);
        LNode := LNode.GetNext;
      end;
    end;
    Clipboard.AsText := LList.Text;
  finally
    LList.Free;
  end;
end;

procedure TMainForm.GoMenuItemClick(Sender: TObject);
begin
  OutlineSelected(TreeView.Selected, True, False);
end;

procedure TMainForm.SelectMenuItemClick(Sender: TObject);
begin
  OutlineSelected(TreeView.Selected, True, True);
end;

procedure TMainForm.MoveUpMenuItemClick(Sender: TObject);
begin
  TreeMove(TreeView.Selected, False);
end;

procedure TMainForm.MoveDownMenuItemClick(Sender: TObject);
begin
  TreeMove(TreeView.Selected, True);
end;

procedure TMainForm.CollapseAllMenuItemClick(Sender: TObject);
begin
  if WaitMessageLoop(1, FMutex, INFINITE) <> 0 then
    Exit;
  with TreeView, Items do
  begin
    BeginUpdate;
    try
      FullCollapse;
    finally
      EndUpdate;
    end;
  end;
  ReleaseMutex(FMutex);
end;

procedure TMainForm.Level2MenuItemClick(Sender: TObject);
var
  LLevel: Integer;
  LNode: TTreeNode;
begin
  if WaitMessageLoop(1, FMutex, INFINITE) <> 0 then
    Exit;
  LLevel := (Sender as TMenuItem).Tag;
  with TreeView, Items do
  begin
    BeginUpdate;
    try
      LNode := GetFirstNode;
      while LNode <> nil do
      begin
        if LNode.Level < LLevel then
          LNode.Expand(False)
        else
          LNode.Collapse(False);
        LNode := LNode.GetNext;
      end;
    finally
      EndUpdate;
    end;
  end;
  ReleaseMutex(FMutex);
end;

procedure TMainForm.ExpandAllMenuItemClick(Sender: TObject);
begin
  if WaitMessageLoop(1, FMutex, INFINITE) <> 0 then
    Exit;
  with TreeView, Items do
  begin
    BeginUpdate;
    try
      FullExpand;
    finally
      EndUpdate;
    end;
  end;
  ReleaseMutex(FMutex);
end;

procedure TMainForm.TextSizeLargestMenuItemClick(Sender: TObject);
begin
  if Sender = TextSizeLargestMenuItem then
    FTextSize := tsLargest
  else if Sender = TextSizeLargerMenuItem then
    FTextSize := tsLarger
  else if Sender = TextSizeSmallerMenuItem then
    FTextSize := tsSmaller
  else if Sender = TextSizeSmallestMenuItem then
    FTextSize := tsSmallest
  else
    FTextSize := tsMedium;
  SetFont;
  WriteIni;
end;

procedure TMainForm.PropPopupMenuItemClick(Sender: TObject);
begin
  SetProperties;
end;

procedure TMainForm.TimerTimer(Sender: TObject);
var
  P: TPoint;
begin
  with TreeView do
  begin
    if not Dragging then
    begin
      Timer.Enabled := False;
      Exit;
    end;
    P := ScreenToClient(Mouse.CursorPos);
    if P.Y < 0 then
      Perform(WM_VSCROLL, SB_LINEUP, 0)
    else
      if P.Y > ClientHeight then
      Perform(WM_VSCROLL, SB_LINEDOWN, 0)
    else
      Timer.Enabled := False;
  end;
end;

procedure TMainForm.TreeViewClick(Sender: TObject);
var
  LNode: TTreeNode;
begin
  LNode := TreeView.GetNodeAt(FPoint.X, FPoint.Y);
  if LNode <> nil then
    OutlineSelected(LNode, False, False);
end;

procedure TMainForm.TreeViewDblClick(Sender: TObject);
var
  LNode: TTreeNode;
begin
  LNode := TreeView.GetNodeAt(FPoint.X, FPoint.Y);
  if LNode <> nil then
    OutlineSelected(LNode, True, False);
end;

procedure TMainForm.TreeViewDragDrop(Sender, Source: TObject; X, Y: Integer);
begin
  if FDragTarget <> nil then
    MoveNode(FDragSource, FDragTarget, FDragAfter);
end;

procedure TMainForm.TreeViewDragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
var
  H: Integer;
  R: TRect;
begin
  with TreeView do
  begin
    Accept := Sender = Source;
    if Accept then
    begin
      H := TreeView_GetItemHeight(Handle);
      FDragAfter := False;
      FDragTarget := GetNodeAt(X, Y);
      if FDragTarget <> nil then
      begin
        R := FDragTarget.DisplayRect(False);
        if (Y > R.Top + H div 2) and (FDragTarget.getFirstChild = nil) then
          FDragAfter := True;
      end
      else
      begin
        FDragTarget := GetNodeAt(X, Y - H);
        if FDragTarget <> nil then
          FDragAfter := True;
      end;
      if FDragTarget <> nil then
      begin
        if UseDarkMode then
          TreeView_SetInsertMarkColor(Handle, RGB($DF, $DF, $DF));
        TreeView_SetInsertMark(Handle, Integer(FDragTarget.ItemId), FDragAfter);
      end;
      Timer.Enabled := True;
    end;
  end;
end;

procedure TMainForm.TreeViewEndDrag(Sender, Target: TObject; X, Y: Integer);
begin
  Timer.Enabled := False;
  TreeView_SetInsertMark((Sender as TTreeView).Handle, 0, False);
end;

procedure TMainForm.TreeViewExpanded(Sender: TObject; Node: TTreeNode);
begin
  if UseDarkMode then
    TreeView.Perform(WM_NCPAINT, 0, 0);
end;

procedure TMainForm.TreeViewKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    OutlineSelected(TreeView.Selected, True, False);
    Key := 0;
  end;
end;

procedure TMainForm.TreeViewMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var
  LNode: TTreeNode;
  LHitTests: THitTests;
begin
  LHitTests := TreeView.GetHitTestInfoAt(X, Y);
  if not(htOnItem in LHitTests) then
  begin
    FPoint := Point(-1, -1);
    Exit;
  end;
  FPoint := Point(X, Y);
  with TreeView do
    case Button of
      mbLeft:
        begin
          FDragSource := GetNodeAt(X, Y);
          if FDragSource <> nil then
            BeginDrag(False);
        end;
      mbRight:
        begin
          LNode := GetNodeAt(X, Y);
          if LNode <> nil then
            Selected := LNode;
        end;
    end;
end;

procedure TMainForm.ReadIni(Prop: TProp; const Mode: string);
var
  S: string;
  I: Integer;
begin
  Prop.Caption := Mode;
  if not GetIniFileName(S) then
    Exit;
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      with Prop do
      begin
        if SectionExists(Format('Outline\%s', [Caption])) then
        begin
          IndentType := ReadInteger(Format('Outline\%s', [Caption]), 'IndentType', IndentType);
          ViewLevel := ReadInteger(Format('Outline\%s', [Caption]), 'ViewLevel', ViewLevel);
          DefaultLevel := TDefaultLevel(ReadInteger(Format('Outline\%s', [Caption]), 'DefaultLevel', Integer(DefaultLevel)));
          Comments := ReadBool(Format('Outline\%s', [Caption]), 'Comments', Comments);
          for I := 0 to MaxDepth - 1 do
          begin
            Match[I] := AnsiDequotedStr(ReadString(Format('Outline\%s', [Caption]), Format('Match%d', [I]), Match[I]), '"');
            RegEx[I] := ReadBool(Format('Outline\%s', [Caption]), Format('RegEx%d', [I]), RegEx[I]);
            Replace[I] := AnsiDequotedStr(ReadString(Format('Outline\%s', [Caption]), Format('Replace%d', [I]), Replace[I]), '"');
          end;
        end
        else
          Reset;
      end;
    finally
      Free;
    end;
end;

procedure TMainForm.WriteIni(Prop: TProp);
var
  S: string;
  I: Integer;
begin
  if not GetIniFileName(S) then
    Exit;
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      with Prop do
      begin
        WriteInteger(Format('Outline\%s', [Caption]), 'IndentType', IndentType);
        WriteInteger(Format('Outline\%s', [Caption]), 'ViewLevel', ViewLevel);
        WriteInteger(Format('Outline\%s', [Caption]), 'DefaultLevel', Integer(DefaultLevel));
        WriteBool(Format('Outline\%s', [Caption]), 'Comments', Comments);
        for I := 0 to MaxDepth - 1 do
        begin
          WriteString(Format('Outline\%s', [Caption]), Format('Match%d', [I]), AnsiQuotedStr(Match[I], '"'));
          WriteBool(Format('Outline\%s', [Caption]), Format('RegEx%d', [I]), RegEx[I]);
          WriteString(Format('Outline\%s', [Caption]), Format('Replace%d', [I]), AnsiQuotedStr(Replace[I], '"'));
        end;
        UpdateFile;
      end;
    finally
      Free;
    end;
end;

procedure TMainForm.EraseSection;
var
  S: string;
  I: Integer;
  Sections: TStrings;
begin
  if FIniFailed or (not GetIniFileName(S)) then
    Exit;
  try
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        Sections := TStringList.Create;
        try
          ReadSections(Sections);
          for I := 0 to Sections.Count - 1 do
            if Pos('Outline\', Sections[I]) = 1 then
              EraseSection(Sections[I]);
        finally
          Sections.Free;
        end;
        UpdateFile;
      finally
        Free;
      end;
  except
    FIniFailed := True;
  end;
end;

function TMainForm.CheckBright: Boolean;
  procedure GetRGB(Col: TColor; var R, G, B: Byte);
  var
    Color: $0 .. $FFFFFFFF;
  begin
    Color := ColorToRGB(Col);
    R := ($000000FF and Color);
    G := ($0000FF00 and Color) shr 8;
    B := ($00FF0000 and Color) shr 16;
  end;

  function ColorIsBright(AColor: TColor): Boolean;
  var
    R, G, B: Byte;
    Delta: Double;
  begin
    GetRGB(AColor, R, G, B);
    Delta := 1 - ((0.299 * R) + (0.587 * G) + (0.114 * B)) / 255;
    Result := (Delta < 0.5);
  end;

var
  LColor: TColor;
begin
  LColor := TColor(Editor_Info(FEditor, MI_GET_BACK_COLOR, COLOR_GENERAL));
  if Editor_Info(FEditor, MI_GET_INVERT_COLOR, 0) = 1 then
    LColor := GetInvertColor(LColor);
  Result := ColorIsBright(LColor);
  if Result then
  begin
    FDarkMode := dmLight;
    DarkModeEnabled := False;
    UseDarkMode := False;
    SendMessage(Handle, WM_THEMECHANGED, 0, 0);
  end;
end;

function TMainForm.Find(ALine, AFind: PChar; ARegEx: Boolean): PChar;
var
  FindRegexInfo: TFindRegExInfo;
  LStart, LEnd, LNext: PChar;
begin
  if AFind^ = #0 then
  begin
    if ALine^ = #0 then
    begin
      Result := ALine + 1;
      Exit;
    end;
    Result := nil;
    Exit;
  end;
  if ARegEx then
  begin
    LStart := nil;
    LEnd := nil;
    LNext := nil;
    FindRegexInfo.cbSize := SizeOf(FindRegexInfo);
    FindRegexInfo.nFlags := FLAG_FIND_MATCH_CASE;
    FindRegexInfo.pszRegEx := PChar(AFind);
    FindRegexInfo.pszText := ALine;
    FindRegexInfo.ppszStart := @LStart;
    FindRegexInfo.ppszEnd := @LEnd;
    FindRegexInfo.ppszNext := @LNext;
    if Editor_FindRegEx(FEditor, @FindRegexInfo) then
      Result := FindRegexInfo.ppszNext^
    else
      Result := nil;
    Exit;
  end
  else
  begin
    LStart := StrPos(ALine, AFind);
    if LStart <> nil then
    begin
      Result := LStart + StrLen(AFind);
      Exit;
    end;
  end;
  Result := nil;
end;

function TMainForm.LineMatched(ALine, ABegin: PChar; ARegExBegin: Boolean;
  AEnd: PChar; ARegExEnd: Boolean): Integer;
var
  P: PChar;
  LLevel: Integer;
begin
  P := ALine;
  LLevel := 0;
  if ALine^ = #0 then
  begin
    if ABegin^ = #0 then
      Inc(LLevel);
    if AEnd^ = #0 then
      Dec(LLevel);
    Result := LLevel;
    Exit;
  end;
  while P^ <> #0 do
  begin
    P := Find(P, ABegin, ARegExBegin);
    if P = nil then
      Break;
    Inc(LLevel);
  end;
  P := ALine;
  while P^ <> #0 do
  begin
    P := Find(P, AEnd, ARegExEnd);
    if P = nil then
      Break;
    Dec(LLevel);
  end;
  Result := LLevel;
end;

function TMainForm.Matched(ALine, AFind: PChar; ARegEx, AStripPrefix: Boolean;
  AReplace: PChar): Boolean;
  function StrCompEx(First, Last: PChar): Boolean;
  begin
    while First^ = Last^ do
    begin
      Inc(First);
      Inc(Last);
      if Last^ = #0 then
      begin
        Result := True;
        Exit;
      end;
    end;
    Result := False;
  end;

var
  MatchRegexInfo: TMatchRegexInfo;
  LineLen, FindLen, ReplaceLen: Integer;
begin
  if ARegEx then
  begin
    FillChar(MatchRegexInfo, SizeOf(TMatchRegexInfo), #0);
    MatchRegexInfo.cbSize := SizeOf(TMatchRegexInfo);
    MatchRegexInfo.nFlags := FLAG_FIND_MATCH_CASE;
    MatchRegexInfo.pszRegEx := PChar(AFind);
    MatchRegexInfo.pszText := ALine;
    if AStripPrefix and (AReplace <> nil) and (AReplace^ <> #0) then
    begin
      MatchRegexInfo.pszReplace := AReplace;
      MatchRegexInfo.pszResult := ALine;
      MatchRegexInfo.cchResult := MaxLineLength;
    end;
    Result := Editor_MatchRegex(FEditor, @MatchRegexInfo);
    Exit;
  end
  else if StrCompEx(ALine, AFind) then
  begin
    if AStripPrefix then
    begin
      LineLen := StrLen(ALine);
      FindLen := StrLen(AFind);
      ReplaceLen := StrLen(AReplace);
      FStringBuilder.Clear;
      FStringBuilder.Append(ALine);
      FStringBuilder.Remove(0, FindLen);
      FStringBuilder.Insert(0, AReplace, ReplaceLen);
      StrLCopy(ALine, PChar(FStringBuilder.ToString), LineLen);
    end;
    Result := True;
    Exit;
  end;
  Result := False;
end;

function TMainForm.IsCommentLine(ALine: Integer; AText: PChar): Boolean;
var
  AI: TAttrInfo;
  P: PChar;
begin
  FillChar(AI, SizeOf(TAttrInfo), #0);
  AI.cbSize := SizeOf(AI);
  AI.nFlags := AI_NEED_ATTR_SUB;
  AI.ptLogical.Y := ALine;
  P := AText;
  while (P^ = ' ') or (P^ = #09) do
  begin
    Inc(P);
    Inc(AI.ptLogical.X);
  end;
  Inc(AI.ptLogical.X);
  Editor_GetAttr(FEditor, @AI);
  if (AI.nAttr and ATTR_COMMENT) <> 0 then
  begin
    AI.ptLogical.X := Length(string(AText));
    Editor_GetAttr(FEditor, @AI);
    if (AI.nAttr and ATTR_COMMENT) <> 0 then
    begin
      Result := True;
      Exit;
    end;
  end;
  Result := False;
end;

function TMainForm.CalcIndent(ALine: PChar; ALevel: Integer;
  var ApplyBefore: Boolean; var CustomBarLevel: Integer): Integer;
var
  P, Temp: PChar;
  BeginChar, EndChar: Char;
  Tested: Boolean;
  Ret: Integer;
begin
  ApplyBefore := False;
  CustomBarLevel := 0;
  P := ALine;
  if FProp.IndentType = IndentSpaces then
  begin
    if ALine[0] <> #0 then
    begin
      ALevel := 0;
      while (P^ = #09) or (P^ = #$0020) do
      begin
        Inc(ALevel);
        Inc(P);
      end;
    end;
  end
  else if (FProp.IndentType = IndentBraces) or (FProp.IndentType = IndentBrackets) then
  begin
    if FProp.IndentType = IndentBraces then
    begin
      BeginChar := '{';
      EndChar := '}';
    end
    else
    begin
      BeginChar := '[';
      EndChar := ']';
    end;
    ApplyBefore := True;
    Tested := False;
    while P^ <> #0 do
    begin
      if P^ = '/' then
      begin
        if (P + 1)^ = '/' then
          Break;
      end
      else if P^ = BeginChar then
      begin
        if not Tested then
        begin
          Tested := True;
          ApplyBefore := False;
          Temp := ALine;
          while Temp <> P do
          begin
            if (Temp^ <> ' ') and (Temp^ <> #09) then
            begin
              ApplyBefore := True;
              Break;
            end;
            Inc(Temp);
          end;
        end;
        Inc(ALevel);
      end
      else if P^ = EndChar then
        Dec(ALevel);
      Inc(P);
    end;
    if ALevel < 0 then
      ALevel := 0;
  end
  else if FProp.IndentType = IndentCustom then
  begin
    CustomBarLevel := CalcOutlineCustom(ALine, True);
    if CustomBarLevel <> 0 then
      ALevel := CustomBarLevel;
    ApplyBefore := True;
  end
  else if FProp.IndentType = IndentCustomBeginEnd then
  begin
    ApplyBefore := True;
    Ret := LineMatched(ALine,
      PChar(FProp.Match[0]), FProp.RegEx[0],
      PChar(FProp.Match[1]), FProp.RegEx[1]);
    Inc(ALevel, Ret);
    if ALevel < 0 then
      ALevel := 0;
  end;
  Result := ALevel;
end;

function TMainForm.CalcOutlineCustom(ALine: PChar;
  AStripPrefix: Boolean): Integer;
var
  I: Integer;
begin
  for I := MaxDepth - 1 downto 0 do
  begin
    if FProp.Match[I] <> '' then
    begin
      if Matched(ALine, PChar(FProp.Match[I]), FProp.RegEx[I], AStripPrefix, PChar(FProp.Replace[I])) then
      begin
        Result := I + 1;
        Exit;
      end;
    end;
  end;
  Result := 0;
end;

function TMainForm.GetCurrentLine: Integer;
var
  P: TPoint;
begin
  Editor_GetCaretPos(FEditor, POS_LOGICAL, @P);
  Result := P.Y;
end;

procedure TMainForm.OutlineSelected(Node: TTreeNode; FocusView, Select,
  ForceScroll, Center: Boolean);
var
  I, J, LOutline: Integer;
  LLevel: Integer;
  LPos, LPosBottom: TPoint;
  LFlags: Cardinal;
begin
  if Node = nil then
    Exit;
  LOutline := NativeInt(Node.Data);
  if not InRange(LOutline, 0, FList.Count - 1) then
    Exit;
  LPos.X := 0;
  LPos.Y := FList[LOutline].LineNum;
  LFlags := POS_LOGICAL or POS_SCROLL_ALWAYS;
  if Center then
    LFlags := LFlags or POS_SCROLL_CENTER
  else
    LFlags := LFlags or POS_SCROLL_TOP;
  Editor_SetCaretPos(FEditor, LFlags, @LPos);
  if FocusView then
    Editor_ExecCommand(FEditor, MEID_WINDOW_ACTIVE_PANE);
  if Select then
  begin
    LPosBottom.X := 0;
    I := LOutline;
    if Node.HasChildren then
    begin
      LLevel := FList[LOutline].Level;
      for J := Succ(LOutline) to FList.Count - 1 do
      begin
        if FList[J].Level > LLevel then
          I := J
        else
          Break;
      end;
    end;
    if I < FList.Count - 1 then
      LPosBottom.Y := FList[Succ(I)].LineNum
    else
      LPosBottom.Y := Editor_GetLines(FEditor, POS_LOGICAL) - 1;
    Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPosBottom, False);
    Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, True);
  end;
end;

procedure TMainForm.MoveNode(Node, Destination: TTreeNode; After: Boolean);
  function GetNextCluster(Value: TTreeNode): TTreeNode;
  var
    NextNode: TTreeNode;
  begin
    repeat
      NextNode := Value.getNextSibling;
      if NextNode <> nil then
      begin
        Result := NextNode;
        Exit;
      end;
      Value := Value.Parent;
    until Value = nil;
    Result := nil;
  end;

var
  LNodeTop, LNodeBottom, LLineTop, LLineBottom, LLine: Integer;
  LNode, LNextNode: TTreeNode;
  LOutline: Integer;
  LPos: TPoint;
  LSize: Cardinal;
  LBuf: array of Char;
begin
  if (Node = nil) or (Destination = nil) or (Node = Destination) then
    Exit;
  LNodeTop := NativeInt(Node.Data);
  if not InRange(LNodeTop, 0, FList.Count - 1) then
    Exit;
  LLineTop := FList[LNodeTop].LineNum;
  LNextNode := GetNextCluster(Node);
  if LNextNode <> nil then
  begin
    LNodeBottom := NativeInt(LNextNode.Data);
    if not InRange(LNodeBottom, 0, FList.Count - 1) then
      Exit;
    LLineBottom := FList[LNodeBottom].LineNum;
  end
  else
  begin
    LPos.X := MaxInt;
    LPos.Y := MaxInt;
    Editor_SetCaretPos(FEditor, POS_VIEW, @LPos);
    Editor_GetCaretPos(FEditor, POS_LOGICAL, @LPos);
    LLineBottom := LPos.Y;
    if LPos.X > 0 then
    begin
      Editor_InsertString(FEditor, PChar(string(#10)));
      Inc(LLineBottom);
    end;
  end;
  TreeView.Items.Delete(Node);
  LOutline := NativeInt(Destination.Data);
  if not InRange(LOutline, 0, FList.Count - 1) then
    Exit;
  if After then
  begin
    // LNextNode := Destination.GetLastChild;
    LNextNode := Destination.GetFirstChild;
    if LNextNode <> nil then
    begin
      LNode := LNextNode;
      repeat
        LNextNode := LNode;
        LNode := LNextNode.getNextSibling;
        if LNode = nil then
          LNode := LNextNode.getFirstChild;
      until LNode = nil;
    end;
    if LNextNode <> nil then
    begin
      LOutline := NativeInt(LNextNode.Data);
      if not InRange(LOutline, 0, FList.Count - 1) then
        Exit;
    end;
    Inc(LOutline);
    if LOutline < FList.Count then
      LLine := FList[LOutline].LineNum
    else
    begin
      LPos.X := MaxInt;
      LPos.Y := MaxInt;
      Editor_SetCaretPos(FEditor, POS_VIEW, @LPos);
      Editor_GetCaretPos(FEditor, POS_LOGICAL, @LPos);
      LLine := LPos.Y;
      if LPos.X > 0 then
      begin
        Editor_InsertString(FEditor, PChar(string(#10)));
        Inc(LLine);
      end;
    end;
  end
  else
    LLine := FList[LOutline].LineNum;
  Editor_Redraw(FEditor, False);
  try
    LPos.X := 0;
    LPos.Y := LLineBottom;
    Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, False);
    LPos.Y := LLineTop;
    Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, True);
    LSize := Editor_GetSelText(FEditor, 0, nil);
    SetLength(LBuf, LSize);
    if Length(LBuf) > 0 then
    begin
      Editor_GetSelText(FEditor, LSize, PChar(LBuf));
      if LLine < LLineTop then
        Editor_ExecCommand(FEditor, MEID_EDIT_DELETE);
      LPos.Y := LLine;
      Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, False);
      Editor_InsertString(FEditor, PChar(LBuf));
      if LLine < LLineTop then
        Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, False)
      else
      begin
        LPos.Y := LLineBottom;
        Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, False);
        LPos.Y := LLineTop;
        Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, True);
        Editor_ExecCommand(FEditor, MEID_EDIT_DELETE);
        LPos.Y := LLine - (LLineBottom - LLineTop);
        Editor_SetCaretPosEx(FEditor, POS_LOGICAL, @LPos, False);
      end;
    end;
  finally
    Editor_Redraw(FEditor, True);
  end;
  FList.Clear;
  FUpdateOutline := True;
end;

procedure TMainForm.TreeMoveSub(Node: TTreeNode; Down: Boolean);
var
  LNode: TTreeNode;
  After: Boolean;
begin
  After := False;
  if Down then
  begin
    // TreeView_Expand(TreeView.Handle, Node.ItemId, TVE_COLLAPSE);
    LNode := Node.getNextSibling;
    if LNode = nil then
      Exit;
    After := True;
  end
  else
  begin
    LNode := Node.getPrevSibling;
    if LNode = nil then
      Exit;
  end;
  MoveNode(Node, LNode, After);
end;

procedure TMainForm.TreeViewWndProc(var Message: TMessage);
begin
  if Message.Msg = WM_LBUTTONDBLCLK then
  begin
    TreeViewDblClick(Self);
    Exit;
  end;
  FTreeViewWndProc(Message);
end;

procedure TMainForm.WMThemeChanged(var Message: TMessage);
begin
  with TreeView do
  begin
    if UseDarkMode then
      BorderStyle := bsNone
    else
      BorderStyle := bsSingle;
    Color := IfThen(DarkModeEnabled, dcTreeView, clWindow);
    SetWindowTheme(Handle, PChar(IfThen(DarkModeEnabled, 'DarkMode_Explorer', '')), nil);
  end;
  inherited;
end;

procedure TMainForm.ReadIni;
var
  S: string;
  Mode: array [0 .. MAX_MODE_NAME - 1] of Char;
begin
  if not GetAppIniFileName(S) then
    Exit;
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      with TScaledForm.DefaultFont do
        if ValueExists('MainForm', 'FontName') then
        begin
          Name := ReadString('MainForm', 'FontName', Name);
          Size := ReadInteger('MainForm', 'FontSize', Size);
        end
        else if CheckWin32Version(6, 2) then
          Assign(Screen.IconFont);
    finally
      Free;
    end;
  if not GetIniFileName(S) then
    Exit;
  with TMemIniFile.Create(S, TEncoding.UTF8) do
    try
      FFontName := ReadString('Outline', 'FontName', FFontName);
      FFontSize := ReadInteger('Outline', 'FontSize', FFontSize);
      FAltGoToNode := ReadBool('Outline', 'AltGoToNode', FAltGoToNode);
      FTextSize := TTextSize(ReadInteger('Outline', 'TextSize', Integer(FTextSize)));
      if ValueExists('Outline', 'ForeColor') then
        FForeColor := ParseColor(ReadString('Outline', 'ForeColor', ColorToHexString(FForeColor)));
      if ValueExists('Outline', 'BackColor') then
        FBackColor := ParseColor(ReadString('Outline', 'BackColor', ColorToHexString(FBackColor)));
    finally
      Free;
    end;
  Mode[0] := #0;
  Editor_GetMode(Editor, @Mode);
  if Mode[0] <> #0 then
    ReadIni(FProp, Mode);
end;

procedure TMainForm.WriteIni;
var
  S: string;
begin
  if FIniFailed or (not GetIniFileName(S)) then
    Exit;
  try
    with TMemIniFile.Create(S, TEncoding.UTF8) do
      try
        WriteInteger('Outline', 'CustomBarPos', FBarPos);
        WriteBool('Outline', 'AltGoToNode', FAltGoToNode);
        WriteInteger('Outline', 'TextSize', Integer(FTextSize));
        UpdateFile;
      finally
        Free;
      end;
  except
    FIniFailed := True;
  end;
end;

procedure TMainForm.ResetThread;
begin
  if FWorkThread > 0 then
  begin
    FAbortThread := True;
    SetEvent(FQueEvent);
    SetThreadPriority(FWorkThread, THREAD_PRIORITY_ABOVE_NORMAL);
    WaitMessageLoop(1, FWorkThread, INFINITE);
    CloseHandle(FWorkThread);
    FWorkThread := 0;
    with TreeView.Items do
    begin
      BeginUpdate;
      try
        Clear;
      finally
        EndUpdate;
      end;
    end;
    FList.Clear;
    FAbortThread := False;
  end;
end;

procedure TMainForm.UpdateTreeViewAll;
var
  I, J: Integer;
  ParentItem: array [0 .. MaxDepth] of TTreeNode;
  LNode: TTreeNode;
  Item: TOutlineItem;
begin
  TreeView.Items.BeginUpdate;
  try
    for I := 0 to High(ParentItem) do
      ParentItem[I] := nil;
    for I := 0 to FList.Count - 1 do
    begin
      if FAbortThread then
        Exit;
      Item := FList[I];
      if Item.Node <> nil then
      begin
        LNode := TreeView.Items.GetNode(Item.Node.ItemId);
        if LNode <> nil then
          LNode.Text := Item.LineStr;
      end
      else
      begin
        if ParentItem[Item.Level - 1] = nil then
          LNode := TreeView.Items.AddChild(nil, Item.LineStr)
        else
          LNode := TreeView.Items.AddChild(ParentItem[Item.Level - 1], Item.LineStr);
        with LNode do
        begin
          Data := Pointer(I);
          case FProp.DefaultLevel of
            dlCollapse:
              ;
            dlLevel2 .. dlLevel7:
              if Parent <> nil then
              begin
                if Parent.Level < Integer(FProp.DefaultLevel) then
                  Parent.Expand(False)
                else
                  Parent.Collapse(False);
              end;
          else
            if Parent <> nil then
              Parent.Expand(False);
          end;
        end;
        Item.Node := LNode;
      end;
      for J := Item.Level to MaxDepth do
        ParentItem[J] := Item.Node;
    end;
    TreeView.Selected := TreeView.Items.GetFirstNode;
  finally
    TreeView.Items.EndUpdate;
    UpdateTreeViewSel;
  end;
end;

procedure TMainForm.OutlineAll;
var
  I, Len: Integer;
  LList: TOutlineList;
  Text: array [0 .. MaxLineLength - 1] of Char;
  LineInfo: TGetLineInfo;
  OldLine, EmptyLine: Integer;
  Level, NewLevel: Integer;
  ApplyBefore: Boolean;
  CustomBarLevel: Integer;
  Line, Temp: Integer;
  UpdateAll: Boolean;
  FirstUpdate: Integer;
  Src, Dest: Integer;
  LNode: TTreeNode;
  LItem: TOutlineItem;
  LUpdating: Boolean;
begin
  LList := TOutlineList.Create;
  try
    Len := Editor_GetLines(FEditor, POS_LOGICAL);
    OldLine := -1;
    EmptyLine := -1;
    Level := 0;
    LineInfo.flags := FLAG_LOGICAL;
    LineInfo.cch := Length(Text);
    for I := 0 to Len - 1 do
    begin
      if FAbortThread then
        Break;
      LineInfo.yLine := I;
      Text[0] := #0;
      Editor_GetLine(FEditor, @LineInfo, Text);
      if FProp.Comments and IsCommentLine(LineInfo.yLine, Text) then
        Continue;
      CustomBarLevel := 0;
      NewLevel := CalcIndent(Text, Level, ApplyBefore, CustomBarLevel);
      if NewLevel < 0 then
        NewLevel := 0;
      if (Text[0] = #0) and (EmptyLine = -1) then
        EmptyLine := LineInfo.yLine;
      if (FProp.IndentType = IndentSpaces) or (FProp.IndentType = IndentBraces) or (FProp.IndentType = IndentBrackets) or (FProp.IndentType = IndentCustomBeginEnd) then
      begin
        if NewLevel <= FProp.ViewLevel then
        begin
          if (NewLevel > Level) and (NewLevel > 0) then
          begin
            if (not ApplyBefore) and (Integer(LineInfo.yLine) > 0) and (OldLine <> Integer(LineInfo.yLine) - 1) then
            begin
              if (EmptyLine <> -1) and (EmptyLine > 0) and (Text[0] <> #0) then
                Line := EmptyLine - 1
              else
                Line := LineInfo.yLine - 1;
              Text[0] := #0;
              Temp := LineInfo.yLine;
              LineInfo.yLine := Line;
              Editor_GetLine(FEditor, @LineInfo, Text);
              LineInfo.yLine := Temp;
            end
            else
              Line := LineInfo.yLine;
            LList.Add(TOutlineItem.Create(Line, Min(NewLevel, MaxDepth), Text));
            OldLine := Line;
          end;
        end;
      end
      else if CustomBarLevel > 0 then
      begin
        if CustomBarLevel <= FProp.ViewLevel then
          LList.Add(TOutlineItem.Create(LineInfo.yLine, Min(CustomBarLevel, MaxDepth), Text));
      end;
      Level := NewLevel;
      if Text[0] <> #0 then
        EmptyLine := -1;
    end;
    if FAbortThread then
      Exit;
    LUpdating := False;
    try
      UpdateAll := False;
      FirstUpdate := FList.Count;
      if FList.Count = 0 then
      begin
        FirstUpdate := -1;
        UpdateAll := True;
        with TreeView.Items do
        begin
          BeginUpdate;
          try
            Clear;
          finally
            EndUpdate;
          end;
        end;
      end
      else
      begin
        for I := 0 to Min(FList.Count, LList.Count) - 1 do
        begin
          if FAbortThread then
            Exit;
          if FList[I].Level <> LList[I].Level then
          begin
            if not UpdateAll then
            begin
              FirstUpdate := I;
              UpdateAll := True;
            end;
          end;
          if UpdateAll then
          begin
            if not LUpdating then
            begin
              TreeView.Items.BeginUpdate;
              LUpdating := True;
            end;
            while True do
            begin
              if FList[I].Node = nil then
                Break;
              LNode := FList[I].Node.GetNext;
              if LNode = nil then
                Break;
              LNode.Delete;
            end;
            if FList[I].Node <> nil then
              FList[I].Node.Delete;
            Break;
          end;
        end;
      end;
      Src := 0;
      Dest := 0;
      for I := 0 to Min(FirstUpdate, LList.Count) - 1 do
      begin
        with FList[I] do
        begin
          LineNum := LList[I].LineNum;
          Level := LList[I].Level;
          LineStr := LList[I].LineStr;
        end;
        Inc(Src);
        Inc(Dest);
      end;
      if InRange(Dest, 0, FList.Count - 1) then
      begin
        if not UpdateAll then
          UpdateAll := True;
        if not LUpdating then
        begin
          TreeView.Items.BeginUpdate;
          LUpdating := True;
        end;
        while True do
        begin
          if FList[Dest].Node = nil then
            Break;
          LNode := FList[Dest].Node.GetNext;
          if LNode = nil then
            Break;
          LNode.Delete;
        end;
        if FList[Dest].Node <> nil then
          FList[Dest].Node.Delete;
        for I := FList.Count - 1 downto Dest do
        begin
          LItem := FList[I];
          FList.Remove(LItem);
          LItem.Free;
        end;
      end;
      if InRange(Src, 0, LList.Count - 1) then
      begin
        for I := Src to LList.Count - 1 do
        begin
          if not UpdateAll then
            UpdateAll := True;
          with LList[I] do
          begin
            LItem := TOutlineItem.Create(LineNum, Level, LineStr);
            LItem.Node := Node;
          end;
          FList.Add(LItem);
        end;
      end;
      if FAbortThread then
        Exit;
      if UpdateAll then
        UpdateTreeViewAll
      else
        UpdateTreeViewString;
    finally
      if LUpdating then
        TreeView.Items.EndUpdate;
    end;
  finally
    LList.Free;
  end;
end;

procedure TMainForm.UpdateTreeViewSel;
var
  I: Integer;
  CurrentLine: Integer;
begin
  if FList.Count = 0 then
    Exit;
  CurrentLine := GetCurrentLine;
  I := 0;
  while I < FList.Count do
  begin
    if CurrentLine = FList[I].LineNum then
      Break
    else if FList[I].LineNum > CurrentLine then
    begin
      Dec(I);
      Break;
    end;
    Inc(I);
  end;
  if I < 0 then
    I := 0;
  if I > FList.Count - 1 then
    I := FList.Count - 1;
  if FList[I].Node <> nil then
    FList[I].Node.Selected := True;
end;

procedure TMainForm.TreeCopy(Node: TTreeNode);
begin
  if Node = nil then
    Node := TreeView.Selected;
  if Node <> nil then
    Clipboard.AsText := Node.Text;
end;

procedure TMainForm.TreeMove(Node: TTreeNode; Down: Boolean);
begin
  if WaitMessageLoop(1, FMutex, INFINITE) <> 0 then
    Exit;
  if Node = nil then
    Node := TreeView.Selected;
  if Node <> nil then
    TreeMoveSub(Node, Down);
  ReleaseMutex(FMutex);
end;

procedure TMainForm.SetFont;
var
  LName: array [0 .. 255] of Char;
  LSize, LHeight: Integer;
  LFore, LBack: TColor;
  LDarkMode: TDarkMode;
  LFont: TLogFont;
  LStyle: NativeInt;
begin
  Editor_Info(FEditor, MI_GET_FONT_NAME, LPARAM(@LName));
  LSize := Editor_Info(FEditor, MI_GET_FONT_SIZE, 0);
  LHeight := Editor_Info(FEditor, MI_GET_FONT_HEIGHT, 0);
  LFore := TColor(Editor_Info(FEditor, MI_GET_TEXT_COLOR, COLOR_GENERAL));
  LBack := TColor(Editor_Info(FEditor, MI_GET_BACK_COLOR, COLOR_GENERAL));
  if Editor_Info(FEditor, MI_GET_INVERT_COLOR, 0) = 1 then
  begin
    LFore := GetInvertColor(LFore);
    LBack := GetInvertColor(LBack);
  end;
  if not CheckBright then
  begin
    LDarkMode := TDarkMode(Editor_Info(FEditor, MI_GET_DARK_MODE, 0));
    if IsDarkModeSupported and (LDarkMode <> FDarkMode) then
    begin
      FDarkMode := LDarkMode;
      if not DarkModeAvailable then
        DarkModeAvailable := InitDarkModeLibrary;
      if DarkModeSupported then
      begin
        UpdateDarkModeEnabled;
        SendMessage(Handle, WM_THEMECHANGED, 0, 0);
      end;
    end;
  end;
  UseMica := TSystemBackdrop(Editor_Info(FEditor, MI_GET_USE_MICA, 0)) <> sbNone;
  with TreeView do
  begin
    if UseMica then
    begin
      LStyle := GetWindowLong(Handle, GWL_EXSTYLE);
      if (LStyle and WS_EX_COMPOSITED) = 0 then
        SetWindowLong(Handle, GWL_EXSTYLE, LStyle or WS_EX_COMPOSITED);
      if not UseDarkMode then
        SetWindowTheme(Handle, 'Explorer', nil);
    end
    else
    begin
      LStyle := GetWindowLong(Handle, GWL_EXSTYLE);
      if (LStyle and WS_EX_COMPOSITED) <> 0 then
        SetWindowLong(Handle, GWL_EXSTYLE, LStyle and (not WS_EX_COMPOSITED));
    end;
    with Font do
    begin
      Name := IfThen(FFontName <> '', FFontName, LName);
      if FFontSize <> 0 then
        Size := FFontSize
      else
      begin
        if LHeight <> 0 then
          Height := LHeight
        else
          Size := LSize;
      end;
      Height := MulDiv(Height, FPixelsPerInch, USER_DEFAULT_SCREEN_DPI);
      case FTextSize of
        tsSmallest:
          Height := Round(Height * 0.75);
        tsSmaller:
          Height := Round(Height * 0.888);
        tsLarger:
          Height := Round(Height * 1.2);
        tsLargest:
          Height := Round(Height * 1.5);
      end;
      Color := IfThen(FForeColor <> clNone, FForeColor, LFore);
      GetObject(Font.Handle, SizeOf(TLogFont), @LFont);
      LFont.lfWeight := FW_DONTCARE;
      LFont.lfItalic := 0;
      Handle := CreateFontIndirect(LFont);
    end;
    Color := IfThen(FBackColor <> clNone, FBackColor, LBack);
  end;
end;

procedure TMainForm.TreeGoToNode(Down, Center: Boolean);
var
  LNode: TTreeNode;
  LPos: TPoint;
  LIndex: Integer;
begin
  if FList.Count = 0 then
    Exit;
  LNode := TreeView.Selected;
  if LNode <> nil then
  begin
    Editor_GetCaretPos(FEditor, POS_LOGICAL, @LPos);
    if Down then
    begin
      if LPos.Y >= FList[0].LineNum then
        LNode := LNode.GetNext;
    end
    else
    begin
      if LPos.Y <= FList[0].LineNum then
        Exit;
      if LPos.Y <= FList[FList.Count - 1].LineNum then
      begin
        LIndex := NativeInt(LNode.Data);
        if not InRange(LIndex, 0, FList.Count - 1) then
          Exit;
        if LPos.Y = FList[LIndex].LineNum then
          LNode := LNode.GetPrev;
      end;
    end;
    if LNode <> nil then
    begin
      TreeView.Selected := LNode;
      OutlineSelected(LNode, True, False, False, Center);
    end;
  end;
end;

procedure TMainForm.SetScale(const Value: Integer);
var
  P: Integer;
begin
  P := FPixelsPerInch;
  FPixelsPerInch := Value;
  with Font do
    Height := MulDiv(Height, FPixelsPerInch, P);
  SetFont;
end;

procedure TMainForm.SetAppMode;
begin
  if not CheckBright then
  begin
    UpdateDarkModeEnabled;
    SendMessage(Handle, WM_THEMECHANGED, 0, 0);
  end;
  SetFont;
end;

procedure TMainForm.UpdateTreeViewString;
var
  I: Integer;
  LNode: TTreeNode;
begin
  for I := 0 to FList.Count - 1 do
    if FList[I].Node <> nil then
    begin
      LNode := TreeView.Items.GetNode(FList[I].Node.ItemId);
      if LNode <> nil then
        LNode.Text := FList[I].LineStr;
    end;
  UpdateTreeViewSel;
end;

function TMainForm.SetProperties: Boolean;
var
  S, P: PChar;
  Len: Cardinal;
  Item: TPropItem;
  Items: TPropItems;
begin
  Result := False;
  Items := TPropItems.Create;
  try
    Len := Editor_EnumMode(FEditor, nil, 0);
    S := StrAlloc(Len);
    try
      Editor_EnumMode(FEditor, S, Len);
      P := S;
      while P^ <> #0 do
      begin
        with Items.Add do
          ReadIni(Prop, P);
        Inc(P, StrLen(P) + 1);
      end;
    finally
      StrDispose(S);
    end;
    if Prop(Self, FBarPos, FAltGoToNode, Items, FProp) then
    begin
      EraseSection;
      for Item in Items do
        WriteIni(Item.Prop);
      WriteIni;
      ReadIni;
      FUpdateOutline := True;
      Result := True;
    end;
  finally
    FreeAndNil(Items);
  end;
end;

end.
