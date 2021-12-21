unit Uagendamento;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.DateTimeCtrls, FMX.Calendar, FMX.Edit, FMX.EditBox, FMX.NumberBox, unitAgend,
  FMX.Colors, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Phys.MySQLDef, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.FMXUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet,
  System.Rtti, System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.DBScope;

type
  TformAgendamento = class(TForm)
    lay1: TLayout;
    Image1: TImage;
    Label1: TLabel;
    Rectangle1: TRectangle;
    DateEdit: TDateEdit;
    edtClient: TEdit;
    lblClient: TLabel;
    lblDate: TLabel;
    lblPhone: TLabel;
    lblSched: TLabel;
    btnConfirm: TRoundRect;
    TimeEdit: TTimeEdit;
    layClientL: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Layout1: TLayout;
    Layout5: TLayout;
    Layout6: TLayout;
    Layout7: TLayout;
    Rectangle2: TRectangle;
    qrySelect: TFDQuery;
    Label2: TLabel;
    BindingsList1: TBindingsList;
    boxPhone: TEdit;
    BindSourceDB1: TBindSourceDB;
    LinkControlToField1: TLinkControlToField;
    LinkControlToField3: TLinkControlToField;
    LinkControlToField2: TLinkControlToField;
    LinkControlToField4: TLinkControlToField;
    procedure btnConfirmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formAgendamento: TformAgendamento;
  Agendamento: array of TAgendamento;
  counter : Integer;
  cur : Integer;
  cur_time : TDateTime;
  datahora : TDateTime;
implementation
uses dm;

{$R *.fmx}


procedure TformAgendamento.btnConfirmClick(Sender: TObject);


var
  fil : TFileStream;
  Client : String;
  Phone : String;
  Date : TDate;
  Sched : TTime;
  DateSched : TDateTime;
  sizeBuffer : Integer;

begin
  cur_time := Now();

  datahora := formAgendamento.DateEdit.Date;
  datahora := datahora + formAgendamento.TimeEdit.Time;

  begin



  if (datahora > cur_time) and (boxPhone.Text.Length = 11) and (edtClient.Text.Length > 0) then
  begin

  SetLength(Agendamento, Length(Agendamento)+1);
  counter := Length(Agendamento);
  cur := counter - 1;
  Agendamento[counter -1] := TAgendamento.Create; //Criando a inst�ncia


  //Fazendo o objeto receber os valores
  Agendamento[cur].setClient(formAgendamento.lblClient.Text);
  Agendamento[cur].setPhone(formAgendamento.boxPhone.Text);
  Agendamento[cur].setSched(formAgendamento.TimeEdit.Time);
  Agendamento[cur].setDate(formAgendamento.DateEdit.Date);


  DataModule1.qrySelect.Post;

  formAgendamento.Close;

  end;
end;




end;

procedure TformAgendamento.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    DataModule1.qrySelect.Active := false;

    DataModule1.qrySelect.Active := true;

end;
procedure TformAgendamento.Image1Click(Sender: TObject);
begin
formAgendamento.Close;
end;

end.