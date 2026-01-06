{ pkgs, lib, inputs, ... }:
{

  imports = [
    inputs.nixcord.homeModules.nixcord
    ./slasher.nix
  ];

  # vencord theme
  home.file = {
    ".config/equibop/themes" = {
      source = ./theme;
      recursive = true;
    };
  };

  programs.nixcord = {
    enable = true;  # enable Nixcord. Also installs discord package
    discord.enable = false;
    equibop.enable = true;
    equibop.autoscroll.enable = true;

    equibopConfig = {
      # themeLinks = [
      #   "https://raw.githubusercontent.com/Xhylo/Visual-Studio-Code-BD-theme/main/VSC-Cord.theme.css"
      # ];
      enabledThemes = [
        "source.css"
        # "betterusertags.theme.css"
        # "pingedserversfirst.theme.css"
        # "randomfixes.theme.css"
        # "shadows.theme.css"
        # "profilepopout.css"
        # "sidebarcat.css"
        # "transparentfixes.css"
      ];

      plugins = {
        betterGifPicker.enable = true;
        betterSessions.enable = true;
        hideMedia.enable = true;
        ignoreTerms.enable = true;
        blurNSFW.enable = true;
        noNitroUpsell.enable = true;
        reviewDB.enable = true;
        soundBoardLogger.enable = true;
        voiceMessages.enable = true;
        whosWatching.enable = true;
        youtubeDescription.enable = true;
        toneIndicators.enable = true;
        splitLargeMessages.enable = true;
        reverseImageSearch.enable = true;
        neverPausePreviews.enable = true;
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
        imageLink.enable = true;
        implicitRelationships.enable = true;
        memberCount.enable = true;
        mentionAvatars.enable = true;
        messageLinkEmbeds.enable = true;
        messageTags.enable = true;
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
        viewIcons.enable = true;
        voiceDownload.enable = true;
        volumeBooster.enable = true;
        whoReacted.enable = true;
        youtubeAdblock.enable = true;
        webRichPresence.enable = true;
        webScreenShareFixes.enable = true;
        sendTimestamps.enable = true;

        messageLoggerEnhanced = {
          enable = true;
          saveImages = true;
          ShowWhereMessageIsFrom = true;
          messageLimit = 0;
          cacheLimit = 0;
          attachmentSizeLimitInMegabytes = 0;
          attachmentFileExtensions = "";
        };

        vcNarrator = {
          enable = true;
          voice = "English (America)+David espeak-ng";
        };

        customIdle = {
          enable = true;
          idleTimeout = 0.0;
        };

        openInApp = {
          enable = true;
        };
        
        noPendingCount =  {
          enable = true;
          hideFriendRequestsCount = false;
        };
      };
      transparent = true;
    };
  };

  services.arrpc.enable = true;
}
