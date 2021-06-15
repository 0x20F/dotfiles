let 
  pkgs = import <nixpkgs> {};

in pkgs.mkShell {
  shellHook = with pkgs; ''
    ${pkgs.figlet}/bin/figlet -f slant "Rust"
    date

    export CURRENT_ENVIRONMENT="rust"
  '';

  buildInputs = with pkgs; [
    cargo
    rustc
    rustfmt

    openssl
    pkg-config
  ];
}
