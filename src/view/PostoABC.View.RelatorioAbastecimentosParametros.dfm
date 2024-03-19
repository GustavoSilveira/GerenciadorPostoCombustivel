object frmRelatorioAbastecimentoParametros: TfrmRelatorioAbastecimentoParametros
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Emiss'#227'o de relat'#243'rio'
  ClientHeight = 126
  ClientWidth = 367
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  TextHeight = 13
  object Label6: TLabel
    Left = 194
    Top = 19
    Width = 40
    Height = 13
    Caption = 'Data fim'
  end
  object Label5: TLabel
    Left = 16
    Top = 19
    Width = 49
    Height = 13
    Caption = 'Data in'#237'cio'
  end
  object btnImprimir: TButton
    Left = 45
    Top = 93
    Width = 121
    Height = 25
    Caption = 'Imprimir'
    TabOrder = 0
    OnClick = btnImprimirClick
  end
  object DatePickerDataIni: TDatePicker
    Left = 16
    Top = 38
    Date = 45370.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
  end
  object DatePickerDataFim: TDatePicker
    Left = 194
    Top = 38
    Date = 45370.000000000000000000
    DateFormat = 'dd/mm/yyyy'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 2
  end
  object btnClose: TButton
    Left = 194
    Top = 93
    Width = 121
    Height = 25
    Caption = 'Sair'
    TabOrder = 3
    OnClick = btnCloseClick
  end
end
