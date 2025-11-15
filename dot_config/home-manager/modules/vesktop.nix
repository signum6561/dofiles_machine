{
  programs.vesktop = {
    enable = true;

    settings = {
      discordBranch = "stable";
      hardwareAcceleration = true;
      appBadge = false;
      arRPC = true;
      enableMenu = false;
      minimizeToTray = true;
      splashBackground = "#24273a";
      splashColor = "#cad3f5";
      splashTheming = true;
    };

    vencord.settings = {
      autoUpdate = false;
      autoUpdateNotification = false;
      notifyAboutUpdates = false;
      plugins = {
        FakeNitro.enabled = true;
        SilentTyping.enabled = true;
      };
    };
  };
}
