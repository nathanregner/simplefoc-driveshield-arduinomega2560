{
  gnumake,
  makePlatformIOSetupHook,
  platformio,
  stdenv,
  python3,
}: let
  setupHook = makePlatformIOSetupHook {
    lockfile = ./platformio2nix.lock;
  };
in
  stdenv.mkDerivation {
    name = "simplefoc-driveshield-atmega2560";
    version = "0.0.0";
    src = ./.;
    nativeBuildInputs = [
      platformio
      setupHook
    ];

    buildPhase = ''
      pio run -t build
    '';
  }