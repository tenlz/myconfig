{ pkgs, ... }:

{
    programs.neovim = {
    enable = true;
    withPython3 = true;
    withNodeJs = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;
  };

}
