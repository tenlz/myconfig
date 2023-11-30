{ pkgs
, ...
}: {
  fonts = {
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk
      noto-fonts-emoji
      corefonts
      iosevka
      roboto
      source-serif-pro
    ];
  };
}
