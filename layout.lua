{
  -- ============================================================================
  -- LAUNCHER SCREEN  (redesigned: iOS-style minimal)
  -- ----------------------------------------------------------------------------
  -- WHAT CHANGED vs the old version
  --   * Neon green/red "cyber" theme  ->  iOS dark palette (see main.lua for the
  --     full list of colours and the type scale).
  --   * Big drop shadows (CardElevation 5dp) removed; iOS separates layers with
  --     flat fills + generous spacing instead.
  --   * Corner radius standardised: 12dp small cards, 16dp big cards.
  --   * One clear type hierarchy: 28sp bold title, 17sp button labels,
  --     15sp card titles, 11sp secondary labels, 9sp footer.
  --   * Quick actions became a single "list" of 56dp rows (like iOS Settings)
  --     instead of four tall 62dp cards with big empty icon bubbles.
  --   * Padding/spacing now follows an 8dp grid (20dp screen margin, 8dp gaps).
  --   * FIX: every textStyle="bold" was deleted. AndLua's layout loader has no
  --     setTextStyle(), so it printed
  --       "TextView@setTextStyle is not a field or method"
  --     for each one and then ignored it - the text was never actually bold.
  --     Bold is now applied from Lua: see applyTypography() in main.lua.
  --     (Same reason letterSpacing cannot be used here either.)
  --
  -- HOW TO EDIT
  --   * Colours/sizes ... edit the values inline here; the tokens are documented
  --                      at the top of main.lua.
  --   * Add a row ....... copy one of the CardView blocks in "QUICK ACTIONS" and
  --                      give it a new id, then add id.onClick() in main.lua.
  --   * Change the font .. see applyTypography() in main.lua.
  --
  -- IMPORTANT: every id= below is used by main.lua (start.onClick, stop.onClick,
  -- game.onClick, tg.onClick, tg1.onClick, ...). Renaming one breaks the handler.
  -- ============================================================================
  FrameLayout;
  layout_width="fill";
  layout_height="fill";
  backgroundColor="0xFF000000"; -- iOS dark base (was translucent 0x55030806)

  {
    -- Optional animated background. Nothing in main.lua plays it yet - add a
    -- MediaPlayer in main.lua if you want motion behind the UI.
    VideoView;
    layout_height="fill";
    layout_width="fill";
    id="video";
  };

  {
    -- Main content column. padding 20dp = the iOS screen margin.
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    padding="20dp";
    -- Soft dim layer (40% black) so white text stays readable if the video
    -- above is ever used. Set it to "0x00000000" for a completely clear glass look.
    backgroundColor="0x66000000";

    {
      -- Header section with title and status
      LinearLayout;
      layout_width="fill";
      layout_height="wrap";
      orientation="vertical";
      layout_marginBottom="16dp";

      {
        -- App title row
        LinearLayout;
        layout_width="fill";
        layout_height="wrap";
        orientation="horizontal";
        gravity="center_vertical";
        layout_marginBottom="12dp";

        {
          -- Title text (iOS uses SF Pro style - clean, medium weight)
          TextView;
          id="title";
          text="KIRO PRIVATE";
          textColor="0xFFFFFFFF";
          textSize="28sp";
          layout_width="wrap";
          layout_height="wrap";
          -- NOTE: letter spacing is applied from Lua (applyTypography in
          -- main.lua) because the layout parser here does not support it.
        };

        {
          -- Version badge (iOS-style pill badge)
          CardView;
          layout_width="wrap";
          layout_height="24dp";
          radius="12dp";
          CardElevation="0dp";
          CardBackgroundColor="0xFF1C1C1E"; -- iOS secondary system background
          layout_marginLeft="12dp";
          layout_gravity="center_vertical";

          {
            TextView;
            id="statusDot";
            text="V1.6.57";
            textColor="0xFF30D158";
            textSize="11sp";
            -- font weight is set in main.lua -> applyTypography()
            gravity="center";
            layout_width="wrap";
            layout_height="fill";
            paddingLeft="10dp";
            paddingRight="10dp";
          };
        };
      };

      {
        -- Subtitle/status row
        LinearLayout;
        layout_width="fill";
        layout_height="wrap";
        orientation="horizontal";
        gravity="center_vertical";

        {
          -- Status indicator dot
          TextView;
          id="statusIcon";
          text="●";
          textColor="0xFF30D158";
          textSize="8sp";
          layout_width="wrap";
          layout_height="wrap";
        };

        {
          TextView;
          id="statusText";
          text="SYSTEM READY";
          textColor="0xFF8E8E93"; -- iOS tertiary label color
          textSize="11sp";
            -- font weight is set in main.lua -> applyTypography()
          layout_width="wrap";
          layout_height="wrap";
          layout_marginLeft="6dp";
        };

        {
          -- Spacer
          Space;
          layout_width="0dp";
          layout_height="wrap";
          layout_weight="1";
        };

        {
          TextView;
          id="version";
          text="PREMIUM • PRIVATE BUILD";
          textColor="0xFF636366"; -- iOS quaternary label
          textSize="10sp";
          gravity="right|center_vertical";
          layout_width="wrap";
          layout_height="wrap";
        };
      };
    };

    {
      -- Action buttons row (START/STOP) - iOS style card buttons
      LinearLayout;
      layout_width="fill";
      layout_height="wrap";
      orientation="horizontal";
      layout_marginBottom="20dp";

      {
        -- START button - iOS green accent
        CardView;
        id="start";
        layout_width="0dp";
        layout_height="110dp";
        layout_weight="1";
        layout_marginRight="8dp";
        radius="16dp"; -- iOS standard corner radius
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E"; -- iOS card background
        layout_gravity="center";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="vertical";
          gravity="center";
          padding="16dp";

          {
            -- Icon container
            CardView;
            layout_width="48dp";
            layout_height="48dp";
            radius="24dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFF30D158"; -- iOS green accent
            layout_gravity="center";

            {
              ImageView;
              src="icon/start.png";
              layout_width="24dp";
              layout_height="24dp";
              layout_gravity="center";
              colorFilter="0xFF000000"; -- Black icon on green
            };
          };

          {
            TextView;
            id="strt";
            text="START";
            textColor="0xFF30D158";
            textSize="17sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="10dp";
          };

          {
            TextView;
            id="strttxt";
            text="Activate Injector";
            textColor="0xFF8E8E93";
            textSize="11sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };
      };

      {
        -- STOP button - iOS red accent
        CardView;
        id="stop";
        layout_width="0dp";
        layout_height="110dp";
        layout_weight="1";
        layout_marginLeft="8dp";
        radius="16dp";
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E";
        layout_gravity="center";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="vertical";
          gravity="center";
          padding="16dp";

          {
            CardView;
            layout_width="48dp";
            layout_height="48dp";
            radius="24dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFFFF453A"; -- iOS red accent
            layout_gravity="center";

            {
              ImageView;
              src="icon/stop.png";
              layout_width="24dp";
              layout_height="24dp";
              layout_gravity="center";
              colorFilter="0xFFFFFFFF";
            };
          };

          {
            TextView;
            id="stp";
            text="STOP";
            textColor="0xFFFF453A";
            textSize="17sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="10dp";
          };

          {
            TextView;
            id="stptxt";
            text="Deactivate Injector";
            textColor="0xFF8E8E93";
            textSize="11sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };
      };
    };

    {
      -- Section header
      TextView;
      id="quickTitle";
      text="QUICK ACTIONS";
      textColor="0xFF8E8E93"; -- iOS secondary label
      textSize="11sp";
      layout_width="wrap";
      layout_height="wrap";
      layout_marginLeft="4dp";
      layout_marginBottom="10dp";
    };

    {
      -- Quick action cards - iOS list style
      LinearLayout;
      layout_width="fill";
      layout_height="wrap";
      orientation="vertical";
      layout_marginBottom="16dp";

      {
        -- Direct Game card
        CardView;
        id="game";
        layout_width="fill";
        layout_height="56dp";
        radius="12dp";
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E";
        layout_marginBottom="8dp";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="horizontal";
          gravity="center_vertical";
          paddingLeft="16dp";
          paddingRight="16dp";

          {
            -- Icon container
            CardView;
            layout_width="40dp";
            layout_height="40dp";
            radius="10dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFF30D158";
            layout_gravity="center";

            {
              ImageView;
              src="icon/game-console.png";
              layout_width="22dp";
              layout_height="22dp";
              layout_gravity="center";
              colorFilter="0xFF000000";
            };
          };

          {
            LinearLayout;
            layout_width="0dp";
            layout_height="wrap";
            layout_weight="1";
            orientation="vertical";
            layout_marginLeft="14dp";

            {
              TextView;
              id="gametxt";
              text="Launch Game";
              textColor="0xFFFFFFFF";
              textSize="15sp";
            -- font weight is set in main.lua -> applyTypography()
              layout_width="wrap";
              layout_height="wrap";
            };

            {
              TextView;
              id="gameSub";
              text="Open CODM directly";
              textColor="0xFF8E8E93";
              textSize="11sp";
              layout_width="wrap";
              layout_height="wrap";
              layout_marginTop="1dp";
            };
          };

          {
            ImageView;
            src="icon/arrow.png";
            layout_width="20dp";
            layout_height="20dp";
            colorFilter="0xFF3A3A3C"; -- iOS separator color
            layout_gravity="center";
          };
        };
      };

      {
        -- Telegram card
        CardView;
        id="tg";
        layout_width="fill";
        layout_height="56dp";
        radius="12dp";
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E";
        layout_marginBottom="8dp";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="horizontal";
          gravity="center_vertical";
          paddingLeft="16dp";
          paddingRight="16dp";

          {
            CardView;
            layout_width="40dp";
            layout_height="40dp";
            radius="10dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFF0A84FF"; -- iOS blue accent
            layout_gravity="center";

            {
              ImageView;
              src="icon/telegram.png";
              layout_width="22dp";
              layout_height="22dp";
              layout_gravity="center";
              colorFilter="0xFFFFFFFF";
            };
          };

          {
            LinearLayout;
            layout_width="0dp";
            layout_height="wrap";
            layout_weight="1";
            orientation="vertical";
            layout_marginLeft="14dp";

            {
              TextView;
              id="tgTitle";
              text="Telegram Channel";
              textColor="0xFFFFFFFF";
              textSize="15sp";
            -- font weight is set in main.lua -> applyTypography()
              layout_width="wrap";
              layout_height="wrap";
            };

            {
              TextView;
              id="tgSub";
              text="Join for updates & support";
              textColor="0xFF8E8E93";
              textSize="11sp";
              layout_width="wrap";
              layout_height="wrap";
              layout_marginTop="1dp";
            };
          };

          {
            ImageView;
            src="icon/arrow.png";
            layout_width="20dp";
            layout_height="20dp";
            colorFilter="0xFF3A3A3C";
            layout_gravity="center";
          };
        };
      };

      {
        -- Developer info card
        CardView;
        id="devInfo";
        layout_width="fill";
        layout_height="56dp";
        radius="12dp";
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E";
        layout_marginBottom="8dp";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="horizontal";
          gravity="center_vertical";
          paddingLeft="16dp";
          paddingRight="16dp";

          {
            CardView;
            layout_width="40dp";
            layout_height="40dp";
            radius="10dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFFBF5AF2"; -- iOS purple accent
            layout_gravity="center";

            {
              ImageView;
              src="icon/ah1.png";
              layout_width="22dp";
              layout_height="22dp";
              layout_gravity="center";
              colorFilter="0xFFFFFFFF";
            };
          };

          {
            LinearLayout;
            layout_width="0dp";
            layout_height="wrap";
            layout_weight="1";
            orientation="vertical";
            layout_marginLeft="14dp";

            {
              TextView;
              id="telegramTitle";
              text="Developer: @KiroPh1";
              textColor="0xFFFFFFFF";
              textSize="15sp";
            -- font weight is set in main.lua -> applyTypography()
              layout_width="wrap";
              layout_height="wrap";
            };

            {
              TextView;
              id="telegramSub";
              text="Creator of this injector";
              textColor="0xFF8E8E93";
              textSize="11sp";
              layout_width="wrap";
              layout_height="wrap";
              layout_marginTop="1dp";
            };
          };
          -- NOTE: no chevron on this card on purpose. A ">" icon means "tap me",
          -- and this row is information only - there is no click handler for it
          -- in main.lua. Add devInfo.onClick() there and you can put one back.
        };
      };

      {
        -- Feedback card
        CardView;
        -- NOTE: the id stays "tg1" (not "feedback") because main.lua binds
        -- tg1.onClick() -> opens the Telegram link. Rename it here AND in
        -- main.lua if you ever want a separate handler for this card.
        id="tg1";
        layout_width="fill";
        layout_height="56dp";
        radius="12dp";
        CardElevation="0dp";
        CardBackgroundColor="0xFF1C1C1E";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="horizontal";
          gravity="center_vertical";
          paddingLeft="16dp";
          paddingRight="16dp";

          {
            CardView;
            layout_width="40dp";
            layout_height="40dp";
            radius="10dp";
            CardElevation="0dp";
            CardBackgroundColor="0xFFFF9F0A"; -- iOS orange accent
            layout_gravity="center";

            {
              ImageView;
              src="icon/add.png";
              layout_width="22dp";
              layout_height="22dp";
              layout_gravity="center";
              colorFilter="0xFF000000";
            };
          };

          {
            LinearLayout;
            layout_width="0dp";
            layout_height="wrap";
            layout_weight="1";
            orientation="vertical";
            layout_marginLeft="14dp";

            {
              TextView;
              id="feedbackTitle";
              text="Feedback";
              textColor="0xFFFFFFFF";
              textSize="15sp";
            -- font weight is set in main.lua -> applyTypography()
              layout_width="wrap";
              layout_height="wrap";
            };

            {
              TextView;
              id="feedbackSub";
              text="Send suggestions & reports";
              textColor="0xFF8E8E93";
              textSize="11sp";
              layout_width="wrap";
              layout_height="wrap";
              layout_marginTop="1dp";
            };
          };

          {
            ImageView;
            src="icon/arrow.png";
            layout_width="20dp";
            layout_height="20dp";
            colorFilter="0xFF3A3A3C";
            layout_gravity="center";
          };
        };
      };
    };

    {
      -- Footer with branding (iOS style - subtle)
      LinearLayout;
      layout_width="fill";
      layout_height="wrap";
      gravity="center_horizontal";
      orientation="vertical";
      layout_marginTop="8dp";

      {
        TextView;
        id="footerTitle";
        text="KIRO PRIVATE • PREMIUM";
        textColor="0xFF636366";
        textSize="10sp";
            -- font weight is set in main.lua -> applyTypography()
        layout_width="wrap";
        layout_height="wrap";
      };

      {
        TextView;
        id="footerStatus";
        text="● READY";
        textColor="0xFF30D158";
        textSize="10sp";
            -- font weight is set in main.lua -> applyTypography()
        layout_width="wrap";
        layout_height="wrap";
        layout_marginTop="4dp";
      };
    };
  };
}