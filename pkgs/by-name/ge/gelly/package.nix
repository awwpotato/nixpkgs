{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  glib,
  libadwaita,
  gst_all_1,
  nix-update-script,
}:
rustPlatform.buildRustPackage (finalAttrs: {
  pname = "gelly";
  version = "0.7.2";

  src = fetchFromGitHub {
    owner = "Fingel";
    repo = "gelly";
    rev = "v${finalAttrs.version}";
    hash = "sha256-98APzHnYpQtYDnFFrEvzeUcA2aNCxgIpSSaDBCzHOc0=";
  };

  cargoHash = "sha256-PA8sr0A7w8Vj3nNJWdmLivbi9yEbJdNaxCztFHNul34=";

  nativeBuiltInputs = [
    pkg-config
  ];

  buildInputs = [
    glib
    libadwaita
    gst_all_1.gstreamer
  ];

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Jellyfin client for Linux focused on music";
    homepage = "https://github.com/Fingel/gelly";
    license = lib.licenses.gpl3Only;
    maintainers = [ lib.maintainers.da157 ];
    mainProgram = "gelly";
  };
})
