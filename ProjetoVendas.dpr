program ProjetoVendas;

uses
  Vcl.Forms,
  LancamentoCarrinho in 'LancamentoCarrinho.pas' {FCarrinho},
  CadastroProdutos in 'CadastroProdutos.pas' {FProdutos},
  LocalizaCarrinho in 'LocalizaCarrinho.pas' {FLocalizaCarrinho};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFCarrinho, FCarrinho);
  Application.Run;
end.
