// -----------------------------------------------------------------------------
// Copyright (c) Kuro. All rights reserved.
// Licensed under the MIT License.
// -----------------------------------------------------------------------------

unit mCommon;

{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

const
  SAppName = 'Mery';

const
  shell32 = 'shell32.dll';

function FileExists2(const FileName: string): Boolean;
function GetAppDataPath: string;
function GetAppIniFileName(var FileName: string): Boolean;
function SHGetFolderPath(hwnd: HWND; csidl: Integer; hToken: THandle;
  dwFlags: DWORD; pszPath: LPWSTR): HResult; stdcall;

var
  FIniFailed: Boolean;

implementation

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
begin
  Result := False;
  if not FileExists2(ParamStr(0)) then
    Exit;
  FileName := ChangeFileExt(ParamStr(0), '.ini');
  if (not FileExists2(FileName)) and (not FileExists2(ExtractFilePath(ParamStr(0)) + 'MeryPortable.ini')) then
  begin
    FileName := GetAppDataPath + SAppName + '\' + ChangeFileExt(ExtractFileName(ParamStr(0)), '.ini');
    System.SysUtils.ForceDirectories(ExtractFileDir(FileName));
  end;
  if FileName <> '' then
    Result := True;
end;

function SHGetFolderPath; external shell32 name 'SHGetFolderPathW';

end.
