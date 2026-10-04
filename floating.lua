{
  -- ============================================================================
  -- FLOATING MOD MENU  (redesigned: smaller + iOS-style minimal)
  -- ----------------------------------------------------------------------------
  -- WHAT CHANGED vs the old version
  --   1. Size: the menu no longer uses "85%w"/"75%w" of the screen. It now fills
  --      whatever window size main.lua gives it, and main.lua sets that window to
  --      MENU_WIDTH_DP x MENU_HEIGHT_DP (300 x 520). To resize the menu, change
  --      those two numbers in main.lua - not this file.
  --   2. Colours: neon "hacker" colours replaced with the iOS dark palette.
  --      0xFF1C1C1E page      0xFF2C2C2E raised surface (headers/sections)
  --      0xFFE5E5EA label     0xFF8E8E93 secondary label  0xFF636366 tertiary
  --      0xFF30D158 green    0xFF64D2FF teal   0xFFFF453A red   0xFFFF9F0A orange
  --   3. Density: section headers 58dp -> 42dp, row text 15sp -> 12sp,
  --      section titles 13sp, list rows are now full width (bigger tap targets).
  --   4. The bright green outer frame is gone (it made the menu look like a
  --      neon box and wasted ~10dp on every side).
  --
  -- IMPORTANT: every id= in this file is referenced by main.lua
  -- (onClick / OnCheckedChangeListener / seekbars). Renaming or deleting an id
  -- will break the matching Lua handler, so keep the ids as they are.
  -- ============================================================================
  LinearLayout,
  layout_width="fill",
  layout_height="fill",
  background="transparent",
  orientation="vertical";
  {
    -- Menu shell. radius 22dp = iOS-style continuous corner.
    CardView,
    radius="22dp";
    layout_width="fill",
    layout_height="fill",
    backgroundColor="0xFF1C1C1E"; -- iOS system background (was 0xFF000000)
    CardElevation="0dp",           -- flat: iOS separates layers with colour, not shadow
    layout_gravity="center";
    id="menufloating";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill";
      layout_height="fill";
      gravity="center";
      {
        -- Header bar. This whole row is the drag handle:
        -- main.lua -> fl.OnTouchListener() moves the window while you drag it.
        -- id="fl" must stay, and its height (40dp -> 44dp) controls the grab area.
        CardView,
        radius=0;
        layout_width="fill",
        layout_height="44dp",
        backgroundColor="0xFF2C2C2E",
        CardElevation="0dp",
        layout_gravity="center";
        id="fl";
        {
          LinearLayout;
          layout_height="wrap";
          layout_width="fill";
          orientation="horizontal";
          layout_gravity="center";
          padding="8dp";
          {
            LinearLayout;
            layout_height="wrap";
            layout_width="fill";
            orientation="vertical";
            layout_gravity="center";
            {
              LinearLayout;
              layout_height="wrap";
              layout_width="fill";
              orientation="vertical";
              layout_gravity="center",
              {

                TextView;
                text="KIRO PREMIUM"; -- plain text now: the unicode small-caps
                                    -- font made the title hard to read
                textColor="0xFFE5E5EA";
                textSize = "14sp";
                textStyle="bold";
                id="";
                layout_gravity="left|center_vertical";
                layout_width="wrap";
                layout_height="wrap";
                paddingLeft="6dp";
              };
            };
          };
        {
          LinearLayout;
          orientation="horizontal";
          layout_height="fill";
          layout_width="fill";
          gravity="right";
          background="transparent",
          {
            ImageView;
            layout_width="30dp";
            layout_height="30dp";
            src="icon/hidemenu.png";
            colorFilter="0xFF64D2FF";
            layout_gravity="center";
            padding="5dp";
            id="eye.png";
          };
          {
            ImageView;
            layout_width="30dp";
            layout_height="30dp";
            src="icon/minimize.png";
            colorFilter="0xFF30D158";
            layout_gravity="center";
            padding="5dp";
            id="t1";
          };
        };
      };
      };

{
        -- One compact status strip. This REPLACES the two stacked banner rows
        -- ("• SECURE VIP" and "PRIVATE BUILD • PREMIUM ACCESS • ONLINE") which
        -- used to waste ~36dp of height. Duplicate this block if you need more
        -- status lines - but remember every extra row makes the menu taller.
        LinearLayout;
        layout_width="fill";
        layout_height="wrap";
        orientation="horizontal";
        gravity="center_vertical";
        backgroundColor="0xFF1C1C1E";
        padding="6dp";
        {
          TextView;
          text="● SECURE VIP";
          textColor="0xFF64D2FF";
          textSize="8sp";
          layout_width="0dp";
          layout_weight="1"; -- pushes the right-hand label to the far edge
          layout_height="wrap";
        };
        {
          TextView;
          text="PRIVATE BUILD • PREMIUM • ONLINE";
          textColor="0xFF8E8E93";
          textSize="8sp";
          gravity="right";
          layout_width="wrap";
          layout_height="wrap";
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
        layout_width="fill",
        layout_height="wrap",
        backgroundColor="0x00000000",
        CardElevation="0dp",
        layout_gravity="center";
        layout_margin="0dp";
        id="";
        {
          LinearLayout;
          orientation="vertical";
          layout_width="fill",
          layout_height="fill",
          gravity="center";
          {
            LinearLayout;
            orientation="vertical";
            padding="0dp";
            {
              ScrollView;
              layout_width="fill_parent";
              layout_height="fill",
              layout_gravity="center_horizontal";
              id="";
              {
                LinearLayout,
                id="win_mainviewX",
                layout_width="fill",
                layout_height="fill";
                backgroundColor="0xFF1C1C1E";
                gravity="center";
                Visibility="visible";
                padding="2dp";
                {
                  LinearLayout;
                  orientation="vertical";
                  {
                    CardView,
                    id="win_mainview",
                    layout_width="fill",
                    layout_height="fill";
                    backgroundColor="0xFF1C1C1E",
                    CardElevation="0dp",
                    layout_gravity="center";
                    radius="0";
                    {
                      LinearLayout;
                      orientation="vertical";
                      layout_width="fill_parent";
                      background="transparent",
                      {
                        LinearLayout;
                        layout_width="fill_parent";
                        background="transparent";
                      };

                      {

                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="espmenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="espicon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("ANTI-BAN MENU");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu1";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {

                              RadioButton;
                              text=toSmallCaps("BYPASS LOGO [ ON GARENA ]");
                              textColor="0xFFE5E5EA";
                              id="logo";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("HOLD REPORT [ ON LOBBY ]");
                              textColor="0xFFE5E5EA";
                              id="anti1";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text=toSmallCaps("SKIP TUTORIAL [ ON TIMI ]");
                              textColor="0xFFE5E5EA";
                              id="skip";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text="   cʟᴇᴀʀ ʟᴏɢꜱ [ ᴀꜰᴛᴇʀɢᴀᴍᴇ ]";
                              textColor="0xFFE5E5EA";
                              id="clogs";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
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

                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="fpsmenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="fpsicon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("GRAPHICS & FRAME RATES");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu4";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {

                              CheckBox;
                              text="180 ғᴘs";
                              textColor="0xFFE5E5EA";
                              id="fps180";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };

                            {

                              CheckBox;
                              text="ᴍᴀx ғᴘs";
                              textColor="0xFFE5E5EA";
                              id="unlockfps";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            }; {

                              CheckBox;
                              text=toSmallCaps("ᴍᴀx ғʀᴀᴍᴇʀᴀᴛᴇ");
                              textColor="0xFFE5E5EA";
                              id="fps";
                              textSize = "12sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };


                          };
                        };
                      };

                      {
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="aimmenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="aimicon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("ADJUSTABLE MENU");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };

                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu2";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";
                              layout_width="fill";
                              {
                                TextView;
                                text=toSmallCaps("ᴀɪᴍʙᴏᴛ");
                                textColor="0xFFFF9F0A";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="   ᴀɪᴍʙᴏᴛ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="aimbot_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
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
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="  ꜰᴏᴠ 3ʀᴅ ᴀᴅᴊᴜꜱᴛᴀʙʟᴇ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="ipad_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
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
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                TextView;
                                text="  sɴᴏᴡʙᴏᴀʀᴅsᴘᴇᴇᴅ (0%)";
                                textColor="0xFFE5E5EA";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="snowboard_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
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
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="othermenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="othericon";
                        };
                        {

                          TextView;
                          text =toSmallCaps("Battle Royale & ᴍᴇᴍᴏʀʏ ʜᴀᴄᴋs");
                          textColor = "0xFFE5E5EA";
                          textSize = "13sp";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu3";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";
                              layout_width="fill";

                              {
                                TextView;
                                text="ʜᴀᴄᴋs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
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
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text=toSmallCaps("ᴡᴀʟʟʜᴀᴄᴋ y/b");
                                textColor="0xFFE5E5EA";
                                id="chams";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ʀᴇᴅ";
                                textColor="0xFFE5E5EA";
                                id="redhack";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴍᴘ ᴛᴀɢs";
                                textColor="0xFFE5E5EA";
                                id="mp";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ᴏᴜᴛʟɪɴᴇ";
                                textColor="0xFFE5E5EA";
                                id="who";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";

                              };
                              {
                                CheckBox;
                                text="ʜɪᴛʙᴏx [ ʀɪsᴋ ᴍᴘ ]";
                                textColor="0xFFE5E5EA";
                                id="hit";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox,
                                text =toSmallCaps("ʙʟᴜᴇᴘʀɪɴᴛ [ Unlock ᴀʟʟsᴋɪɴ ]"),
                                textColor = "0xFFE5E5EA",
                                id = "Blueprint",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width="fill",
                                layout_height = "wrap"
                              },
                              {
                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴄᴏᴘᴇ";
                                textColor="0xFFE5E5EA";
                                id="Scope";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";

                              };
                              {

                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴡɪᴛᴄʜ";
                                textColor="0xFFE5E5EA";
                                id="fastsw";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Speed Hack 2x"),
                                textColor="0xFFE5E5EA";
                                id="speed";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ sᴘʀᴇᴀᴅ";
                                textColor="0xFFE5E5EA";
                                id="spread";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇʟᴏᴀᴅ";
                                textColor="0xFFE5E5EA";
                                id="noreload";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇᴄᴏɪʟ";
                                textColor="0xFFE5E5EA";
                                id="norecoil";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱʜᴀᴋᴇ";
                                textColor="0xFFE5E5EA";
                                id="shake";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴘʀɪɴᴛ ꜰɪʀᴇ ᴅᴇʟᴀʏ";
                                textColor="0xFFE5E5EA";
                                id="Delaysprintfire";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴍᴏᴋᴇ";
                                textColor="0xFFE5E5EA";
                                id="nsmoke";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ᴄʀᴏᴜᴄʜ";
                                textColor="0xFFE5E5EA";
                                id="nocrouch";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text=toSmallCaps("BATTLE ROYALE");
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
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
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Br Tags"),
                                textColor="0xFFE5E5EA";
                                id="Battle";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Walk Underwater"),
                                textColor="0xFFE5E5EA";
                                id="Walk";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("No Parachute"),
                                textColor="0xFFE5E5EA";
                                id="nop";
                                layout_gravity="center";
                                textSize = "12sp";
                                layout_width="fill";
                                layout_height="wrap";

                              };
                            };
                          };
                        };
                      };


                      {

                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="brmenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="bricon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("SAFE MODE FEATURES");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          textStyle = "bold";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu5";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";
                              layout_width="fill";


                            };
                            {
                              TextView;
                              text=toSmallCaps("Safe Mode");
                              textColor="0xFF64D2FF";
                              id="";
                              textSize = "12sp";
                              layout_gravity="left|center_vertical";
                              layout_width="fill";
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
                              textSize = "12sp";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("Safe BR");
                              textColor="0xFFE5E5EA";
                              id="safee";
                              layout_gravity="center";
                              textSize = "12sp";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                          };
                        };
                      };


                      {
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="skinmenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="skinicon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("SKIN HACK FEATURES");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          textStyle = "bold";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu6";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";
                              layout_width="fill";




                              {
                                TextView;
                                text=" ᴍʏᴛʜɪᴄ ᴄʜᴀʀᴀᴄᴛᴇʀ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                RadioButton,
                                text = "ᴅᴀʀᴋsʜᴇᴘʜᴇʀᴅ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "shepherd",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "ᴋᴜɪᴊɪ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "kuiji",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴏᴘʜɪᴀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "sophia",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴘᴇᴄᴛʀᴇ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "spectre",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴛᴇᴍᴘʟᴀʀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "templar",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sɪʀᴇɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "siren",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ɢʜᴏsᴛ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "ghost",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴀᴢᴀʀᴜs ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "lazarus",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ sᴋɪɴ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };

                              {
                                RadioButton,
                                text = "ᴄʜᴜɴʟɪ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "chunli",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʀʏᴜ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "ryu",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴄᴀᴍᴍʏ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "cammy",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴀᴋᴜᴍᴀ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "akuma",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="ᴛʜᴇ ʙᴏʏs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              },
                              {
                                RadioButton,
                                text = "𝙷𝙾𝙼𝙴𝙻𝙰𝙽𝙳𝙴𝚁",
                                textColor = "0xFFBF5AF2",
                                id = "homelander",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝚂𝚃𝙰𝚁𝙻𝙸𝙶𝙷𝚃",
                                textColor = "0xFFBF5AF2",
                                id = "starlight",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝙱𝙻𝙰𝙲𝙺𝙽𝙾𝙸𝚁",
                                textColor = "0xFFBF5AF2",
                                id = "blacknoir",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Character Epic Skin"),
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Black Vivian"),
                                textColor = "0xFFBF5AF2",
                                id = "vivian",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Holy Pader"),
                                textColor = "0xFFBF5AF2",
                                id = "pader",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Nikto"),
                                textColor = "0xFFBF5AF2",
                                id = "nikto",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                TextView;
                                text="ᴍʏᴛʜɪᴄ ɢᴜɴ sᴋɪɴs";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";
                              };

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Lava Remix"),
                                textColor = "0xFFFF453A",
                                id = "ak117lava",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Memento"),
                                textColor = "0xFFFF453A",
                                id = "ak117",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Bp50 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "bp50",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ffar Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ffar",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Grau Mythic"),
                                textColor = "0xFFFF453A",
                                id = "grau",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Krig6 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "krig6",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type19 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "type19",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Oden Mythic"),
                                textColor = "0xFFFF453A",
                                id = "oden",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Xm4 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "xm4",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak47 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ak47",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Tundra Mythic"),
                                textColor = "0xFFFF453A",
                                id = "lw3",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Dlq Mythic"),
                                textColor = "0xFFFF453A",
                                id = "dlq33",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Vmp Mythic"),
                                textColor = "0xFFFF453A",
                                id = "vmp",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Uss9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "uss9",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Kilo Mythic"),
                                textColor = "0xFFFF453A",
                                id = "kilo",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Switchblade Mythic"),
                                textColor = "0xFFFF453A",
                                id = "switchh",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Jak12 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "jak12",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cx9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "cx9",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Qq9 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "qq9",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Mg42 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "mg42",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("M13 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "m13",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Fennec Mythic"),
                                textColor = "0xFFFF453A",
                                id = "fennec",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Rytec Mythic"),
                                textColor = "0xFFFF453A",
                                id = "rytec",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Holger Mythic"),
                                textColor = "0xFFFF453A",
                                id = "holger",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Em2 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "em2",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cbr Mythic"),
                                textColor = "0xFFFF453A",
                                id = "cbr",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Asval Mythic"),
                                textColor = "0xFFFF453A",
                                id = "asval",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Peacekeeper Mythic"),
                                textColor = "0xFFFF453A",
                                id = "peace",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ram7 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "ram7",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type25 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "type25",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("So14 Mythic"),
                                textColor = "0xFFFF453A",
                                id = "so14",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʟᴀᴄʜᴍᴀɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "lachmann",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅᴘ27 ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF453A",
                                id = "dp27",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {

                                TextView;
                                text="ʟᴇɢᴇɴᴅᴀʀʏ ɢᴜɴ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴋʀᴍ ɢʟᴏʀɪᴏᴜs ʙʟᴀᴢᴇ",
                                textColor = "0xFFFFD60A",
                                id = "krm",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʀᴇᴅ ғɪssᴜʀᴇ",
                                textColor = "0xFFFFD60A",
                                id = "krmred",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʟᴏᴀᴅᴇᴅ ɢʟɪᴛᴄʜ",
                                textColor = "0xFFFFD60A",
                                id = "krmload",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴇʟᴇᴄᴛʀᴏɴ",
                                textColor = "0xFFFFD60A",
                                id = "locus",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴅᴇᴍᴏɴɪᴄ ʙʀᴇᴀᴛʜ",
                                textColor = "0xFFFFD60A",
                                id = "locusdemon",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },



                              {
                                RadioButton,
                                text = "ʙʏ15 ʙᴏʙᴀ ʙʟᴀsᴛᴇʀ",
                                textColor = "0xFFFFD60A",
                                id = "by15",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʜs0405 ʟᴇɢᴇɴᴅᴀʀʏ",
                                textColor = "0xFFFFD60A",
                                id = "hssong",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ʜᴏʟɪᴅᴀʏs",
                                textColor = "0xFFFFD60A",
                                id = "dlqholi",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ᴢᴇᴀʟᴏᴛ",
                                textColor = "0xFFFFD60A",
                                id = "dlqzealot",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Legendary Melee"),
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Tang Knife"),
                                textColor = "0xFFFFD60A",
                                id = "tang",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Longquan"),
                                textColor = "0xFFFFD60A",
                                id = "longq",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Spear Azure"),
                                textColor = "0xFFFFD60A",
                                id = "spear",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam scissors"),
                                textColor = "0xFFFFD60A",
                                id = "scissors",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("beam Tomahawk"),
                                textColor = "0xFFFFD60A",
                                id = "tomahawk",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam Saber"),
                                textColor = "0xFFFFD60A",
                                id = "saber",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Katana Fiery Blade"),
                                textColor = "0xFFFFD60A",
                                id = "fiery",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              },
                              {
                                TextView;
                                text = "ᴇǫᴜɪᴘᴍᴇɴᴛ & ᴠᴇʜɪᴄʟᴇ",
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴊᴇᴛᴘᴀᴄᴋ sᴏᴀʀɪɴɢ ʙʟᴀᴢᴇ",
                                textColor = "0xFFFFD60A",
                                id = "jetpack",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴘᴀʀᴀᴄʜᴜᴛᴇ ғᴀʀ ғʟɪɢʜᴛ",
                                textColor = "0xFFFFD60A",
                                id = "farflight",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "[ sɴᴏᴡʙᴏᴀʀᴅ ] sᴀɴᴅsᴛᴏʀᴍ",
                                textColor = "0xFFFFD60A",
                                id = "sand",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap",
                              };
                            };
                          };
                        };
                      };


                      {
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="42dp";
                        layout_width="fill";
                        backgroundColor="0xFF2C2C2E",
                        layout_gravity="center";
                        layout_margin="2dp";
                        id="antennamenu";
                        {
                          ImageView;
                          layout_width="25dp";
                          layout_height="25dp";
                          src="icon/ic_to_bottom.png";
                          colorFilter="0xA0FFFFFF";
                          layout_gravity="center";
                          padding="5dp";
                          id="antennaicon";
                        };
                        {
                          TextView;
                          text=toSmallCaps("CAMO HACK MENU");
                          textColor="0xFFE5E5EA";
                          id="";
                          textSize = "13sp";
                          textStyle = "bold";
                          layout_gravity = "left|center_vertical";
                          gravity = "left|center_vertical";
                          paddingLeft = "14dp";
                          layout_width = "fill";
                          layout_height = "wrap";
                        };
                      };
                      {
                        LinearLayout;
                        layout_width="fill";
                        layout_height="fill",
                        orientation="vertical";
                        id="menu7";
                        visibility="gone";
                        {
                          ScrollView;
                          layout_width="fill";
                          layout_height="fill",
                          layout_gravity="center_horizontal";
                          id="";
                          {
                            LinearLayout;
                            layout_height="fill";
                            layout_width="fill";
                            orientation="vertical";
                            {
                              LinearLayout;
                              orientation="vertical";
                              layout_height="fill";
                              layout_width="fill";
                              {

                                TextView;
                                text="ɴᴏᴛᴇ : ɪɴᴊᴇᴄᴛᴏʀ ᴛʜᴇ sᴋɪɴ ғɪʀsᴛ";
                                textColor="0xFF64D2FF";
                                id="";
                                textSize = "12sp";
                                layout_gravity="left|center_vertical";
                                layout_width="fill";
                                layout_height="wrap";
                                paddingLeft="10dp";
                                paddingTop="8dp";

                              };
                              {
                                RadioButton,
                                text = "ᴏғғ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "offcamo",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴅɪᴀᴍᴏɴᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "diamond",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʀᴇᴅsᴘʀɪᴛᴇ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "redsprite",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴇᴍᴇʀᴀʟᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "emerald",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴀssᴀᴜʟᴛ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "assault",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "sᴄᴏʀᴄʜ ᴄᴀᴍᴏ",
                                textColor = "0xFFE5E5EA",
                                id = "scorch",
                                textSize = "12sp",
                                layout_gravity = "center",
                                layout_width = "fill",
                                layout_height = "wrap"
                              };



                              {
                                Button;
                                text ="Exit App";
                                textColor = "0xFFE5E5EA";
                                backgroundColor = "0xFFFF2A2A";
                                id = "closeui";
                                textSize = "12sp";
                                layout_width = "fill";
                                layout_height = "wrap";
                              };
                            };
                          };
                        };
                      };
                      {
                        TextView;
                        text="KIRO  •  PRIVATE  •  PREMIUM";
                        textColor="0xFF8E8E93";
                        textSize="8sp";
                        gravity="center";
                        layout_width="fill";
                        layout_height="26dp";
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