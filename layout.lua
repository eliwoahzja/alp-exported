{
  FrameLayout;
  layout_width="fill";
  layout_height="fill";
  backgroundColor="0x00000000";

  {
    VideoView;
    layout_height="fill";
    layout_width="wrap";
    id="video";
  };

  {
    LinearLayout;
    layout_width="fill";
    layout_height="fill";
    orientation="vertical";
    padding="16dp";
    backgroundColor="0x55030806";

    {
      LinearLayout;
      layout_width="fill";
      layout_height="72dp";
      orientation="horizontal";
      gravity="center_vertical";


      {
        LinearLayout;
        layout_width="0dp";
        layout_height="wrap";
        layout_weight="1";
        orientation="vertical";
        gravity="center";

        {
          TextView;
          id="title";
          text="𝗞𝗜𝗥𝗢 𝗣𝗥𝗜𝗩𝗔𝗧𝗘";
          textColor="0xFFFF6868";
          textSize="27sp";
          textStyle="bold";
          layout_width="wrap";
          layout_height="wrap";
        };

        {
          TextView;
          id="subtitle";
          text="𝗞𝗜𝗥𝗢 𝗣𝗥𝗘𝗠𝗨𝗜𝗠 • 𝗣𝗥𝗜𝗩𝗔𝗧𝗘";
          textColor="0xFF65FF81";
          textSize="14sp";
          layout_width="wrap";
          layout_height="wrap";
          layout_marginTop="0dp";
        };
      };

      {
        CardView;
        layout_width="44dp";
        layout_height="44dp";
        radius="22dp";
        CardElevation="0dp";
        CardBackgroundColor="0xB3230D0D";

        {
          TextView;
          id="statusDot";
          text="V1";
          textColor="0xFF00FF84";
          textSize="17sp";
          gravity="center";
          layout_width="fill";
          layout_height="fill";
        };
      };
    };

    {
      CardView;
      layout_width="fill";
      layout_height="40dp";
      radius="14dp";
      CardElevation="0dp";
      CardBackgroundColor="0x6608100C";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="horizontal";
        gravity="center_vertical";
        paddingLeft="13dp";
        paddingRight="13dp";

        {
          TextView;
          id="statusIcon";
          text="●";
          textColor="0xFF00FF84";
          textSize="10sp";
          layout_width="wrap";
          layout_height="wrap";
        };

        {
          TextView;
          id="statusText";
          text="  SYSTEM READY";
          textColor="0xFF65FF81";
          textSize="10sp";
          textStyle="bold";
          layout_width="wrap";
          layout_height="wrap";
        };

        {
          TextView;
          id="version";
          text="v1.6.57";
          textColor="0xFF65FF81";
          textSize="9sp";
          gravity="right|center_vertical";
          layout_width="0dp";
          layout_height="fill";
          layout_weight="1";
        };
      };
    };

    {
      Space;
      layout_width="fill";
      layout_height="12dp";
    };

    {
      LinearLayout;
      layout_width="fill";
      layout_height="150dp";
      orientation="horizontal";

      -- START BUTTON NI TANGA
      {
        CardView;
        id="start";
        layout_width="0dp";
        layout_height="fill";
        layout_weight="1";
        layout_marginRight="6dp";
        radius="20dp";
        CardElevation="5dp";
        CardBackgroundColor="0xB3092419";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="vertical";
          gravity="center";
          padding="12dp";

          {
            CardView;
            layout_width="52dp";
            layout_height="52dp";
            radius="26dp";
            CardElevation="0dp";
            CardBackgroundColor="0xAA104F35";

            {
              ImageView;
              src="icon/start.png";
              layout_width="25dp";
              layout_height="25dp";
              layout_gravity="center";
              colorFilter="0xFF00FF84";
            };
          };

          {
            TextView;
            id="strt";
            text="START";
            textColor="0xFF00FF84";
            textSize="20sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="8dp";
          };

          {
            TextView;
            id="strttxt";
            text="Activate";
            textColor="0xFF8BB6A5";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };
      };

      -- STOP
      {
        CardView;
        id="stop";
        layout_width="0dp";
        layout_height="fill";
        layout_weight="1";
        layout_marginLeft="6dp";
        radius="20dp";
        CardElevation="5dp";
        CardBackgroundColor="0xB3230D0D";

        {
          LinearLayout;
          layout_width="fill";
          layout_height="fill";
          orientation="vertical";
          gravity="center";
          padding="12dp";

          {
            CardView;
            layout_width="52dp";
            layout_height="52dp";
            radius="26dp";
            CardElevation="0dp";
            CardBackgroundColor="0xAA551818";

            {
              ImageView;
              src="icon/stop.png";
              layout_width="25dp";
              layout_height="25dp";
              layout_gravity="center";
              colorFilter="0xFFFF5C5C";
            };
          };

          {
            TextView;
            id="stp";
            text="STOP";
            textColor="0xFFFF6868";
            textSize="20sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="8dp";
          };

          {
            TextView;
            id="stptxt";
            text="Deactivate";
            textColor="0xFFB58282";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };
      };
    };

    {
      Space;
      layout_width="fill";
      layout_height="14dp";
    };

    {
      TextView;
      id="quickTitle";
      text="CONTROL PANEL";
      textColor="0xFF7EFF9E";
      textSize="10sp";
      textStyle="bold";
      layout_width="wrap";
      layout_height="wrap";
      layout_marginLeft="4dp";
    };

    {
      Space;
      layout_width="fill";
      layout_height="7dp";
    };


    {
      CardView;
      id="game";
      layout_width="fill";
      layout_height="62dp";
      radius="18dp";
      CardElevation="2dp";
      CardBackgroundColor="0xAA07150F";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="horizontal";
        gravity="center_vertical";
        paddingLeft="13dp";
        paddingRight="12dp";

        {
          CardView;
          layout_width="40dp";
          layout_height="40dp";
          radius="20dp";
          CardElevation="0dp";
          CardBackgroundColor="0xAA123D2B";

          {
            ImageView;
            src="icon/game-console.png";
            layout_width="43dp";
            layout_height="43dp";
            layout_gravity="center";

          };
        };

        {
          LinearLayout;
          layout_width="0dp";
          layout_height="wrap";
          layout_weight="1";
          orientation="vertical";
          layout_marginLeft="12dp";

          {
            TextView;
            id="gametxt";
            text="Direct Game";
            textColor="0xFFFFFFFF";
            textSize="15sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
          };

          {
            TextView;
            id="gameSub";
            text="Launch game";
            textColor="0xFF709487";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };

        {
          ImageView;
          src="icon/arrow.png";
          layout_width="20dp";
          layout_height="20dp";
          colorFilter="0xFFFF6868";
          padding="3dp";
        };
      };
    };

    {
      Space;
      layout_width="fill";
      layout_height="8dp";
    };


    {
      CardView;
      id="tg";
      layout_width="fill";
      layout_height="62dp";
      radius="18dp";
      CardElevation="2dp";
      CardBackgroundColor="0xAA07150F";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="horizontal";
        gravity="center_vertical";
        paddingLeft="13dp";
        paddingRight="12dp";

        {
          CardView;
          id="tg1";
          layout_width="40dp";
          layout_height="40dp";
          radius="20dp";
          CardElevation="0dp";
          CardBackgroundColor="0xAA123D2B";

          {
            ImageView;
            src="icon/telegram.png";
            layout_width="43dp";
            layout_height="43dp";
            layout_gravity="center";

          };
        };

        {
          LinearLayout;
          layout_width="0dp";
          layout_height="wrap";
          layout_weight="1";
          orientation="vertical";
          layout_marginLeft="12dp";

          {
            TextView;
            id="tg";
            text="Join our Channel";
            textColor="0xFFFFFFFF";
            textSize="15sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
          };

          {
            TextView;
            id="tg";
            text="Telegram community";
            textColor="0xFF709487";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };

        {
          ImageView;
          src="icon/arrow.png";
          layout_width="20dp";
          layout_height="20dp";
          colorFilter="0xFFFF6868";
          padding="3dp";
        };
      };
    };


    {
      Space;
      layout_width="fill";
      layout_height="8dp";
    };


    {
      CardView;
      id="";
      layout_width="fill";
      layout_height="62dp";
      radius="18dp";
      CardElevation="2dp";
      CardBackgroundColor="0xAA07150F";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="horizontal";
        gravity="center_vertical";
        paddingLeft="13dp";
        paddingRight="12dp";

        {
          CardView;
          layout_width="40dp";
          layout_height="40dp";
          radius="20dp";
          CardElevation="0dp";
          CardBackgroundColor="0xAA123D2B";

          {
            ImageView;
            src="icon/ah1.png";
            lyout_width="100dp";
            layout_height="100dp";
            layout_gravity="center";

          };
        };

        {
          LinearLayout;
          layout_width="0dp";
          layout_height="wrap";
          layout_weight="1";
          orientation="vertical";
          layout_marginLeft="12dp";

          {
            TextView;
            id="telegramTitle";
            text="Developer : @KiroPh1";
            textColor="0xFFFFFFFF";
            textSize="15sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
          };

          {
            TextView;
            id="telegramSub";
            text="Creator Of The Injector";
            textColor="0xFF709487";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };

        {
          ImageView;
          src="icon/arrow.png";
          layout_width="20dp";
          layout_height="20dp";
          colorFilter="0xFFFF6868";
          padding="3dp";
        };
      };
    };

    {
      Space;
      layout_width="fill";
      layout_height="8dp";
    };


    {
      CardView;
      id="tg1";
      layout_width="fill";
      layout_height="62dp";
      radius="18dp";
      CardElevation="2dp";
      CardBackgroundColor="0xAA07150F";

      {
        LinearLayout;
        layout_width="fill";
        layout_height="fill";
        orientation="horizontal";
        gravity="center_vertical";
        paddingLeft="13dp";
        paddingRight="12dp";

        {
          CardView;
          layout_width="40dp";
          layout_height="40dp";
          radius="20dp";
          CardElevation="0dp";
          CardBackgroundColor="0xAA123D2B";

          {
            ImageView;
            src="icon/add.png";
            layout_width="fill";
            layout_height="fill";
            layout_gravity="center";

          };
        };

        {
          LinearLayout;
          layout_width="0dp";
          layout_height="wrap";
          layout_weight="1";
          orientation="vertical";
          layout_marginLeft="12dp";

          {
            TextView;
            id="feedbackTitle";
            text="Feedback";
            textColor="0xFFFFFFFF";
            textSize="15sp";
            textStyle="bold";
            layout_width="wrap";
            layout_height="wrap";
          };

          {
            TextView;
            id="feedbackSub";
            text="Send your feedback";
            textColor="0xFF709487";
            textSize="10sp";
            layout_width="wrap";
            layout_height="wrap";
            layout_marginTop="2dp";
          };
        };

        {
          ImageView;
          src="icon/arrow.png";
          layout_width="20dp";
          layout_height="20dp";
          colorFilter="0xFFFF6868";
          padding="3dp";
        };
      };
    };

    {
      LinearLayout;
      layout_width="fill";
      layout_height="0dp";
      layout_weight="1";
      gravity="bottom|center_horizontal";
      orientation="vertical";
      paddingBottom="5dp";

      {
        TextView;
        id="footerTitle";
        text="KIRO  • PRIVATE • PRIMIUM";
        textColor="0xFF65FF81";
        textSize="9sp";
        layout_width="wrap";
        layout_height="wrap";
      };

      {
        TextView;
        id="footerStatus";
        text="●  READY";
        textColor="0xFF00FF84";
        textSize="10sp";
        textStyle="bold";
        layout_width="wrap";
        layout_height="wrap";
        layout_marginTop="3dp";
      };
    };

  };
};