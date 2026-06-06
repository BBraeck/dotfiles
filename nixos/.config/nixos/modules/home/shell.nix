{ config, pkgs, ... }:

{
  # Enable the lightning-fast Starship prompt
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  # Declarative Zsh configuration
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    
    # Custom aliases to keep your terminal efficient
    shellAliases = {
      ll = "ls -lah";
      v = "nvim";
      g = "git";
      y = "yazi";
    };
  };

  # Custom Terminal Multiplexer layout
  programs.tmux = {
    enable = true;
    clock24 = true;
    keyMode = "vi"; # Enables ultra-fast vim keys for navigating buffers
    shortcut = "a"; # Changes prefix shortcut from Ctrl-b to Ctrl-a (Community favorite)
  };
}
