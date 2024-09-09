{pkgs ? import <nixpkgs> {}}: let
  libs = with pkgs; [
  ];
in
  pkgs.mkShell {
    # LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath libs}";

    BOOST_INCLUDE = "${pkgs.boost.dev}/include";
    BOOST_LIB = "${pkgs.boost}/lib";

    RAYLIB_INCLUDE = "${pkgs.raylib}/include";
    RAYLIB_LIB = "${pkgs.raylib}/lib";

    ENTT_INCLUDE = "${pkgs.entt}/include";

    packages = with pkgs; [
      bear
      catch2
      clang
    ];

    shellHook = ''
    '';
  }
