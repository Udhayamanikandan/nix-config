{
  userConfig,
  pkgs,
  ...
}: {
  # GTK theme configuration
  gtk = {
    enable = true;
    theme = {
      name = "Andromeda";
      package = pkgs.andromeda-gtk-theme;
    };
    iconTheme = {
      name = "Tela-circle-dark";
      package = pkgs.tela-circle-icon-theme;
    };
    cursorTheme = {
      name = "Yaru";
      package = pkgs.yaru-theme;
      size = 24;
    };
    font = {
      name = "Roboto";
      size = 11;
    };
    gtk2 = {
      extraConfig = "gtk-application-prefer-dark-theme = 1";
    };
    gtk3 = {
      extraConfig = {
        # Explicitly set dark theme preference
        "gtk-application-prefer-dark-theme" = 1;
      };
      bookmarks = [
        "file:///home/${userConfig.name}/Documents"
        "file:///home/${userConfig.name}/Downloads"
        "file:///home/${userConfig.name}/Pictures"
        "file:///home/${userConfig.name}/Videos"
        "file:///home/${userConfig.name}/Documents/repositories"
      ];
    };
  };
}
