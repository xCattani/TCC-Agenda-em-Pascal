program projeto_agenda;

uses
  System.StartUpCopy,
  FMX.Forms,
  unitPrincipal in 'unitPrincipal.pas' {formPrincipal},
  Uagendamento in 'Uagendamento.pas' {formAgendamento},
  dm in 'dm.pas' {DataModule1: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TformPrincipal, formPrincipal);
  Application.CreateForm(TformAgendamento, formAgendamento);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.Run;
end.
