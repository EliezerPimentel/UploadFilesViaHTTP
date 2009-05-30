//=======================================================================================
// Eliézer Pimentel, 05/29/2009, from Brazil (http://www.twitter.com/EliezerPimentel
// This sample was used to show how you can do uploads using http Indy Component (idHTTP)
//=======================================================================================

unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, OleCtrls, SHDocVw, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ExtCtrls, Menus;

type
  TformMain = class(TForm)
    IdHTTP1: TIdHTTP;
    Panel1: TPanel;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    ListBox_Filelist: TListBox;
    btnAddFile: TButton;
    btnRemoveFile: TButton;
    Edit_URLAddress: TEdit;
    btnUpload: TButton;
    memo_Log: TMemo;
    Label1: TLabel;
    btn_ClearMessages: TButton;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Exit1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    procedure btnUploadClick(Sender: TObject);
    procedure btn_ClearMessagesClick(Sender: TObject);
    procedure btnRemoveFileClick(Sender: TObject);
    procedure btnAddFileClick(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formMain: TformMain;

implementation

{$R *.dfm}

uses
IdMultiPartFormData;

procedure TformMain.btnUploadClick(Sender: TObject);
var
  formData : TIdMultiPartFormDataStream;
  i: integer;
begin
  if (ListBox_Filelist.Items.Count = 0) then exit;
  
  formData := TIdMultiPartFormDataStream.Create;

  try
    for i := 0 to ListBox_FileList.Items.Count -1 do
    begin
      formData.AddFile('File'+IntToStr(i), ListBox_FileList.Items[i], 'plain/text');
    end;

    IdHTTP1.Request.Referer := Edit_URLAddress.Text;

    try
      memo_log.Lines.Text     := idHTTP1.Post(Edit_URLAddress.Text, formData);
    except
      on e: exception do
      begin
        memo_log.Lines.Text   := e.Message;
      end;
    end;
  finally
    formData.Free;
  end;
end;

procedure TformMain.btn_ClearMessagesClick(Sender: TObject);
begin
  // pt-br: Para apagar todas as linhas de mensagens
  // en: To clear all messages lines
  with memo_log.Lines do
  begin
    BeginUpdate;
    Clear;
    EndUpdate;
  end;
end;

procedure TformMain.btnRemoveFileClick(Sender: TObject);
begin
  // pt-br: Para remover os itens selecionados da lista de arquivos
  // en: To remove the selected itens from filelist
  ListBox_Filelist.DeleteSelected;
end;

procedure TformMain.btnAddFileClick(Sender: TObject);
begin
  // pt-br: Para adicionar um novo arquivo na lista através da caixa de diálogo
  // en: To add a new file at filelist from dialog box
  if (OpenDialog1.Execute) then ListBox_Filelist.Items.Add(OpenDialog1.FileName);
end;

procedure TformMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TformMain.About1Click(Sender: TObject);
var about: string;
begin
  about :=         'by Eliézer Pimentel'+#10#13;
  about := about + '29, May, 2009 - from Brazil'+#10#13;
  about := about + 'Delphi 7.0 (Build 4.453)'+#10#13;
  about := about + 'Indy Component 9.00.10'+#10#13;
  about := about + 'http://www.twitter.com/EliezerPimentel';

  ShowMessage(about);
end;

end.
