object Note: TNote
  AlignWithMargins = True
  Left = 0
  Top = 0
  AutoSize = True
  Caption = 'Note'
  ClientHeight = 593
  ClientWidth = 1065
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object screen: TPanel
    Left = 0
    Top = 0
    Width = 1065
    Height = 593
    Caption = 'screen'
    TabOrder = 0
    object Panel1: TPanel
      Left = 0
      Top = 1
      Width = 1065
      Height = 41
      Color = clTeal
      ParentBackground = False
      TabOrder = 0
      object ToolBar1: TToolBar
        AlignWithMargins = True
        Left = 4
        Top = 4
        Width = 1057
        Height = 37
        ButtonHeight = 21
        ButtonWidth = 62
        Caption = 'ToolBar1'
        Ctl3D = False
        List = True
        ShowCaptions = True
        TabOrder = 0
        Transparent = True
        Wrapable = False
        object file_button: TToolButton
          AlignWithMargins = True
          Left = 0
          Top = 0
          Caption = 'File'
          ImageIndex = 3
          OnClick = file_buttonClick
        end
        object edit_button: TToolButton
          AlignWithMargins = True
          Left = 62
          Top = 0
          Caption = 'Modifica'
          ImageIndex = 1
          OnClick = edit_buttonClick
        end
        object view_button: TToolButton
          Left = 124
          Top = 0
          Caption = 'Visualizza'
          ImageIndex = 2
        end
      end
    end
    object text: TMemo
      AlignWithMargins = True
      Left = 0
      Top = 48
      Width = 1065
      Height = 545
      Lines.Strings = (
        'text')
      ScrollBars = ssBoth
      TabOrder = 1
    end
  end
  object file_popup_menu: TPopupMenu
    Left = 320
    Top = 200
    object NuovaSched1: TMenuItem
      Caption = 'Nuova Scheda'
    end
    object open_file_button: TMenuItem
      Caption = 'Apri'
      OnClick = open_file_buttonClick
    end
    object save_as_button: TMenuItem
      Caption = 'Salva con Nome'
      OnClick = save_as_buttonClick
    end
  end
  object ActionList1: TActionList
    Left = 656
    Top = 320
  end
  object edit_popup_menu: TPopupMenu
    Left = 776
    Top = 368
    object rova1: TMenuItem
      Caption = 'Trova'
      OnClick = rova1Click
    end
  end
end
