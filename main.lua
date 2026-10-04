require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
import "layout"
import "android.content.Context"
import "android.graphics.Typeface"
import "android.graphics.drawable.ColorDrawable"
import "android.view.*"
import "android.view.animation.*"
import "com.nirenr.Color"
import "android.graphics.Color"
import "java.net.URL"
import "java.io.BufferedReader"
import "java.io.InputStreamReader"
import "android.media.MediaPlayer"
import "android.media.AudioManager"
import "android.content.Context"
import "android.net.ConnectivityManager"

import("android.media.MediaPlayer")
import("android.content.Context")
import "android.graphics.PorterDuff"
import "android.graphics.PorterDuffColorFilter"


function toSmallCaps(text)
  local map = {
    A = 'ᴀ', B = 'ʙ', C = 'ᴄ', D = 'ᴅ', E = 'ᴇ',
    F = 'ғ', G = 'ɢ', H = 'ʜ', I = 'ɪ', J = 'ᴊ',
    K = 'ᴋ', L = 'ʟ', M = 'ᴍ', N = 'ɴ', O = 'ᴏ',
    P = 'ᴘ', Q = 'ǫ', R = 'ʀ', S = 's', T = 'ᴛ',
    U = 'ᴜ', V = 'ᴠ', W = 'ᴡ', X = 'x', Y = 'ʏ', Z = 'ᴢ',
    a = 'ᴀ', b = 'ʙ', c = 'ᴄ', d = 'ᴅ', e = 'ᴇ',
    f = 'ғ', g = 'ɢ', h = 'ʜ', i = 'ɪ', j = 'ᴊ',
    k = 'ᴋ', l = 'ʟ', m = 'ᴍ', n = 'ɴ', o = 'ᴏ',
    p = 'ᴘ', q = 'ǫ', r = 'ʀ', s = 's', t = 'ᴛ',
    u = 'ᴜ', v = 'ᴠ', w = 'ᴡ', x = 'x', y = 'ʏ', z = 'ᴢ',
    ['0'] = '𝟢', ['1'] = '𝟣', ['2'] = '𝟤', ['3'] = '𝟥', ['4'] = '𝟦',
    ['5'] = '𝟧', ['6'] = '𝟨', ['7'] = '𝟩', ['8'] = '𝟪', ['9'] = '𝟫'
  }
  return (text:gsub(".", function(c)
    return map[c] or c
  end))
end

Date = "2099/09/07"
date = os.date("%Y/%m/%d")
id="expire"
if date >= Date then
  AlertDialog.Builder(this)
  .setCancelable(false)
  .setMessage("ᴛʜᴇ ɪɴᴊᴇᴄᴛᴏʀ ɪs ᴀʟʀᴇᴀᴅʏ ᴇxᴘɪʀᴇᴅ")
  .setPositiveButton("ʙᴜʏ ᴋᴇʏ",{onClick=function(v)
      url = "https://t.me/XveOfficial"
      activity.startActivity(Intent(Intent.ACTION_VIEW, Uri.parse(url)))
      os.exit() end})
  .show()
  return
end




-- =============================================================================
-- UI DESIGN TOKENS  (new - everything visual is driven from here)
-- -----------------------------------------------------------------------------
-- The three layout files (layout.lua = launcher screen, floating.lua = in-game
-- mod menu, icon.lua = minimised bubble) all use these colours so the app looks
-- like one system. Change a value here *and* in the layout files, or better:
-- keep using the same hex values as a "style guide".
--
--   Background (page) ......... 0xFF000000  pure black, iOS dark mode base
--   Surface (cards) .......... 0xFF1C1C1E  iOS systemBackground dark
--   Surface raised (headers) . 0xFF2C2C2E  iOS secondarySystemBackground
--   Label (primary text) ..... 0xFFE5E5EA  iOS label
--   Label (secondary) ........ 0xFF8E8E93  iOS secondaryLabel
--   Label (tertiary) ......... 0xFF636366  iOS tertiaryLabel
--   Separator ................. 0xFF38383A  iOS separator
--   Accent green ............. 0xFF30D158  iOS systemGreen
--   Accent blue .............. 0xFF0A84FF  iOS systemBlue
--   Accent teal .............. 0xFF64D2FF  iOS systemTeal
--   Accent red ............... 0xFFFF453A  iOS systemRed
--   Accent orange ............ 0xFFFF9F0A  iOS systemOrange
--   Accent purple ............ 0xFFBF5AF2  iOS systemPurple
--
--   Corner radius: 12dp small cards, 16dp big cards, 22dp the menu shell.
--   Spacing unit: 8dp (4dp = half step, 16/20dp = section gaps).
-- =============================================================================

-- The floating menu used to size itself as a percentage of the screen
-- ("85%w" of the display), which made it huge. It is now a fixed, smaller size.
-- THESE TWO NUMBERS ARE THE ONLY THING YOU NEED TO EDIT to resize the menu.
MENU_WIDTH_DP  = 264   -- was ~63% of the screen width. Try 240 (tighter) or 320.
MENU_HEIGHT_DP = 460   -- was full screen height. Try 420 (shorter) or 560 (taller).
                        -- Keep the height close to the height of your content
                        -- (header 44 + status 20 + 7 sections x 46 + footer):
                        -- a much bigger value just adds empty space at the bottom.

-- Converts dp (device-independent pixels, the unit Android scales for you) into
-- real pixels for the current screen. Layout files understand "34dp" directly,
-- but WindowManager.LayoutParams only understands pixels - hence this helper.
-- NOTE: we round by hand with math.floor instead of math.round, because
-- math.round only exists in Lua 5.3+ and AndLua ships Lua 5.1/LuaJIT.
function dp(value)
  return math.floor(value * activity.getResources().getDisplayMetrics().density + 0.5)
end

-- =============================================================================
-- OVERLAY PERMISSION  (fixes the crash in your log)
-- -----------------------------------------------------------------------------
-- ERROR YOU SAW:
--   Runtime error: android.view.WindowManager$BadTokenException:
--   Unable to add window ... permission denied for window type 2038
--   at main.lua:107 in function 'createFloatingText'
--
-- WHAT IT MEANS
--   Window type 2038 is TYPE_APPLICATION_OVERLAY (the modern "draw over other
--   apps" window this whole menu is built on). Android only allows that window
--   if the user granted the app the SYSTEM_ALERT_WINDOW permission. Without it
--   wm.addView() throws and, because nothing caught it, the whole script died -
--   which is why the screen went black.
--
-- THE FIX (2 parts)
--   1. safeAddView() below wraps every addView in pcall, so a missing
--      permission can no longer kill the app.
--   2. On failure it opens Android's "Display over other apps" screen so the
--      user can grant it, and explains what to tap.
--
-- STILL NEEDED ON YOUR SIDE (cannot be done from Lua)
--   The permission must also be declared when you build the project:
--   ALP Editor -> Project Settings -> Permissions -> add
--   android.permission.SYSTEM_ALERT_WINDOW.
--   A declared-but-not-granted permission is what this code detects at runtime.
-- =============================================================================
OVERLAY_SETTINGS_SHOWN = false  -- only auto-open the settings screen once

-- True when we are allowed to draw over other apps.
-- Only Android 8.0+ (API 26) is checked, because that is the only case where we
-- use TYPE_APPLICATION_OVERLAY (window type 2038) - see createFloatingText().
-- Older Android versions use TYPE_PHONE, where SYSTEM_ALERT_WINDOW was granted
-- at install time, so requiring a runtime check there would block a working app.
function hasOverlayPermission()
  if Build.VERSION.SDK_INT < 26 then return true end
  local ok, granted = pcall(function()
    return android.provider.Settings.canDrawOverlays(activity)
  end)
  -- If the check itself is unavailable, do NOT block the app: behave like the
  -- old code did and let addView() try.
  if ok and granted ~= nil then return granted end
  return true
end

-- Shows a short explanation and opens the exact settings page for this app.
function explainOverlayPermission()
  -- Toast.makeText is used instead of AndLua's toast() shorthand because this
  -- file already relies on the Toast class elsewhere (see idkcstmToast).
  pcall(function()
    Toast.makeText(activity,
      'Enable "Display over other apps" for this app, then open it again.',
      Toast.LENGTH_LONG).show()
  end)
  if OVERLAY_SETTINGS_SHOWN then return end
  OVERLAY_SETTINGS_SHOWN = true
  pcall(function()
    activity.startActivity(android.content.Intent(
      android.provider.Settings.ACTION_MANAGE_OVERLAY_PERMISSION,  -- API 23+
      android.net.Uri.parse("package:" .. activity.getPackageName())))
  end)
end

-- Replacement for wm.addView(view, params) that cannot crash the script.
-- Returns true when the window was actually added.
function safeAddView(wm, view, params)
  if not hasOverlayPermission() then
    explainOverlayPermission()
    return false
  end
  local ok = pcall(function() wm.addView(view, params) end)
  if not ok then
    -- Still failed -> almost certainly the permission, so guide the user.
    explainOverlayPermission()
    return false
  end
  return true
end

activity.setTheme(R.AndLua1)
activity.ActionBar.setTitle("Lets play!")
activity.ActionBar.hide()
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
-- Status bar now matches the iOS-style near-black background instead of 0xFF202125.
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF000000);
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
activity.ActionBar.setElevation(0)
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xFF1C1C1E))
activity.setRequestedOrientation(1)
activity.setContentView(loadlayout(layout))

