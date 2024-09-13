{pkgs ? import <nixpkgs> {}}: let
  libs = with pkgs; [
  ];

  # sokol = pkgs.sokol.overrideAttrs (oldAttrs: {
  #   version = "unstable-2024";
  #   src = pkgs.fetchFromGitHub {
  #     owner = "floooh";
  #     repo = "sokol";
  #     rev = "1eb96dd0f96b9ea73065f9078244c2255c2b75d9";
  #     sha256 = "sha256-TsM5wK9a2ectrAY8VnrMPaxCNV3e1yW92SBBCHgs+0k=";
  #   };
  # });

	nixosConfigPath = builtins.getEnv "NIXOS_CONFIG";

  bgfx = pkgs.callPackage "${nixosConfigPath}/pkgs/development/libraries/bgfx" {};
in
  pkgs.mkShell {
    # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath libs}";

    BOOST_INCLUDE = "${pkgs.boost.dev}/include";
    BOOST_LIB = "${pkgs.boost}/lib";

    BGFX_INCLUDE = "${bgfx}/include";

    ENTT_INCLUDE = "${pkgs.entt}/include";

    packages = with pkgs; [
      bear
      catch2
      clang
    ];

    shellHook = ''
    '';
  }
