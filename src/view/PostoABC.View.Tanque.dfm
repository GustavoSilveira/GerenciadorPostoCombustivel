object frmTanques: TfrmTanques
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Tanques'
  ClientHeight = 312
  ClientWidth = 593
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 26
    Top = 11
    Width = 40
    Height = 13
    Caption = 'Tanque:'
  end
  object Label2: TLabel
    Left = 14
    Top = 38
    Width = 52
    Height = 13
    Caption = 'Valor Litro:'
  end
  object Label3: TLabel
    Left = 8
    Top = 125
    Width = 141
    Height = 13
    Caption = 'Selecione um registro abaixo:'
  end
  object edtValorLitro: TEdit
    Left = 72
    Top = 35
    Width = 121
    Height = 21
    Enabled = False
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 144
    Width = 593
    Height = 168
    Align = alBottom
    DataSource = dsTanques
    ReadOnly = True
    TabOrder = 8
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGrid1CellClick
    Columns = <
      item
        Expanded = False
        FieldName = 'DESCRICAO'
        Title.Caption = 'Tanque'
        Width = 121
        Visible = True
      end
      item
        Alignment = taRightJustify
        Expanded = False
        FieldName = 'VALOR_LITRO'
        Title.Alignment = taRightJustify
        Title.Caption = 'Valor Litro'
        Width = 90
        Visible = True
      end>
  end
  object btnGet: TButton
    Left = 8
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 2
    OnClick = btnGetClick
  end
  object btnInsert: TButton
    Left = 214
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Inserir'
    Enabled = False
    TabOrder = 4
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 296
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    Enabled = False
    TabOrder = 5
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 377
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Deletar'
    Enabled = False
    TabOrder = 6
    OnClick = btnDeleteClick
  end
  object btnClose: TButton
    Left = 510
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
    OnClick = btnCloseClick
  end
  object edtTanqueDescricao: TEdit
    Left = 72
    Top = 8
    Width = 121
    Height = 21
    Hint = 'Informe ex: Gasolina, '#211'leo de diesel ou etc.'
    CharCase = ecUpperCase
    Enabled = False
    MaxLength = 50
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
    TextHint = 'Informe a descri'#231#227'o do tanque.'
  end
  object btnNovo: TButton
    Left = 133
    Top = 75
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object dsTanques: TDataSource
    Left = 232
    Top = 224
  end
end
