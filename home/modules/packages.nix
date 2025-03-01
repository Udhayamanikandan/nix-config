{
  pkgs,
  zen-browser,
  ...
}: {
  # ensure common packages are installed
  home.packages = with pkgs;
    [
      ncdu
      eza
      fd
      jq
      pipenv
      python3
      ripgrep
      pavucontrol
      pulseaudio
      tesseract
      unzip
      wl-clipboard
      vesktop
      arrpc
      playerctl
      wireguard-tools
      obsidian
      gitkraken
      vscode
      zed-editor
      nodePackages_latest.nodejs
      yt-dlp
      ollama
      zed-editor
      localsend
      zoxide
      tree
      vlc
      fragments
      batmon
      soulseekqt
      lm_sensors
      ffmpeg
    ]
    ++ [
      zen-browser.packages.${pkgs.system}.stable
    ];
}
