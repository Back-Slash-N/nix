{pkgs, lib, ...}:
{

  imports = [
    ./slasher.nix
  ];

  # vencord theme
  home.file = {
    ".config/vesktop/themes" = {
      source = ./theme;
      recursive = true;
    };
  };

  programs.nixcord = {
    enable = true;  # enable Nixcord. Also installs discord package
    vesktop.enable = true;
    config = {
      # themeLinks = [
      #   "https://raw.githubusercontent.com/Xhylo/Visual-Studio-Code-BD-theme/main/VSC-Cord.theme.css"
      # ];
      enabledThemes = [
        "source.css"
        "betterusertags.theme.css"
        "pingedserversfirst.theme.css"
        "randomfixes.theme.css"
        "shadows.theme.css"
      ];
      plugins = {
        betterGifPicker.enable = true;
        betterSessions.enable = true;
        callTimer.enable = true;
        clearURLs.enable = true;
        disableCallIdle.enable = true;
        experiments.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        fixCodeblockGap.enable = true;
        fixImagesQuality.enable = true;
        fixSpotifyEmbeds.enable = true;
        fixYoutubeEmbeds.enable = true;
        forceOwnerCrown.enable = true;
        friendInvites.enable = true;
        friendsSince.enable = true;
        gameActivityToggle.enable = true;
        gifPaste.enable = true;
        greetStickerPicker.enable = true;
        hideAttachments.enable = true;
        imageLink.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLinkEmbeds.enable = true;
        messageLogger.enable = true;
        moreCommands.enable = true;
        messageTags.enable = true;
        moreUserTags.enable = true;
        mutualGroupDMs.enable = true;
        noOnboardingDelay.enable = true;
        noReplyMention.enable = true;
        noUnblockToJump.enable = true;
        normalizeMessageLinks.enable = true;
        onePingPerDM.enable = true;
        pauseInvitesForever.enable = true;
        permissionFreeWill.enable = true;
        permissionsViewer.enable = true;
        pictureInPicture.enable = true;
        pinDMs.enable = true;
        platformIndicators.enable = true;
        previewMessage.enable = true;
        userMessagesPronouns.enable = true;
        relationshipNotifier.enable = true;
        revealAllSpoilers.enable = true;
        serverInfo.enable = true;
        serverListIndicators.enable = true;
        shikiCodeblocks.enable = true;
        showAllMessageButtons.enable = true;
        showConnections.enable = true;
        showHiddenChannels.enable = true;
        showHiddenThings.enable = true;
        showMeYourName.enable = true;
        showTimeoutDuration.enable = true;
        silentMessageToggle.enable = true;
        spotifyCrack.enable = true;
        stickerPaste.enable = true;
        translate.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        unindent.enable = true;
        unsuppressEmbeds.enable = true;
        userVoiceShow.enable = true;
        validReply.enable = true;
        validUser.enable = true;
        vcNarrator.enable = true;
        viewIcons.enable = true;
        voiceDownload.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        webRichPresence.enable = true;
        webScreenShareFixes.enable = true;

        customIdle = {
          enable = true;
          idleTimeout = 0.0;
        };

        openInApp = {
          enable = true;
          steam = true;
          spotify = false;
          epic = false;
          tidal = false;
          itunes = false;
        };
        
        noPendingCount =  {
          enable = true;
          hideFriendRequestsCount = false;
          hideMessageRequestCount = false;
        };
      };
      transparent = true;
    };
  };

  services.arrpc.enable = true;
}
