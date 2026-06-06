{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
      pi-coding-agent
      claude-code
      github-copilot-cli
  ];
}