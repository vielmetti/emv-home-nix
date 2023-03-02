{ config, pkgs, ... }:

{
  home.username = "emv";
  home.homeDirectory = "/home/emv";
  home.stateVersion = "22.11";
  programs.home-manager.enable = true;

  home.packages = [
    pkgs.fortune
    pkgs.csvkit
    pkgs.tailscale
    pkgs.any-nix-shell
    pkgs.atuin
  # sysadmin stuff
    pkgs.htop
    pkgs.ftop
    pkgs.glances
  # netadmin stuff
    pkgs.traceroute
    pkgs.mtr
  ];

  programs.git = {
    enable = true;
    userName  = "vielmetti";
    userEmail = "edward.vielmetti@gmail.com";
    extraConfig = {
      credential.helper = "${
          pkgs.git.override { withLibsecret = true; }
        }/bin/git-credential-libsecret";
    };
  };

  programs.zsh = {
    enable = true;
    history = {
      size = 10000;
      path = "${config.xdg.dataHome}/zsh/history";
    };
    zplug = {
      enable = true;
      plugins = [
              { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
              { name = "atuin"; }
      ];
    };
  };
}
