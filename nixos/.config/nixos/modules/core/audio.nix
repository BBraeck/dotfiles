{ config, pkgs, ... }:

{
  # Enable real-time kit (rtkit) for PipeWire to guarantee audio processing priority
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true; # Encompasses complete modern audio routing compatibility
  };

  # Install EasyEffects system-wide so it integrates natively with the PipeWire daemon
  environment.systemPackages = with pkgs; [
    easyeffects
  ];
}
