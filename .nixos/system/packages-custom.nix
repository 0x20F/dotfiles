{ pkgs ? import <nixpkgs> {} }:


{
	ix = pkgs.stdenv.mkDerivation {
	
		name = "ix";

		src = builtins.fetchGit {
			url = "https://github.com/0x20F/ix";
			ref = "master";
		};

		phases = "installPhase";

        buildInputs = with pkgs; [
          python3
        ];

		installPhase = with pkgs; ''
			mkdir -p $out/bin
		
			# Add the shebang for python
			echo '#!${ pkgs.coreutils }/bin/env ${ pkgs.python3 }/bin/python' >> $out/bin/ix

			# Add the rest of the script
			cat $src/ix.py >> $out/bin/ix

			# Make it executable
			chmod +x $out/bin/ix
		'';
	};


    # Jonaburg's fork of picom
    picom = pkgs.stdenv.mkDerivation {
      
      name = "picom";

      src = builtins.fetchGit {
        url = "https://github.com/jonaburg/picom";
        ref = "next";
      };

      phases = "buildPhase installPhase";

      nativeBuildInputs = with pkgs; [
        gcc
        gcc-arm-embedded
        cmake
        xorg.libxcb.dev libconfig libevdev uthash
        libev xorg.libX11 pkg-config xorg.xcbutilrenderutil
        xorg.xcbutilimage xorg.libXext pixman pcre.dev libGL
        dbus
        meson
        ninja
      ];

      buildPhase = ''
        cp -r $src/* .

        # Just follow the repo instructions
        meson --buildtype=release . build
        ninja -C build
      '';

      installPhase = ''
        mkdir -p $out/bin

        # Save the binary
        mv ./build/src/picom $out/bin
      '';
    };
}
