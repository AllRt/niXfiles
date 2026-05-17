{config, pkgs,...}: {
  config = {
    environment.systemPackages = with pkgs; [
      pay-respects
      eza # ls alternative
      oh-my-posh
      zoxide
      ripgrep
      tree
      comma
      fzf
      lazygit
    ];

    programs.zsh = {
      enable = true;
      shellAliases = {
        kopai-soft = "sudo nixos-rebuild test --flake $HOME/src/niXfiles#cybertractor";
        kopai-hard = "sudo nixos-rebuild switch --flake $HOME/src/niXfiles#cybertractor";

        ls = "eza";
        cd = "z";

        v = "nvim";

        nz = "nix-shell --command zsh";

        ssh-init = "eval $(ssh-agent -s) && ssh-add";
      };
      enableCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histFile = "$HOME/.config/zsh_history";
      setOptions = ["INC_APPEND_HISTORY"];

      ohMyZsh = {
        enable = true;
        plugins = [
          "eza"
          "fzf"
          "sudo" # press escape twice to sudo
          "aliases" # als - show all aliases
          "git"
          # aliases for git commit with prefixes
          # use git fix -s "api" "message"
          # git feat "message"
          "git-commit"
          "rust"
          # "colorize" todo i think bat is a viable alternative
          "extract" # get files from archives
        ];
        theme = "robbyrussell";
      };
      promptInit = ''
        eval "$(zoxide init zsh)"
      '';
    };

    home-manager.users.smsr = {
      programs.zsh.initContent = "source ${./zshrc.sh}";
      programs.zsh.autocd = true;
    };

    users.defaultUserShell = pkgs.zsh;
    users.users.smsr.shell = pkgs.zsh;
  };
  }
