{config, pkgs,...}: {
  config = {
    programs.zsh = {
      enable = true;
      shellAliases = {
        kopai-soft = "sudo nixos-rebuild test --flake $HOME/src/niXfiles#cybertractor";
        kopai-hard = "sudo nixos-rebuild switch --flake $HOME/src/niXfiles#cybertractor";
      };
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histFile = "$HOME/.config/zsh_history";
      setOptions = ["INC_APPEND_HISTORY"];
    };

    home-manager.users.smsr = {
      programs.zsh.initContent = "source ${./zshrc.sh}";
      programs.zsh.autocd = true;
    };

    users.defaultUserShell = pkgs.zsh;
    users.users.smsr.shell = pkgs.zsh;
  };
  }
