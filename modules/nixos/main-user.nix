{lib, config, pkgs, ... }:

let
  conUser = config.main-user;
in
{
  options.main-user = {
    enable
      = lib.mkEnableOption "enable user module";

    userName = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };
  };

  config = lib.mkIf conUser.enable {
    users.users.${conUser.userName} = {
      isNormalUser = true;
      initialPassword = "F!$hN!*24";
      extraGroups = [ "networkmanager" "wheel" ];
    };
  };
}