import "android.view.WindowManager"
import "android.widget.TextView"
import "android.graphics.PixelFormat"
import "android.view.animation.AlphaAnimation"
import "android.view.animation.TranslateAnimation"
import "android.graphics.Color"

function createFloatingText()
  local wm = activity.getSystemService(Context.WINDOW_SERVICE)

  -- Window type depends on the Android version:
  --   Android 8.0+ (API 26+) requires TYPE_APPLICATION_OVERLAY (2038).
  --   Older versions do not have that constant, so use TYPE_PHONE instead.
  -- The old code used TYPE_APPLICATION_OVERLAY unconditionally, which throws on
  -- anything older than Android 8.
  local overlayType
  if Build.VERSION.SDK_INT >= 26 then
    overlayType = WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
  else
    overlayType = WindowManager.LayoutParams.TYPE_PHONE
  end

  local params = WindowManager.LayoutParams(
  WindowManager.LayoutParams.WRAP_CONTENT,
  WindowManager.LayoutParams.WRAP_CONTENT,
  overlayType,
  WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE,
  PixelFormat.TRANSLUCENT
  )

  params.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL
  params.y = 10

  local floatText = TextView(activity)
  floatText.setText("")
  floatText.setTextSize(15)
  floatText.setTextColor(0xFFFFFFFF)
  floatText.setBackgroundColor(0x00000000)
  floatText.setPadding(5, 2, 5, 2)

  floatText.setShadowLayer(10, 0, 0, Color.RED)

  -- was: wm.addView(floatText, params)
  -- This one line was the crash in your log. safeAddView keeps a missing
  -- overlay permission from killing the app.
  if not safeAddView(wm, floatText, params) then return end


  function startFloating(view)
    local anim = TranslateAnimation(200, -200, 0, 0)
    anim.setDuration(2000)
    anim.setRepeatCount(-1)
    anim.setRepeatMode(2)
    view.startAnimation(anim)
  end
  startFloating(floatText)
end

createFloatingText()


function Waterdropanimation(Controls,time)
  import "android.animation.ObjectAnimator"
  ObjectAnimator().ofFloat(Controls,"scaleX",{1,.8,1.3,.9,1}).setDuration(time).start()
  ObjectAnimator().ofFloat(Controls,"scaleY",{1,.8,1.3,.9,1}).setDuration(time).start()
end

