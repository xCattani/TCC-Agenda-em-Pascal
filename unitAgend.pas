unit unitAgend;

interface

uses System.classes;


 type
  TAgendamento = class

  private
  Client      : String;
  Phone       : String;
  Date        : TDate;
  Schedule    : TTime;

  public
  function getClient : String;
  function getPhone  : String;
  function getDate   : TDate;
  function getSched  : TTime;

  procedure setClient (fValor : String) ;
  procedure setPhone  (fValor : String) ;
  procedure setDate   (fValor : TDate) ;
  procedure setSched  (fValor : TTime) ;

 end;


implementation



{ TAgendamento }
{$REGION 'GETs'}

function TAgendamento.getClient: String;
begin
Result := Client;
end;

function TAgendamento.getDate: TDate;
begin
Result := Date;
end;

function TAgendamento.getPhone: String;
begin
Result := Phone;
end;

function TAgendamento.getSched: TTime;
begin
Result := Schedule;
end;

{$ENDREGION}

{$REGION 'SETs'}

procedure TAgendamento.setClient(fValor: String);
begin
  Client := fValor;
end;

procedure TAgendamento.setDate(fValor: TDate);
begin
  Date := fValor;
end;

procedure TAgendamento.setPhone(fValor: String);
begin
  Phone := fValor;
end;

procedure TAgendamento.setSched(fValor: TTime);
begin
  Schedule := fValor;
end;

{$ENDREGION}

end.
