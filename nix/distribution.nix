{
  inputs,
  self,
  ...
}: {
  perSystem = {
    lib,
    pkgs,
    ...
  }: {
    packages = let
      ourPackages = lib.fix (final: self.overlays.default final pkgs);
    in {
      inherit
        (ourPackages)
        shatteredprism-unwrapped
        shatteredprism
        ;
      default = ourPackages.shatteredprism;
    };
  };

  flake = {
    overlays.default = final: prev: let
      version = builtins.substring 0 8 self.lastModifiedDate or "dirty";
    in {
      shatteredprism-unwrapped = prev.callPackage ./pkg {
        inherit (inputs) libnbtplusplus;
        inherit version;
      };

      shatteredprism = prev.qt6Packages.callPackage ./pkg/wrapper.nix {
        inherit (final) shatteredprism-unwrapped;
      };
    };
  };
}