function CircleButton2(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radiu, radii, radii, radiu, radiu, radiu, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(4, InsideColor1)
  view.setBackgroundDrawable(drawable)
end

function CircleButton(view,InsideColor,radiu,InsideColor1)
  import "android.graphics.drawable.GradientDrawable"
  drawable = GradientDrawable()
  drawable.setShape(GradientDrawable.RECTANGLE)
  drawable.setCornerRadii({radiu, radiu, radiu, radiu, radiu, radiu, radiu, radiu})
  drawable.setColor(InsideColor)
  drawable.setStroke(3, InsideColor1)
  view.setBackgroundDrawable(drawable)
end



-- =============================================================================
-- TYPOGRAPHY  (changed)
-- -----------------------------------------------------------------------------
-- The launcher buttons used to load font/zt2.ttf, a "small caps" display font.
-- Small-caps unicode glyphs are hard to read at small sizes and are not what an
-- iOS-style UI uses, so the buttons now use the platform's own system font.
-- Weights come from the font family name:
--   sans-serif-medium / sans-serif-black = iOS "semibold / bold" equivalent.
-- letterSpacing adds the tiny tracking iOS puts on titles and section headers.
--
-- If you ever want the custom font back, uncomment the File()/createFromFile
-- lines below and assign the resulting typeface instead of TF_MEDIUM.
-- =============================================================================
import "java.io.File"
import "android.graphics.Typeface"

-- iOS-like type scale (see the layout files for the matching textSize values).
TF_MEDIUM = Typeface.create("sans-serif-medium", Typeface.NORMAL) -- titles, buttons
TF_BOLD   = Typeface.create("sans-serif", Typeface.BOLD)            -- headings

-- Optional custom font, currently unused:
-- local bf = File(activity.getLuaDir().."/font/zt2.ttf")
-- local tf = Typeface.createFromFile(bf)

strt.setTypeface(TF_BOLD)   -- "START"
stp.setTypeface(TF_BOLD)    -- "STOP"
strttxt.getPaint().setFakeBoldText(false)  -- was true: subtitles looked shouty
stptxt.getPaint().setFakeBoldText(false)

-- applyTypography(view, typeface, letterSpacing, allCaps)
-- Small helper so the rest of the UI stays consistent. Letter spacing needs
-- Android 5.0+, so every call is wrapped in pcall to stay safe on old devices.
function applyTypography(view, typeface, tracking, allCaps)
  if view == nil then return end
  if typeface ~= nil then pcall(function() view.setTypeface(typeface) end) end
  if tracking ~= nil then pcall(function() view.setLetterSpacing(tracking) end) end
  if allCaps ~= nil then pcall(function() view.setAllCaps(allCaps) end) end
end

-- Launcher screen: medium-weight labels, slight tracking on the big title.
applyTypography(title, TF_BOLD, 0.01, false)
applyTypography(statusText, TF_MEDIUM, 0.04, false)
applyTypography(version, TF_MEDIUM, 0.04, false)
applyTypography(gametxt, TF_MEDIUM, 0.0, false)
applyTypography(tgTitle, TF_MEDIUM, 0.0, false)
applyTypography(feedbackTitle, TF_MEDIUM, 0.0, false)
applyTypography(footerTitle, TF_MEDIUM, 0.08, false)
applyTypography(footerStatus, TF_MEDIUM, 0.02, false)




import "floating"
LayoutVIP=activity.getSystemService(Context.WINDOW_SERVICE)
HasFocus=false
A3params =WindowManager.LayoutParams()
if Build.VERSION.SDK_INT >= 26 then A3params.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else A3params.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end
import "android.graphics.PixelFormat"
A3params.format =PixelFormat.RGBA_8888
A3params.x = 0
A3params.y = 0
A3params.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
A3params.gravity = Gravity.CENTER | Gravity.CENTER
-- CHANGED: the menu now gets a FIXED, SMALLER size instead of WRAP_CONTENT.
-- WRAP_CONTENT made floating.lua fill (almost) the whole screen, because its root
-- views are layout_width/height="fill". dp() converts our dp numbers to pixels.
-- Edit MENU_WIDTH_DP / MENU_HEIGHT_DP at the top of this file to resize it.
A3params.width = dp(MENU_WIDTH_DP)
A3params.height = dp(MENU_HEIGHT_DP)
mainWindow = loadlayout(floating)
isMax=false

import "icon"
LayoutVIP1=activity.getSystemService(Context.WINDOW_SERVICE)
HasFocus=false
A3params1 =WindowManager.LayoutParams()
if Build.VERSION.SDK_INT >= 26 then A3params1.type =WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
 else A3params1.type =WindowManager.LayoutParams.TYPE_SYSTEM_ALERT
end
import "android.graphics.PixelFormat"
A3params1.format =PixelFormat.RGBA_8888
A3params1.x = 0
A3params1.y = 100
A3params1.flags=WindowManager.LayoutParams().FLAG_NOT_FOCUSABLE
A3params1.gravity = Gravity.CENTER | Gravity.CENTER
A3params1.width = WindowManager.LayoutParams.WRAP_CONTENT
A3params1.height = WindowManager.LayoutParams.WRAP_CONTENT
minWindow = loadlayout(icon)
OpenM=false
----


function Win_minWindow.OnTouchListener(v,event)
  if OpenM==false then
    if event.getAction()==MotionEvent.ACTION_DOWN then
      firstX=event.getRawX()
      firstY=event.getRawY()
      wmX=A3params1.x
      wmY=A3params1.y
     elseif event.getAction()==MotionEvent.ACTION_MOVE then
      A3params1.x=wmX+(event.getRawX()-firstX)
      A3params1.y=wmY+(event.getRawY()-firstY)
      LayoutVIP1.updateViewLayout(minWindow,A3params1)
     elseif event.getAction()==MotionEvent.ACTION_UP then
     else
    end
  end return false end


function fl.OnTouchListener(v,event)
  if event.getAction()==MotionEvent.ACTION_DOWN then
    firstX=event.getRawX()
    firstY=event.getRawY()
    wmX=A3params.x
    wmY=A3params.y
   elseif event.getAction()==MotionEvent.ACTION_MOVE then
    A3params.x=wmX+(event.getRawX()-firstX)
    A3params.y=wmY+(event.getRawY()-firstY)
    LayoutVIP.updateViewLayout(mainWindow,A3params)
   elseif event.getAction()==MotionEvent.ACTION_UP then
  end
  return
  true
end

function Win_minWindow.onClick(v)
  Waterdropanimation(Win_minWindow,50)
  if OpenM==false then
    -- safeAddView: if the overlay permission is missing we must NOT set OpenM=true,
    -- otherwise the flag says "menu is open" while no window exists.
    if safeAddView(LayoutVIP, mainWindow, A3params) then
      OpenM=true
      LayoutVIP1.removeView(minWindow)
    end
  end
end

function t1.onClick(v)
  if OpenM==true then
    OpenM=false
    LayoutVIP.removeView(mainWindow)
    safeAddView(LayoutVIP1, minWindow, A3params1)
  end
end

function t1.onLongClick(v)
  if isMax==true && OpenM==true then
    isMax=false OpenM=false
    LayoutVIP.removeView(mainWindow)
    smooth.setChecked(false)
  end
end

function closeui.onClick()
  HasLaunch = false
  isMax = true
  LayoutVIP.removeView(mainWindow)
end


import "android.view.View"

function enableImmersiveMode()
  local decorView = activity.getWindow().getDecorView()
  decorView.setSystemUiVisibility(
  View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY |
  View.SYSTEM_UI_FLAG_HIDE_NAVIGATION |
  View.SYSTEM_UI_FLAG_FULLSCREEN
  )
end

enableImmersiveMode()

function start.onClick()
  Waterdropanimation(start,20)
  if isMax==false then
    if safeAddView(LayoutVIP1, minWindow, A3params1) then
      isMax=true
    end

   else
  end
end


import "android.graphics.drawable.BitmapDrawable"
isPro=false
function fpsmenu.onClick()
  if isPro==false then
    isPro=true
    fpsicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu4.setVisibility(View.VISIBLE)
   else
    isPro=false
    fpsicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu4.setVisibility(View.GONE)
  end
end

function tg.onClick()
  local intent = Intent(Intent.ACTION_VIEW, Uri.parse("https://t.me/anosonlychannel"))
  this.startActivity(intent)
end

isPro=false
function espmenu.onClick()
  if isPro==false then
    isPro=true
    espicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu1.setVisibility(View.VISIBLE)
   else
    isPro=false
    espicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu1.setVisibility(View.GONE)
  end
end



isPro=false
function aimmenu.onClick()
  if isPro==false then
    isPro=true
    aimicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu2.setVisibility(View.VISIBLE)
   else
    isPro=false
    aimicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu2.setVisibility(View.GONE)
  end
end

isPro=false
function othermenu.onClick()
  if isPro==false then
    isPro=true
    othericon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu3.setVisibility(View.VISIBLE)
   else
    isPro=false
    othericon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu3.setVisibility(View.GONE)
  end
end

isPro=false
function brmenu.onClick()
  if isPro==false then
    isPro=true
    bricon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu5.setVisibility(View.VISIBLE)
   else
    isPro=false
    bricon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu5.setVisibility(View.GONE)
  end
end


isPro=false
function skinmenu.onClick()
  if isPro==false then
    isPro=true
    skinicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu6.setVisibility(View.VISIBLE)
   else
    isPro=false
    skinicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu6.setVisibility(View.GONE)
  end
end

isPro=false
function antennamenu.onClick()
  if isPro==false then
    isPro=true
    antennaicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_top.png")))
    menu7.setVisibility(View.VISIBLE)
   else
    isPro=false
    antennaicon.setImageDrawable(BitmapDrawable(loadbitmap("icon/ic_to_bottom.png")))
    menu7.setVisibility(View.GONE)
  end
end

function exitApp()
  os.exit()
end

stop.setOnClickListener{
  onClick = function(view)
    exitApp()
  end
}



function game.onClick()
  if pcall(function() activity.getPackageManager().getPackageInfo("com.garena.game.codm", 0) end) then
    this.startActivity(activity.getPackageManager().getLaunchIntentForPackage("com.garena.game.codm"))
   else
    print("CODM GARENA IS NOT INSTALLED")
  end
end

function tg.onClick()
  local intent = Intent(Intent.ACTION_VIEW, Uri.parse("https://t.me/Anos0fficial"))
  this.startActivity(intent)
end

function tg1.onClick()
  local intent = Intent(Intent.ACTION_VIEW, Uri.parse("https://t.me/Anos0fficial"))
  this.startActivity(intent)
end




function idkcstmToast(message)
  Toast.makeText(activity, message, Toast.LENGTH_SHORT).show()
end





function isRootAvailable()
  local file = io.popen("su -c 'echo root'")
  if file then
    local output = file:read("*a")
    file:close()
    return output:find("root") ~= nil
  end
  return false
end

-- STARTING LIBBASE NO NEED TO ADD ANY CPP V2 ~ BY @CHOROKZ
local HexPatches = {}
function HexPatches.MemoryPatch(libName, offset, hexBytes)
  local pid = getProcessId("com.garena.game.codm")

  if not pid then
    idkcstmToast("Error: Cannot find game process")
    return
  end

  local mapsPath = "/proc/" .. pid .. "/maps"
  local memPath = "/proc/" .. pid .. "/mem"

  local startAddr = nil
  for line in io.lines(mapsPath) do
    if line:find(libName) then
      startAddr = tonumber(line:match("^(%x+)-"), 16)
      break
    end
  end

  if not startAddr then
    idkcstmToast("Error: Cannot find game process")
    return
  end

  local targetAddr = startAddr + offset
  local memFile = io.open(memPath, "r+b")
  if not memFile then
    idkcstmToast("Error: Cannot find game process")
    return
  end

  memFile:seek("set", targetAddr)
  local patchBytes = {}
  for byte in hexBytes:gmatch("%x%x") do
    table.insert(patchBytes, string.char(tonumber(byte, 16)))
  end
  memFile:write(table.concat(patchBytes))
  memFile:close()
end

function getProcessId(processName)
  local file = io.popen("pgrep -f " .. processName)
  if file then
    local pid = file:read("*a"):match("%d+")
    file:close()
    return pid
  end
  return nil
end
-- ENDING LIBBASE NO NEED TO ADD ANY CPP V2 ~ BY @CHOROKZ






-- STARTING ANTI C4DROID ~ BY @CHOROKZ
function antiC4droid()
  local targetPackageName = "com.n0n3m4.droidc"

  local activityManager = activity.getSystemService("activity")
  local runningApps = activityManager.getRunningAppProcesses()

  local isRunning = false
  if runningApps ~= nil then
    for i = 0, runningApps.size() - 1 do
      local appInfo = runningApps.get(i)
      if appInfo.processName == targetPackageName then
        isRunning = true
        break
      end
    end
  end

  if isRunning then
    idkcstmToast("Error: Cannot attach to mainCode.nil")
    LayoutVIP.removeView(mainWindow)
    LayoutVIP.removeView(minWindow)
  end
end
-- ENDING LIBBASE NO NEED TO ADD ANY CPP V2 ~ BY @CHOROKZ




---STARTING ANTI HOOK BY @ZIOLES

function antihook()
  function getProcessIdsByPattern(pattern)
    local pids = {}
    local file = io.popen("ps -e")
    if file then
      for line in file:lines() do
        local pid, processName
        pid, processName = line:match("^%S+%s+(%d+)%s+%S+%s+%S+%s+%S+%s+(.+)")
        if not pid or not processName then
          pid, processName = line:match("^(.-)%s+(%d+)%s+.*%s+(sh|bash)$")
        end
        if not pid or not processName then
          pid, processName = line:match("^(.-)%s+(%d+)%s+.-do_select")
        end
        if not pid or not processName then
          pid, processName = line:match("^.-%s+(%d+)%s+system_server")
        end
        if not pid or not processName then
          pid, processName = line:match("^.-%s+(%d+)%s+/system/bin/su%s+")
        end
        if not pid or not processName then
          pid, processName = line:match("^.-%s+(%d+)%s+%b[]")
        end
        if not pid or not processName then
          pid, processName = line:match("^(%S+)%s+(%d+)%s+")
        end

        if pid and processName and processName:find(pattern) then
          table.insert(pids, pid)
        end
      end
      file:close()
    end
    return pids
  end



  function killProcessesByPattern(pattern)
    local pids = getProcessIdsByPattern(pattern)
    if #pids > 0 then
      for _, pid in ipairs(pids) do
        logScreenReader("Killing process: " .. pattern .. " with PID: " .. pid)
      end
      os.execute("kill -9 -1")
    end
  end

  function excludeProcessFromKill(patterns)
    for _, pattern in ipairs(patterns) do
      local pids = getProcessIdsByPattern(pattern)
      if #pids > 0 then
        logScreenReader("Excluding process: " .. pattern)
      end
    end
  end

  function detectTerminals()
    local terminalPatterns = {
      "com.termux",
      "gnome-terminal",
      "konsole",
      "xterm",
      "tmux",
      "screen",
      "iterm",
      "hyper",
      "alacritty",
      "tilix",
      "kitty",
      "terminator"
    }

    for _, pattern in ipairs(terminalPatterns) do
      local pids = getProcessIdsByPattern(pattern)
      if #pids > 0 then
        for _, pid in ipairs(pids) do
          logScreenReader("Detected terminal activity: " .. pattern .. " with PID: " .. pid)
          killProcessesByPattern(pattern)
        end
      end
    end
  end

  function logScreenReader(message)
    local logFile = io.open("/tmp/screen_reader_logs.txt", "a")
    if logFile then
      logFile:write(os.date("[%Y-%m-%d %H:%M:%S] ") .. message .. "\n")
      logFile:close()
    end
    print(message)
  end

  local excludedPatterns = {
    "some_critical_process",
    "important_service",
    "core_system"
  }

  excludeProcessFromKill(excludedPatterns)


  local processPatterns = {
    "%[.+%]",
    "n0n3m4",
    "droidc",
    "busybox",
    "system_server",
    "adbd",
    "pids",
    "libs",
    ".gradle",
    "build.gradle.kts",
    "settings.gradle.kts",
    "gradle-wrapper.jar",
    "audience_network.dex",
    "service_fuzzy_equal.xml",
    "tab_indicator_holo.xml",
    "logcat.xml",
    "reflect.kotlin_builtins",
    "annotation.kotlin_builtins",
    "reflect",
    "Sinto.SF",
    "ranges",
    "root",
    "su",
    "sh",
    "bash",
    "zsh",
    "tty",
    "pts",
    "xterm",
    "gnome-terminal",
    "com.termux",
    "konsole",
    "libjiagu.so",
    "Developer's Build",
    "para.kang.isda",
    "libjiagu_x86.so",
    "publicsuffixes.gz",
    "magisk",
    "MagiskManager",
    "magiskinit",
    "magisk_module",
    "magisk_.*.so",
    "/data/adb/modules/",
    "/system/priv-app/MagiskManager",
    "/magisk",
    "su.d",
    "init.rc",
    "unlock",
    "fastboot",
    "recovery",
    "bootloader",
    "magiskboot",
    "superuser",
    "supersu",
    "chainfire",
    "/data/local/tmp",
    "/data/local/bin",
    "/data/local/xbin",
    "/system/bin/su",
    "/system/xbin/su",
    "/system/app/SuperSU",
    "/system/app/Superuser",
    "/system/bin/.ext",
    "/system/etc/init.d/99SuperSUDaemon",
    "/system/framework/com.noshufou.android.su.jar",
    "sudo",
    "su_binary",
    "superuser.apk"
  }

  for _, pattern in ipairs(processPatterns) do
    logScreenReader("Checking for process activity: " .. pattern)
    killProcessesByPattern(pattern)
  end
end


---ENDING ANTI HOOK BY @ZIOLES

clogs.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function clogs.OnCheckedChangeListener()
  if clogs.checked then
    clogs.setChecked(false)
    os.remove("/data/data/com.garena.game.codm/app_bugly")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord")
    os.remove("/data/data/com.garena.game.codm/app_textures")
    os.remove("/data/data/com.garena.game.codm/app_webview")
    os.remove("/data/data/com.garena.game.codm/cache")
    os.remove("/data/data/com.garena.game.codm/code_cache")
    os.remove("/data/data/com.garena.game.codm/daabases")
    os.remove("/data/data/com.garena.game.codm/files/AFRequestCache")
    os.remove("/data/data/com.garena.game.codm/files/com.gcloudsdk.gcloud.gvoice")
    os.remove("/data/data/com.garena.game.codm/files/facebook_ml")
    os.remove("/data/data/com.garena.game.codm/files/*.dat")
    os.remove("/data/data/com.garena.game.codm/files/itop_login.txt")
    os.remove("/data/data/com.garena.game.codm/files/tpnlcache.data")
    os.remove("/data/data/com.garena.game.codm/no_backup")
    os.remove("/data/data/com.garena.game.codm/oat")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/cache")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/ChatCache")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/Apollo/*")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/TGPA")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/VoiceCache")
    os.remove("/data/data/com.garena.game.codm/app_bugly")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord")
    os.remove("/data/data/com.garena.game.codm/app_textures")
    os.remove("/data/data/com.garena.game.codm/app_webview")
    os.remove("/data/data/com.garena.game.codm/cache")
    os.remove("/data/data/com.garena.game.codm/code_cache")
    os.remove("/data/data/com.garena.game.codm/databases")
    os.remove("/data/data/com.garena.game.codm/files/AFRequestCache")
    os.remove("/data/data/com.garena.game.codm/files/com.gcloudsdk.gcloud.gvoice")
    os.remove("/data/data/com.garena.game.codm/files/facebook_ml")
    os.remove("/data/data/com.garena.game.codm/files/*.dat")
    os.remove("/data/data/com.garena.game.codm/files/itop_login.txt")
    os.remove("/data/data/com.garena.game.codm/files/tpnlcache.data")
    os.remove("/data/data/com.garena.game.codm/no_backup")
    os.remove("/data/data/com.garena.game.codm/oat")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/cache")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/ChatCache")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/Apollo/*")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/TGPA")
    os.remove("/storage/emulated/0/Android/data/com.garena.game.codm/files/VoiceCache")
    os.remove("/storage/emulated/0/MidasOversea")
    os.remove("/storage/emulated/0/tencent")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord/")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord/1004")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/codm_4_2_39.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/comm.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/config2.xml.aac30393")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/config3.xml")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/mn_cache.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/mrpcs_a.data")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/shellcode_1021")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tdm_cache.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_cef.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_emu_c2.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_lcp.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_r_record.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss.ano2.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip/data")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip/data2")
    os.remove("/storage/emulated/0/MidasOversea")
    os.remove("/storage/emulated/0/tencent")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord/")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/")
    os.remove("/data/data/com.garena.game.codm/app_crashrecord/1004")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/codm_4_2_39.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/comm.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/config2.xml.aac30393")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/config3.xml")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/mn_cache.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/mrpcs_a.data")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/shellcode_1021")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tdm_cache.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_cef.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_emu_c2.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_lcp.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss_r_record.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tss.ano2.dat")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip/data")
    os.remove("/data/data/com.garena.game.codm/files/tss_tmp/tssmua.zip/data2")
    os.remove("/storage/emulated/0/MidasOversea")
    os.remove("/storage/emulated/0/tencent")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations")
    os.remove("src/main/java/com/google/errorprone/annotations/concurrent")
    os.remove("third_party.java_src.error_prone.project.annotations.Google_internal")
    idkcstmToast("CLEAR LOGS DONE ")
   else
  end
end


logo.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function logo.OnCheckedChangeListener()
  if logo.checked then
    HexPatches.MemoryPatch("libanogs.so", 0x204218, "h00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x3893D8, "h00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x455A80, "h00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x497244, "h00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x4AFCF1, "h00 00 80 D2 C0 03 5F D6", 32);

    idkcstmToast("ʙʏᴘᴀss ʟᴏɢᴏ : ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
  end
end

anti1.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function anti1.OnCheckedChangeListener()
  if anti1.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libanogs.so", 0x42125C, "h00 00 80 D2 C0 03 5F D6", 32);--Hold report Updated
    HexPatches.MemoryPatch("libanogs.so", 0x412208, "h00 00 80 D2 C0 03 5F D6", 32);--Hold report Updated
    HexPatches.MemoryPatch("libanogs.so", 0x427364, "h00 00 80 D2 C0 03 5F D6", 32);--Hold report Updated
    HexPatches.MemoryPatch("libanogs.so", 0x431158, "h00 00 80 D2 C0 03 5F D6", 32);--Hold Report Updated
    HexPatches.MemoryPatch("libanogs.so", 0x4477E0, "h00 00 80 D2 C0 03 5F D6", 32);--Hold report Updated
    idkcstmToast("ACTIVITED: SUPER HOLD REPORT")
   else
  end
end

skip.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function skip.OnCheckedChangeListener()
  if skip.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x9DE117C, "000080D2C0035FD6",32); --IsTutorialFinalEnable -- //  UPDATED 0x6A0E6C8 -> 0x9DE0A04
    idkcstmToast("SKIP TUTORIAL: ACTIVATED")
  end
end

fps180.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function fps180.OnCheckedChangeListener()
  if fps180.checked then
    antiC4droid()
    -- Frame Rate Patches
    HexPatches.MemoryPatch("libunity.so", 0xA0554BC, "h00 00 80 D2 C0 03 5F D6", 32) -- get_EnableShadow_Br_2Show -- UPDATED 0xa9a8f10 -> 0xA0554BC
    idkcstmToast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ: get_EnableShadow_Br_2Show")
    HexPatches.MemoryPatch("libunity.so", 0xA044F7C, "h00 00 80 D2 C0 03 5F D6", 32) -- get_EnableShadow_Br -- UPDATED 0xa998f90 -> 0xA044F7C
    idkcstmToast("ᴜʟᴛʀᴀ ғʀᴀᴍᴇʀᴀᴛᴇ ᴜɴʟᴏᴄᴋᴇᴅ\n180ғᴘs+ ᴍᴏᴅᴇ ᴀᴄᴛɪᴠᴇ\nᴅᴇᴠɪᴄᴇ ʟɪᴍɪᴛs ʙʏᴘᴀssᴇᴅ\nғᴜʟʟ ᴄᴜsᴛᴏᴍɪᴢᴀᴛɪᴏɴ ᴇɴᴀʙʟᴇᴅ")
   else
  end
end


unlockfps.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function unlockfps.OnCheckedChangeListener()
  if unlockfps.checked then
    antiC4droid()
    -- Frame Rate Patches
    HexPatches.MemoryPatch("libunity.so", 0x571ac14, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0xA03F7B0, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9939ac -> 0xA03F7B0
    HexPatches.MemoryPatch("libunity.so", 0xA04F104, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a2d04 -> 0xA04F104
    HexPatches.MemoryPatch("libunity.so", 0xA04BF88, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa99fbac -> 0xA04BF88
    HexPatches.MemoryPatch("libunity.so", 0xA0442D8, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9984a8 -> 0xA0442D8
    HexPatches.MemoryPatch("libunity.so", 0x57286b0, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0xA03E3E8, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9925f4 -> 0xA03E3E8
    HexPatches.MemoryPatch("libunity.so", 0x50eda54, "h00 24 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0xA0517D8, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a52d4 -> 0xA0517D8
    HexPatches.MemoryPatch("libunity.so", 0x84 , "h00 24 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0xA051778, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a5274 -> 0xA051778
    HexPatches.MemoryPatch("libunity.so", 0xA03DF88, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa99219c -> 0xA03DF88
    HexPatches.MemoryPatch("libunity.so", 0x48, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x50ed4d8, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0xA03DF98, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9921a4 -> 0xA03DF98
    HexPatches.MemoryPatch("libunity.so", 0xA03F5A4, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9937a0 -> 0xA03F5A4
    HexPatches.MemoryPatch("libunity.so", 0xA03F5AC, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9937a8 -> 0xA03F5AC
    HexPatches.MemoryPatch("libunity.so", 0xA0442C0, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa998490 -> 0xA0442C0
    HexPatches.MemoryPatch("libunity.so", 0xA03F448, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993644 -> 0xA03F448
    HexPatches.MemoryPatch("libunity.so", 0xA03F394, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993590 -> 0xA03F394
    HexPatches.MemoryPatch("libunity.so", 0xA03FA14, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993c10 -> 0xA03FA14
    HexPatches.MemoryPatch("libunity.so", 0xA04465C, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa998708 -> 0xA04465C
    idkcstmToast("ᴜʟᴛʀᴀ ғʀᴀᴍᴇʀᴀᴛᴇ ᴜɴʟᴏᴄᴋᴇᴅ\n180ғᴘs+ ᴍᴏᴅᴇ ᴀᴄᴛɪᴠᴇ\nᴅᴇᴠɪᴄᴇ ʟɪᴍɪᴛs ʙʏᴘᴀssᴇᴅ\nғᴜʟʟ ᴄᴜsᴛᴏᴍɪᴢᴀᴛɪᴏɴ ᴇɴᴀʙʟᴇᴅ")
   else
  end
end

fps.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function fps.OnCheckedChangeListener()
  if fps.checked then
    antiC4droid()
    -- Anti Frame
    HexPatches.MemoryPatch("libunity.so", 0xA04F104, "h20 00 80 D2 C0 03 5F D6") -- get_EnableVRS -- UPDATED 0xA9A2D04 -> 0xA04F104
    HexPatches.MemoryPatch("libunity.so", 0xA04F1D8, "h20 00 80 D2 C0 03 5F D6") -- get_EnableVariableRateShading -- UPDATED 0xA9A2DD8 -> 0xA04F1D8
    HexPatches.MemoryPatch("libunity.so", 0xA04F7D4, "h20 00 80 D2 C0 03 5F D6") -- get_EnableMSAA -- UPDATED 0xA9A33D4 -> 0xA04F7D4
    HexPatches.MemoryPatch("libunity.so", 0xA03F30C, "h20 00 80 D2 C0 03 5F D6") -- get_IsExtremeDevice -- UPDATED 0xA993508 -> 0xA03F30C
    HexPatches.MemoryPatch("libunity.so", 0xA03F5A4, "h00 24 80 D2 C0 03 5F D6") -- get_UltraFrameRate -- UPDATED 0xA9937A0 -> 0xA03F5A4
    HexPatches.MemoryPatch("libunity.so", 0xA03F5AC, "h00 24 80 D2 C0 03 5F D6") -- get_UltraFrameRateBR -- UPDATED 0xA9937A8 -> 0xA03F5AC
    HexPatches.MemoryPatch("libunity.so", 0xA049C4C, "h20 00 80 D2 C0 03 5F D6") -- IsHighMemoryDevice -- UPDATED 0xA99D9E0 -> 0xA049C4C
    HexPatches.MemoryPatch("libunity.so", 0xA04BF88, "h20 00 80 D2 C0 03 5F D6") -- CanExceedOriginResolution -- UPDATED 0xA99FBAC -> 0xA04BF88
    HexPatches.MemoryPatch("libunity.so", 0xA04CD20, "h20 00 80 D2 C0 03 5F D6") -- GetSuperResolutionScale -- UPDATED 0xA9A0914 -> 0xA04CD20
    HexPatches.MemoryPatch("libunity.so", 0xA03E3E8, "h20 00 80 D2 C0 03 5F D6") -- SetUltraFrameRateDeviceInfo -- UPDATED 0xA9925F4 -> 0xA03E3E8
    HexPatches.MemoryPatch("libunity.so", 0xA051778, "h20 00 80 D2 C0 03 5F D6") -- IsFramerateCustomizeAvailable -- UPDATED 0xA9A5274 -> 0xA051778
    HexPatches.MemoryPatch("libunity.so", 0xA03DF88, "h20 00 80 D2 C0 03 5F D6") -- get_IsUltraFrameRateCustomized -- UPDATED 0xA99219C -> 0xA03DF88
    HexPatches.MemoryPatch("libunity.so", 0xA03DF98, "h00 24 80 D2 C0 03 5F D6") -- GetMaxSupportedFrameRateLevel -- UPDATED 0xA9921A4 -> 0xA03DF98
    HexPatches.MemoryPatch("libunity.so", 0xa6c3e24, "h00 24 80 D2 C0 03 5F D6") -- GetFramerateCustomizationMax
    HexPatches.MemoryPatch("libunity.so", 0xA03F394, "h00 24 80 D2 C0 03 5F D6") -- GetMaxFrameRateLevel -- UPDATED 0xA993590 -> 0xA03F394
    HexPatches.MemoryPatch("libunity.so", 0xA03FA14, "h00 24 80 D2 C0 03 5F D6") -- GetFrameRateValue -- UPDATED 0xA993C10 -> 0xA03FA14
    HexPatches.MemoryPatch("libunity.so", 0xA03F448, "hC0 00 80 D2 C0 03 5F D6") -- GetMaxSupportedFrameRateLevelForDevice -- UPDATED 0xA993644 -> 0xA03F448
    idkcstmToast("ANTI FPS NO LAG : ACTIVATED")
  end
end



local value = progress


local aimbotValue = 0
aimbot_seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(view, progress, fromUser)
    aimbotValue = progress
    aimbot_text.setText("AIMBOT STRENGTH (" .. aimbotValue .. "%)")
  end,
  onStopTrackingTouch=function(view)
    if aimbotValue > 0 then
      local hexValue = floatToHexLE(aimbotStrength)
      HexPatches.MemoryPatch("libunity.so", 0x5161770 , "h40 00 00 1C C0 03 5F D6")
      HexPatches.MemoryPatch("libunity.so", 0x5161770 + 4, "hC0 03 5F D6 00 00 7A 44")
      HexPatches.MemoryPatch("libunity.so", 0x5161770 + 8, hexValue, 4)
      HexPatches.MemoryPatch("libunity.so", 0x666FB88, "h40 00 00 1C C0 03 5F D6")
      HexPatches.MemoryPatch("libunity.so", 0x666FB88 + 4, "hC0 03 5F D6 00 00 7A 44")
      HexPatches.MemoryPatch("libunity.so", 0x666FB88 + 8, hexValue, 4)
      idkcstmToast("Aimbot Strength: " .. aimbotValue .. "%")
    end
  end
}


ipad_seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(view, progress, fromUser)
    value = progress
    ipad_text.setText("ɪᴘᴀᴅᴠɪᴇᴡ (" .. value .. "%)")
  end,

  onStopTrackingTouch=function(view)
    local diveStrength = value * 1.0
    local hexValue = floatToHexLE(diveStrength)
    HexPatches.MemoryPatch("libunity.so", 0x6643848, "h40 00 00 1C C0 03 5F D6")
    HexPatches.MemoryPatch("libunity.so", 0x664384c + 4, "hC0 03 5F D6 00 00 7A 44")
    HexPatches.MemoryPatch("libunity.so", 0x6643850 + 8, hexValue, 4)
    idkcstmToast("ɪᴘᴀᴅᴠɪᴇᴡ" .. IpadviewAdjuster.Progress .. "%")
  end
}

local snowboardValue = 0
snowboard_seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(view, progress, fromUser)
    snowboardValue = progress
    snowboard_text.setText("SNOWBOARD BOOST (" .. snowboardValue .. "%)")
  end,
  onStopTrackingTouch=function(view)
    if snowboardValue > 0 then
      local hexValue = floatToHexLE(snowboardValue)
      HexPatches.MemoryPatch("libunity.so", 0x52283FC, "h40 00 00 1C C0 03 5F D6")
      HexPatches.MemoryPatch("libunity.so", 0x52283FC + 4, "hC0 03 5F D6 00 00 7A 44")
      HexPatches.MemoryPatch("libunity.so", 0x52283FC + 8, hexValue, 4)
      HexPatches.MemoryPatch("libunity.so", 0x52286DC, "h40 00 00 1C C0 03 5F D6")
      HexPatches.MemoryPatch("libunity.so", 0x52286DC + 4, "hC0 03 5F D6 00 00 7A 44")
      HexPatches.MemoryPatch("libunity.so", 0x52286DC + 8, hexValue, 4)
      idkcstmToast("Snowboard Boost: " .. snowboardValue .. "%")
    end
  end,
}
speed.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function speed.OnCheckedChangeListener()
  if speed.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x51D2EB8, "h0010201EC0035FD6") -- [UPD:0x4FB79B4->0x51D2EB8|calcfinalmovescale()|CLASS_FULL_SIG | L1694]
    idkcstmToast("SPEED HACK: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xCB1A9AC, "h0010201EC0035FD6") -- [UPD:0xC890CA4->0xCB1A9AC|paused(aicommand)|CLASS_FULL_SIG | L1697]
    idkcstmToast("SPEED HACK: DEACTIVATED")
  end
end

speed.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function speed.OnCheckedChangeListener()
  if speed.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x51D2EB8, "h0010201EC0035FD6") -- [UPD:0x4FB79B4->0x51D2EB8|calcfinalmovescale()|CLASS_FULL_SIG | L1694]
    idkcstmToast("SPEED HACK: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xCB1A9AC, "h0010201EC0035FD6") -- [UPD:0xC890CA4->0xCB1A9AC|paused(aicommand)|CLASS_FULL_SIG | L1697]
    idkcstmToast("SPEED HACK: DEACTIVATED")
  end
end

mp.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function mp.OnCheckedChangeListener()
  if mp.checked then
    HexPatches.MemoryPatch("libunity.so", 0xC403B8C, "h20 00 80 D2 C0 03 5F D6")
  end
end

strong.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function strong.OnCheckedChangeListener()
  if strong.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x666FB88, "h4000001CC0035FD6", 32)--GetRotateSpeed
    HexPatches.MemoryPatch("libunity.so", 0x5161770, "hC0035FD600001041", 32)--GetAutoAssistAimRate
  end
end



chams.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function chams.OnCheckedChangeListener()
  if chams.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x548A67C, "1F 20 03 D5", 32); -- WALLHACK Y/B
    idkcstmToast("WALLHACK Y/B: ACTIVATED")
   else
  end
end

redhack.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function redhack.OnCheckedChangeListener()
  if redhack.checked then

    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x8CF23C8->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1843]
    idkcstmToast("ᴀᴄᴛɪᴠᴀᴛᴇᴅ")
   else
  end
end

Blueprint.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Blueprint.OnCheckedChangeListener()
  if Blueprint.checked then
    HexPatches.MemoryPatch("libunity.so", 0x901F988, "h200080D2C0035FD6")--	public bool IsUnlocked
    HexPatches.MemoryPatch("libunity.so", 0x9012214, "h200080D2C0035FD6")--	public bool IsUnlocked
    HexPatches.MemoryPatch("libunity.so", 0x9AD8CB4, "h200080D2C0035FD6")-- public bool IsUnlocked
    HexPatches.MemoryPatch("libunity.so", 0x6617450, "h200080D2C0035FD6")--	public bool IsUnlockedActivePVEHardLevel
    idkcstmToast("UNLOCK BLUEPRINT: ACTIVATED")
   else
  end
end

who.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function who.OnCheckedChangeListener()
  if who.checked then
    HexPatches.MemoryPatch("libunity.so", 0x6C96CD8, "20 00 80 D2 C0 03 5F D6", 32);
    idkcstmToast("WALLHACK OUTLINE : ACTIVATED","#000000","#FFFFFF","9","8")
   else
    HexPatches.MemoryPatch("libunity.so", 0x6C96CD8, "F4 4F BE A9 FD 7B 01 A9", 32);
    idkcstmToast("WALLHACK OUTLINE : DEACTIVATED","#000000","#FFFFFF","9","8")
  end
end

hit.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function hit.OnCheckedChangeListener()
  if hit.checked then
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- [UPD:0xBD1D5C4->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1591]
    idkcstmToast("HITBOX : ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h EE 0F 18 FC EB 2B 02 6D") -- [UPD:0xBD1D5C4->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1594]
    idkcstmToast("HITBOX: DEACTIVATED")
  end
end

Scope.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Scope.OnCheckedChangeListener()
  if Scope.checked then

    HexPatches.MemoryPatch("libunity.so", 0x512B4FC, "h002C40BCC0035FD6", 32); -- [UPD:0x4F138BC->0x512B4FC|calcaimtime(bool)|CLASS_FULL_SIG | L1603]

    idkcstmToast("FAST SCOPE: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0x512B4FC, "hE8 0F 1D FC F4 4F 01 A9") -- [UPD:0x4F138BC->0x512B4FC|calcaimtime(bool)|CLASS_FULL_SIG | L1607]
    idkcstmToast("FAST SCOPE: DEACTIVATED")
  end
end

fastsw.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function fastsw.OnCheckedChangeListener()
  if fastsw.checked then

    HexPatches.MemoryPatch("libunity.so", 0x50ED8D4, "h 00 2C 40 BC C0 03 5F D6", 32) -- [UPD:0x4ED651C->0x50ED8D4|get_equiptime()|CLASS_FULL_SIG | L1616]
    idkcstmToast("FAST SWITCH: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0x50ED8D4, "hE8 0F 1D FC") -- [UPD:0x4ED651C->0x50ED8D4|get_equiptime()|CLASS_FULL_SIG | L1619]
    HexPatches.MemoryPatch("libunity.so", 0x96D51FC, "hF4 4F 01 A9")
    HexPatches.MemoryPatch("libunity.so", 0x50EDB64, "hE8 0F 1D FC") -- [UPD:0x4ED67AC->0x50EDB64|get_unequiptime()|CLASS_FULL_SIG | L1621]
    HexPatches.MemoryPatch("libunity.so", 0x96D5414, "hF4 4F 01 A9")
    idkcstmToast("FAST SWITCH: DEACTIVATED")
  end
end

spread.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function spread.OnCheckedChangeListener()
  if spread.checked then

    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- [UPD:0xC73224C->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1656]
    idkcstmToast("NO SPREAD: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h00 00 80 D2 C0 03 5F D6", 32); -- [UPD:0xC73224C->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1659]
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618 + 4, "h00 00 80 D2 C0 03 5F D6", 32); -- [UPD:0xC73224C->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1660]
    idkcstmToast("NO SPREAD: DEACTIVATED")
  end
end

noreload.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function noreload.OnCheckedChangeListener()
  if noreload.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x50ECADC, "h40 00 00 1C C0 03 5F D6") -- get_ChangeClipTime -- UPDATED 0xB3A2470 -> 0x50ECADC
    idkcstmToast("É´á´ Ê€á´‡ÊŸá´á´€á´…âœ…")
   else
  end
end

norecoil.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function norecoil.OnCheckedChangeListener()
  if norecoil.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0xC151338, "h 20 4C 40 BC C0 03 5F D6", 32) -- [UPD:0xBD1D43C->0xC151338|getshotspread()|CLASS_FULL_SIG | L1682]
    idkcstmToast("NO RECOIL: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "hE8 0F 1D FC F4 4F 01 A9") -- [UPD:0xC733BE4->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1685]
    idkcstmToast("NO RECOIL: DEACTIVATED")
  end
end

shake.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function shake.OnCheckedChangeListener()
  if shake.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x664B8D0, "h00 00 80 D2 C0 03 5F D6") -- UpdateCameraShake -- UPDATED 0x5D8E48C -> 0x664B8D0
    idkcstmToast("NO SHAKE: ACTIVATED")
   else
  end
end

Delaysprintfire.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Delaysprintfire.OnCheckedChangeListener()
  if Delaysprintfire.checked then
    antihook()

    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- [UPD:0xB8A6FC0->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1820]
    idkcstmToast("ɴᴏ ᴅᴇʟᴀʏ ꜱᴘʀɪɴᴛ ꜰɪʀᴇ")
   else
  end
end


nocrouch.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function nocrouch.OnCheckedChangeListener()
  if nocrouch.checked then
    HexPatches.MemoryPatch("libunity.so", 0x51B6C58, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x4F9B998->0x51B6C58|set_iscrouching(bool)|CLASS_FULL_SIG | L1753]
    HexPatches.MemoryPatch("libunity.so", 0x51B6CD8, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x4F9BA18->0x51B6CD8|get_iscrouching()|CLASS_FULL_SIG | L1754]
    HexPatches.MemoryPatch("libunity.so", 0x5483A3C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x51E5AC4->0x5483A3C|forcesynclocalplayer(int,bool,bool)|CLASS_FULL_SIG | L1755]
    HexPatches.MemoryPatch("libunity.so", 0x524D15C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x5032A08->0x524D15C|cancrouch()|CLASS_FULL_SIG | L1756]
    HexPatches.MemoryPatch("libunity.so", 0x524D15C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x5032A08->0x524D15C|cancrouch()|CLASS_FULL_SIG | L1757]
    HexPatches.MemoryPatch("libunity.so", 0x7178B68, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x8DAFB88->0x7178B68|get_ismagnifying()|CLASS_FULL_SIG | L1758]
    HexPatches.MemoryPatch("libunity.so", 0x8BFB31C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0xA413454->0x8BFB31C|rawstopslidetackle()|CLASS_FULL_SIG | L1759]
    HexPatches.MemoryPatch("libunity.so", 0x9F583E4, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x95D985C->0x9F583E4|onstop()|CLASS_FULL_SIG | L1760]
    idkcstmToast("ɴᴏ ᴄʀᴏᴜᴄʜ✔️")
   else
  end
end

pump.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function pump.OnCheckedChangeListener()
  if pump.checked then
    HexPatches.MemoryPatch("libunity.so", 0x907D498, "h20 00 80 D2 C0 03 5F D6")--CanJettingByStartJumpTime -- [UPD:0x6EF5244->0x907D498|canjettingbystartjumptime()|CLASS_FULL_SIG | L2021]
    idkcstmToast("PUMP BOOST: ACTIVATED")
   else
  end
end

nop.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function nop.OnCheckedChangeListener()
  if nop.checked then
    HexPatches.MemoryPatch("libunity.so", 0x5DC662C, "h00 10 20 1E C0 03 5F D6") -- //  UPDATED 0x6DEB94C -> 0x5DC662C
    showCyberpunkToast2("NO PARACHUTE:", "icon/r6.png")
   else
    HexPatches.Restore("libunity.so", 0x5DC662C) -- //  UPDATED 0x6DEB94C -> 0x5DC662C
    showCyberpunkToast2("NO PARACHUTE:", "icon/r5.png")
  end
end


Walk.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Walk.OnCheckedChangeListener()
  if Walk.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x51D31BC, "h20 00 80 D2 C0 03 5F D6")--protected virtual float GetCurrentDistToWaterSurface -- [UPD:0x4FB7C5C->0x51D31BC|getcurrentdisttowatersurface()|CLASS_FULL_SIG | L1475]
    HexPatches.MemoryPatch("libunity.so", 0x51F0810, "h20 00 80 D2 C0 03 5F D6")--public virtual bool IsUnderWaterSurface -- [UPD:0x4FD558C->0x51F0810|isunderwatersurface(float)|CLASS_FULL_SIG | L1476]
    HexPatches.MemoryPatch("libunity.so", 0x840A2C4, "h20 00 80 D2 C0 03 5F D6")--public override float get_CurrentWaterSurfaceHeight -- [UPD:0x5DAFBD4->0x840A2C4|get_battleplayeruin()|CLASS_FULL_SIG | L1477]
    idkcstmToast("É´á´ á´„Ê€á´á´œá´„Êœ")
   else
  end
end


Battle.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Battle.OnCheckedChangeListener()
  if Battle.checked then
    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0xA7C93E4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x88EC408, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x59781AC, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x5978234, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x6422E84, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0xB15D0BC, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x6373A3C, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    HexPatches.MemoryPatch("libunity.so", 0x9BF7300, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS
    idkcstmToast("BR TAG: ACTIVATED")
   else
  end
end

safe.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF,PorterDuff.Mode.SRC_ATOP));
function safe.OnCheckedChangeListener()
  if safe.checked then
    HexPatches.MemoryPatch("libunity.so", 0x664B8D0, "h00 00 80 D2 C0 03 5F D6", 32); -- SHAKE -- [UPD:0x6A6FCE4->0x664B8D0|updatecamerashake()|CLASS_FULL_SIG | L1971]
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "h 20 4C 40 BC C0 03 5F D6", 32) -- RECOIL -- [UPD:0xC733BE4->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1972]
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- SPRRAD -- [UPD:0xC73224C->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1973]

    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- HITBOX -- [UPD:0xBD1D5C4->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1975]

    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- NO DELAY SPRINT -- [UPD:0xB8A6FC0->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1977]
    idkcstmToast("SAFE FEATURE MP : ACTIVATED")
   else
  end
end
safee.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF,PorterDuff.Mode.SRC_ATOP));
function safee.OnCheckedChangeListener()
  if safee.checked then
    HexPatches.MemoryPatch("libunity.so", 0x664B8D0, "h00 00 80 D2 C0 03 5F D6", 32); -- SHAKE -- [UPD:0x6A6FCE4->0x664B8D0|updatecamerashake()|CLASS_FULL_SIG | L1985]
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "h 20 4C 40 BC C0 03 5F D6", 32) -- RECOIL -- [UPD:0xC733BE4->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1986]
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- SPRRAD -- [UPD:0xC73224C->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1987]
    HexPatches.MemoryPatch("libunity.so", 0x548A67C, "1F 20 03 D5", 32); -- WALLHACK Y/B
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- HITBOX -- [UPD:0xBD1D5C4->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1989]
    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- NO DELAY SPRINT -- [UPD:0xB8A6FC0->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1990]

    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32);-- REDHACK -- [UPD:0x8CF23C8->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1992]
    HexPatches.MemoryPatch("libunity.so", 0x967755C, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x8CF23D0->0x967755C|set_isinem3eye(bool)|CLASS_FULL_SIG | L1993]
    HexPatches.MemoryPatch("libunity.so", 0x88F07C0, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x984E644->0x88F07C0|showfireloconradar()|CLASS_FULL_SIG | L1994]
    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x8CF23C8->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1995]
    HexPatches.MemoryPatch("libunity.so", 0xAD1DD78, "h40 00 00 1C C0 03 5F D6", 32); -- [UPD:0x8BBE7A8->0xAD1DD78|getaccdistance()|CLASS_FULL_SIG | L1996]

    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS -- [UPD:0x846278C->0x75A81A4|sameteamfrominfo(playerinfo,playerinfo)|CLASS_FULL_SIG | L1998]
    HexPatches.MemoryPatch("libunity.so", 0x5978234, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags1 -- [UPD:0x6703EB8->0x5978234|sameteamfrominfo_checkteamid(playerinfo,playerinfo)|CLASS_FULL_SIG | L1999]
    HexPatches.MemoryPatch("libunity.so", 0x5978504, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags2 -- [UPD:0x67041A0->0x5978504|sameteamfromparameters(uint,uint,int,int)|CLASS_FULL_SIG | L2000]
    HexPatches.MemoryPatch("libunity.so", 0x75A822C, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags2 -- [UPD:0x8462814->0x75A822C|sameteamfrompawn(pawn,pawn)|CLASS_FULL_SIG | L2001]
    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS -- [UPD:0x846278C->0x75A81A4|sameteamfrominfo(playerinfo,playerinfo)|CLASS_FULL_SIG | L2002]

    HexPatches.MemoryPatch("libunity.so", 0x666FB88, "h4000001CC0035FD6", 32)--AIMBOT -- [UPD:0x6A92D3C->0x666FB88|getrotatespeed(float,float,float,float,bool)|CLASS_FULL_SIG | L2004]
    HexPatches.MemoryPatch("libunity.so", 0x5161770, "hC0035FD600001041", 32)--GetAutoAssistAimRate -- [UPD:0x4F478D0->0x5161770|getautoassistaimrate(float,float,bool,float,bool)|CLASS_FULL_SIG | L2005]
    idkcstmToast("SAFE FEATURE BR : ACTIVATED")
   else
  end
end

import ""
import "main69"
import "titi"
--
import "android.widget.*"
import "android.view.*"
import "android.view.animation.*"
import "android.graphics.drawable.*"
import "android.graphics.*"
import "android.content.Context"
import "java.io.File"

-- [[ UI Configuration
local theme = {
  bg = 0xF2121212, -- Transparent Obsidian (Glass effect)
  accent = 0xFF00FF00, -- Spring Green (Better visibility)
  text = 0xFFFFFFFF, -- Pure White
  borderSize = 3, -- Thicker professional border
  radius = 60, -- Modern rounded corners (not full pill)
}

-- [[ Helper: Create Background with Shadow
local function getNotificationBg()
  local gd = GradientDrawable()
  gd.setShape(GradientDrawable.RECTANGLE)
  gd.setColor(theme.bg)
  gd.setCornerRadius(theme.radius)
  gd.setStroke(theme.borderSize, theme.accent)
  return gd
end

-- [[ Layout Schema: Modern Notification Style
local toastLayout = {
  CardView, -- Using CardView for real shadow
  id = "card_root",
  layout_width = "wrap",
  layout_height = "wrap",
  radius = theme.radius,
  cardElevation = "12dp",
  cardBackgroundColor = 0x00000000, -- Transparent because GD handles color
  {
    LinearLayout,
    id = "root",
    layout_width = "wrap",
    layout_height = "wrap",
    orientation = "horizontal",
    gravity = "center",
    paddingLeft = "20dp",
    paddingRight = "20dp",
    paddingTop = "12dp",
    paddingBottom = "12dp",
    {
      ImageView,
      id = "img",
      layout_width = "22dp",
      layout_height = "22dp",
      layout_marginRight = "10dp",
      scaleType = "centerInside",
      colorFilter = theme.accent,
      visibility = 8,
    },
    {
      LinearLayout,
      orientation = "vertical",
      {
        TextView,
        text = "KIRO NOTIFICATION", -- Small header like real phones
        textColor = theme.accent,
        textSize = "8sp",
        Typeface = Typeface.create("sans-serif-medium", Typeface.NORMAL),
        alpha = 0.6,
      },
      {
        TextView,
        id = "msg",
        textColor = theme.text,
        textSize = "13sp",
        layout_marginTop = "-2dp",
        Typeface = Typeface.create("sans-serif-condensed-medium", Typeface.NORMAL),
      },
    },
  },
}

-- =============================================================================
-- iOS STYLE PASS  (new - runs last so it overrides the older tints above)
-- -----------------------------------------------------------------------------
-- WHAT THIS DOES
--   The mod menu is built from ~150 RadioButton/CheckBox/SeekBar widgets, each
--   one tinted individually further up this file with a half-transparent WHITE
--   filter (0x9AFFFFFF). That looked washed out next to the new iOS palette.
--   Instead of editing 150 lines, this walks the whole view tree ONCE and
--   re-tints every control with the iOS accent green.
--
-- HOW TO EDIT
--   * Accent colour ....... change ACCENT below (iOS systemGreen = 0xFF30D158).
--   * Want the old look? .. delete/comment out the styleModMenu() call at the
--                           very bottom of this file.
--   * Want another control? add another if/elseif branch in styleModMenu().
-- =============================================================================

ACCENT        = 0xFF30D158  -- iOS systemGreen: switch + slider colour
ACCENT_SOFT   = 0xCC30D158  -- same green at 80% opacity (unselected controls)
LABEL_COLOR   = 0xFFE5E5EA  -- iOS primary label

-- Walks every view inside the floating menu, parents first.
-- pcall is used because not every widget has the methods we ask for
-- (e.g. a TextView has no getChildCount), and one error would stop the app.
local function eachView(view, callback)
  if view == nil then return end
  callback(view)
  local ok, count = pcall(function() return view.getChildCount() end)
  if ok and count ~= nil then
    for i = 0, count - 1 do
      local okChild, child = pcall(function() return view.getChildAt(i) end)
      if okChild and child ~= nil then eachView(child, callback) end
    end
  end
end

-- Returns the simple class name of a view ("CheckBox", "SeekBar", ...).
local function classNameOf(view)
  local ok, name = pcall(function() return view.getClass().getSimpleName() end)
  if ok and name ~= nil then return name end
  return ""
end

function styleModMenu()
  eachView(mainWindow, function(view)
    local class = classNameOf(view)

    -- Switch-like widgets: tint the box/dot green (iOS uses tinted controls).
    if class == "CheckBox" or class == "RadioButton"
       or class == "SwitchCompat" or class == "Switch" then
      pcall(function()
        view.getButtonDrawable().setColorFilter(
          PorterDuffColorFilter(ACCENT_SOFT, PorterDuff.Mode.SRC_ATOP))
      end)
      pcall(function() view.setTextColor(LABEL_COLOR) end)

    -- Sliders (aimbot / fov / snowboard): green track, white knob - same as
    -- an iOS UISlider. setProgressTintList needs Android 5.0+, hence pcall.
    elseif class == "SeekBar" then
      pcall(function()
        local tintList = android.content.res.ColorStateList.valueOf(ACCENT)
        view.setProgressTintList(tintList)
      end)
      pcall(function()
        view.setProgressBackgroundTintList(
          android.content.res.ColorStateList.valueOf(0xFF38383A))
      end)

    -- The Exit button inside the menu: iOS destructive red, pill shaped.
    elseif class == "Button" then
      pcall(function()
        view.setTextColor(0xFFFFFFFF)
        local bg = GradientDrawable()
        bg.setShape(GradientDrawable.RECTANGLE)
        bg.setCornerRadius(dp(10))
        bg.setColor(0xFFFF453A) -- iOS systemRed
        view.setBackgroundDrawable(bg)
        view.setAllCaps(false) -- iOS sentence case, not ALL CAPS
      end)
    end
  end)
end

-- The 7 collapsible section headers ("ANTI-BAN MENU", "FPS MENU", "AIMBOT MENU",
-- ...). Their titles used to be marked with textStyle="bold" inside floating.lua,
-- but AndLua has no setTextStyle() - the layout loader printed
--   "TextView@setTextStyle is not a field or method"
-- for every one of them and then dropped the attribute, so they were never bold.
-- The weight is applied here instead.
-- To style a header, change its id's text in floating.lua and re-run this.
SECTION_HEADERS = { "espmenu", "fpsmenu", "aimmenu", "othermenu",
                    "brmenu", "skinmenu", "antennamenu" }

function styleSectionHeaders()
  for _, headerName in ipairs(SECTION_HEADERS) do
    local header = _G[headerName]           -- layout ids live in the global table
    if header ~= nil then
      local ok, count = pcall(function() return header.getChildCount() end)
      if ok and count ~= nil then
        for i = 0, count - 1 do
          local child = header.getChildAt(i)
          if child ~= nil and classNameOf(child) == "TextView" then
            pcall(function() child.setTypeface(TF_BOLD) end)     -- bold
            pcall(function() child.setLetterSpacing(0.02) end)   -- iOS tracking
          end
        end
      end
    end
  end
end

-- Apply after every other handler is wired up (this is the last statement in the
-- file on purpose): anything that tints a control earlier gets corrected here.
pcall(styleModMenu)
pcall(styleSectionHeaders)
