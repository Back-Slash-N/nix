{...}:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion = {
      enable = true;
      highlight = "fg=#c93c00,bold,underline";
      strategy = [ "completion" ];
    };
    oh-my-zsh = {
      enable = true;
      theme = "agnoster";
    };
    # bashrcExtra = "fastfetch";
  };
}
