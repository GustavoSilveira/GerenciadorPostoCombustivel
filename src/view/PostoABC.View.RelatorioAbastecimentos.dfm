object frmRelatorioAbastecimento: TfrmRelatorioAbastecimento
  Left = 0
  Top = 0
  Caption = 'Relatorio de Abastecimentos'
  ClientHeight = 454
  ClientWidth = 802
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 13
  object RLReport1: TRLReport
    Left = 0
    Top = 0
    Width = 794
    Height = 1123
    DataSource = dsAbastecimentos
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Title = 'Relat'#243'rio de Abastecimentos'
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 67
      BandType = btHeader
      object RLSystemInfo1: TRLSystemInfo
        Left = 341
        Top = 0
        Width = 36
        Height = 16
        Align = faCenterTop
        Info = itTitle
        Text = ''
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 283
        Top = 22
        Width = 146
        Height = 27
        Caption = 'POSTO ABC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -24
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        Transparent = False
      end
    end
    object RLGroup1: TRLGroup
      Left = 38
      Top = 105
      Width = 718
      Height = 232
      DataFields = 'DATA_ABASTECIMENTO'
      object RLBand2: TRLBand
        Left = 0
        Top = 0
        Width = 718
        Height = 51
        BandType = btHeader
        object RLLabel3: TRLLabel
          Left = 3
          Top = 0
          Width = 33
          Height = 16
          Align = faTopOnly
          Caption = 'Data'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
        object RLDBText1: TRLDBText
          Left = 50
          Top = 0
          Width = 87
          Height = 16
          DataField = 'DATA_ABASTECIMENTO'
          DataSource = dsAbastecimentos
          Text = ''
        end
        object RLLabel2: TRLLabel
          Left = 5
          Top = 24
          Width = 46
          Height = 16
          Caption = 'Tanque'
        end
        object RLLabel4: TRLLabel
          Left = 141
          Top = 22
          Width = 45
          Height = 16
          Caption = 'Bomba'
        end
        object RLLabel5: TRLLabel
          Left = 563
          Top = 22
          Width = 152
          Height = 16
          Caption = 'Valor total abastecimento'
        end
        object RLLabel6: TRLLabel
          Left = 461
          Top = 22
          Width = 84
          Height = 16
          Caption = 'Valor Imposto'
        end
        object RLDraw1: TRLDraw
          Left = 3
          Top = 34
          Width = 712
          Height = 17
          DrawKind = dkLine
        end
      end
      object RLBand3: TRLBand
        Left = 0
        Top = 51
        Width = 718
        Height = 16
        object RLDBTTanque: TRLDBText
          Left = 3
          Top = 1
          Width = 119
          Height = 14
          DataField = 'DESCRICAO_TANQUE'
          DataSource = dsAbastecimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBTBomba: TRLDBText
          Left = 143
          Top = 1
          Width = 115
          Height = 14
          DataField = 'DESCRICAO_BOMBA'
          DataSource = dsAbastecimentos
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
        object RLDBTValorAbastecimento: TRLDBText
          Left = 576
          Top = 1
          Width = 139
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_TOTAL'
          DataSource = dsAbastecimentos
          DisplayMask = 'R$#,##0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Text = ''
          BeforePrint = RLDBTValorAbastecimentoBeforePrint
        end
        object RLDBTImposto: TRLDBText
          Left = 447
          Top = 1
          Width = 98
          Height = 14
          Alignment = taRightJustify
          DataField = 'VALOR_IMPOSTO'
          DataSource = dsAbastecimentos
          DisplayMask = '#0.00'
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          Text = ''
        end
      end
      object RLBand4: TRLBand
        Left = 0
        Top = 67
        Width = 718
        Height = 62
        BandType = btFooter
        object RLDBResult2: TRLDBResult
          Left = 576
          Top = 6
          Width = 142
          Height = 16
          Alignment = taRightJustify
          DataFormula = 'VALOR_IMPOSTO'
          DataSource = dsAbastecimentos
          DisplayMask = '#.##0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult2BeforePrint
        end
        object RLLabel8: TRLLabel
          Left = 352
          Top = 6
          Width = 97
          Height = 16
          Caption = 'Total por data:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RLDBResult1: TRLDBResult
          Left = 450
          Top = 6
          Width = 96
          Height = 16
          Alignment = taRightJustify
          DataFormula = 'VALOR_TOTAL'
          DataSource = dsAbastecimentos
          DisplayMask = '#.##0,00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Info = riSum
          ParentFont = False
          Text = ''
          BeforePrint = RLDBResult2BeforePrint
        end
        object RLDraw2: TRLDraw
          Left = 376
          Top = -10
          Width = 339
          Height = 25
          DrawKind = dkLine
        end
      end
    end
    object RLBand5: TRLBand
      Left = 38
      Top = 337
      Width = 718
      Height = 62
      BandType = btSummary
      object RLDBResult3: TRLDBResult
        Left = 576
        Top = 6
        Width = 142
        Height = 16
        Alignment = taRightJustify
        DataFormula = 'VALOR_IMPOSTO'
        DataSource = dsAbastecimentos
        DisplayMask = '#.##0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        BeforePrint = RLDBResult2BeforePrint
      end
      object RLLabel7: TRLLabel
        Left = 331
        Top = 6
        Width = 113
        Height = 16
        Caption = 'Total do per'#237'odo:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RLDBResult4: TRLDBResult
        Left = 450
        Top = 6
        Width = 96
        Height = 16
        Alignment = taRightJustify
        DataFormula = 'VALOR_TOTAL'
        DataSource = dsAbastecimentos
        DisplayMask = '#.##0,00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        BeforePrint = RLDBResult2BeforePrint
      end
      object RLDraw3: TRLDraw
        Left = 0
        Top = -10
        Width = 715
        Height = 25
        DrawKind = dkLine
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 640
        Top = 49
        Width = 78
        Height = 10
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = []
        Info = itPageNumber
        ParentFont = False
        Text = 'P'#225'gina '
      end
      object RLSystemInfo3: TRLSystemInfo
        Left = 0
        Top = 48
        Width = 69
        Height = 11
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -8
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        Info = itFullDate
        ParentFont = False
        Text = 'Impresso '
      end
    end
  end
  object dsAbastecimentos: TDataSource
    Left = 216
    Top = 168
  end
end
