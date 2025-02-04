{pkgs, ...}: let
  ulauncher_config = ./../../files/configs/ulauncher;
in {
  # Ulauncher package
  home.packages = with pkgs; [
    ulauncher
  ];

  # Ulauncher service configuration
  systemd.user.services.ulauncher = {
    Unit = {
      Description = "ulauncher application launcher service";
      Documentation = "https://ulauncher.io";
      PartOf = ["graphical-session.target"];
    };

    Service = {
      Type = "simple";
      ExecStart = "${pkgs.bash}/bin/bash -lc '${pkgs.ulauncher}/bin/ulauncher --hide-window'";
      Restart = "always";
    };

    Install.WantedBy = ["graphical-session.target"];
  };

  # Source ulauncher configuration from this repository
  xdg.configFile = {
    "ulauncher" = {
      recursive = true;
      source = "${ulauncher_config}";
    };
  };
}
