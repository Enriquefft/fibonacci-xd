{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
    flakelight-rust.url = "github:accelbread/flakelight-rust";

    fenix = {
      url = "github:nix-community/fenix/monthly";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };
  outputs = { flakelight, flakelight-rust, fenix, nixpkgs, ... }:

    flakelight ./. {

      inputs.nixpkgs = nixpkgs;

      withOverlays = [ fenix.overlays.default ];

      imports = [ flakelight-rust.flakelightModules.default ];

      devShell.packages = pkgs:
        with pkgs;
        [
          # (pkgs.fenix.complete.withComponents [
          #   "cargo"
          #   "clippy"
          #   "rust-src"
          #   "rustc"
          #   "rustfmt"
          # ])
          rust-analyzer-nightly

        ];

    };
}
