{ config, lib, pkgs, ... }:

with lib;

{
  meta.maintainers = [ maintainers.szczyp ];

  ###### interface
  options = {
    programs.ddcutil = {
      enable = mkOption {
        default = false;
        example = true;
        type = types.bool;
        description = ''
          Whether to configure system to use ddcutil.
          To grant i2c access to a user, the user must
          be part of the i2c group:
          <code>users.extraUsers.alice.extraGroups = ["i2c"];</code>
        '';
      };
    };
  };

  ###### implementation
  config = mkIf config.programs.ddcutil.enable {
    boot.kernelModules = [ "i2c-dev" ];
    services.udev.packages = [ pkgs.ddcutil ];
    environment.systemPackages = [ pkgs.ddcutil ];
    users.extraGroups.i2c = {};
  };
}
