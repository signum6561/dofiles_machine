{
  config,
  pkgs,
  lib,
  ...
}:
let
  tpmDir = "${config.home.homeDirectory}/.config/tmux/plugins/tpm";
in
{
  home.username = "dsynclair";
  home.homeDirectory = "/home/dsynclair";
  home.stateVersion = "25.05"; # Please read the comment before changing.
  home.packages = with pkgs; [
    chezmoi
    eza
    zoxide
    fzf
    zinit
    fd
    direnv
    nix-direnv
    typos-lsp
    yq
    glow
    tmux
    opencode
    devenv
    nil
    nixfmt
    nodejs_24
    lazygit
    oh-my-posh
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "signum6561";
        email = "quiocdat777@gmail.com";
      };
      core.editor = "hx";
    };
  };

  home.activation = {
    installTpm = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
      echo "Checking for TPM installation..."
      if [ ! -d "${tpmDir}" ]; then
        echo "TPM not found. Cloning repository..."
        ${pkgs.git}/bin/git clone https://github.com/tmux-plugins/tpm "${tpmDir}"
      fi
    '';
  };

  home.sessionVariables = {
    ZINIT_HOME="${pkgs.zinit}/share/zinit";
  };

  programs.home-manager.enable = true;
}
