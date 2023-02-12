{
	description = "pbp nixos config";
	inputs.nixpkgs.url = "github:nixos/nixpkgs/724bfc0892363087709bd3a5a1666296759154b1";

	outputs = { self, nixpkgs }: {
		nixosConfigurations.pbp = nixpkgs.lib.nixosSystem {
			system = "aarch64-linux";
			modules = [
				"${nixpkgs}/nixos/modules/installer/sd-card/sd-image-aarch64-installer.nix"
				./configuration.nix
				./desktop-configuration.nix
				./network-configuration.nix
			];
		};
	};
}
