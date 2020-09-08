{ pkgs, configTxt, firmware ? pkgs.raspberrypifw }:

pkgs.substituteAll {
  src = ./raspberrypi-builder.sh;
  isExecutable = true;

  checkPhase = "shellcheck $out";
  checkInputs = [ pkgs.buildPackages.shellcheck ];
  doCheck = false;

  inherit (pkgs) bash;
  path = [pkgs.coreutils pkgs.gnused pkgs.gnugrep];
  inherit firmware configTxt;
}
