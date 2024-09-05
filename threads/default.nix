with import <nixpkgs> {}; let
  libs = with pkgs; [
  ];
in
  pkgs.mkShell {
    LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath libs}";

    buildInputs = [
      bear
      clang
    ];

    shellHook = ''
      # sed -i "s|/home/[^/]*|$HOME|g" compile_commands.json
    '';
  }
