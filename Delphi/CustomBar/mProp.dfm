object PropForm: TPropForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #12503#12525#12497#12486#12451
  ClientHeight = 105
  ClientWidth = 185
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object BarPosLabel: TLabel
    Left = 8
    Top = 8
    Width = 72
    Height = 13
    Caption = #12496#12540#12398#20301#32622'(&P):'
    FocusControl = BarPosComboBox
  end
  object Bevel: TBevel
    Left = 0
    Top = 56
    Width = 185
    Height = 9
    Shape = bsTopLine
  end
  object BarPosComboBox: TComboBox
    Left = 8
    Top = 24
    Width = 129
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      #24038
      #19978
      #21491
      #19979)
  end
  object OKButton: TButton
    Left = 8
    Top = 72
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 1
  end
  object CancelButton: TButton
    Left = 96
    Top = 72
    Width = 81
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 2
  end
end
