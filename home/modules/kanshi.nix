{pkgs, ...}: {
  # Install kanshi via home-manager module
  home.packages = with pkgs; [
    kanshi
  ];

  # Manage kanshi services via Home-manager
  services.kanshi = {
    enable = true;
    systemdTarget = "graphical-session.target";
    settings = [
      {
        profile.name = "docked";
        profile.outputs = [
          {
            criteria = "DP-1";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "eDP-1";
            status = "disable";
          }
        ];
      }
      {
        profile.name = "undocked";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
          }
        ];
      }
      {
        profile.name = "mirror";
        profile.outputs = [
          {
            criteria = "eDP-1";
            status = "enable";
            position = "0,0";
          }
          {
            criteria = "DP-1";
            status = "enable";
            position = "0,0";
          }
        ];
        profile.exec = "wlr-randr --output DP-1 --mirror eDP-1";
      }
    ];
  };
}
