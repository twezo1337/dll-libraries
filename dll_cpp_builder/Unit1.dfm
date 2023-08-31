object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 329
  ClientWidth = 651
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 201
    Height = 25
    Caption = 'dll_sample_cpp'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 223
    Top = 8
    Width = 201
    Height = 25
    Caption = 'dll_sample_lazarus'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 442
    Top = 8
    Width = 201
    Height = 25
    Caption = 'dll_sample_cpp_builder'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Memo1: TMemo
    Left = 8
    Top = 39
    Width = 635
    Height = 282
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
end
