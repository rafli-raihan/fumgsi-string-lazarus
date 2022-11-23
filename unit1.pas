unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonConcat: TButton;
    ButtonCopy: TButton;
    ButtonLength: TButton;
    ButtonDelete: TButton;
    ButtonInsert: TButton;
    ButtonUppercase: TButton;
    ButtonLowercase: TButton;
    ButtonClear: TButton;
    ButtonQuit: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure ButtonClearClick(Sender: TObject);
    procedure ButtonQuitClick(Sender: TObject);
    procedure ButtonConcatClick(Sender: TObject);
    procedure ButtonCopyClick(Sender: TObject);
    procedure ButtonInsertClick(Sender: TObject);
    procedure ButtonLengthClick(Sender: TObject);
    procedure ButtonDeleteClick(Sender: TObject);
    procedure ButtonLowercaseClick(Sender: TObject);
    procedure ButtonUppercaseClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;
  a,j:Integer;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.ButtonConcatClick(Sender: TObject);
begin
if RadioButton1.Checked = true then
  begin
  Edit5.Text:= 'Operasi CONCAT harus menggunakan option "2 String"';
  end
  else if RadioButton2.Checked = true then
  begin
  Edit5.Text:= Concat(Edit1.Text,Edit2.Text);
  end
end;

procedure TForm1.ButtonClearClick(Sender: TObject);
begin
  Edit1.Clear;
  Edit2.Clear;
  Edit3.Clear;
  Edit4.Clear;
  Edit5.Text:= 'Hasil akan muncul disini...';
end;

procedure TForm1.ButtonQuitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.ButtonCopyClick(Sender: TObject);
begin
  a:= strtoint(Edit3.Text);
  j:= strtoint(Edit4.Text);
if RadioButton1.Checked = true then
begin
  if Edit1.Text = '' then
  begin
  Edit5.Text:= Copy(Edit2.Text, a, j);
  end
  else if Edit2.Text = '' then
  begin
  Edit5.Text:= Copy(Edit1.Text, a, j);
  end
  else
  begin
  Edit5.Text:= 'Pilih option "2 String"';
  end
end
else if RadioButton2.Checked = true then
begin
Edit5.Text:= Copy(Edit1.Text + Edit2.Text, a,j);
end
end;

procedure TForm1.ButtonInsertClick(Sender: TObject);
var
  Sa:String;
begin
a:= strtoint(Edit3.Text);
Sa:= Edit5.Text;
If Radiobutton1.Checked = true then
begin
  If Edit1.Text = '' then
  begin
    Insert(Edit2.Text,Sa,a);
    Edit5.Text:= Sa;
  end
  else if Edit2.Text = '' then
  begin
    Insert(Edit1.Text,Sa,a);
    Edit5.Text:= Sa;
  end
  else
  begin
    Edit5.Text:= 'Pilih option "2 String"';
  end
end
else if Radiobutton2.Checked = true then
begin
Insert(Edit1.Text + Edit2.Text,Sa,a);
Edit5.Text:= Sa;
end
end;

procedure TForm1.ButtonLengthClick(Sender: TObject);
var
  S2:String;
  L:Integer;
begin
S2:= Edit1.Text + Edit2.Text;
If Radiobutton1.Checked = true then
  begin
    If Edit1.Text = '' then
    begin
      L:= Length(Edit2.Text);
      Edit5.Text:= 'Banyaknya Char: ' + inttostr(L);
    end
    else if Edit2.Text = '' then
    begin
      L:= Length(Edit1.Text);
      Edit5.Text:= 'Banyaknya Char: ' + inttostr(L);
    end
    else
    begin
    Edit5.Text:= 'Pilih option "2 String"';
    end
  end
else if Radiobutton2.Checked = true then
  begin
    L:= Length(S2);
    Edit5.Text:= 'Banyaknya Char: ' + inttostr(L);
  end
end;

procedure TForm1.ButtonDeleteClick(Sender: TObject);
var
  S1,S2,S3:String;
begin
  S1 := Edit1.Text;
  S2 := Edit2.Text;
  S3 := S1 + S2;
  a := strtoint(Edit3.Text);
  j := strtoint(Edit4.Text);
if RadioButton1.Checked = true then
begin
  if Edit2.Text = '' then
  begin
  Delete(S1,a,j);
  Edit5.Text:=S1;
  end
  else if Edit1.Text = '' then
  begin
  Delete(S2,a,j);
  Edit5.Text:=S2;
  end
  else
  begin
  Edit5.Text:= 'Pilih option "2 String"';
  end
end
else if Radiobutton2.Checked = true then
begin
  Delete(S3,a,j);
  Edit5.Text:= S3;
end
end;

procedure TForm1.ButtonLowercaseClick(Sender: TObject);
var
  S3:String;
begin
S3:= Edit1.Text + Edit2.Text;
If Radiobutton1.Checked = true then
begin
  If Edit1.Text = '' then
  begin
    Edit5.Text:= Lowercase(Edit2.Text);
  end
  else if Edit2.Text = '' then
  begin
    Edit5.Text:= Lowercase(Edit1.Text);
  end
  else
  begin
  Edit5.Text:= 'Pilih option "2 String"';
  end
end
else if Radiobutton2.Checked = true then
begin
Edit5.Text:= Lowercase(S3);
end
end;

procedure TForm1.ButtonUppercaseClick(Sender: TObject);
var
  S3:String;
begin
S3:= Edit1.Text + Edit2.Text;
If Radiobutton1.Checked = true then
  begin
    If Edit1.Text = '' then
      begin
        Edit5.Text:= Uppercase(Edit2.Text);
      end
    else if Edit2.Text = '' then
      begin
        Edit5.Text:= Uppercase(Edit1.Text);
      end
    else
      begin
        Edit5.Text:= 'Pilih option "2 String"';
      end
  end
else if Radiobutton2.Checked = true then
begin
  Edit5.Text:= Uppercase(S3);
end
end;

end.

{NOTES}
{'' artinya Editnya kosong, gaada isinya. Misal If Edit1.Text = '' berarti itu Edit 1 nya kosong.}
{perhatikan tiap begin sama end jgn sampe ada begin yg nyangkut.}
