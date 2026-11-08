{ config, pkgs, ... }:

{
  home.username = "aquanull";
  home.homeDirectory = "/home/aquanull";

  home.stateVersion = "26.05";

  home.packages = [
    pkgs.hello
  ];

  home.file = {
    
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      settings = {
        user = {
	  name = "aquaNull-fish";
          email = "aquanull-fish@pm.me";
	};
        init.defaultBranch = "main";
	safe.directory = "/etc/nixos";
      };
    };
  };
}
