object MainForm: TMainForm
  Left = 0
  Top = 0
  ActiveControl = TreeView
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
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object TreeView: TTreeView
    Left = 0
    Top = 0
    Width = 651
    Height = 338
    Align = alClient
    HideSelection = False
    Indent = 19
    PopupMenu = PopupMenu
    ReadOnly = True
    RightClickSelect = True
    TabOrder = 0
    Touch.InteractiveGestureOptions = [igoPanSingleFingerVertical, igoPanInertia, igoPanGutter, igoParentPassthrough]
    OnClick = TreeViewClick
    OnDblClick = TreeViewDblClick
    OnDragDrop = TreeViewDragDrop
    OnDragOver = TreeViewDragOver
    OnEndDrag = TreeViewEndDrag
    OnExpanded = TreeViewExpanded
    OnKeyUp = TreeViewKeyUp
    OnMouseDown = TreeViewMouseDown
  end
  object PopupMenu: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = PopupMenuPopup
    Left = 8
    Top = 8
    object CopyMenuItem: TMenuItem
      Caption = #12467#12500#12540'(&O)'
      ShortCut = 16451
      OnClick = CopyMenuItemClick
    end
    object CopyAllMenuItem: TMenuItem
      Caption = #12377#12409#12390#12467#12500#12540'(&A)'
      OnClick = CopyAllMenuItemClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object GoMenuItem: TMenuItem
      Caption = #31227#21205'(&G)'
      OnClick = GoMenuItemClick
    end
    object SelectMenuItem: TMenuItem
      Caption = #36984#25246'(&S)'
      OnClick = SelectMenuItemClick
    end
    object N2: TMenuItem
      Caption = '-'
    end
    object MoveUpMenuItem: TMenuItem
      Caption = #19978#12408#31227#21205'(&U)'
      ShortCut = 32806
      OnClick = MoveUpMenuItemClick
    end
    object MoveDownMenuItem: TMenuItem
      Caption = #19979#12408#31227#21205'(&D)'
      ShortCut = 32808
      OnClick = MoveDownMenuItemClick
    end
    object N3: TMenuItem
      Caption = '-'
    end
    object CollapseAllMenuItem: TMenuItem
      Caption = #12377#12409#12390#32302#23567'(&C)'
      ShortCut = 32817
      OnClick = CollapseAllMenuItemClick
    end
    object Level2MenuItem: TMenuItem
      Tag = 1
      Caption = #12524#12505#12523' 2(&2)'
      ShortCut = 32818
      OnClick = Level2MenuItemClick
    end
    object Level3MenuItem: TMenuItem
      Tag = 2
      Caption = #12524#12505#12523' 3(&3)'
      ShortCut = 32819
      OnClick = Level2MenuItemClick
    end
    object Level4MenuItem: TMenuItem
      Tag = 3
      Caption = #12524#12505#12523' 4(&4)'
      ShortCut = 32820
      OnClick = Level2MenuItemClick
    end
    object Level5MenuItem: TMenuItem
      Tag = 4
      Caption = #12524#12505#12523' 5(&5)'
      ShortCut = 32821
      OnClick = Level2MenuItemClick
    end
    object Level6MenuItem: TMenuItem
      Tag = 5
      Caption = #12524#12505#12523' 6(&6)'
      ShortCut = 32822
      OnClick = Level2MenuItemClick
    end
    object Level7MenuItem: TMenuItem
      Tag = 6
      Caption = #12524#12505#12523' 7(&7)'
      ShortCut = 32823
      OnClick = Level2MenuItemClick
    end
    object ExpandAllMenuItem: TMenuItem
      Caption = #12377#12409#12390#23637#38283'(&E)'
      ShortCut = 32824
      OnClick = ExpandAllMenuItemClick
    end
    object N4: TMenuItem
      Caption = '-'
    end
    object TextSizeMenuItem: TMenuItem
      Caption = #25991#23383#12398#12469#12452#12474'(&X)'
      object TextSizeLargestMenuItem: TMenuItem
        Caption = #26368#22823'(&G)'
        OnClick = TextSizeLargestMenuItemClick
      end
      object TextSizeLargerMenuItem: TMenuItem
        Caption = #22823'(&L)'
        OnClick = TextSizeLargestMenuItemClick
      end
      object TextSizeMediumMenuItem: TMenuItem
        Caption = #20013'(&M)'
        OnClick = TextSizeLargestMenuItemClick
      end
      object TextSizeSmallerMenuItem: TMenuItem
        Caption = #23567'(&S)'
        OnClick = TextSizeLargestMenuItemClick
      end
      object TextSizeSmallestMenuItem: TMenuItem
        Caption = #26368#23567'(&A)'
        OnClick = TextSizeLargestMenuItemClick
      end
    end
    object N5: TMenuItem
      Caption = '-'
    end
    object PropPopupMenuItem: TMenuItem
      Caption = #12503#12525#12497#12486#12451'(&P)'
      OnClick = PropPopupMenuItemClick
    end
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 40
    Top = 8
  end
end
