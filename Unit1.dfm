object formMain: TformMain
  Left = 369
  Top = 195
  Width = 585
  Height = 500
  Caption = 'Uploading files via HTTP by Eli'#233'zer Pimentel'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Arial'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 14
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 233
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 8
      Top = 144
      Width = 331
      Height = 14
      Caption = 
        'URL (Escreva a URL para seus testes / Type the URL for your test' +
        's)'
    end
    object GroupBox1: TGroupBox
      Left = 8
      Top = 8
      Width = 561
      Height = 129
      Caption = 
        'Lista de arquivos para Upload via HTTP / Filelist to Upload via ' +
        'HTTP'
      TabOrder = 0
      object ListBox_Filelist: TListBox
        Left = 7
        Top = 17
        Width = 425
        Height = 97
        ItemHeight = 14
        MultiSelect = True
        TabOrder = 0
      end
      object btnAddFile: TButton
        Left = 440
        Top = 16
        Width = 105
        Height = 25
        Caption = 'Adicionar / Add'
        TabOrder = 1
        OnClick = btnAddFileClick
      end
      object btnRemoveFile: TButton
        Left = 440
        Top = 48
        Width = 105
        Height = 25
        Caption = 'Remover / Remove'
        TabOrder = 2
        OnClick = btnRemoveFileClick
      end
    end
    object Edit_URLAddress: TEdit
      Left = 8
      Top = 160
      Width = 465
      Height = 22
      TabOrder = 1
      Text = 'http://0.0.0.0/sisweb/ReceiveUpload.aspx'
    end
    object btnUpload: TButton
      Left = 8
      Top = 192
      Width = 75
      Height = 25
      Caption = 'Upload'
      TabOrder = 2
      OnClick = btnUploadClick
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 233
    Width = 577
    Height = 32
    Align = alTop
    TabOrder = 1
    object btn_ClearMessages: TButton
      Left = 8
      Top = 4
      Width = 209
      Height = 25
      Caption = 'Apagar mensagens / Clear messages'
      TabOrder = 0
      OnClick = btn_ClearMessagesClick
    end
  end
  object memo_Log: TMemo
    Left = 0
    Top = 265
    Width = 577
    Height = 181
    Align = alClient
    TabOrder = 2
  end
  object IdHTTP1: TIdHTTP
    MaxLineAction = maException
    ReadTimeout = 0
    AllowCookies = True
    ProxyParams.BasicAuthentication = False
    ProxyParams.ProxyPort = 0
    Request.ContentLength = -1
    Request.ContentRangeEnd = 0
    Request.ContentRangeStart = 0
    Request.ContentType = 'text/html'
    Request.Accept = 'text/html, */*'
    Request.BasicAuthentication = False
    Request.UserAgent = 'Mozilla/3.0 (compatible; Indy Library)'
    HTTPOptions = [hoForceEncodeParams]
    Left = 480
    Top = 160
  end
  object OpenDialog1: TOpenDialog
    Left = 448
    Top = 88
  end
  object MainMenu1: TMainMenu
    Left = 480
    Top = 88
    object File1: TMenuItem
      Caption = '&File'
      object Exit1: TMenuItem
        Caption = '&Exit'
        OnClick = Exit1Click
      end
    end
    object Help1: TMenuItem
      Caption = '&Help'
      object About1: TMenuItem
        Caption = '&About'
        OnClick = About1Click
      end
    end
  end
end
