{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
	package = pkgs.vscodium;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      dracula-theme.theme-dracula
      yzhang.markdown-all-in-one
      bbenoist.nix
	  pkgs.nix-vscode-extensions.open-vsx.jeanp413.open-remote-ssh
    ] ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
	    {
	      name = "vscript-snippets";
	      publisher = "Baptiste-Martinet";
	      version = "1.0.4";
	      sha256 = "jZ/h9nXaCz8cHcKKKFW6aevx6QdftfqBXungQ3CjwhU=";
	    }
	    {
	      name = "vscript-debug";
	      publisher = "LionDoge";
	      version = "0.2.7";
	      sha256 = "CXmSRIK+00bN0ONLuLeIgIMYeM3tqBJ7R6JhveIhv00=";
	    }
	    {
	      name = "vscode-electricimp";
	      publisher = "electricimp";
	      version = "1.0.0";
	      sha256 = "a23AfdrJTCQYj7vJCDYwdxe7MvoTfH8bGVjB92ktp7w=";
	    }
	    {
	      name = "better-comments";
	      publisher = "aaron-bond";
	      version = "3.0.2";
	      sha256 = "hQmA8PWjf2Nd60v5EAuqqD8LIEu7slrNs8luc3ePgZc=";
	    }
    ];

    profiles.default.userSettings = {
      "files.autoSave" = "onFocusChange";
	  "editor.selectionClipboard" = false;
	  "editor.tabSize" = 2;
    };
  };

  home.file.".config/Code/User/snippets/" = {
	source = ./code-snippets;
	recursive = true;
  };
}
