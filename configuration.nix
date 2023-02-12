{ config, pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		tmux
	];
	time.timeZone = "Asia/Kolkata";
	security.sudo.wheelNeedsPassword = false;
	users.users = let
		keys = pkgs.fetchurl {
			url = "https://github.com/illustris.keys";
			hash = "sha256-Ue0orizAxflXASj3C4+UJ6mcJUmzeSiipls+7D2CKqE=";
		};
	in {
		illustris = {
			isNormalUser = true;
			extraGroups = [ "wheel" "kvm" "docker" "libvirtd" "adbusers" "audio" "vboxusers" "networkmanager" "dialout" "plugdev" ];
			openssh.authorizedKeys.keyFiles = [ keys ];
		};
		root.openssh.authorizedKeys.keyFiles = [ keys ];
	};
	nix = {
		nixPath = [ "nixpkgs=${pkgs.path}" ];
		settings = {
			auto-optimise-store = true;
			experimental-features = [ "nix-command" "flakes" ];
			trusted-users = [ "root" "illustris" ];
		};
	};
	programs.mosh.enable = true;
	services = {
		openssh = {
			enable = true;
			forwardX11 = true;
		};
	};
	system.stateVersion = "23.05";
}
