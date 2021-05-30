{ pkgs ? import <nixpkgs> {} }:


{
	ix = pkgs.stdenv.mkDerivation {
	
		name = "ix";

		src = builtins.fetchGit {
			url = "https://github.com/0x20F/ix";
			ref = "master";
		};

		phases = "installPhase";

		installPhase = ''
			mkdir -p $out/bin
		
			# Add the shebang for python
			echo '#!/usr/bin/env python' >> $out/bin/ix

			# Add the rest of the script
			cat $src/ix.py >> $out/bin/ix

			# Make it executable
			chmod +x $out/bin/ix
		'';
	};

}
