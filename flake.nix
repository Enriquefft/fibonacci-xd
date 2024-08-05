{
  inputs = {
    nixpkgs.url = "nixpkgs/nixpkgs-unstable";
    flakelight.url = "github:nix-community/flakelight";
    flakelight-rust.url = "github:accelbread/flakelight-rust";
  };
  outputs = { flakelight, flakelight-rust, nixpkgs, ... }:
    flakelight ./. {

      inputs.nixpkgs = nixpkgs;

      imports = [ flakelight-rust.flakelightModules.default ];

    };
}
