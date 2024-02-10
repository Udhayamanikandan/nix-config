{pkgs, ...}: {
  # Zsh shell configuration
  # TODO: replace exa alias with eza once auto-complete fixed
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    shellAliases = {
      cat = "bat -p";

      # git
      gaa = "git add --all";
      gcam = "git commit --all --message";
      gco = "git checkout";

      du = "dust";
      grep = "rg";
      kupdate = "krew update && krew upgrade";

      # kubectl
      k = "kubectl";
      kgp = "kubectl get pods";
      kep = "kubectl edit pods";
      kdp = "kubectl describe pods";
      kdelp = "kubectl delete pods";
      kgs = "kubectl get svc";
      kes = "kubectl edit svc";
      kds = "kubectl describe svc";
      kdels = "kubectl delete svc";
      kgi = "kubectl get ingress";
      kei = "kubectl edit ingress";
      kdi = "kubectl describe ingress";
      kdeli = "kubectl delete ingress";
      kgns = "kubectl get namespaces";
      kens = "kubectl edit namespace";
      kdns = "kubectl describe namespace";
      kdelns = "kubectl delete namespace";
      kgd = "kubectl get deployment";
      ked = "kubectl edit deployment";
      kdd = "kubectl describe deployment";
      kdeld = "kubectl delete deployment";

      ld = "lazydocker";
      lg = "lazygit";

      repo = "cd $HOME/Documents/repositories";
      temp = "cd $HOME/Downloads/temp";

      top = "btm";

      v = "nvim";
      vi = "nvim";
      vim = "nvim";

      ls = "exa --icons"; # default view
      ll = "exa -bhl --group-directories-first --icons"; # long list
      la = "exa -abhl --group-directories-first --icons"; # all list
      lt = "exa --tree --level=2 --icons"; # tree
    };
    initExtra = ''
      # kubectl auto-complete
      source <(kubectl completion zsh)

      # bindings
      bindkey -s ^f "cd-to-project\n"
    '';
  };

  programs.starship = let
    flavour = "macchiato";
  in {
    enable = true;
    enableZshIntegration = true;
    settings =
      {
        palette = "catppuccin_${flavour}";
      }
      // builtins.fromTOML (builtins.readFile
        (pkgs.fetchFromGitHub
          {
            owner = "catppuccin";
            repo = "starship";
            rev = "5629d2356f62a9f2f8efad3ff37476c19969bd4f";
            sha256 = "sha256-nsRuxQFKbQkyEI4TXgvAjcroVdG+heKX5Pauq/4Ota0=";
          }
          + /palettes/${flavour}.toml));
  };
}
