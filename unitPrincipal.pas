unit unitPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView, Uagendamento,
  FireDAC.Phys.MySQLDef, FireDAC.Stan.Intf, FireDAC.Phys, FireDAC.Phys.MySQL,
  Data.Bind.GenData, System.Rtti,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.DBScope, FMX.Colors;

type
  TformPrincipal = class(TForm)
    layoutNotification: TLayout;
    Layout2: TLayout;
    retangulomenor: TRectangle;
    RoundRect1: TRoundRect;
    retangulomaior: TRectangle;
    Label2: TLabel;
    Layout1: TLayout;
    list_lancamento: TListView;
    Label3: TLabel;
    PrototypeBindSource1: TPrototypeBindSource;
    BindingsList1: TBindingsList;
    LinkListControlToField1: TLinkListControlToField;
    Image1: TImage;
    BindSourceDB1: TBindSourceDB;
    Switch1: TSwitch;
    btnDeleteAll: TColorButton;
    btnDelete: TColorButton;
    procedure RoundRect1Click(Sender: TObject);
    procedure list_lancamentoChange(Sender: TObject);
    procedure list_lancamentoButtonClick(const Sender: TObject;
      const AItem: TListViewItem; const AObject: TListItemSimpleControl);
    procedure list_lancamentoItemsChange(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
  private

  public
    { Public declarations }
  end;

var
  formPrincipal: TformPrincipal;
  id : integer;

implementation
  uses dm;
{$R *.fmx}



procedure TformPrincipal.btnDeleteClick(Sender: TObject);
var
  I: Integer;
  J: Integer;
begin

  if DataModule1.qryCount <> nil then
  begin

     I := DataModule1.qryCount.ParamCount;

  for J := 0 to I do
    begin

      DataModule1.qrySelectLate.Delete;
      DataModule1.qrySelect.Active := False;

      DataModule1.qrySelect.Active := True;
    end;

  end;

end;

procedure TformPrincipal.list_lancamentoButtonClick(const Sender: TObject;
  const AItem: TListViewItem; const AObject: TListItemSimpleControl);
begin


  id := DataModule1.qrySelect.FieldByName('id').value;
  DataModule1.qrySelect.Delete;

end;

procedure TformPrincipal.list_lancamentoChange(Sender: TObject);
var
  i : Integer;
begin

for I := 1 to Length(Agendamento) do
 begin



 end;

end;

procedure TformPrincipal.list_lancamentoItemsChange(Sender: TObject);
var
lista : Tlistview;
item : TListViewItem ;
current : TDateTime;
timedate : TDateTime;
begin
  lista := TListView(sender);
  current := Now();

  for item in lista.Items do
  begin
     if (item <> nil) and (item.Objects.DetailObject <> nil) then
     begin

      if item.Objects.DetailObject.Text <> '' then
      begin

      timedate := StrToDateTime(item.Objects.DetailObject.Text);

      if (current > timedate) then
        begin
        item.Objects.DetailObject.TextColor := TAlphaColors.Red;
        end;
      end;



     end;
  end;

end;



procedure TformPrincipal.RoundRect1Click(Sender: TObject);
begin
if NOT Assigned (formAgendamento) then
   Application.CreateForm(TFormAgendamento, formAgendamento);

   DataModule1.qrySelect.Append;
   formAgendamento := TFormAgendamento.Create(Application);
   formAgendamento.ShowModal;


end;


end.
