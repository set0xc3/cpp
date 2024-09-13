{pkgs ? import <nixpkgs> {}}: let
in
  pkgs.stdenv.mkDerivation rec {
    pname = "chord";
    version = "0.1.0";

    buildInputs = with pkgs; [
      cmake
    ];

    configurePhase = ''
      cmake -S . -B build && cmake --build build -j$(nproc)
    '';
  }
