program UploadFilesViaHTTP;

uses
  Forms,
  Unit1 in 'Unit1.pas' {formMain};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Upload Files Via HTTP';
  Application.CreateForm(TformMain, formMain);
  Application.Run;
end.
