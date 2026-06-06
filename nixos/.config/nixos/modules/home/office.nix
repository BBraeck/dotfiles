{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wpsoffice            # Comprehensive office suite
    evince               # PDF viewer
    pdftk                # PDF manipulation tool
    zotero               # Reference manager
    obsidian             # Knowledge base and note-taking app
  ];
}