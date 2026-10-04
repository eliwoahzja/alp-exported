{
  -- ============================================================================
  -- MINIMISED MENU BUBBLE  (redesigned: smaller + iOS-style)
  -- ----------------------------------------------------------------------------
  -- WHAT CHANGED
  --   * 40dp -> 34dp circle, so it covers less of the game screen.
  --   * Pure black square-ish blob -> iOS dark "secondary surface" circle
  --     (0xFF1C2C2E) with a soft shadow, so it reads as a floating control.
  --   * The glyph now has 6dp of padding inside the circle instead of being
  --     stretched edge to edge.
  --
  -- HOW TO EDIT
  --   * Bubble size .... layout_width/layout_height on the CardView below (34dp).
  --   * Bubble colour .. backgroundColor (CardBackgroundColor is used instead when
  --                     you want it to follow a theme).
  --   * Icon ........... src="icon.png" (any image in your project folder works).
  --
  -- IMPORTANT: keep the ids "iconf" and "Win_minWindow".
  --   main.lua uses Win_minWindow for the tap-to-open handler AND for the
  --   drag-to-move handler (Win_minWindow.OnTouchListener), so renaming it will
  --   stop the bubble from being draggable.
  -- ============================================================================
  LinearLayout;
  layout_width = "fill";
  layout_height = "fill";
  {
    CardView;
    layout_width = "34dp";   -- was 40dp: smaller footprint on screen
    layout_height = "34dp";
    backgroundColor = "0xFF1C1C1E"; -- iOS dark surface (was 0xFF000000)
    CardElevation = "2dp";         -- soft lift, iOS uses subtle shadows
    radius = "100";                -- 100 => perfect circle
    layout_margin = "4dp";         -- was 5dp
    id = "iconf";
    {
      ImageView;
      layout_height = "fill";  -- fills the circle so the WHOLE bubble is
      layout_width = "fill";   -- tappable/draggable, not just the glyph
      src = "icon.png";
      id = "Win_minWindow";    -- do not rename - main.lua binds to this
      padding = "7dp";         -- was 0dp: keeps the glyph off the circle edge
      colorFilter = "0x00000000"; -- no tint: keeps the original icon colours
    };
  };
};