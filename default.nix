{ pkgs ? import <nixpkgs> {} }:

let
  rEnv = pkgs.rWrapper.override {
    packages = with pkgs.rPackages; [
      tidyverse
      ggplot2
      Epi
      rmarkdown
      knitr
    ];
  };
in
pkgs.mkShell {
  buildInputs = [
    rEnv
    pkgs.quarto
    pkgs.dvc
  ];

  shellHook = ''
    echo "🌿 Mobility Health Observatory Nix Environment Loaded"
    export QUARTO_R="$(which R)"
    echo "Using R: $QUARTO_R"
    echo "Quarto version: $(quarto --version)"
  '';
}
