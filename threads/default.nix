{pkgs ? import <nixpkgs> {}}: let
  libs = with pkgs; [
  ];
in
  pkgs.mkShell {
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath libs}";

    packages = with pkgs; [
      boost
      catch2
      clang
    ];

    shellHook = ''
    '';
  }
