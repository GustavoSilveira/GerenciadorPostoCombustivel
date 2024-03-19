object frmBombas: TfrmBombas
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Cadastro de Bombas'
  ClientHeight = 351
  ClientWidth = 595
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 27
    Top = 46
    Width = 54
    Height = 13
    Caption = 'Nr. Bomba:'
  end
  object Label2: TLabel
    Left = 41
    Top = 16
    Width = 40
    Height = 13
    Caption = 'Tanque:'
  end
  object Label3: TLabel
    Left = 8
    Top = 125
    Width = 141
    Height = 13
    Caption = 'Selecione um registro abaixo:'
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 144
    Width = 595
    Height = 207
    Align = alBottom
    DataSource = dsBombas
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
        Width = 196
        Visible = True
      end
      item
        Alignment = taCenter
        Expanded = False
        FieldName = 'NUMERO_BOMBA'
        Title.Alignment = taCenter
        Title.Caption = 'Nr. Bomba'
        Width = 83
        Visible = True
      end>
  end
  object btnGet: TButton
    Left = 14
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Listar'
    TabOrder = 2
    OnClick = btnGetClick
  end
  object btnInsert: TButton
    Left = 213
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Inserir'
    Enabled = False
    TabOrder = 4
    OnClick = btnInsertClick
  end
  object btnUpdate: TButton
    Left = 295
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Atualizar'
    Enabled = False
    TabOrder = 5
    OnClick = btnUpdateClick
  end
  object btnDelete: TButton
    Left = 376
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Deletar'
    Enabled = False
    TabOrder = 6
    OnClick = btnDeleteClick
  end
  object btnClose: TButton
    Left = 496
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 7
    OnClick = btnCloseClick
  end
  object DBLkpTanque: TDBLookupComboBox
    Left = 87
    Top = 16
    Width = 187
    Height = 21
    Enabled = False
    KeyField = 'ID'
    ListField = 'DESCRICAO'
    ListSource = dsTanques
    TabOrder = 0
  end
  object edtNumeroBomba: TSpinEdit
    Left = 87
    Top = 43
    Width = 48
    Height = 22
    Enabled = False
    MaxValue = 100
    MinValue = 0
    TabOrder = 1
    Value = 0
  end
  object btnNovo: TButton
    Left = 132
    Top = 82
    Width = 75
    Height = 25
    Caption = 'Novo'
    TabOrder = 3
    OnClick = btnNovoClick
  end
  object dsBombas: TDataSource
    Left = 216
    Top = 240
  end
  object dsTanques: TDataSource
    Left = 216
    Top = 176
  end
end
