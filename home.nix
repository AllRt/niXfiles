{
  config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  home = {
    username = "smsr";
    homeDirectory = "/home/smsr";
    stateVersion = "25.05";
  };

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "nvim";
    TERMINAL = "ghostty";
    # fix for wayland not working
    # https://www.reddit.com/r/NixOS/comments/1df2oxc/kde_6_wayland_not_working_with_sddm/
    # SHELL = "zsh";
    # NIX_SHELL_INIT = "zsh";
    NIXPKGS_ALLOW_UNFREE = "1";
  };

     xdg.configFile = {
       "nvim" = {
         source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/src/niXfiles/config/nvim";
	 recursive = true;
       };
     };

  programs.git = {
    enable = true;
    userName = "SMSRRDR";
    userEmail = "yurkevska.s@gmail.com";
  };

  programs.oh-my-posh = {
    enable = true;
    enableZshIntegration = true;
  };
  xsession.enable = true;
  programs.zsh.enable = true;
  programs.home-manager.enable = true;
}
