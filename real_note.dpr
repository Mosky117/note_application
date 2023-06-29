program real_note;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Note};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNote, Note);
  Application.Run;
end.
