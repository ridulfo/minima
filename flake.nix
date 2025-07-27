{
  inputs.nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

  outputs = { self, nixpkgs }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
      pkgsForSystem = system: import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
    in
    {
      devShells = forAllSystems (system:
        let pkgs = pkgsForSystem system;
        in {
          default = pkgs.mkShell {
            packages = with pkgs; [
              zsh
              zig
              e2fsprogs
            ];

            shellHook = ''
              export SHELL=${pkgs.zsh}/bin/zsh
              PS1="[devshell] $PS1"  # Prepend [devshell] to the prompt
              exec ${pkgs.zsh}/bin/zsh
            '';
          };
        }
      );
    };
}
