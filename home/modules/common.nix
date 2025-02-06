{outputs, ...}: {
  imports = [
    ../modules/alacritty.nix
    ../modules/atuin.nix
    ../modules/bat.nix
    ../modules/btop.nix
    ../modules/fastfetch.nix
    ../modules/fzf.nix
    ../modules/git.nix
    ../modules/gpg.nix
    ../modules/home.nix
    ../modules/obs-studio.nix
    ../modules/packages.nix
    ../modules/scripts.nix
    ../modules/starship.nix
    ../modules/telegram.nix
    ../modules/tmux.nix
    ../modules/zen.nix
    ../modules/normcap.nix
  ];

  # Nixpkgs configuration
  nixpkgs = {
    overlays = [
      outputs.overlays.stable-packages
    ];

    config = {
      allowUnfree = true;
    };
  };

  # Catpuccin flavor and accent
  catppuccin = {
    flavor = "macchiato";
    accent = "lavender";
  };
}
