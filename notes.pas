unit notes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Vcl.Menus, System.Actions, Vcl.ActnList;

type
  TNote = class(TForm)
    ToolBar1: TToolBar;
    edit_button: TToolButton;
    view_button: TToolButton;
    text: TMemo;
    file_popup_menu: TPopupMenu;
    ActionList1: TActionList;
    file_button: TToolButton;
    NuovaSched1: TMenuItem;
    open_file_button: TMenuItem;
    save_as_button: TMenuItem;
    edit_popup_menu: TPopupMenu;
    rova1: TMenuItem;
    screen: TPanel;
    procedure file_buttonClick(Sender: TObject);
    procedure open_file_buttonClick(Sender: TObject);
    procedure save_as_buttonClick(Sender: TObject);
    procedure edit_buttonClick(Sender: TObject);
    procedure rova1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Note: TNote;

implementation
uses
  Math;
{$R *.dfm}

procedure TNote.FormResize(Sender: TObject);
var
  ratio: double;
begin
  ratio:= min(clientwidth/screen.Width, clientheight/screen.height);
  ScaleBy(trunc(ratio *100),100);

end;

procedure TNote.edit_buttonClick(Sender: TObject);
var
  button: TControl;
  lowerLeft: TPoint;
begin
  if Sender is TControl then
  begin
    button := TControl(Sender);
    lowerLeft := Point(button.Left, button.Top + Button.Height);
    lowerLeft := ClientToScreen(lowerLeft);
    edit_popup_menu.Popup(lowerLeft.X, lowerLeft.Y);
  end;
end;

procedure TNote.file_buttonClick(Sender: TObject);
var
  button: TControl;
  lowerLeft: TPoint;
begin
  if Sender is TControl then
  begin
    button := TControl(Sender);
    lowerLeft := Point(button.Left, button.Top + Button.Height);
    lowerLeft := ClientToScreen(lowerLeft);
    file_popup_menu.Popup(lowerLeft.X, lowerLeft.Y);
  end;
end;



procedure TNote.open_file_buttonClick(Sender: TObject);
var
  window_dialog: TOpenDialog;
begin
  window_dialog:=TOpenDialog.Create(nil);
  window_dialog.Filter := 'Only Text files (*.txt)|*.txt';
  if window_dialog.Execute then
    text.Lines.LoadFromFile(window_dialog.FileName);
end;



procedure TNote.rova1Click(Sender: TObject);
var
  word: string;
  i: integer;
  j: integer;
  
begin
  word:=inputbox('Trova','Cerca:','');
  for i:=0 to text.Lines.Count-1 do
    if pos(word,text.Lines[i])>0 then
    begin
      showMessage('Parola trovata alla riga:' + (i+1).ToString);
      text.SelStart := text.Perform(EM_LINEINDEX, i, 0);
      text.SelLength := Length(text.Lines[i]) ; 
      text.SetFocus;   
    end;
end;
    



procedure TNote.save_as_buttonClick(Sender: TObject);
var
  window_dialog: TSaveDialog;
begin
  window_dialog:=TSaveDialog.Create(nil);
  if window_dialog.Execute then
    text.Lines.SaveToFile(window_dialog.FileName);
end;








end.