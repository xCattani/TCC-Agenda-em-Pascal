unit unitLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, FMX.Layouts, FMX.StdCtrls,
  FMX.TabControl, System.Actions, FMX.ActnList, FMX.VirtualKeyboard;

type
  TformLogin = class(TForm)
    layout_tela_login: TLayout;
    layout_icone: TLayout;
    img_login: TImage;
    layout_login: TLayout;
    RoundRect_user_login: TRoundRect;
    edit_user: TEdit;
    RoundRect_senha_login: TRoundRect;
    layout_user_login: TLayout;
    layout_senha_login: TLayout;
    edit_senha_login: TEdit;
    layout_botao_login: TLayout;
    RoundRect_botao_login: TRoundRect;
    Label_botao_login: TLabel;
    TabControl1: TTabControl;
    tab_login: TTabItem;
    tab_recuperar: TTabItem;
    layout_cad: TLayout;
    layout_email_cad: TLayout;
    RoundRect2: TRoundRect;
    edit_email_cad: TEdit;
    layout_senha_cad: TLayout;
    RoundRect3: TRoundRect;
    Edit3: TEdit;
    layout_img_cad: TLayout;
    img_icone_cad: TImage;
    layout_recuperar: TLayout;
    layout_cad_center: TLayout;
    RoundRect4: TRoundRect;
    label_botao_cad: TLabel;
    StyleBook1: TStyleBook;
    layoutTroca1: TLayout;
    layoutBot: TLayout;
    labelBotLogin: TLabel;
    labelBotCad: TLabel;
    ActionList1: TActionList;
    ActConta: TChangeTabAction;
    ActLogin: TChangeTabAction;
    LineLogin: TLine;
    ActFoto: TChangeTabAction;
    layout_senha2: TLayout;
    RoundRect6: TRoundRect;
    edit_senha2: TEdit;
    tab_Cad1: TTabItem;
    Layout4: TLayout;
    Layout5: TLayout;
    Label2: TLabel;
    Label3: TLabel;
    Line1: TLine;
    layoutBack: TLayout;
    backbutton: TImage;
    Layout1: TLayout;
    Layout2: TLayout;
    Image1: TImage;
    Layout3: TLayout;
    Layout6: TLayout;
    RoundRect5: TRoundRect;
    Edit2: TEdit;
    Layout7: TLayout;
    RoundRect7: TRoundRect;
    Edit4: TEdit;
    Layout8: TLayout;
    RoundRect8: TRoundRect;
    Edit5: TEdit;
    Layout9: TLayout;
    RoundRect9: TRoundRect;
    Edit6: TEdit;
    Layout10: TLayout;
    RoundRect10: TRoundRect;
    Label1: TLabel;
    Label4: TLabel;
    procedure labelBotCadClick(Sender: TObject);
    procedure labelLoginCadClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure RoundRect_botao_loginClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure backbuttonClick(Sender: TObject);
    procedure Rectangle2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formLogin: TformLogin;

implementation

{$R *.fmx}

uses unitPrincipal;

procedure TformLogin.labelLoginCadClick(Sender: TObject);
begin
tabControl1.ActiveTab := tab_login;
end;


procedure TformLogin.Rectangle2Click(Sender: TObject);
begin
tabControl1.ActiveTab := tab_recuperar;
end;

procedure TformLogin.RoundRect_botao_loginClick(Sender: TObject);
begin
 if not Assigned (formPrincipal) then

   formPrincipal := TFormPrincipal.Create(Application);
   formPrincipal.ShowModal;
   formLogin.Close;

end;

procedure TformLogin.backbuttonClick(Sender: TObject);
begin
tabControl1.ActiveTab := tab_login;
end;

procedure TformLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   Action := TCloseAction.caFree;
   formLogin := nil;
end;

procedure TformLogin.FormKeyUp(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);

{$IFDEF ANDROID}

var
  FService : FMXVirtualKeyboardService;

{$ENDIF}

begin
   {$IFDEF ANDROID}
   if (Key = vkHardwareBack) then
     begin
     TPlataformService.Current.SuportPlataformService (FMXVirtualKeyboardService, Interface (FService));

     if (FService <> nill) and (TVituralVitrtualKeyboardState.Visible in FService.VirtualKeuboardState) then
      else
       begin
          if TabControl1.ActiveTab = tab_cad then
          begin
             Key := 0;

             TabControl1.ActiveTab:= tab_login;
          end;
       end;
     end;
     {$ENDIF}
end;

procedure TformLogin.FormShow(Sender: TObject);
begin
  TabControl1.ActiveTab := tab_login;
end;

procedure TformLogin.Image2Click(Sender: TObject);
begin
tabControl1.ActiveTab := tab_recuperar;
end;

procedure TformLogin.Label4Click(Sender: TObject);
begin
tabControl1.ActiveTab := tab_recuperar;
end;

procedure TformLogin.labelBotCadClick(Sender: TObject);
begin
tabControl1.ActiveTab := tab_Cad1;
end;

end.