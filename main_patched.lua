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




activity.setTheme(R.AndLua1)
activity.ActionBar.setTitle("Lets play!")
activity.ActionBar.hide()
activity.overridePendingTransition(android.R.anim.fade_in,android.R.anim.fade_out)
activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_DRAWS_SYSTEM_BAR_BACKGROUNDS).setStatusBarColor(0xFF202125);
--activity.getWindow().addFlags(WindowManager.LayoutParams.FLAG_TRANSLUCENT_STATUS);
activity.ActionBar.setElevation(0)
activity.ActionBar.setBackgroundDrawable(ColorDrawable(0xFF202125))
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

  local params = WindowManager.LayoutParams(
  WindowManager.LayoutParams.WRAP_CONTENT,
  WindowManager.LayoutParams.WRAP_CONTENT,
  WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY,
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

  wm.addView(floatText, params)


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



import "java.io.File"
import "android.graphics.Typeface"
local bf=File(activity.getLuaDir().."/font/zt2.ttf");
local tf=Typeface.createFromFile(bf)

strt.setTypeface(tf);
stp.setTypeface(tf);
strttxt.getPaint().setFakeBoldText(true)
stptxt.getPaint().setFakeBoldText(true)




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
A3params.width = WindowManager.LayoutParams.WRAP_CONTENT
A3params.height = WindowManager.LayoutParams.WRAP_CONTENT
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
    OpenM=true
    LayoutVIP.addView(mainWindow,A3params)
    LayoutVIP1.removeView(minWindow)
  end
end

function t1.onClick(v)
  if OpenM==true then
    OpenM=false
    LayoutVIP.removeView(mainWindow)
    LayoutVIP1.addView(minWindow,A3params1)
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
    isMax=true
    LayoutVIP1.addView(minWindow,A3params1)

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
    HexPatches.MemoryPatch("libanogs.so", 0x1CEF70, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x201C2C, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x204218, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x258B6C, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x259670, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x3055A0, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x3075C4, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x307764, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x30E234, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x39CD30, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x3893D8, "00 00 80 D2 C0 03 5F D6", 32);--Hold report
    HexPatches.MemoryPatch("libanogs.so", 0x40ECB4, "00 00 80 D2 C0 03 5F D6", 32);--Hold report
    HexPatches.MemoryPatch("libanogs.so", 0x40FECC, "00 00 80 D2 C0 03 5F D6", 32);--Hold report
    HexPatches.MemoryPatch("libanogs.so", 0x411C8C, "00 00 80 D2 C0 03 5F D6", 32);--Hold report
    HexPatches.MemoryPatch("libanogs.so", 0x40F360, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x4102B4, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x41BA40, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x44BC90, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x497E64, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x4987A8, "00 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libanogs.so", 0x4B9C10, "00 00 80 D2 C0 03 5F D6", 32);
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
    HexPatches.MemoryPatch("libunity.so", 0x9DE0A04, "000080D2C0035FD6",32); --IsTutorialFinalEnable -- //  UPDATED 0x6A0E6C8 -> 0x9DE0A04
    HexPatches.MemoryPatch("libunity.so", 0x9DE3174, "000080d2C0035FD6",32); --IsTutorialFinalEnable -- //  UPDATED 0x6A086A8 -> 0x9DE3174
    HexPatches.MemoryPatch("libunity.so", 0xBD29F14, "000080d2C0035FD6",32); --IsTutorialFinalEnable -- //  UPDATED 0x903DA10 -> 0xBD29F14
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
    HexPatches.MemoryPatch("libunity.so", 0x9FE4844, "h00 00 80 D2 C0 03 5F D6", 32) -- get_EnableShadow_Br -- UPDATED 0xa998f90 -> 0x9FE4844 -- //  UPDATED 0xA044F7C -> 0x9FE4844 -- //  UPDATED 0xA044F7C -> 0x9FE4844
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
    HexPatches.MemoryPatch("libunity.so", 0x9FDFF80, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9939ac -> 0x9FDFF80 -- //  UPDATED 0xA03F7B0 -> 0x9FDFF80 -- //  UPDATED 0xA03F7B0 -> 0x9FDFF80
    HexPatches.MemoryPatch("libunity.so", 0x9FEABC4, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a2d04 -> 0x9FEABC4 -- //  UPDATED 0xA04F104 -> 0x9FEABC4 -- //  UPDATED 0xA04F104 -> 0x9FEABC4
    HexPatches.MemoryPatch("libunity.so", 0x9FE958C, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa99fbac -> 0x9FE958C -- //  UPDATED 0xA04BF88 -> 0x9FE958C -- //  UPDATED 0xA04BF88 -> 0x9FE958C
    HexPatches.MemoryPatch("libunity.so", 0x9FE3C80, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9984a8 -> 0x9FE3C80 -- //  UPDATED 0xA0442D8 -> 0x9FE3C80 -- //  UPDATED 0xA0442D8 -> 0x9FE3C80
    HexPatches.MemoryPatch("libunity.so", 0x57286b0, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x9FDEE28, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9925f4 -> 0x9FDEE28 -- //  UPDATED 0xA03E3E8 -> 0x9FDEE28 -- //  UPDATED 0xA03E3E8 -> 0x9FDEE28
    HexPatches.MemoryPatch("libunity.so", 0x50eda54, "h00 24 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x9FECDB4, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a52d4 -> 0x9FECDB4 -- //  UPDATED 0xA0517D8 -> 0x9FECDB4 -- //  UPDATED 0xA0517D8 -> 0x9FECDB4
    HexPatches.MemoryPatch("libunity.so", 0x84 , "h00 24 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x9FECD54, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9a5274 -> 0x9FECD54 -- //  UPDATED 0xA051778 -> 0x9FECD54 -- //  UPDATED 0xA051778 -> 0x9FECD54
    HexPatches.MemoryPatch("libunity.so", 0x9FDE9C8, "h20 00 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa99219c -> 0x9FDE9C8 -- //  UPDATED 0xA03DF88 -> 0x9FDE9C8 -- //  UPDATED 0xA03DF88 -> 0x9FDE9C8
    HexPatches.MemoryPatch("libunity.so", 0x48, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x50ed4d8, "h20 00 80 D2 C0 03 5F D6", 32);
    HexPatches.MemoryPatch("libunity.so", 0x9FDE9D8, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9921a4 -> 0x9FDE9D8 -- //  UPDATED 0xA03DF98 -> 0x9FDE9D8 -- //  UPDATED 0xA03DF98 -> 0x9FDE9D8
    HexPatches.MemoryPatch("libunity.so", 0x9FDFDCC, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9937a0 -> 0x9FDFDCC -- //  UPDATED 0xA03F5A4 -> 0x9FDFDCC -- //  UPDATED 0xA03F5A4 -> 0x9FDFDCC
    HexPatches.MemoryPatch("libunity.so", 0x9FDFDD4, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa9937a8 -> 0x9FDFDD4 -- //  UPDATED 0xA03F5AC -> 0x9FDFDD4 -- //  UPDATED 0xA03F5AC -> 0x9FDFDD4
    HexPatches.MemoryPatch("libunity.so", 0x9FE3C68, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa998490 -> 0x9FE3C68 -- //  UPDATED 0xA0442C0 -> 0x9FE3C68 -- //  UPDATED 0xA0442C0 -> 0x9FE3C68
    HexPatches.MemoryPatch("libunity.so", 0x9FDFC58, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993644 -> 0x9FDFC58 -- //  UPDATED 0xA03F448 -> 0x9FDFC58 -- //  UPDATED 0xA03F448 -> 0x9FDFC58
    HexPatches.MemoryPatch("libunity.so", 0x9FDFBBC, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993590 -> 0x9FDFBBC -- //  UPDATED 0xA03F394 -> 0x9FDFBBC -- //  UPDATED 0xA03F394 -> 0x9FDFBBC
    HexPatches.MemoryPatch("libunity.so", 0x9FE01CC, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa993c10 -> 0x9FE01CC -- //  UPDATED 0xA03FA14 -> 0x9FE01CC -- //  UPDATED 0xA03FA14 -> 0x9FE01CC
    HexPatches.MemoryPatch("libunity.so", 0x9FE3FB4, "h00 24 80 D2 C0 03 5F D6", 32); -- UPDATED 0xa998708 -> 0x9FE3FB4 -- //  UPDATED 0xA04465C -> 0x9FE3FB4 -- //  UPDATED 0xA04465C -> 0x9FE3FB4
    idkcstmToast("ᴜʟᴛʀᴀ ғʀᴀᴍᴇʀᴀᴛᴇ ᴜɴʟᴏᴄᴋᴇᴅ\n180ғᴘs+ ᴍᴏᴅᴇ ᴀᴄᴛɪᴠᴇ\nᴅᴇᴠɪᴄᴇ ʟɪᴍɪᴛs ʙʏᴘᴀssᴇᴅ\nғᴜʟʟ ᴄᴜsᴛᴏᴍɪᴢᴀᴛɪᴏɴ ᴇɴᴀʙʟᴇᴅ")
   else
  end
end

fps.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function fps.OnCheckedChangeListener()
  if fps.checked then
    antiC4droid()
    -- Anti Frame
    HexPatches.MemoryPatch("libunity.so", 0x9FEABC4, "h20 00 80 D2 C0 03 5F D6") -- get_EnableVRS -- UPDATED 0xA9A2D04 -> 0x9FEABC4 -- //  UPDATED 0xA04F104 -> 0x9FEABC4 -- //  UPDATED 0xA04F104 -> 0x9FEABC4
    HexPatches.MemoryPatch("libunity.so", 0x9FEAC98, "h20 00 80 D2 C0 03 5F D6") -- get_EnableVariableRateShading -- UPDATED 0xA9A2DD8 -> 0x9FEAC98 -- //  UPDATED 0xA04F1D8 -> 0x9FEAC98 -- //  UPDATED 0xA04F1D8 -> 0x9FEAC98
    HexPatches.MemoryPatch("libunity.so", 0x9FEB294, "h20 00 80 D2 C0 03 5F D6") -- get_EnableMSAA -- UPDATED 0xA9A33D4 -> 0x9FEB294 -- //  UPDATED 0xA04F7D4 -> 0x9FEB294 -- //  UPDATED 0xA04F7D4 -> 0x9FEB294
    HexPatches.MemoryPatch("libunity.so", 0x9FDFB20, "h20 00 80 D2 C0 03 5F D6") -- get_IsExtremeDevice -- UPDATED 0xA993508 -> 0x9FDFB20 -- //  UPDATED 0xA03F30C -> 0x9FDFB20 -- //  UPDATED 0xA03F30C -> 0x9FDFB20
    HexPatches.MemoryPatch("libunity.so", 0x9FDFDCC, "h00 24 80 D2 C0 03 5F D6") -- get_UltraFrameRate -- UPDATED 0xA9937A0 -> 0x9FDFDCC -- //  UPDATED 0xA03F5A4 -> 0x9FDFDCC -- //  UPDATED 0xA03F5A4 -> 0x9FDFDCC
    HexPatches.MemoryPatch("libunity.so", 0x9FDFDD4, "h00 24 80 D2 C0 03 5F D6") -- get_UltraFrameRateBR -- UPDATED 0xA9937A8 -> 0x9FDFDD4 -- //  UPDATED 0xA03F5AC -> 0x9FDFDD4 -- //  UPDATED 0xA03F5AC -> 0x9FDFDD4
    HexPatches.MemoryPatch("libunity.so", 0x9FE8298, "h20 00 80 D2 C0 03 5F D6") -- IsHighMemoryDevice -- UPDATED 0xA99D9E0 -> 0x9FE8298 -- //  UPDATED 0xA049C4C -> 0x9FE8298 -- //  UPDATED 0xA049C4C -> 0x9FE8298
    HexPatches.MemoryPatch("libunity.so", 0x9FE958C, "h20 00 80 D2 C0 03 5F D6") -- CanExceedOriginResolution -- UPDATED 0xA99FBAC -> 0x9FE958C -- //  UPDATED 0xA04BF88 -> 0x9FE958C -- //  UPDATED 0xA04BF88 -> 0x9FE958C
    HexPatches.MemoryPatch("libunity.so", 0x9FE9CBC, "h20 00 80 D2 C0 03 5F D6") -- GetSuperResolutionScale -- UPDATED 0xA9A0914 -> 0x9FE9CBC -- //  UPDATED 0xA04CD20 -> 0x9FE9CBC -- //  UPDATED 0xA04CD20 -> 0x9FE9CBC
    HexPatches.MemoryPatch("libunity.so", 0x9FDEE28, "h20 00 80 D2 C0 03 5F D6") -- SetUltraFrameRateDeviceInfo -- UPDATED 0xA9925F4 -> 0x9FDEE28 -- //  UPDATED 0xA03E3E8 -> 0x9FDEE28 -- //  UPDATED 0xA03E3E8 -> 0x9FDEE28
    HexPatches.MemoryPatch("libunity.so", 0x9FECD54, "h20 00 80 D2 C0 03 5F D6") -- IsFramerateCustomizeAvailable -- UPDATED 0xA9A5274 -> 0x9FECD54 -- //  UPDATED 0xA051778 -> 0x9FECD54 -- //  UPDATED 0xA051778 -> 0x9FECD54
    HexPatches.MemoryPatch("libunity.so", 0x9FDE9C8, "h20 00 80 D2 C0 03 5F D6") -- get_IsUltraFrameRateCustomized -- UPDATED 0xA99219C -> 0x9FDE9C8 -- //  UPDATED 0xA03DF88 -> 0x9FDE9C8 -- //  UPDATED 0xA03DF88 -> 0x9FDE9C8
    HexPatches.MemoryPatch("libunity.so", 0x9FDE9D8, "h00 24 80 D2 C0 03 5F D6") -- GetMaxSupportedFrameRateLevel -- UPDATED 0xA9921A4 -> 0x9FDE9D8 -- //  UPDATED 0xA03DF98 -> 0x9FDE9D8 -- //  UPDATED 0xA03DF98 -> 0x9FDE9D8
    HexPatches.MemoryPatch("libunity.so", 0xa6c3e24, "h00 24 80 D2 C0 03 5F D6") -- GetFramerateCustomizationMax
    HexPatches.MemoryPatch("libunity.so", 0x9FDFBBC, "h00 24 80 D2 C0 03 5F D6") -- GetMaxFrameRateLevel -- UPDATED 0xA993590 -> 0x9FDFBBC -- //  UPDATED 0xA03F394 -> 0x9FDFBBC -- //  UPDATED 0xA03F394 -> 0x9FDFBBC
    HexPatches.MemoryPatch("libunity.so", 0x9FE01CC, "h00 24 80 D2 C0 03 5F D6") -- GetFrameRateValue -- UPDATED 0xA993C10 -> 0x9FE01CC -- //  UPDATED 0xA03FA14 -> 0x9FE01CC -- //  UPDATED 0xA03FA14 -> 0x9FE01CC
    HexPatches.MemoryPatch("libunity.so", 0x9FDFC58, "hC0 00 80 D2 C0 03 5F D6") -- GetMaxSupportedFrameRateLevelForDevice -- UPDATED 0xA993644 -> 0x9FDFC58 -- //  UPDATED 0xA03F448 -> 0x9FDFC58 -- //  UPDATED 0xA03F448 -> 0x9FDFC58
    idkcstmToast("ANTI FPS NO LAG : ACTIVATED")
  end
end



local value = progress

aimbot_seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(view, progress, fromUser)
    value = progress
    aimbot_text.setText("ᴀɪᴍʙᴏᴛ (" .. value .. "%)")
  end,

  onStopTrackingTouch=function(view)
    local aimStrength = value * 1.0
    local hexValue = floatToHexLE(aimStrength)
    HexPatches.MemoryPatch("libunity.so", 0x5161770, "h40 00 00 1C C0 03 5F D6")
    HexPatches.MemoryPatch("libunity.so", 0x5161774 + 4,"hC0 03 5F D6 00 00 7A 44")
    HexPatches.MemoryPatch("libunity.so", 0x5161778 + 8, hexValue, 4)
    HexPatches.MemoryPatch("libunity.so", 0x666fb88, "h40 00 00 1C C0 03 5F D6")
    HexPatches.MemoryPatch("libunity.so", 0x666fb8c + 4, "hC0 03 5F D6 00 00 7A 44")
    HexPatches.MemoryPatch("libunity.so", 0x666fb90 + 8, hexValue, 4)
    idkcstmToast("ᴀɪᴍʙᴏᴛ " .. IpadviewAdjuster.Progress .. "%")
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
    HexPatches.MemoryPatch("libunity.so", 0x6643848, "h40 00 00 1C C0 03 5F D6") -- [UPD:0x6643848->0x6643848|getcurrentworldcamerafov(int)|CLASS_FULL_SIG | L1415] -- //  UPDATED 0x6A67B58 -> 0x6643848
    HexPatches.MemoryPatch("libunity.so", 0x6643848 + 4, "hC0 03 5F D6 00 00 7A 44") -- [UPD:0x6643848->0x6643848|getcurrentworldcamerafov(int)|CLASS_FULL_SIG | L1416] -- //  UPDATED 0x6A67B58 -> 0x6643848
    HexPatches.MemoryPatch("libunity.so", 0x6643848 + 8, hexValue, 4) -- [UPD:0x6643848->0x6643848|getcurrentworldcamerafov(int)|CLASS_FULL_SIG | L1417] -- //  UPDATED 0x6A67B58 -> 0x6643848
    idkcstmToast("ɪᴘᴀᴅᴠɪᴇᴡ" .. IpadviewAdjuster.Progress .. "%")
  end
}

snowboard_seekbar.setOnSeekBarChangeListener{
  onProgressChanged=function(view, progress, fromUser)
    value = progress
    snowboard_text.setText("sɴᴏᴡʙᴏᴀʀᴅ (" .. value .. "%)")
  end,

  onStopTrackingTouch=function(view)
    local snowboardBoost = value * 1.0
    local hexValue = floatToHexLE(snowboardBoost)
    HexPatches.MemoryPatch("libunity.so", 0x52283fc, "h40 00 00 1C C0 03 5F D6") -- [UPD:0x6FB7D84->0x522860C|get_m_physskismaxspeed()|CLASS_FULL_SIG | L1360]
    HexPatches.MemoryPatch("libunity.so", 0x5228400 + 4, "hC0 03 5F D6 00 00 7A 44") -- [UPD:0x6FB7D84->0x522860C|get_m_physskismaxspeed()|CLASS_FULL_SIG | L1361]
    HexPatches.MemoryPatch("libunity.so", 0x5228404 + 8, hexValue, 4) -- [UPD:0x522860C->0x6FB7D84|get_m_physskismaxspeed()|CLASS_FULL_SIG | L1362] -- //  UPDATED 0x500DCA0 -> 0x522860C
    HexPatches.MemoryPatch("libunity.so", 0x52286dc, "h40 00 00 1C C0 03 5F D6") -- [UPD:0x52286DC->0x52286DC|get_m_physskisslopmaxspeed()|CLASS_FULL_SIG | L1363] -- //  UPDATED 0x500DD70 -> 0x52286DC
    HexPatches.MemoryPatch("libunity.so", 0x52286e0 + 4, "hC0 03 5F D6 00 00 7A 44") -- [UPD:0x52286DC->0x52286DC|get_m_physskisslopmaxspeed()|CLASS_FULL_SIG | L1364] -- //  UPDATED 0x500DD70 -> 0x52286DC
    HexPatches.MemoryPatch("libunity.so", 0x52286e4 + 8, hexValue, 4) -- [UPD:0x52286DC->0x52286DC|get_m_physskisslopmaxspeed()|CLASS_FULL_SIG | L1365] -- //  UPDATED 0x500DD70 -> 0x52286DC
  end
}

speed.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function speed.OnCheckedChangeListener()
  if speed.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x51D2EB8, "h0010201EC0035FD6") -- [UPD:0x51D2EB8->0x51D2EB8|calcfinalmovescale()|CLASS_FULL_SIG | L1694] -- //  UPDATED 0x4FB79B4 -> 0x51D2EB8
    idkcstmToast("SPEED HACK: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xCB1A9AC, "h0010201EC0035FD6") -- [UPD:0x892BE60->0xCB1A9AC|paused(aicommand)|CLASS_FULL_SIG | L1697] -- //  UPDATED 0xC890CA4 -> 0x892BE60
    idkcstmToast("SPEED HACK: DEACTIVATED")
  end
end

speed.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function speed.OnCheckedChangeListener()
  if speed.checked then
    antiC4droid()
    HexPatches.MemoryPatch("libunity.so", 0x51D2EB8, "h0010201EC0035FD6") -- [UPD:0x51D2EB8->0x51D2EB8|calcfinalmovescale()|CLASS_FULL_SIG | L1694] -- //  UPDATED 0x4FB79B4 -> 0x51D2EB8
    idkcstmToast("SPEED HACK: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xCB1A9AC, "h0010201EC0035FD6") -- [UPD:0x892BE60->0xCB1A9AC|paused(aicommand)|CLASS_FULL_SIG | L1697] -- //  UPDATED 0xC890CA4 -> 0x892BE60
    idkcstmToast("SPEED HACK: DEACTIVATED")
  end
end

mp.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function mp.OnCheckedChangeListener()
  if mp.checked then
    HexPatches.MemoryPatch("libunity.so", 0x856F1CC, "h20 00 80 D2 C0 03 5F D6") -- //  UPDATED 0xC403B8C -> 0x856F1CC
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

    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x9677554->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1843] -- //  UPDATED 0x8CF23C8 -> 0x9677554
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
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- [UPD:0xC1514C0->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1591] -- //  UPDATED 0xBD1D5C4 -> 0xC1514C0
    idkcstmToast("HITBOX : ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h EE 0F 18 FC EB 2B 02 6D") -- [UPD:0xC1514C0->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1594] -- //  UPDATED 0xBD1D5C4 -> 0xC1514C0
    idkcstmToast("HITBOX: DEACTIVATED")
  end
end

Scope.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Scope.OnCheckedChangeListener()
  if Scope.checked then

    HexPatches.MemoryPatch("libunity.so", 0x512B4FC, "h002C40BCC0035FD6", 32); -- [UPD:0x512B4FC->0x512B4FC|calcaimtime(bool)|CLASS_FULL_SIG | L1603] -- //  UPDATED 0x4F138BC -> 0x512B4FC

    idkcstmToast("FAST SCOPE: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0x512B4FC, "hE8 0F 1D FC F4 4F 01 A9") -- [UPD:0x512B4FC->0x512B4FC|calcaimtime(bool)|CLASS_FULL_SIG | L1607] -- //  UPDATED 0x4F138BC -> 0x512B4FC
    idkcstmToast("FAST SCOPE: DEACTIVATED")
  end
end

fastsw.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function fastsw.OnCheckedChangeListener()
  if fastsw.checked then

    HexPatches.MemoryPatch("libunity.so", 0x50ED8D4, "h 00 2C 40 BC C0 03 5F D6", 32) -- [UPD:0x50ED8D4->0x50ED8D4|get_equiptime()|CLASS_FULL_SIG | L1616] -- //  UPDATED 0x4ED651C -> 0x50ED8D4
    idkcstmToast("FAST SWITCH: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0x50ED8D4, "hE8 0F 1D FC") -- [UPD:0x50ED8D4->0x50ED8D4|get_equiptime()|CLASS_FULL_SIG | L1619] -- //  UPDATED 0x4ED651C -> 0x50ED8D4
    HexPatches.MemoryPatch("libunity.so", 0x96D51FC, "hF4 4F 01 A9")
    HexPatches.MemoryPatch("libunity.so", 0x50EDB64, "hE8 0F 1D FC") -- [UPD:0x50EDB64->0x50EDB64|get_unequiptime()|CLASS_FULL_SIG | L1621] -- //  UPDATED 0x4ED67AC -> 0x50EDB64
    HexPatches.MemoryPatch("libunity.so", 0x96D5414, "hF4 4F 01 A9")
    idkcstmToast("FAST SWITCH: DEACTIVATED")
  end
end

spread.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function spread.OnCheckedChangeListener()
  if spread.checked then

    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- [UPD:0xC9B9618->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1656] -- //  UPDATED 0xC73224C -> 0xC9B9618
    idkcstmToast("NO SPREAD: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h00 00 80 D2 C0 03 5F D6", 32); -- [UPD:0xC9B9618->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1659] -- //  UPDATED 0xC73224C -> 0xC9B9618
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618 + 4, "h00 00 80 D2 C0 03 5F D6", 32); -- [UPD:0xC9B9618->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1660] -- //  UPDATED 0xC73224C -> 0xC9B9618
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
    HexPatches.MemoryPatch("libunity.so", 0xC151338, "h 20 4C 40 BC C0 03 5F D6", 32) -- [UPD:0xC151338->0xC151338|getshotspread()|CLASS_FULL_SIG | L1682] -- //  UPDATED 0xBD1D43C -> 0xC151338
    idkcstmToast("NO RECOIL: ACTIVATED")
   else
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "hE8 0F 1D FC F4 4F 01 A9") -- [UPD:0xC9BAFF8->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1685] -- //  UPDATED 0xC733BE4 -> 0xC9BAFF8
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

    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- [UPD:0x6A627B4->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1820] -- //  UPDATED 0xB8A6FC0 -> 0x6A627B4
    idkcstmToast("ɴᴏ ᴅᴇʟᴀʏ ꜱᴘʀɪɴᴛ ꜰɪʀᴇ")
   else
  end
end


nocrouch.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function nocrouch.OnCheckedChangeListener()
  if nocrouch.checked then
    HexPatches.MemoryPatch("libunity.so", 0x51B6C58, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x51B6C58->0x51B6C58|set_iscrouching(bool)|CLASS_FULL_SIG | L1753] -- //  UPDATED 0x4F9B998 -> 0x51B6C58
    HexPatches.MemoryPatch("libunity.so", 0x51B6CD8, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x8B0FB44->0x51B6CD8|get_iscrouching()|CLASS_FULL_SIG | L1754] -- //  UPDATED 0x4F9BA18 -> 0x8B0FB44
    HexPatches.MemoryPatch("libunity.so", 0x5483A3C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x5483A3C->0x5483A3C|forcesynclocalplayer(int,bool,bool)|CLASS_FULL_SIG | L1755] -- //  UPDATED 0x51E5AC4 -> 0x5483A3C
    HexPatches.MemoryPatch("libunity.so", 0x56E51A0, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x511F50C->0x56E51A0|cancrouch()|CLASS_FULL_SIG | L1756] -- //  UPDATED 0x524D15C -> 0x56E51A0 -- //  UPDATED 0x5032A08 -> 0x511F50C -- //  UPDATED 0x524D15C -> 0x56E51A0
    HexPatches.MemoryPatch("libunity.so", 0x56E51A0, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x511F50C->0x56E51A0|cancrouch()|CLASS_FULL_SIG | L1757] -- //  UPDATED 0x524D15C -> 0x56E51A0 -- //  UPDATED 0x5032A08 -> 0x511F50C -- //  UPDATED 0x524D15C -> 0x56E51A0
    HexPatches.MemoryPatch("libunity.so", 0x7178B68, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x7178B68->0x7178B68|get_ismagnifying()|CLASS_FULL_SIG | L1758] -- //  UPDATED 0x8DAFB88 -> 0x7178B68
    HexPatches.MemoryPatch("libunity.so", 0x8BFB31C, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x8BFB31C->0x8BFB31C|rawstopslidetackle()|CLASS_FULL_SIG | L1759] -- //  UPDATED 0xA413454 -> 0x8BFB31C
    HexPatches.MemoryPatch("libunity.so", 0x9F583E4, "00 00 80 D2 C0 03 5F D6", 32) -- [UPD:0x9F5B748->0x9F583E4|onstop()|CLASS_FULL_SIG | L1760] -- //  UPDATED 0x95D985C -> 0x9F5B748
    idkcstmToast("ɴᴏ ᴄʀᴏᴜᴄʜ✔️")
   else
  end
end

pump.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function pump.OnCheckedChangeListener()
  if pump.checked then
    HexPatches.MemoryPatch("libunity.so", 0x907D498, "h20 00 80 D2 C0 03 5F D6")--CanJettingByStartJumpTime -- [UPD:0x907D498->0x907D498|canjettingbystartjumptime()|CLASS_FULL_SIG | L2021] -- //  UPDATED 0x6EF5244 -> 0x907D498
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
    HexPatches.MemoryPatch("libunity.so", 0x51D31BC, "h20 00 80 D2 C0 03 5F D6")--protected virtual float GetCurrentDistToWaterSurface -- [UPD:0x51D31BC->0x51D31BC|getcurrentdisttowatersurface()|CLASS_FULL_SIG | L1475] -- //  UPDATED 0x4FB7C5C -> 0x51D31BC
    HexPatches.MemoryPatch("libunity.so", 0x51F0810, "h20 00 80 D2 C0 03 5F D6")--public virtual bool IsUnderWaterSurface -- [UPD:0x51F0810->0x51F0810|isunderwatersurface(float)|CLASS_FULL_SIG | L1476] -- //  UPDATED 0x4FD558C -> 0x51F0810
    HexPatches.MemoryPatch("libunity.so", 0x840A2C4, "h20 00 80 D2 C0 03 5F D6")--public override float get_CurrentWaterSurfaceHeight -- [UPD:0x840A2C4->0x840A2C4|get_battleplayeruin()|CLASS_FULL_SIG | L1477] -- //  UPDATED 0x5DAFBD4 -> 0x840A2C4
    idkcstmToast("É´á´ á´„Ê€á´á´œá´„Êœ")
   else
  end
end


Battle.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function Battle.OnCheckedChangeListener()
  if Battle.checked then
    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS -- [UPD:0x75A81A4->0x75A81A4|sameteamfrominfo(playerinfo,playerinfo)|CLASS_FULL_SIG | L2013] -- //  UPDATED 0x846278C -> 0x75A81A4
    idkcstmToast("BR TAG: ACTIVATED")
   else
  end
end

safe.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF,PorterDuff.Mode.SRC_ATOP));
function safe.OnCheckedChangeListener()
  if safe.checked then
    HexPatches.MemoryPatch("libunity.so", 0x664B8D0, "h00 00 80 D2 C0 03 5F D6", 32); -- SHAKE -- [UPD:0x664B8D0->0x664B8D0|updatecamerashake()|CLASS_FULL_SIG | L1971] -- //  UPDATED 0x6A6FCE4 -> 0x664B8D0
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "h 20 4C 40 BC C0 03 5F D6", 32) -- RECOIL -- [UPD:0xC9BAFF8->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1972] -- //  UPDATED 0xC733BE4 -> 0xC9BAFF8
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- SPRRAD -- [UPD:0xC9B9618->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1973] -- //  UPDATED 0xC73224C -> 0xC9B9618

    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- HITBOX -- [UPD:0xC1514C0->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1975] -- //  UPDATED 0xBD1D5C4 -> 0xC1514C0

    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- NO DELAY SPRINT -- [UPD:0x6A627B4->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1977] -- //  UPDATED 0xB8A6FC0 -> 0x6A627B4
    idkcstmToast("SAFE FEATURE MP : ACTIVATED")
   else
  end
end
safee.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF,PorterDuff.Mode.SRC_ATOP));
function safee.OnCheckedChangeListener()
  if safee.checked then
    HexPatches.MemoryPatch("libunity.so", 0x664B8D0, "h00 00 80 D2 C0 03 5F D6", 32); -- SHAKE -- [UPD:0x664B8D0->0x664B8D0|updatecamerashake()|CLASS_FULL_SIG | L1985] -- //  UPDATED 0x6A6FCE4 -> 0x664B8D0
    HexPatches.MemoryPatch("libunity.so", 0xC9BAFF8, "h 20 4C 40 BC C0 03 5F D6", 32) -- RECOIL -- [UPD:0xC9BAFF8->0xC9BAFF8|getscalerecoil()|CLASS_FULL_SIG | L1986] -- //  UPDATED 0xC733BE4 -> 0xC9BAFF8
    HexPatches.MemoryPatch("libunity.so", 0xC9B9618, "h 00 2C 40 BC C0 03 5F D6", 32) -- SPRRAD -- [UPD:0xC9B9618->0xC9B9618|getrealspreadmodifier()|CLASS_FULL_SIG | L1987] -- //  UPDATED 0xC73224C -> 0xC9B9618
    HexPatches.MemoryPatch("libunity.so", 0x548A67C, "1F 20 03 D5", 32); -- WALLHACK Y/B
    HexPatches.MemoryPatch("libunity.so", 0xC1514C0, "h 20 01 80 D2 C0 03 5F D6") -- HITBOX -- [UPD:0xC1514C0->0xC1514C0|singlelinecheckphysics(int,attackabletarget,collider,vector3,vector3,impactinfo)|CLASS_FULL_SIG | L1989] -- //  UPDATED 0xBD1D5C4 -> 0xC1514C0
    HexPatches.MemoryPatch("libunity.so", 0x6A627B4, "00 00 80 D2 C0 03 5F D6"); -- NO DELAY SPRINT -- [UPD:0x6A627B4->0x6A627B4|adddelaysprintfire(realweaponinidata,list<datapropertydata>)|CLASS_FULL_SIG | L1990] -- //  UPDATED 0xB8A6FC0 -> 0x6A627B4

    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32);-- REDHACK -- [UPD:0x9677554->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1992] -- //  UPDATED 0x8CF23C8 -> 0x9677554
    HexPatches.MemoryPatch("libunity.so", 0x967755C, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x967755C->0x967755C|set_isinem3eye(bool)|CLASS_FULL_SIG | L1993] -- //  UPDATED 0x8CF23D0 -> 0x967755C
    HexPatches.MemoryPatch("libunity.so", 0x88F07C0, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x88F07C0->0x88F07C0|showfireloconradar()|CLASS_FULL_SIG | L1994] -- //  UPDATED 0x984E644 -> 0x88F07C0
    HexPatches.MemoryPatch("libunity.so", 0x9677554, "h20 00 80 D2 C0 03 5F D6", 32); -- [UPD:0x9677554->0x9677554|get_isinem3eye()|CLASS_FULL_SIG | L1995] -- //  UPDATED 0x8CF23C8 -> 0x9677554
    HexPatches.MemoryPatch("libunity.so", 0xAD1DD78, "h40 00 00 1C C0 03 5F D6", 32); -- [UPD:0xAD1FCDC->0xAD1DD78|getaccdistance()|CLASS_FULL_SIG | L1996] -- //  UPDATED 0x8BBE7A8 -> 0xAD1FCDC

    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS -- [UPD:0x75A81A4->0x75A81A4|sameteamfrominfo(playerinfo,playerinfo)|CLASS_FULL_SIG | L1998] -- //  UPDATED 0x846278C -> 0x75A81A4
    HexPatches.MemoryPatch("libunity.so", 0x5978234, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags1 -- [UPD:0x5978234->0x5978234|sameteamfrominfo_checkteamid(playerinfo,playerinfo)|CLASS_FULL_SIG | L1999] -- //  UPDATED 0x6703EB8 -> 0x5978234
    HexPatches.MemoryPatch("libunity.so", 0x5978504, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags2 -- [UPD:0x5978504->0x5978504|sameteamfromparameters(uint,uint,int,int)|CLASS_FULL_SIG | L2000] -- //  UPDATED 0x67041A0 -> 0x5978504
    HexPatches.MemoryPatch("libunity.so", 0x75A822C, "h20 00 80 D2 C0 03 5F D6", 32) -- mptags2 -- [UPD:0x75A822C->0x75A822C|sameteamfrompawn(pawn,pawn)|CLASS_FULL_SIG | L2001] -- //  UPDATED 0x8462814 -> 0x75A822C
    HexPatches.MemoryPatch("libunity.so", 0x75A81A4, "h20 00 80 D2 C0 03 5F D6", 32) -- BR TAGS -- [UPD:0x75A81A4->0x75A81A4|sameteamfrominfo(playerinfo,playerinfo)|CLASS_FULL_SIG | L2002] -- //  UPDATED 0x846278C -> 0x75A81A4

    HexPatches.MemoryPatch("libunity.so", 0x666FB88, "h4000001CC0035FD6", 32)--AIMBOT -- [UPD:0x666FB88->0x666FB88|getrotatespeed(float,float,float,float,bool)|CLASS_FULL_SIG | L2004] -- //  UPDATED 0x6A92D3C -> 0x666FB88
    HexPatches.MemoryPatch("libunity.so", 0x5161770, "hC0035FD600001041", 32)--GetAutoAssistAimRate -- [UPD:0x5161770->0x5161770|getautoassistaimrate(float,float,bool,float,bool)|CLASS_FULL_SIG | L2005] -- //  UPDATED 0x4F478D0 -> 0x5161770
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
        text = "ANOS NOTIFICATION", -- Small header like real phones
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

