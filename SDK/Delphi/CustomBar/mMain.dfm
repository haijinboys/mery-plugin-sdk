object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'MainForm'
  ClientHeight = 338
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 0
    Top = 0
    Width = 651
    Height = 338
    Align = alClient
    PopupMenu = PopupMenu
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    Left = 8
    Top = 8
    object PropMenuItem: TMenuItem
      Caption = #12503#12525#12497#12486#12451'(&P)'
      OnClick = PropMenuItemClick
    end
  end
end
