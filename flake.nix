{
  description = "Idris Example Project";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-parts,
      ...
    }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "aarch64-darwin"
	"aarch64-linux"
	"x86_64-darwin"
	"x86_64-linux"
      ];

      perSystem =
        {
	  system,
	  pkgs,
	  ...
	}:
	{
	  devShells.default = pkgs.mkShell {
	    packages = with pkgs; [
	      idris2
	      idris2Packages.idris2Lsp
	    ];
	  };
	};
    };
}
