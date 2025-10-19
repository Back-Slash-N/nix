{ pkgs, ... }:
{
  home.packages = with pkgs; [
    mprisence # Music Discord RPC.
  ];

  home.file.".config/mprisence/config.toml" = {
    text = ''
      clear_on_pause = false
      interval = 2000

      [template]
      detail = "{{{title}}}"
      state = "{{{artist_display}}}"
      large_text = "{{#if album}}{{{album}}}{{#if year}} ({{{year}}}){{/if}}{{#if album_artist_display}} by {{{album_artist_display}}}{{/if}}{{/if}}"
      small_text = "{{#if player}}Playing on {{{player}}}{{else}}MPRIS{{/if}}"

      [time]
      show = true
      as_elapsed = false

      [activity_type]
      use_content_type = true
      default = "listening"

      [cover]
      file_names = ["cover", "folder", "front", "album", "art"]
      local_search_depth = 2

      [cover.provider]
      provider = ["musicbrainz", "imgbb"]

      [cover.provider.imgbb]
      expiration = 86400

      [cover.provider.musicbrainz]
      min_score = 95

      [player]
      default = { ignore = false, app_id = "1121632048155742288", icon = "https://raw.githubusercontent.com/lazykern/mprisence/main/assets/icon.png", show_icon = false, allow_streaming = false }

      [player.supersonic]
      app_id = "1404479711106568202"
      icon = "https://github.com/dweymouth/supersonic/blob/main/res/appicon-256.png?raw=true"
    '';
  };
}
