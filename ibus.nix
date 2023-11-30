{ pkgs
, ...
}:
{
  i18n.inputMethod = {
    enabled = "ibus";
    ibus.engines = [
     pkgs.ibus-engines.rime
    ];
  };
}
