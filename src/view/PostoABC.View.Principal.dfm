object frmAbastecimento: TfrmAbastecimento
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Registro de Abastecimento'
  ClientHeight = 507
  ClientWidth = 818
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 128
    Top = 135
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Valor R$ desejado:'
  end
  object Label2: TLabel
    Left = 128
    Top = 91
    Width = 98
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Litros desejados:'
  end
  object Label4: TLabel
    Left = 99
    Top = 35
    Width = 154
    Height = 13
    Alignment = taRightJustify
    AutoSize = False
    Caption = 'Selecione o Tanque / Bomba:'
  end
  object Label3: TLabel
    Left = 8
    Top = 232
    Width = 133
    Height = 13
    Caption = 'Hist'#243'rico de abastecimento:'
  end
  object Label5: TLabel
    Left = 184
    Top = 113
    Width = 12
    Height = 13
    Caption = 'ou'
  end
  object btnBombas: TButton
    Left = 683
    Top = 77
    Width = 121
    Height = 25
    Caption = 'Bombas'
    TabOrder = 3
    OnClick = btnBombasClick
  end
  object btnTanques: TButton
    Left = 683
    Top = 46
    Width = 121
    Height = 25
    Caption = 'Tanques'
    TabOrder = 5
    OnClick = btnTanquesClick
  end
  object edtValor: TEdit
    Left = 232
    Top = 133
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '0,00'
    OnChange = edtValorChange
  end
  object edtQuantidade: TEdit
    Left = 232
    Top = 91
    Width = 121
    Height = 21
    TabOrder = 2
    Text = '0,00'
    OnChange = edtQuantidadeChange
  end
  object DBLkpTanqueBomba: TDBLookupComboBox
    Left = 259
    Top = 32
    Width = 254
    Height = 21
    KeyField = 'ID'
    ListField = 'TANQUE_BOMBA'
    ListSource = dsBomba
    TabOrder = 0
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 251
    Width = 818
    Height = 256
    Align = alBottom
    DataSource = dsAbastecimento
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'DATA_ABASTECIMENTO'
        Title.Caption = 'Data Abastecimento'
        Width = 207
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_TANQUE'
        Title.Caption = 'Tanque'
        Width = 121
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'DESCRICAO_BOMBA'
        Title.Caption = 'Bomba'
        Width = 62
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_LITRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Litro'
        Width = 68
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'QUANTIDADE_LITROS'
        Title.Alignment = taRightJustify
        Title.Caption = 'Quantidade Litros'
        Width = 101
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_IMPOSTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor imposto'
        Width = 99
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_ABASTECIMENTO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Total'
        Width = 91
        Visible = True
      end>
  end
  object btnAbastecer: TButton
    Left = 295
    Top = 212
    Width = 154
    Height = 25
    Caption = 'Registrar o abastecimento'
    TabOrder = 4
    OnClick = btnAbastecerClick
  end
  object btnRelatorio: TButton
    Left = 683
    Top = 108
    Width = 121
    Height = 25
    Caption = 'Relat'#243'rio'
    TabOrder = 7
    OnClick = btnRelatorioClick
  end
  object btnClose: TButton
    Left = 683
    Top = 212
    Width = 121
    Height = 25
    Caption = 'Sair'
    TabOrder = 8
    OnClick = btnCloseClick
  end
  object btnCalcularLitros: TButton
    Left = 359
    Top = 89
    Width = 74
    Height = 63
    Caption = 'Calcular'
    TabOrder = 9
    OnClick = btnCalcularLitrosClick
  end
  object btnLimpar: TButton
    Left = 439
    Top = 89
    Width = 74
    Height = 63
    Caption = 'Limpar'
    TabOrder = 10
    OnClick = btnLimparClick
  end
  object btnRemover: TButton
    Left = 472
    Top = 212
    Width = 73
    Height = 25
    Caption = 'Remover'
    TabOrder = 11
    OnClick = btnRemoverClick
  end
  object dsBomba: TDataSource
    OnDataChange = dsBombaDataChange
    Left = 424
    Top = 328
  end
  object dsAbastecimento: TDataSource
    Left = 424
    Top = 392
  end
end
