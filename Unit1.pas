unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    edt1: TEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    edt2: TEdit;
    btn1: TButton;
    lbl3: TLabel;
    edt3: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1; s1, s2 : String;

implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  lbl1.Caption := 'Входная строка №1:';
  lbl2.Caption := 'Входная строка №2:';
  lbl3.Caption := 'Выходная строка:';
  edt1.Text := '1 2 3 4 5 6';
  edt2.Text := '1111 2222 3333 4444 5555 6666';
  edt3.Text := '';
  edt3.ReadOnly := True;
  btn1.Caption := 'Смешать';
end;

procedure TForm1.btn1Click(Sender: TObject);
var i, j, m_n : Integer; flag1, flag2, slovo : Boolean; s_temp : String;
begin
  i := 1;
  j := 1;
  flag1 := True;
  flag2 := True;
  s1 := edt1.Text;
  s2 := edt2.Text;
  edt3.Text := '';

  if (Length(s1) < 1) then begin
    ShowMessage('Входная строка №1 пустая!');
    exit;
  end;

  if (Length(s2) < 1) then begin
    ShowMessage('Входная строка №2 пустая!');
    exit;
  end;

  while(flag1 or flag2) do begin
    flag1 := false;
    flag2 := false;
    s_temp := '';
    slovo := False;

    for m_n := i to Length(s1) do begin
      flag1 := true;
      if (slovo = False) then begin
        if (s1[m_n] <> ' ') then begin
          slovo := True;
          s_temp := s_temp + s1[m_n];
          if (m_n = Length(s1)) then begin
            edt3.Text := edt3.Text + s_temp + ' ';
            i := Length(s1);
          end;
        end;
      end
      else begin
        if (s1[m_n] <> ' ') then begin
          s_temp := s_temp + s1[m_n];
          if (m_n = Length(s1)) then begin
            edt3.Text := edt3.Text + s_temp + ' ';
            i := Length(s1);
          end
        end
        else begin
          edt3.Text := edt3.Text + s_temp + ' ';
          i := m_n;
          Break;
        end;
      end;
    end;
    inc(i);

    slovo := False;
    s_temp := '';

    for m_n := j to Length(s2) do begin
      flag2 := true;
      if (slovo = False) then begin
        if (s2[m_n] <> ' ') then begin
          slovo := True;
          s_temp := s_temp + s2[m_n];
          if (m_n = Length(s2)) then begin
            edt3.Text := edt3.Text + s_temp + ' ';
            j := Length(s2);
          end;
        end;
      end
      else begin
        if (s2[m_n] <> ' ') then begin
          s_temp := s_temp + s2[m_n];
          if (m_n = Length(s2)) then begin
            edt3.Text := edt3.Text + s_temp + ' ';
            j := Length(s2);
          end;
        end
        else begin
          edt3.Text := edt3.Text + s_temp + ' ';
          j := m_n;
          Break;
        end;
      end;
    end;
    inc(j);
  end;

  if (edt3.Text[Length(edt3.Text)] = ' ') then edt3.Text := Copy(edt3.Text, 1, Length(edt3.Text) - 1);
end;

end.
