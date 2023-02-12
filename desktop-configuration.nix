{pkgs, ...}: {
	nixpkgs.overlays = [
		(import ./st-overlay.nix)
		(import ./dwm-overlay.nix)
	];

	fonts.fonts = with pkgs; [
		(nerdfonts.override { fonts = [ "DroidSansMono" ]; })
	];

	services = {
		xserver = {
			enable = true;

			# breaks touch input if enabled
			wacom.enable = true;

			# Touchpad
			libinput.enable = true;

			displayManager = {
				defaultSession = "none+dwm";
			};

			windowManager = {
				# i3 = {
				# 	enable = true;
				# 	package = pkgs.i3-gaps;
				# 	configFile = pkgs.writeText "i3.conf" (builtins.readFile ./conf_files/i3.conf);
				# };
				dwm = {
					enable = true;
				};
			};
		};
		# picom = {
		# 	enable = true;
		# 	vSync = true;
		# 	backend = "glx";
		# };
	};

	environment.systemPackages = with pkgs; [ st ];

	# services = {
	# 	zerotierone.enable = true;
	# 	resolved.enable = true;
	# };

	# systemd.user.services = {
	# 	# guake = {
	# 	#	enable = true;
	# 	#	description = "Guake terminal";
	# 	#	serviceConfig = {
	# 	#		Type = "simple";
	# 	#		ExecStart = "${pkgs.guake}/bin/guake";
	# 	#		Restart = "always";
	# 	#	};
	# 	#	after = [ "dbus.service" ];
	# 	# };
	# 	picom.bindsTo = [ "graphical-session.target" ];
	# };

	# hardware.pulseaudio = {
	# 	enable = true;
	# 	# extraModules = [ pkgs.pulseaudio-modules-bt ];
	# 	package = pkgs.pulseaudioFull;
	# };
}
