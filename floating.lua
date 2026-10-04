{
  -- ============================================================================
  -- FLOATING MOD MENU - iOS-style minimal, rebuilt like an iOS Settings screen
  -- ----------------------------------------------------------------------------
  -- THE STRUCTURE (top to bottom), so you can navigate this file quickly:
  --   menufloating  black rounded sheet (radius 22dp, #000000)
  --     +- fl       header row, 44dp, #1C1C1E. Also the DRAG HANDLE:
  --     |           main.lua -> fl.OnTouchListener moves the window.
  --     |           Contains the title plus the hide (eye.png) and
  --     |           minimize (t1) buttons.
  --     +- ScrollView -> win_mainviewX -> win_mainview -> the 7 sections:
  --           a section = one header row (espmenu, fpsmenu, aimmenu,
  --           othermenu, brmenu, skinmenu, antennamenu) followed by its
  --           option panel (menu1 .. menu7). Panels start visibility="gone";
  --           the onClick handlers in main.lua show/hide them.
  --
  -- WHAT CHANGED vs the old neon version
  --   1. Size: the menu no longer uses "85%w"/"75%w" of the screen. It fills
  --      whatever window size main.lua gives it, and main.lua sets that window
  --      with MENU_WIDTH_DP / MENU_HEIGHT_DP. Change those two numbers there.
  --   2. Colours: the neon "hacker" palette was replaced with the iOS dark one.
  --      0xFF000000 page (black sheet)   0xFF1C1C1E card / raised surface
  --      0xFFE5E5EA primary label         0xFF8E8E93 secondary label
  --      0xFF636366 tertiary label       0xFF38383A hairline separator
  --      0xFF30D158 green   0xFF64D2FF teal   0xFFFF453A red   0xFFFF9F0A orange
  --   3. iOS grouped list: black sheet + #1C1C1E cards for the expanded option
  --      groups, with a 16dp side inset.
  --   4. Section headers are small grey labels (12sp, secondary grey) instead of
  --      bold white 15sp, and the disclosure chevron sits on the RIGHT (18dp,
  --      tertiary grey) - that is where iOS puts it.
  --   5. 1dp separators are inset 16dp so they line up with the label text,
  --      and option rows use 13sp primary-label text.
  --   6. Deleted the "SECURE VIP / PRIVATE BUILD..." status strip and the
  --      "KIRO - PRIVATE - PREMIUM" footer: a floating panel should show one
  --      idea. Want them back? They are in git history (commit d43797c).
  --   7. "fill"/"fill_parent" became Android's canonical "match_parent", and the
  --      shell + list gravity became "top" ("center" is what pushed the content
  --      down and left a dead gap at the bottom).
  --   8. All textStyle="bold" attributes were deleted - AndLua's layout loader
  --      has no setTextStyle(), so it logged
  --      "TextView@setTextStyle is not a field or method" and ignored them.
  --      Weights are applied from Lua (applyTypography / styleSectionHeaders in
  --      main.lua). A typo like "lyout_width" also breaks the loader.
  --
  -- HOW TO EDIT
  --   * Menu size ......... MENU_WIDTH_DP / MENU_HEIGHT_DP in main.lua.
  --   * A new section .... copy a section row + its menu panel, give them new
  --                        ids, then add the ids to SECTION_HEADERS in main.lua
  --                        and write the onClick that toggles the panel.
  --   * Colours .......... the hex values above; styleModMenu() in main.lua
  --                        re-tints switches/sliders after load.
  --
  LinearLayout,
  layout_width="match_parent",
  layout_height="match_parent",
  background="transparent",
  orientation="vertical";
  {
    -- Menu shell. radius 22dp = iOS-style continuous corner.
    CardView,
    radius="22dp";
    layout_width="match_parent",
    layout_height="match_parent",
    backgroundColor="0xFF000000"; -- iOS dark base: black sheet, lighter cards
    CardElevation="0dp",           -- flat: iOS separates layers with colour, not shadow
    layout_gravity="center";
    id="menufloating";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="match_parent";
      layout_height="match_parent";
      gravity="top";  -- NOT "center": centring pushed the list down and left a
                       -- dead gap under the last section
      {
        -- Header bar. This whole row is the drag handle:
        -- main.lua -> fl.OnTouchListener() moves the window while you drag it.
        -- id="fl" must stay, and its height (40dp -> 44dp) controls the grab area.
        CardView,
        radius=0;
        layout_width="match_parent",
        layout_height="44dp",
        backgroundColor="0xFF2C2C2E",
        CardElevation="0dp",
        layout_gravity="center";
        id="fl";
        {
          -- ONE row: title on the left, the two action icons on the right.
          -- The old layout stacked the icons BELOW the title inside this
          -- 44dp card, which pushed the minimize button off-screen.
          LinearLayout;
          layout_width="match_parent";
          layout_height="match_parent";
          orientation="horizontal";
          gravity="center_vertical";
          paddingLeft="14dp";
          paddingRight="10dp";
          {
            -- Title. 0dp width + weight 1 = "fill the space the icons leave".
            TextView;
            text="KIRO PREMIUM";
            textColor="0xFFE5E5EA";
            textSize="14sp";
            id="";
            layout_width="0dp";
            layout_weight="1";
            layout_height="wrap";
            layout_gravity="center_vertical";
          };
          {
            -- Hide the menu (game stays visible).
            ImageView;
            layout_width="24dp";
            layout_height="24dp";
            src="icon/hidemenu.png";
            colorFilter="0xFF8E8E93"; -- iOS secondary grey
            layout_gravity="center_vertical";
            padding="4dp";
            id="eye.png";
          };
          {
            -- Minimize to the floating bubble.
            -- main.lua binds t1.onClick (minimize) and t1.onLongClick
            -- (close menu) - do not rename this id.
            ImageView;
            layout_width="24dp";
            layout_height="24dp";
            src="icon/minimize.png";
            colorFilter="0xFF8E8E93"; -- iOS secondary grey
            layout_gravity="center_vertical";
            padding="4dp";
            id="t1";
          };
        };
      };

      {
        -- Formerly a bright green frame around the whole menu. Kept as an
        -- invisible wrapper so the nesting depth of this file does not change -
        -- that keeps the diff small and avoids breaking the closing braces at
        -- the bottom of the file. Safe to delete together with its matching
        -- "};" at the end if you are careful.
        CardView,
        radius="0dp";
        layout_width="match_parent",
        layout_height="match_parent",
        backgroundColor="0x00000000",
        CardElevation="0dp";
        id="";
        {
          LinearLayout;
          orientation="vertical";
          layout_width="match_parent",
          layout_height="match_parent",
          gravity="center";
          {
            LinearLayout;
            orientation="vertical";
            padding="0dp";
            {
              ScrollView;
              layout_width="match_parent";
              layout_height="match_parent",
              layout_gravity="center_horizontal";
              id="";
              {
                LinearLayout,
                id="win_mainviewX",
                layout_width="match_parent",
                layout_height="match_parent";
                backgroundColor="0xFF1C1C1E";
                gravity="top";  -- was "center" (same dead-space problem)
                Visibility="visible";
                padding="0dp";
                {
                  LinearLayout;
                  orientation="vertical";
                  {
                    CardView,
                    id="win_mainview",
                    layout_width="match_parent",
                    layout_height="match_parent";
                    backgroundColor="0xFF1C1C1E",
                    CardElevation="0dp",
                    layout_gravity="center";
                    radius="0";
                    {
                      LinearLayout;
                      orientation="vertical";
                      layout_width="match_parent";
                      background="transparent",
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        background="transparent";
                      };

                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="espmenu";
                        {
                          TextView;
                          text="ANTI-BAN MENU";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="espicon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu1";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {

                              RadioButton;
                              text=toSmallCaps("BYPASS LOGO [ ON GARENA ]");
                              textColor="0xFFE5E5EA";
                              id="logo";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("HOLD REPORT [ ON LOBBY ]");
                              textColor="0xFFE5E5EA";
                              id="anti1";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text=toSmallCaps("SKIP TUTORIAL [ ON TIMI ]");
                              textColor="0xFFE5E5EA";
                              id="skip";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text="   cʟᴇᴀʀ ʟᴏɢꜱ [ ᴀꜰᴛᴇʀɢᴀᴍᴇ ]";
                              textColor="0xFFE5E5EA";
                              id="clogs";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                              checked=false;

                              onClick = function()
                                if logs.isChecked() then
                                  logs.setChecked(false)
                                  logs.setText("ᴄʟᴇᴀʀ ʟᴏɢꜱ")
                                 else
                                  logs.setChecked(true)
                                  logs.setText("ᴄʟᴇᴀʀ ʟᴏɢꜱ")
                                end
                              end







                            };
                          };
                        };
                      };

                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="fpsmenu";
                        {
                          TextView;
                          text="GRAPHICS & FRAME RATES";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="fpsicon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu4";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {

                              CheckBox;
                              text="180 ғᴘs";
                              textColor="0xFFE5E5EA";
                              id="fps180";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };

                            {

                              CheckBox;
                              text="ᴍᴀx ғᴘs";
                              textColor="0xFFE5E5EA";
                              id="unlockfps";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            }; {

                              CheckBox;
                              text=toSmallCaps("ᴍᴀx ғʀᴀᴍᴇʀᴀᴛᴇ");
                              textColor="0xFFE5E5EA";
                              id="fps";
                              textSize = "13sp";
                              layout_gravity="center";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };


                          };
                        };
                      };

                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="aimmenu";
                        {
                          TextView;
                          text="ADJUSTABLE MENU";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="aimicon";  -- main.lua swaps this icon when the section opens
                        };
                      };

                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu2";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="match_parent";
                              layout_width="match_parent";
                              {
                                TextView;
                                text=toSmallCaps("ᴀɪᴍʙᴏᴛ");
                                textColor="0xFFFF9F0A";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="   ᴀɪᴍʙᴏᴛ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="aimbot_text";
                              };
                              {
                                SeekBar;
                                layout_width="match_parent";
                                layout_height="18dp";
                                max=100;
                                progress=0;
                                id="aimbot_seekbar";
                              };
                              {
                                TextView;
                                text=toSmallCaps("ꜰᴏᴠ 3ʀᴅ");
                                textColor="0xFFFF9F0A";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="  ꜰᴏᴠ 3ʀᴅ ᴀᴅᴊᴜꜱᴛᴀʙʟᴇ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="ipad_text";
                              };
                              {
                                SeekBar;
                                layout_width="match_parent";
                                layout_height="18dp";
                                max=100;
                                progress=0;
                                id="ipad_seekbar";
                              };
                              {
                                TextView;
                                text=toSmallCaps("sɴᴏᴡʙᴏᴀʀᴅ");
                                textColor="0xFFFF9F0A";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="  sɴᴏᴡʙᴏᴀʀᴅsᴘᴇᴇᴅ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="snowboard_text";
                              };
                              {
                                SeekBar;
                                layout_width="match_parent";
                                layout_height="18dp";
                                max=100;
                                progress=0;
                                id="snowboard_seekbar";
                              };

                            }
                          }
                        }
                      },
                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="othermenu";
                        {
                          TextView;
                          text="BATTLE ROYALE & MEMORY HACKS";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="othericon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu3";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="match_parent";
                              layout_width="match_parent";

                              {
                                TextView;
                                text="ʜᴀᴄᴋs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {

                                CheckBox;
                                text=toSmallCaps("ꜱᴛʀᴏɴɢ ᴀɪᴍ [ High Risk ]");
                                textColor="0xFFE5E5EA";
                                id="strong";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text=toSmallCaps("ᴡᴀʟʟʜᴀᴄᴋ y/b");
                                textColor="0xFFE5E5EA";
                                id="chams";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ʀᴇᴅ";
                                textColor="0xFFE5E5EA";
                                id="redhack";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴍᴘ ᴛᴀɢs";
                                textColor="0xFFE5E5EA";
                                id="mp";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ᴏᴜᴛʟɪɴᴇ";
                                textColor="0xFFE5E5EA";
                                id="who";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";

                              };
                              {
                                CheckBox;
                                text="ʜɪᴛʙᴏx [ ʀɪsᴋ ᴍᴘ ]";
                                textColor="0xFFE5E5EA";
                                id="hit";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {

                                CheckBox,
                                text =toSmallCaps("ʙʟᴜᴇᴘʀɪɴᴛ [ Unlock ᴀʟʟsᴋɪɴ ]"),
                                textColor = "0xFFE5E5EA",
                                id = "Blueprint",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width="match_parent",
                                layout_height = "wrap"
                              },
                              {
                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴄᴏᴘᴇ";
                                textColor="0xFFE5E5EA";
                                id="Scope";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";

                              };
                              {

                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴡɪᴛᴄʜ";
                                textColor="0xFFE5E5EA";
                                id="fastsw";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Speed Hack 2x"),
                                textColor="0xFFE5E5EA";
                                id="speed";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ sᴘʀᴇᴀᴅ";
                                textColor="0xFFE5E5EA";
                                id="spread";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇʟᴏᴀᴅ";
                                textColor="0xFFE5E5EA";
                                id="noreload";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇᴄᴏɪʟ";
                                textColor="0xFFE5E5EA";
                                id="norecoil";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱʜᴀᴋᴇ";
                                textColor="0xFFE5E5EA";
                                id="shake";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴘʀɪɴᴛ ꜰɪʀᴇ ᴅᴇʟᴀʏ";
                                textColor="0xFFE5E5EA";
                                id="Delaysprintfire";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴍᴏᴋᴇ";
                                textColor="0xFFE5E5EA";
                                id="nsmoke";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ᴄʀᴏᴜᴄʜ";
                                textColor="0xFFE5E5EA";
                                id="nocrouch";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text=toSmallCaps("BATTLE ROYALE");
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {

                                CheckBox;
                                text = toSmallCaps("Pump Boost"),
                                textColor="0xFFE5E5EA";
                                id="pump";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Br Tags"),
                                textColor="0xFFE5E5EA";
                                id="Battle";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Walk Underwater"),
                                textColor="0xFFE5E5EA";
                                id="Walk";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("No Parachute"),
                                textColor="0xFFE5E5EA";
                                id="nop";
                                layout_gravity="center";
                                textSize = "13sp";
                                layout_width="match_parent";
                                layout_height="wrap";

                              };
                            };
                          };
                        };
                      };


                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="brmenu";
                        {
                          TextView;
                          text="SAFE MODE FEATURES";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="bricon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu5";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="match_parent";
                              layout_width="match_parent";


                            };
                            {
                              TextView;
                              text=toSmallCaps("Safe Mode");
                              textColor="0xFF64D2FF";
                              id="";
                              textSize = "13sp";
                              layout_gravity="left|center_vertical";
                              layout_width="match_parent";
                              layout_height="wrap";
                              paddingLeft="10dp";
                              paddingTop="8dp";
                            };
                            {

                              RadioButton;
                              text=toSmallCaps("Safe MP");
                              textColor="0xFFE5E5EA";
                              id="safe";
                              layout_gravity="center";
                              textSize = "13sp";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("Safe BR");
                              textColor="0xFFE5E5EA";
                              id="safee";
                              layout_gravity="center";
                              textSize = "13sp";
                              layout_width="match_parent";
                              layout_height="wrap";
                            };
                          };
                        };
                      };


                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="skinmenu";
                        {
                          TextView;
                          text="SKIN HACK FEATURES";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="skinicon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu6";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="match_parent";
                              layout_width="match_parent";




                              {
                                TextView;
                                text=" ᴍʏᴛʜɪᴄ ᴄʜᴀʀᴀᴄᴛᴇʀ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                RadioButton,
                                text = "ᴅᴀʀᴋsʜᴇᴘʜᴇʀᴅ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "shepherd",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "ᴋᴜɪᴊɪ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "kuiji",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴏᴘʜɪᴀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "sophia",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴘᴇᴄᴛʀᴇ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "spectre",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴛᴇᴍᴘʟᴀʀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "templar",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sɪʀᴇɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "siren",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ɢʜᴏsᴛ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "ghost",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴀᴢᴀʀᴜs ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "lazarus",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ sᴋɪɴ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };

                              {
                                RadioButton,
                                text = "ᴄʜᴜɴʟɪ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "chunli",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʀʏᴜ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "ryu",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴄᴀᴍᴍʏ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "cammy",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴀᴋᴜᴍᴀ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "akuma",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="ᴛʜᴇ ʙᴏʏs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              },
                              {
                                RadioButton,
                                text = "𝙷𝙾𝙼𝙴𝙻𝙰𝙽𝙳𝙴𝚁",
                                textColor = "0xFFBF5AF2",
                                id = "homelander",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝚂𝚃𝙰𝚁𝙻𝙸𝙶𝙷𝚃",
                                textColor = "0xFFBF5AF2",
                                id = "starlight",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝙱𝙻𝙰𝙲𝙺𝙽𝙾𝙸𝚁",
                                textColor = "0xFFBF5AF2",
                                id = "blacknoir",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Character Epic Skin"),
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Black Vivian"),
                                textColor = "0xFFBF5AF2",
                                id = "vivian",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Holy Pader"),
                                textColor = "0xFFBF5AF2",
                                id = "pader",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Nikto"),
                                textColor = "0xFFBF5AF2",
                                id = "nikto",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                TextView;
                                text="ᴍʏᴛʜɪᴄ ɢᴜɴ sᴋɪɴs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Lava Remix"),
                                textColor = "0xFFFF453A",
                                id = "ak117lava",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Memento"),
                                textColor = "0xFFFF453A",
                                id = "ak117",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Bp50 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "bp50",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ffar Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ffar",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Grau Mythic"),
                                textColor = "0xFFFF453A",
                                id = "grau",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Krig6 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "krig6",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type19 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "type19",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Oden Mythic"),
                                textColor = "0xFFFF453A",
                                id = "oden",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Xm4 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "xm4",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak47 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ak47",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Tundra Mythic"),
                                textColor = "0xFFFF453A",
                                id = "lw3",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Dlq Mythic"),
                                textColor = "0xFFFF453A",
                                id = "dlq33",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Vmp Mythic"),
                                textColor = "0xFFFF453A",
                                id = "vmp",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Uss9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "uss9",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Kilo Mythic"),
                                textColor = "0xFFFF453A",
                                id = "kilo",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Switchblade Mythic"),
                                textColor = "0xFFFF453A",
                                id = "switchh",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Jak12 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "jak12",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cx9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "cx9",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Qq9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "qq9",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Mg42 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "mg42",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("M13 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "m13",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Fennec Mythic"),
                                textColor = "0xFFFF453A",
                                id = "fennec",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Rytec Mythic"),
                                textColor = "0xFFFF453A",
                                id = "rytec",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Holger Mythic"),
                                textColor = "0xFFFF453A",
                                id = "holger",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Em2 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "em2",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cbr Mythic"),
                                textColor = "0xFFFF453A",
                                id = "cbr",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Asval Mythic"),
                                textColor = "0xFFFF453A",
                                id = "asval",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Peacekeeper Mythic"),
                                textColor = "0xFFFF453A",
                                id = "peace",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ram7 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ram7",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type25 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "type25",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("So14 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "so14",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʟᴀᴄʜᴍᴀɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "lachmann",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅᴘ27 ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "dp27",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {

                                TextView;
                                text="ʟᴇɢᴇɴᴅᴀʀʏ ɢᴜɴ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴋʀᴍ ɢʟᴏʀɪᴏᴜs ʙʟᴀᴢᴇ",
                                textColor = "0xFFFFD60A",
                                id = "krm",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʀᴇᴅ ғɪssᴜʀᴇ",
                                textColor = "0xFFFFD60A",
                                id = "krmred",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʟᴏᴀᴅᴇᴅ ɢʟɪᴛᴄʜ",
                                textColor = "0xFFFFD60A",
                                id = "krmload",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴇʟᴇᴄᴛʀᴏɴ",
                                textColor = "0xFFFFD60A",
                                id = "locus",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴅᴇᴍᴏɴɪᴄ ʙʀᴇᴀᴛʜ",
                                textColor = "0xFFFFD60A",
                                id = "locusdemon",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },



                              {
                                RadioButton,
                                text = "ʙʏ15 ʙᴏʙᴀ ʙʟᴀsᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "by15",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʜs0405 ʟᴇɢᴇɴᴅᴀʀʏ",
                                textColor = "0xFFFFD60A",
                                id = "hssong",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ʜᴏʟɪᴅᴀʏs",
                                textColor = "0xFFFFD60A",
                                id = "dlqholi",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ᴢᴇᴀʟᴏᴛ",
                                textColor = "0xFFFFD60A",
                                id = "dlqzealot",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Legendary Melee"),
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Tang Knife"),
                                textColor = "0xFFFFD60A",
                                id = "tang",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Longquan"),
                                textColor = "0xFFFFD60A",
                                id = "longq",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Spear Azure"),
                                textColor = "0xFFFFD60A",
                                id = "spear",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam scissors"),
                                textColor = "0xFFFFD60A",
                                id = "scissors",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("beam Tomahawk"),
                                textColor = "0xFFFFD60A",
                                id = "tomahawk",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam Saber"),
                                textColor = "0xFFFFD60A",
                                id = "saber",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Katana Fiery Blade"),
                                textColor = "0xFFFFD60A",
                                id = "fiery",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              },
                              {
                                TextView;
                                text = "ᴇǫᴜɪᴘᴍᴇɴᴛ & ᴠᴇʜɪᴄʟᴇ",
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴊᴇᴛᴘᴀᴄᴋ sᴏᴀʀɪɴɢ ʙʟᴀᴢᴇ",
                                textColor = "0xFFFFD60A",
                                id = "jetpack",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴘᴀʀᴀᴄʜᴜᴛᴇ ғᴀʀ ғʟɪɢʜᴛ",
                                textColor = "0xFFFFD60A",
                                id = "farflight",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "[ sɴᴏᴡʙᴏᴀʀᴅ ] sᴀɴᴅsᴛᴏʀᴍ",
                                textColor = "0xFFFFD60A",
                                id = "sand",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap",
                              };
                            };
                          };
                        };
                      };


                      {
                        -- 1dp hairline separator, inset to line up with the
                        -- label text (exactly how iOS draws them).
                        TextView;
                        text="";
                        layout_width="match_parent";
                        layout_height="1dp";
                        backgroundColor="0xFF38383A";
                        layout_marginLeft="16dp";
                      };
                      {
                        -- iOS grouped-list section header: small grey label on the left,
                        -- disclosure chevron on the RIGHT (that is where iOS puts it).
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="40dp";
                        layout_width="match_parent";
                        gravity="center_vertical";
                        paddingLeft="16dp";
                        paddingRight="14dp";
                        id="antennamenu";
                        {
                          TextView;
                          text="CAMO HACK MENU";
                          textColor="0xFF8E8E93"; -- iOS secondary label (not bold white)
                          textSize="12sp";
                          id="";
                          layout_width="0dp";
                          layout_weight="1";  -- fills what the chevron leaves
                          layout_height="wrap";
                          layout_gravity="center_vertical";
                        };
                        {
                          ImageView;
                          layout_width="18dp";
                          layout_height="18dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xFF636366"; -- iOS tertiary label
                          layout_gravity="center_vertical";
                          id="antennaicon";  -- main.lua swaps this icon when the section opens
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="match_parent";
                        layout_height="match_parent",
                        orientation="vertical";
                        id="menu7";
                        -- iOS grouped list: the expanded options sit on a lighter
                        -- card (#1C1C1E) against the black sheet, with a 16dp inset.
                        backgroundColor="0xFF1C1C1E";
                        paddingLeft="16dp";
                        paddingRight="16dp";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="match_parent";
                          layout_height="match_parent",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="match_parent";
                            layout_width="match_parent";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="match_parent";
                              layout_width="match_parent";
                              {

                                TextView;
                                text="ɴᴏᴛᴇ : ɪɴᴊᴇᴄᴛᴏʀ ᴛʜᴇ sᴋɪɴ ғɪʀsᴛ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "13sp";
                                layout_gravity="left|center_vertical";
                                layout_width="match_parent";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴏғғ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "offcamo",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴅɪᴀᴍᴏɴᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "diamond",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʀᴇᴅsᴘʀɪᴛᴇ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "redsprite",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴇᴍᴇʀᴀʟᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "emerald",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴀssᴀᴜʟᴛ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "assault",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "sᴄᴏʀᴄʜ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "scorch",
                                textSize = "13sp",
                                layout_gravity = "center",
                                layout_width = "match_parent",
                                layout_height = "wrap"
                              };



                              {
                                Button;
                                text ="Exit App";
                                textColor = "0xFFE5E5EA";
                                backgroundColor = "0xFFFF2A2A";
                                id = "closeui";
                                textSize = "13sp";
                                layout_width = "match_parent";
                                layout_height = "wrap";
                              };
                            };
                          };
                        };
                      };

                    };
                  };
                };
              };
            };
          }



        };
      };
    };
  }




} 