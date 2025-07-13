object PropForm: TPropForm
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = #12450#12454#12488#12521#12452#12531
  ClientHeight = 441
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object BarPosLabel: TLabel
    Left = 8
    Top = 12
    Width = 72
    Height = 13
    Caption = #12496#12540#12398#20301#32622'(&P):'
    FocusControl = BarPosComboBox
  end
  object IndentTypeLabel: TLabel
    Left = 8
    Top = 100
    Width = 44
    Height = 13
    Caption = #12479#12452#12503'(&T):'
    FocusControl = IndentTypeComboBox
  end
  object LevelLabel1: TLabel
    Left = 8
    Top = 148
    Width = 10
    Height = 13
    Caption = '&1:'
    FocusControl = MatchEdit1
  end
  object LevelLabel2: TLabel
    Left = 8
    Top = 172
    Width = 10
    Height = 13
    Caption = '&2:'
    FocusControl = MatchEdit2
  end
  object LevelLabel3: TLabel
    Left = 8
    Top = 196
    Width = 10
    Height = 13
    Caption = '&3:'
    FocusControl = MatchEdit3
  end
  object LevelLabel4: TLabel
    Left = 8
    Top = 220
    Width = 10
    Height = 13
    Caption = '&4:'
    FocusControl = MatchEdit4
  end
  object LevelLabel5: TLabel
    Left = 8
    Top = 244
    Width = 10
    Height = 13
    Caption = '&5:'
    FocusControl = MatchEdit5
  end
  object LevelLabel6: TLabel
    Left = 8
    Top = 268
    Width = 10
    Height = 13
    Caption = '&6:'
    FocusControl = MatchEdit6
  end
  object LevelLabel7: TLabel
    Left = 8
    Top = 292
    Width = 10
    Height = 13
    Caption = '&7:'
    FocusControl = MatchEdit7
  end
  object LevelLabel8: TLabel
    Left = 8
    Top = 316
    Width = 10
    Height = 13
    Caption = '&8:'
    FocusControl = MatchEdit8
  end
  object ViewLevelLabel: TLabel
    Left = 216
    Top = 76
    Width = 72
    Height = 13
    Caption = #26368#22823#12524#12505#12523'(&A):'
    FocusControl = ViewLevelComboBox
  end
  object DefaultLevelLabel: TLabel
    Left = 216
    Top = 100
    Width = 72
    Height = 13
    Caption = #26082#23450#12524#12505#12523'(&D):'
    FocusControl = DefaultLevelComboBox
  end
  object ModeLabel: TLabel
    Left = 8
    Top = 76
    Width = 72
    Height = 13
    Caption = #32232#38598#12514#12540#12489'(&M):'
    FocusControl = ModeComboBox
  end
  object LevelLabel: TLabel
    Left = 8
    Top = 128
    Width = 29
    Height = 13
    Caption = #12524#12505#12523
  end
  object MatchLabel: TLabel
    Left = 48
    Top = 128
    Width = 24
    Height = 13
    Caption = #26908#32034
  end
  object RegExLabel: TLabel
    Left = 208
    Top = 128
    Width = 48
    Height = 13
    Caption = #27491#35215#34920#29694
  end
  object ReplaceLabel: TLabel
    Left = 264
    Top = 128
    Width = 24
    Height = 13
    Caption = #32622#25563
  end
  object Bevel1: TBevel
    Left = 0
    Top = 64
    Width = 425
    Height = 9
    Shape = bsTopLine
  end
  object Bevel2: TBevel
    Left = 0
    Top = 400
    Width = 425
    Height = 9
    Shape = bsTopLine
  end
  object BarPosComboBox: TComboBox
    Left = 88
    Top = 8
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      #24038
      #19978
      #21491
      #19979)
  end
  object AltGoToNodeCheckBox: TCheckBox
    Left = 8
    Top = 40
    Width = 409
    Height = 17
    Caption = 'Alt+Up/Down '#12391#21069'/'#27425#12398#12494#12540#12489#12408#31227#21205#12377#12427'(&G)'
    TabOrder = 1
  end
  object IndentTypeComboBox: TComboBox
    Left = 88
    Top = 96
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    OnChange = IndentTypeComboBoxChange
    Items.Strings = (
      #31354#30333#12398#25968
      #25324#24359' { } '#12398#25968
      #25324#24359' [ ] '#12398#25968
      #12459#12473#12479#12512
      #12459#12473#12479#12512' ('#38283#22987#12392#32066#20102')')
  end
  object MatchEdit1: TEdit
    Left = 48
    Top = 144
    Width = 153
    Height = 21
    TabOrder = 6
  end
  object RegExCheckBox1: TCheckBox
    Left = 224
    Top = 144
    Width = 17
    Height = 17
    TabOrder = 7
  end
  object MatchEdit2: TEdit
    Left = 48
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 9
  end
  object RegExCheckBox2: TCheckBox
    Left = 224
    Top = 168
    Width = 17
    Height = 17
    TabOrder = 10
  end
  object MatchEdit3: TEdit
    Left = 48
    Top = 192
    Width = 153
    Height = 21
    TabOrder = 12
  end
  object RegExCheckBox3: TCheckBox
    Left = 224
    Top = 192
    Width = 17
    Height = 17
    TabOrder = 13
  end
  object MatchEdit4: TEdit
    Left = 48
    Top = 216
    Width = 153
    Height = 21
    TabOrder = 15
  end
  object RegExCheckBox4: TCheckBox
    Left = 224
    Top = 216
    Width = 17
    Height = 17
    TabOrder = 16
  end
  object MatchEdit5: TEdit
    Left = 48
    Top = 240
    Width = 153
    Height = 21
    TabOrder = 18
  end
  object RegExCheckBox5: TCheckBox
    Left = 224
    Top = 240
    Width = 17
    Height = 17
    TabOrder = 19
  end
  object MatchEdit6: TEdit
    Left = 48
    Top = 264
    Width = 153
    Height = 21
    TabOrder = 21
  end
  object RegExCheckBox6: TCheckBox
    Left = 224
    Top = 264
    Width = 17
    Height = 17
    TabOrder = 22
  end
  object MatchEdit7: TEdit
    Left = 48
    Top = 288
    Width = 153
    Height = 21
    TabOrder = 24
  end
  object RegExCheckBox7: TCheckBox
    Left = 224
    Top = 288
    Width = 17
    Height = 17
    TabOrder = 25
  end
  object MatchEdit8: TEdit
    Left = 48
    Top = 312
    Width = 153
    Height = 21
    TabOrder = 27
  end
  object RegExCheckBox8: TCheckBox
    Left = 224
    Top = 312
    Width = 17
    Height = 17
    TabOrder = 28
  end
  object ViewLevelComboBox: TComboBox
    Left = 296
    Top = 72
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 4
    Items.Strings = (
      '1'
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      '8')
  end
  object DefaultLevelComboBox: TComboBox
    Left = 296
    Top = 96
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 5
    Items.Strings = (
      #12377#12409#12390#32302#23567
      '2'
      '3'
      '4'
      '5'
      '6'
      '7'
      #12377#12409#12390#23637#38283)
  end
  object ModeComboBox: TComboBox
    Left = 88
    Top = 72
    Width = 121
    Height = 21
    Style = csDropDownList
    DropDownCount = 32
    TabOrder = 2
    OnChange = ModeComboBoxChange
  end
  object ReplaceEdit1: TEdit
    Left = 264
    Top = 144
    Width = 153
    Height = 21
    TabOrder = 8
  end
  object ReplaceEdit2: TEdit
    Left = 264
    Top = 168
    Width = 153
    Height = 21
    TabOrder = 11
  end
  object ReplaceEdit3: TEdit
    Left = 264
    Top = 192
    Width = 153
    Height = 21
    TabOrder = 14
  end
  object ReplaceEdit4: TEdit
    Left = 264
    Top = 216
    Width = 153
    Height = 21
    TabOrder = 17
  end
  object ReplaceEdit5: TEdit
    Left = 264
    Top = 240
    Width = 153
    Height = 21
    TabOrder = 20
  end
  object ReplaceEdit6: TEdit
    Left = 264
    Top = 264
    Width = 153
    Height = 21
    TabOrder = 23
  end
  object ReplaceEdit7: TEdit
    Left = 264
    Top = 288
    Width = 153
    Height = 21
    TabOrder = 26
  end
  object ReplaceEdit8: TEdit
    Left = 264
    Top = 312
    Width = 153
    Height = 21
    TabOrder = 29
  end
  object CommentsCheckBox: TCheckBox
    Left = 8
    Top = 344
    Width = 409
    Height = 17
    Caption = #12467#12513#12531#12488#34892#12434#28961#35222#12377#12427'(&C)'
    TabOrder = 30
  end
  object ResetButton: TButton
    Left = 336
    Top = 368
    Width = 81
    Height = 25
    Caption = #12522#12475#12483#12488'(&R)'
    TabOrder = 31
    OnClick = ResetButtonClick
  end
  object OKButton: TButton
    Left = 248
    Top = 408
    Width = 81
    Height = 25
    Caption = 'OK'
    Default = True
    ModalResult = 1
    TabOrder = 32
  end
  object CancelButton: TButton
    Left = 336
    Top = 408
    Width = 81
    Height = 25
    Cancel = True
    Caption = #12461#12515#12531#12475#12523
    ModalResult = 2
    TabOrder = 33
  end
end
