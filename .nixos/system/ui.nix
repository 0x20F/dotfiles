{ config, pkgs, ... }:

let 
  nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
    export __NV_PRIME_RENDER_OFFLOAD=1
    export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
    export __GLX_VENDOR_LIBRARY_NAME=nvidia
    export __VK_LAYER_NV_optimus=NVIDIA_only
    exec -a "$0" "$@"
  '';
in
{
    environment.systemPackages = [ nvidia-offload ];    

    environment.variables = {
      GDK_SCALE = "1";
      GDK_DPI_SCALE = "0.7";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      XCURSOR_SIZE = "64";
    };

	# Enable the X11 windowing system
	services.xserver = {
		enable = true;
		autorun = true;
		
		layout = "se";		

		autoRepeatDelay = 200;
		autoRepeatInterval = 25;

		desktopManager = {
			xterm.enable = false;
        };

        displayManager = {
          defaultSession = "none+bspwm";

          lightdm.greeters.gtk.cursorTheme = {
            name = "Vanilla-DMZ";
            package = pkgs.vanilla-dmz;
            size = 64;
          };
        };

		windowManager.bspwm.enable = true;

		libinput.enable = true;

        dpi = 290;

        videoDrivers = [ "nvidia" ];
    };

    
    hardware.cpu.intel.updateMicrocode = config.hardware.enableRedistributableFirmware;
    hardware.opengl.driSupport32Bit = true;
    hardware.opengl.enable = true;
    hardware.opengl.extraPackages = with pkgs; [
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      intel-media-driver
    ];
    hardware.nvidia.powerManagement.enable = true;
    hardware.nvidia.prime = {
      offload.enable = true;

      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };

	# Enable sound.
	sound.enable = true;
	hardware.pulseaudio.enable = true;
}
