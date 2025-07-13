// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mCommon;

{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, System.SysUtils, Vcl.Graphics;

const
  SAppName = 'Mery';

const
  shell32 = 'shell32.dll';

function FileExists2(const FileName: string): Boolean;
function DirectoryExists2(const Directory: string): Boolean;
function GetAppDataPath: string;
function GetAppIniFileName(var FileName: string): Boolean;
function ColorToHexString(AColor: TColor): string;
function HexStringToColor(const AStr: string): TColor;
function RGBStringToColor(const AStr: string): TColor;
function HSLStringToColor(const AStr: string): TColor;
function ParseColor(const AStr: string): TColor;
function GetInvertColor(Color: TColor): TColor;
function SHGetFolderPath(hwnd: HWND; csidl: Integer; hToken: THandle;
  dwFlags: DWORD; pszPath: LPWSTR): HResult; stdcall;

var
  FIniFailed: Boolean;

implementation

uses
  System.Types, System.StrUtils, Vcl.GraphUtil;

// -----------------------------------------------------------------------------
// ドライブ確認

function IsDriveReady(C: Char): Boolean;
var
  W: Word;
  LRec: TSearchRec;
begin
  if C = '\' then
  begin
    Result := True;
    Exit;
  end;
  C := CharUpper(PChar(string(C)))^;
  W := SetErrorMode(SEM_FAILCRITICALERRORS);
  try
    Result := DiskSize(Ord(C) - $40) <> -1;
    if Result and (GetDriveType(PChar(string(C + ':\'))) in [DRIVE_REMOTE, DRIVE_CDROM]) then
      try
        Result := FindFirst(C + ':\*.*', $3F, LRec) = 0;
      finally
        FindClose(LRec);
      end;
  finally
    SetErrorMode(W);
  end;
end;

// -----------------------------------------------------------------------------
// ファイル存在確認

function FileExists2(const FileName: string): Boolean;
begin
  if Length(FileName) = 0 then
    Result := False
  else
  begin
    if (ExpandFileName(FileName)[1] = '\') or
      IsDriveReady(ExpandFileName(FileName)[1]) then
      Result := FileExists(FileName)
    else
      Result := False;
  end;
end;

// -----------------------------------------------------------------------------
// ディレクトリ存在確認

function DirectoryExists2(const Directory: string): Boolean;
begin
  if Length(Directory) = 0 then
    Result := False
  else
  begin
    if (ExpandFileName(Directory)[1] = '\') or
      IsDriveReady(ExpandFileName(Directory)[1]) then
      Result := System.SysUtils.DirectoryExists(Directory)
    else
      Result := False;
  end;
end;

// -----------------------------------------------------------------------------
// アプリケーションデータパス取得

const
  CSIDL_APPDATA = $001A;

function GetAppDataPath: string;
var
  S: array [0 .. MAX_PATH] of Char;
begin
  SetLastError(ERROR_SUCCESS);
  if SHGetFolderPath(0, CSIDL_APPDATA, 0, 0, @S) = S_OK then
    Result := IncludeTrailingPathDelimiter(S);
end;

// -----------------------------------------------------------------------------
// アプリケーションINIファイル名取得

function GetAppIniFileName(var FileName: string): Boolean;
var
  S: string;
begin
  Result := False;
  if not FileExists2(ParamStr(0)) then
    Exit;
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if (not FileExists2(FileName)) and (not FileExists2(ExtractFilePath(ParamStr(0)) + 'MeryPortable.ini')) then
  begin
    S := SAppName;
    FileName := GetAppDataPath + S + '\' + ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini');
    System.SysUtils.ForceDirectories(ExtractFileDir(FileName));
  end;
  if FileName <> '' then
    Result := True;
end;

// -----------------------------------------------------------------------------
// 色を16進数カラーコードに変換

function ColorToHexString(AColor: TColor): string;
var
  LRGB: LongInt;
begin
  case AColor of
    clNone, clWindow, clWindowText, clHighlight:
      Result := '';
  else
    begin
      LRGB := ColorToRGB(AColor);
      Result := '#' + LowerCase(IntToHex(((LRGB and $0000FF) shl 16) or (LRGB and $00FF00) or ((LRGB and $FF0000) shr 16), 6));
    end;
  end;
end;

// -----------------------------------------------------------------------------
// 16進数カラーコードを色に変換

function HexStringToColor(const AStr: string): TColor;
var
  S: string;
  I: LongInt;
begin
  Result := clNone;
  if StartsStr('#', AStr) then
  begin
    S := AStr;
    Delete(S, 1, 1);
    case Length(S) of
      3:
        S := S[1] + S[1] + S[2] + S[2] + S[3] + S[3];
      6:
        ;
    else
      Exit;
    end;
    if TryStrToInt('$' + S, I) then
      Result := ((I and $FF0000) shr 16) or (I and $00FF00) or ((I and $0000FF) shl 16);
  end;
end;

// -----------------------------------------------------------------------------
// RGBカラーコードを色に変換

function RGBStringToColor(const AStr: string): TColor;
var
  S: string;
  R, G, B: Word;
  A: TStringDynArray;
begin
  Result := clNone;
  if StartsStr('rgb', AStr) then
  begin
    A := SplitString(AStr, ',');
    if Length(A) in [3, 4] then
    begin
      S := Trim(A[0]);
      if StartsStr('rgb(', S) then
        Delete(S, 1, 4)
      else if StartsStr('rgba(', S) then
        Delete(S, 1, 5)
      else
        Exit;
      R := StrToIntDef(Trim(S), 0);
      G := StrToIntDef(Trim(A[1]), 0);
      S := Trim(A[2]);
      if EndsStr(')', S) then
        Delete(S, Length(S), 1);
      B := StrToIntDef(Trim(S), 0);
      Result := RGB(R, G, B);
    end;
  end;
end;

// -----------------------------------------------------------------------------
// HSLカラーコードを色に変換

function HSLStringToColor(const AStr: string): TColor;
var
  T: string;
  H, S, L: Word;
  A: TStringDynArray;
begin
  Result := clNone;
  if StartsStr('hsl', AStr) then
  begin
    A := SplitString(AStr, ',');
    if Length(A) = 3 then
    begin
      T := Trim(A[0]);
      if StartsStr('hsl(', T) then
        Delete(T, 1, 4)
      else
        Exit;
      H := StrToIntDef(T, 0);
      T := Trim(A[1]);
      if EndsStr('%', T) then
        Delete(T, Length(T), 1)
      else
        Exit;
      S := StrToIntDef(Trim(T), 0);
      T := Trim(A[2]);
      if EndsStr(')', T) then
        Delete(T, Length(T), 1)
      else
        Exit;
      T := Trim(T);
      if EndsStr('%', T) then
        Delete(T, Length(T), 1)
      else
        Exit;
      L := StrToIntDef(Trim(T), 0);
      Result := ColorHLSToRGB(Trunc(H / 360 * 240), Trunc(L / 100 * 240), Trunc(S / 100 * 240));
    end;
  end;
end;

// -----------------------------------------------------------------------------
// カラーコードを解析

function ParseColor(const AStr: string): TColor;
begin
  Result := HexStringToColor(AStr);
  if Result = clNone then
    Result := RGBStringToColor(AStr);
  if Result = clNone then
    Result := HSLStringToColor(AStr);
  if Result = clNone then
    Result := clBlack;
end;

// -----------------------------------------------------------------------------
// 反転色取得

function GetInvertColor(Color: TColor): TColor;
begin
  if Color < 0 then
    Color := GetSysColor(Color and $FF);
  Result := Color xor $FFFFFF;
end;

function SHGetFolderPath; external shell32 name 'SHGetFolderPathW';

end.
