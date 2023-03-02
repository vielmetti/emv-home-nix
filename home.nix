{pkgs, ...}: {
    home.username = "emv";
    home.homeDirectory = "/home/emv";
    home.stateVersion = "22.11"; # To figure this out you can comment out the line and see what version it expected.
    programs.home-manager.enable = true;

  home.packages = [
    pkgs.fortune
    pkgs.csvkit
    pkgs.any-nix-shell
    pkgs.atuin
  # sysadmin stuff
    pkgs.htop
    pkgs.ftop
    pkgs.glances
  # netadmin stuff
    pkgs.traceroute
    pkgs.mtr
  # access stuff
    pkgs.tailscale
  ];

  programs.git = {
    enable = true;
    userName  = "vielmetti";
    userEmail = "edward.vielmetti@gmail.com";
  };

  programs.mosh.enable = true;

  programs.zsh = {
    enable = true;
    zplug = {
      enable = true;
      plugins = [
              { name = "romkatv/powerlevel10k"; tags = [ as:theme depth:1 ]; }
              { name = "atuin"; }
      ];
    };
  };
}
