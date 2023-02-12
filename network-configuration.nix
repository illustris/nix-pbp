{ pkgs, ... }: {
	environment.systemPackages = with pkgs; [
		arping
		arp-scan
		bmon
		iftop
		iperf3
		nethogs
		networkmanager
		tcpdump
	];
	networking = {
		hostName = "pbp";
		# hostId = "d25c46cd"; # needed by ZFS, not networking
		networkmanager.enable = true;
		# firewall = {
		# 	enable = true;
		# };
		wireless.enable = false;
	};
	programs.mtr.enable = true;
}
