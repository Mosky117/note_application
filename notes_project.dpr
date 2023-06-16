program notes_project;


uses
  Vcl.Forms,
  notes in 'notes.pas' {Note};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNote, Note);
  Application.Run;
end.
