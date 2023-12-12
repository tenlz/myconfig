{ config, pkgs, ... }:

{

  # 注意修改这里的用户名与用户目录
  home.username = "shmily";
  home.homeDirectory = "/home/shmily";

  # 直接将当前文件夹的配置文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # 递归将某个文件夹中的文件，链接到 Home 目录下的指定位置
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # 递归整个文件夹
  #   executable = true;  # 将其中所有文件添加「执行」权限
  # };

  # 直接以 text 的方式，在 nix 配置文件中硬编码文件内容
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # git 相关配置
  programs.git = {
    enable = true;
    userName = "tenlz";
    userEmail = "shmily@gmail.com";
  };

  # 通过 home.packages 安装一些常用的软件
  # 这些软件将仅在当前用户下可用，不会影响系统级别的配置
  # 建议将所有 GUI 软件，以及与 OS 关系不大的 CLI 软件，都通过 home.packages 安装
  home.packages = with pkgs;[
    # 如下是我常用的一些命令行工具，你可以根据自己的需要进行增删
    neofetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb
    
    ruby
    duf    
    
    #gui
    google-chrome
    mpv
    ffmpeg
    gimp-with-plugins
    inkscape
    jellyfin-media-player
    obsidian
    mkvtoolnix
    discord
    upscayl
    libreoffice-fresh
    goldendict-ng
    telegram-desktop   
  ];

  # 启用 starship，这是一个漂亮的 shell 提示符
  programs.starship = {
    enable = true;
    # 自定义配置
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO 在这里添加你的自定义 bashrc 内容
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # TODO 设置一些别名方便使用，你可以根据自己的需要进行增删
    shellAliases = {
      k = "kubectl";
      upgrade = "cd /home/shmily/myconfig && nix flake update && sudo nixos-rebuild switch --flake .#nixos";
    };
  };
    
  programs.fish = {
    enable = true;
    shellAbbrs = {
      gc1 = "git clone --depth=1 ";
      upgrade = "cd /home/shmily/myconfig && nix flake update && sudo nixos-rebuild switch --flake .#nixos";
    };
  };

  dconf.settings = {
      "org/gnome/desktop/interface".color-scheme = "default";
      "org/gnome/desktop/interface".cursor-theme = "Yaru";
      "org/gnome/desktop/interface".gtk-theme = "adw-gtk3-dark";
      "org/gnome/desktop/interface".icon-theme = "Yaru-dark";
      "org/gnome/desktop/interface".font-name = "Roboto 11";
      "org/gnome/desktop/interface".document-font-name = "Roboto 11";
      "org/gnome/desktop/interface".monospace-font-name = "Iosevka 10";
      "org/gnome/desktop/wm/preferences".titlebar-font = "Roboto Bold 11";
      "org/gnome/shell" = {
      favorite-apps = [
                       "org.gnome.Console.desktop"
                       "google-chrome.desktop" 
                       "org.gnome.Nautilus.desktop" 
                       "com.github.iwalton3.jellyfin-media-player.desktop" 
                       "obsidian.desktop"
                       "virt-manager.desktop"
                       ];
      disable-user-extensions = false;

      # `gnome-extensions list` for a list
      enabled-extensions = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "gsconnect@andyholmes.github.io"
        "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "clipboard-indicator@tudmotu.com"
        "customize-ibus@hollowman.ml"
        "gnome-fuzzy-app-search@gnome-shell-extensions.Czarlie.gitlab.com"
        "user-theme@gnome-shell-extensions.gcampax.github.com"

      ];
                    };
    };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
    extraConfig = ''
      " NOTE: For some reason these settings don't have any affect if configured
      " in lua

      ${builtins.readFile ./nvim_deaults.vim}
      lua << EOF
        ${builtins.readFile ./nvim_deaults.lua}
      EOF
    '';
};
      
 
  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "23.11";

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
