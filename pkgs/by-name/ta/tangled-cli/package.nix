{
  lib,
  rustPlatform,
  fetchgit,
  pkg-config,
  openssl,
}:
rustPlatform.buildRustPackage {
  name = "tangled-cli";
  version = "0-unstable-2025-10-18";

  src = fetchgit {
    url = "https://tangled.org/vitorpy.com/tangled-cli";
    rev = "2950b681afe0312b4e6cfa1e0fe1496a4612b247";
    hash = "sha256-4fYysFuv4bvWGg1AXQ7Cd+PTTiWrMMGeLZdUY5r2nwM=";
  };

  cargoHash = "sha256-giqpVvnJqj1G1heidfmGKIoiJ6DSBACWoiQyIvD0id0=";

  nativeBuildInputs = [ pkg-config ];

  buildInputs = [ openssl ];

  meta = {
    homepage = "https://tangled.org/vitorpy.com/tangled-cli";
    description = "Rust CLI for tangled";
    license = with lib.licenses; [
      mit
      asl20
    ];
    maintainers = [ lib.maintainers.da157 ];
    mainProgram = "tangled";
  };
}
