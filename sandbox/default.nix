{pkgs ? import <nixpkgs> {}}:
pkgs.mkShell {
  packages = with pkgs; [
    bear
    catch2
    clang
  ];

  shellHook = ''
  '';
}
