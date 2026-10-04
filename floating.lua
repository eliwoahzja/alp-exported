{
  LinearLayout,
  layout_width="fill",
  layout_height="fill",
  background="transparent",
  orientation="vertical";
  {
    CardView,
    radius=24;
    layout_width="85%w",
    layout_height="fill",
    backgroundColor="0xFF000000",
    CardElevation="0dp",
    layout_gravity="center";
    id="menufloating";
    {
      LinearLayout;
      orientation="vertical";
      layout_width="fill",
      layout_height="fill",
      gravity="center";
      {
        CardView,
        radius=0;
        layout_width="fill",
        layout_height="40dp",
        backgroundColor="0xFF111118",
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
                text="ᴋɪʀᴏ ᴘʀᴇᴍᴜɪᴍ ɪɴᴊᴇᴄᴛᴏʀ";
                textColor="0xFF65FF81";
                textStyle="bold";
                id="";
                textSize="15sp";
                layout_gravity="center";
                layout_width="wrap";
                layout_height="wrap";
              };
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
            colorFilter="0xFF00FFF8";
            layout_gravity="center";
            padding="5dp";
            id="eye.png";
          };
          {
            ImageView;
            layout_width="30dp";
            layout_height="30dp";
            src="icon/minimize.png";
            colorFilter="0xFF65FF81";
            layout_gravity="center";
            padding="5dp";
            id="t1";
          };
        };
      };

      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        backgroundColor="0xFF171720",
        layout_height="wrap";
        gravity="center";
        padding="6dp";
        { TextView; text="• SECURE VIP";
          textColor="0xFF00FFF8";
          textSize="10sp";
          layout_width="wrap";
          layout_height="wrap"; };
      };

      {
        LinearLayout;
        orientation="vertical";
        layout_width="fill";
        layout_height="wrap";
        gravity="center";
        padding="6dp";
        { TextView; text="PRIVATE BUILD  •  PREMIUM ACCESS  •  ONLINE";
          textColor="0xFF65FF81";
          textSize="9sp";
          layout_width="wrap";
          layout_height="wrap"; };
      };
      {
        CardView,
        radius=10;
        layout_width="fill",
        layout_height="wrap",
        backgroundColor="0xFF65FF81",
        CardElevation="0dp",
        layout_gravity="center";
        layout_margin="5dp";
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
            padding="8dp";
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
                backgroundColor="0xFF101017";
                gravity="center";
                Visibility="visible";
                padding="3dp";
                {
                  LinearLayout;
                  orientation="vertical";
                  {
                    CardView,
                    id="win_mainview",
                    layout_width="75%w",
                    layout_height="fill";
                    backgroundColor="0xFF111218",
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
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          layout_gravity = "center";
                          gravity = "center";
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
                              textColor="0xFFFFFFFF";
                              id="logo";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("HOLD REPORT [ ON LOBBY ]");
                              textColor="0xFFFFFFFF";
                              id="anti1";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text=toSmallCaps("SKIP TUTORIAL [ ON TIMI ]");
                              textColor="0xFFFFFFFF";
                              id="skip";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              CheckBox;
                              text="   cʟᴇᴀʀ ʟᴏɢꜱ [ ᴀꜰᴛᴇʀɢᴀᴍᴇ ]";
                              textColor="0xFFFFFFFF";
                              id="clogs";
                              textSize="15sp";
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
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          layout_gravity = "center";
                          gravity = "center";
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
                              textColor="0xFFFFFFFF";
                              id="fps180";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            };

                            {

                              CheckBox;
                              text="ᴍᴀx ғᴘs";
                              textColor="0xFFFFFFFF";
                              id="unlockfps";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="fill";
                              layout_height="wrap";
                            }; {

                              CheckBox;
                              text=toSmallCaps("ᴍᴀx ғʀᴀᴍᴇʀᴀᴛᴇ");
                              textColor="0xFFFFFFFF";
                              id="fps";
                              textSize="15sp";
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
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          layout_gravity = "center";
                          gravity = "center";
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
                                textColor="0xFFFFD45A";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text="   ᴀɪᴍʙᴏᴛ (0%)";
                                textColor="0xFFFFFFFF";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="aimbot_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
                                layout_height="wrap";
                                max=100;
                                progress=0;
                                id="aimbot_seekbar";
                              };
                              {
                                TextView;
                                text=toSmallCaps("ꜰᴏᴠ 3ʀᴅ");
                                textColor="0xFFFFD45A";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text="  ꜰᴏᴠ 3ʀᴅ ᴀᴅᴊᴜꜱᴛᴀʙʟᴇ (0%)";
                                textColor="0xFFFFFFFF";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="ipad_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
                                layout_height="wrap";
                                max=100;
                                progress=0;
                                id="ipad_seekbar";
                              };
                              {
                                TextView;
                                text=toSmallCaps("sɴᴏᴡʙᴏᴀʀᴅ");
                                textColor="0xFFFFD45A";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text="  sɴᴏᴡʙᴏᴀʀᴅsᴘᴇᴇᴅ (0%)";
                                textColor="0xFFFFFFFF";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                                layout_gravity="center";
                                id="snowboard_text";
                              };
                              {
                                SeekBar;
                                layout_width="fill";
                                layout_height="wrap";
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
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor = "0xFFFFFFFF";
                          textSize = "15sp";
                          layout_gravity = "center";
                          gravity = "center";
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
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text=toSmallCaps("ꜱᴛʀᴏɴɢ ᴀɪᴍ [ High Risk ]");
                                textColor="0xFFFFFFFF";
                                id="strong";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text=toSmallCaps("ᴡᴀʟʟʜᴀᴄᴋ y/b");
                                textColor="0xFFFFFFFF";
                                id="chams";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ʀᴇᴅ";
                                textColor="0xFFFFFFFF";
                                id="redhack";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴍᴘ ᴛᴀɢs";
                                textColor="0xFFFFFFFF";
                                id="mp";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text="ᴡᴀʟʟʜᴀᴄᴋ ᴏᴜᴛʟɪɴᴇ";
                                textColor="0xFFFFFFFF";
                                id="who";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";

                              };
                              {
                                CheckBox;
                                text="ʜɪᴛʙᴏx [ ʀɪsᴋ ᴍᴘ ]";
                                textColor="0xFFFFFFFF";
                                id="hit";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {

                                CheckBox,
                                text =toSmallCaps("ʙʟᴜᴇᴘʀɪɴᴛ [ Unlock ᴀʟʟsᴋɪɴ ]"),
                                textColor = "0xFFFFFFFF",
                                id = "Blueprint",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="fill",
                                layout_height = "wrap"
                              },
                              {
                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴄᴏᴘᴇ";
                                textColor="0xFFFFFFFF";
                                id="Scope";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";

                              };
                              {

                                CheckBox;
                                text="ꜰᴀꜱᴛ ꜱᴡɪᴛᴄʜ";
                                textColor="0xFFFFFFFF";
                                id="fastsw";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Speed Hack 2x"),
                                textColor="0xFFFFFFFF";
                                id="speed";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ sᴘʀᴇᴀᴅ";
                                textColor="0xFFFFFFFF";
                                id="spread";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇʟᴏᴀᴅ";
                                textColor="0xFFFFFFFF";
                                id="noreload";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ʀᴇᴄᴏɪʟ";
                                textColor="0xFFFFFFFF";
                                id="norecoil";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱʜᴀᴋᴇ";
                                textColor="0xFFFFFFFF";
                                id="shake";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴘʀɪɴᴛ ꜰɪʀᴇ ᴅᴇʟᴀʏ";
                                textColor="0xFFFFFFFF";
                                id="Delaysprintfire";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ꜱᴍᴏᴋᴇ";
                                textColor="0xFFFFFFFF";
                                id="nsmoke";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text="ɴᴏ ᴄʀᴏᴜᴄʜ";
                                textColor="0xFFFFFFFF";
                                id="nocrouch";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                TextView;
                                text=toSmallCaps("BATTLE ROYALE");
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {

                                CheckBox;
                                text = toSmallCaps("Pump Boost"),
                                textColor="0xFFFFFFFF";
                                id="pump";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Br Tags"),
                                textColor="0xFFFFFFFF";
                                id="Battle";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("Walk Underwater"),
                                textColor="0xFFFFFFFF";
                                id="Walk";
                                layout_gravity="center";
                                textSize="15sp";
                                layout_width="fill";
                                layout_height="wrap";
                              };
                              {
                                CheckBox;
                                text = toSmallCaps("No Parachute"),
                                textColor="0xFFFFFFFF";
                                id="nop";
                                layout_gravity="center";
                                textSize="15sp";
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
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          textStyle = "bold";
                          layout_gravity = "center";
                          gravity = "center";
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
                              textColor="0xFF00FFF8";
                              id="";
                              textSize="15sp";
                              layout_gravity="center";
                              layout_width="wrap";
                              layout_height="wrap";
                            };
                            {

                              RadioButton;
                              text=toSmallCaps("Safe MP");
                              textColor="0xFFFFFFFF";
                              id="safe";
                              layout_gravity="center";
                              textSize="15sp";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                            {
                              RadioButton;
                              text=toSmallCaps("Safe BR");
                              textColor="0xFFFFFFFF";
                              id="safee";
                              layout_gravity="center";
                              textSize="15sp";
                              layout_width="fill";
                              layout_height="wrap";
                            };
                          };
                        };
                      };


                      {
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          textStyle = "bold";
                          layout_gravity = "center";
                          gravity = "center";
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
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {
                                RadioButton,
                                text = "ᴅᴀʀᴋsʜᴇᴘʜᴇʀᴅ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "shepherd",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "ᴋᴜɪᴊɪ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "kuiji",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴏᴘʜɪᴀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "sophia",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sᴘᴇᴄᴛʀᴇ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "spectre",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴛᴇᴍᴘʟᴀʀ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "templar",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "sɪʀᴇɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "siren",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ɢʜᴏsᴛ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "ghost",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴀᴢᴀʀᴜs ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "lazarus",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ sᴋɪɴ";
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };

                              {
                                RadioButton,
                                text = "ᴄʜᴜɴʟɪ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFE0A100",
                                id = "chunli",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʀʏᴜ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFE0A100",
                                id = "ryu",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴄᴀᴍᴍʏ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFE0A100",
                                id = "cammy",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴀᴋᴜᴍᴀ sᴛʀᴇᴇᴛ ғɪɢʜᴛᴇʀ",
                                textColor = "0xFFE0A100",
                                id = "akuma",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text="ᴛʜᴇ ʙᴏʏs";
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              },
                              {
                                RadioButton,
                                text = "𝙷𝙾𝙼𝙴𝙻𝙰𝙽𝙳𝙴𝚁",
                                textColor = "0xFF7C19FF",
                                id = "homelander",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝚂𝚃𝙰𝚁𝙻𝙸𝙶𝙷𝚃",
                                textColor = "0xFF7C19FF",
                                id = "starlight",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },
                              {
                                RadioButton,
                                text = "𝙱𝙻𝙰𝙲𝙺𝙽𝙾𝙸𝚁",
                                textColor = "0xFF7C19FF",
                                id = "blacknoir",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Character Epic Skin"),
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Black Vivian"),
                                textColor = "0xFF7C19FF",
                                id = "vivian",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Holy Pader"),
                                textColor = "0xFF7C19FF",
                                id = "pader",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                CheckBox,
                                text = toSmallCaps("Nikto"),
                                textColor = "0xFF7C19FF",
                                id = "nikto",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                TextView;
                                text="ᴍʏᴛʜɪᴄ ɢᴜɴ sᴋɪɴs";
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";
                              };

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Lava Remix"),
                                textColor = "0xFFFF0000",
                                id = "ak117lava",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak117 Memento"),
                                textColor = "0xFFFF0000",
                                id = "ak117",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Bp50 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "bp50",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ffar Mythic"),
                                textColor = "0xFFFF0000",
                                id = "ffar",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Grau Mythic"),
                                textColor = "0xFFFF0000",
                                id = "grau",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Krig6 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "krig6",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type19 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "type19",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Oden Mythic"),
                                textColor = "0xFFFF0000",
                                id = "oden",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Xm4 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "xm4",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ak47 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "ak47",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Tundra Mythic"),
                                textColor = "0xFFFF0000",
                                id = "lw3",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Dlq Mythic"),
                                textColor = "0xFFFF0000",
                                id = "dlq33",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Vmp Mythic"),
                                textColor = "0xFFFF0000",
                                id = "vmp",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Uss9 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "uss9",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Kilo Mythic"),
                                textColor = "0xFFFF0000",
                                id = "kilo",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Switchblade Mythic"),
                                textColor = "0xFFFF0000",
                                id = "switchh",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Jak12 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "jak12",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cx9 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "cx9",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Qq9 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "qq9",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Mg42 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "mg42",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("M13 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "m13",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Fennec Mythic"),
                                textColor = "0xFFFF0000",
                                id = "fennec",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Rytec Mythic"),
                                textColor = "0xFFFF0000",
                                id = "rytec",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Holger Mythic"),
                                textColor = "0xFFFF0000",
                                id = "holger",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Em2 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "em2",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Cbr Mythic"),
                                textColor = "0xFFFF0000",
                                id = "cbr",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Asval Mythic"),
                                textColor = "0xFFFF0000",
                                id = "asval",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Peacekeeper Mythic"),
                                textColor = "0xFFFF0000",
                                id = "peace",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Ram7 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "ram7",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Type25 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "type25",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("So14 Mythic"),
                                textColor = "0xFFFF0000",
                                id = "so14",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʟᴀᴄʜᴍᴀɴ ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "lachmann",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅᴘ27 ᴍʏᴛʜɪᴄ",
                                textColor = "0xFFFF0000",
                                id = "dp27",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {

                                TextView;
                                text="ʟᴇɢᴇɴᴅᴀʀʏ ɢᴜɴ";
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";

                              };
                              {
                                RadioButton,
                                text = "ᴋʀᴍ ɢʟᴏʀɪᴏᴜs ʙʟᴀᴢᴇ",
                                textColor = "0xFFE0A100",
                                id = "krm",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʀᴇᴅ ғɪssᴜʀᴇ",
                                textColor = "0xFFE0A100",
                                id = "krmred",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴋʀᴍ ʟᴏᴀᴅᴇᴅ ɢʟɪᴛᴄʜ",
                                textColor = "0xFFE0A100",
                                id = "krmload",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴇʟᴇᴄᴛʀᴏɴ",
                                textColor = "0xFFE0A100",
                                id = "locus",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʟᴏᴄᴜs ᴅᴇᴍᴏɴɪᴄ ʙʀᴇᴀᴛʜ",
                                textColor = "0xFFE0A100",
                                id = "locusdemon",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },



                              {
                                RadioButton,
                                text = "ʙʏ15 ʙᴏʙᴀ ʙʟᴀsᴛᴇʀ",
                                textColor = "0xFFE0A100",
                                id = "by15",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ʜs0405 ʟᴇɢᴇɴᴅᴀʀʏ",
                                textColor = "0xFFE0A100",
                                id = "hssong",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ʜᴏʟɪᴅᴀʏs",
                                textColor = "0xFFE0A100",
                                id = "dlqholi",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = "ᴅʟǫ ᴢᴇᴀʟᴏᴛ",
                                textColor = "0xFFE0A100",
                                id = "dlqzealot",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                TextView;
                                text = toSmallCaps("Legendary Melee"),
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";

                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Tang Knife"),
                                textColor = "0xFFE0A100",
                                id = "tang",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },

                              {
                                RadioButton,
                                text = toSmallCaps("Longquan"),
                                textColor = "0xFFE0A100",
                                id = "longq",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Spear Azure"),
                                textColor = "0xFFE0A100",
                                id = "spear",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam scissors"),
                                textColor = "0xFFE0A100",
                                id = "scissors",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("beam Tomahawk"),
                                textColor = "0xFFE0A100",
                                id = "tomahawk",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Beam Saber"),
                                textColor = "0xFFE0A100",
                                id = "saber",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = toSmallCaps("Katana Fiery Blade"),
                                textColor = "0xFFE0A100",
                                id = "fiery",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              },
                              {
                                TextView;
                                text = "ᴇǫᴜɪᴘᴍᴇɴᴛ & ᴠᴇʜɪᴄʟᴇ",
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";

                              };
                              {
                                RadioButton,
                                text = "ᴊᴇᴛᴘᴀᴄᴋ sᴏᴀʀɪɴɢ ʙʟᴀᴢᴇ",
                                textColor = "0xFFE0A100",
                                id = "jetpack",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴘᴀʀᴀᴄʜᴜᴛᴇ ғᴀʀ ғʟɪɢʜᴛ",
                                textColor = "0xFFE0A100",
                                id = "farflight",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "[ sɴᴏᴡʙᴏᴀʀᴅ ] sᴀɴᴅsᴛᴏʀᴍ",
                                textColor = "0xFFE0A100",
                                id = "sand",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap",
                              };
                            };
                          };
                        };
                      };


                      {
                        LinearLayout;
                        orientation="horizontal";
                        layout_height="58dp";
                        layout_width="fill";
                        backgroundColor="0xFF171820",
                        layout_gravity="center";
                        layout_margin="4dp";
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
                          textColor="0xFFFFFFFF";
                          id="";
                          textSize="15sp";
                          textStyle = "bold";
                          layout_gravity = "center";
                          gravity = "center";
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
                                textColor="0xFF00FFF8";
                                id="";
                                textSize="15sp";
                                layout_gravity="center";
                                layout_width="wrap";
                                layout_height="wrap";

                              };
                              {
                                RadioButton,
                                text = "ᴏғғ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "offcamo",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴅɪᴀᴍᴏɴᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "diamond",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ʀᴇᴅsᴘʀɪᴛᴇ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "redsprite",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴇᴍᴇʀᴀʟᴅ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "emerald",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "ᴀssᴀᴜʟᴛ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "assault",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };
                              {
                                RadioButton,
                                text = "sᴄᴏʀᴄʜ ᴄᴀᴍᴏ",
                                textColor = "0xFFFFFFFF",
                                id = "scorch",
                                textSize = "15sp",
                                layout_gravity = "center",
                                layout_width="77%w",
                                layout_height = "wrap"
                              };



                              {
                                Button;
                                text ="Exit App";
                                textColor = "0xFFFFFFFF";
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
                        text="KIRO  •  PRIVATE  •  PREMUIM";
                        textColor="0xFF00FFF8";
                        textSize="9sp";
                        gravity="center";
                        layout_width="fill";
                        layout_height="38dp";
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