unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.Menus, Vcl.Tabs,
  Vcl.StdCtrls;

type
  TNote = class(TForm)
    PageControl: TPageControl;
    toolbar: TMainMenu;
    file_toolbar: TMenuItem;
    edit_toolbar: TMenuItem;
    new_sheet: TMenuItem;
    tab: TTabSheet;
    text: TMemo;
    saveAs: TMenuItem;
    open_file: TMenuItem;
    find: TMenuItem;
    close: TMenuItem;
    procedure new_sheetClick(Sender: TObject);
    procedure saveAsClick(Sender: TObject);
    procedure open_fileClick(Sender: TObject);
    procedure findClick(Sender: TObject);
    procedure closeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Note: TNote;

implementation

{$R *.dfm}



procedure TNote.findClick(Sender: TObject);
var
  word: string;
  i: integer;
  j: integer;

begin
  word:=inputbox('Trova','Cerca:','');
  for i:=0 to text.Lines.Count-1 do
    if pos(word,text.Lines[i])>0 then
    begin
      showMessage('Parola trovata alla riga: ' + (i+1).ToString);
      text.SelStart := text.Perform(EM_LINEINDEX, i, 0);
      text.SelLength := Length(text.Lines[i]) ;
      text.SetFocus;
    end;
end;



procedure TNote.closeClick(Sender: TObject);
var
  window_dialog: TSaveDialog;
begin
  if messagedlg('Vuoi salvare le modifiche? ', mtconfirmation, [mbyes,mbno],0,mbyes)=mryes then
  begin
    window_dialog:=TSaveDialog.Create(nil);
    if window_dialog.Execute then
      window_dialog.Filter:='.txt';
      text.Lines.SaveToFile(window_dialog.FileName);
  end;
  pagecontrol.ActivePage.Destroy;
end;



procedure TNote.new_sheetClick(Sender: TObject);
var
  mysheet: TTabsheet;
  mymemo: TMemo;
begin
  mysheet:= TTabsheet.Create(Pagecontrol);
  mysheet.PageControl:= Pagecontrol;
  mysheet.Caption:= 'Senza Nome '+ inttostr(Pagecontrol.PageCount);
  Pagecontrol.ActivePage:= mysheet;

  mymemo:= TMemo.Create(mysheet);
  mymemo.Parent:= mysheet;
  mymemo.Align:= alClient;
  mymemo.Text:= '';
end;




procedure TNote.open_fileClick(Sender: TObject);
var
  window_dialog: TOpenDialog;
  counter: integer;
  filename: string;
  i : integer;
begin
  window_dialog:=TOpenDialog.Create(nil);
  window_dialog.Filter := 'Only Text files (*.txt)|*.txt';
  if window_dialog.Execute then
  with PageControl.ActivePage do
  begin
    for counter:= 0 to controlcount-1 do
      if controls[counter] is TMemo then
      begin
        TMemo(Controls[counter]).Lines.LoadFromFile(window_dialog.FileName);
        filename:=window_dialog.FileName;
        for I := (filename.Length) downto 0 do
        begin
          system.Delete(filename,1,pos('\',filename));
        end;
        pagecontrol.ActivePage.Caption:=filename;
      end;
  end;
end;

procedure TNote.saveAsClick(Sender: TObject);
var
  window_dialog: TSaveDialog;
begin
  window_dialog:=TSaveDialog.Create(nil);
  if window_dialog.Execute then
    window_dialog.Filter:='.txt';
    text.Lines.SaveToFile(window_dialog.FileName);
end;



end.
