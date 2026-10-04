import "android.widget.*"
import "android.view.*"
import "android.app.*"
import "android.graphics.*"
import "android.graphics.drawable.*"
import "android.content.*"
import "android.os.Handler"
import "android.view.Gravity"
import "android.net.Uri"
import "android.view.animation.*"

local json = require("json")


local GAME_PRODUCT = "CODMGR"
local API_URL = "https://makspanel.x10.mx/connect"
local GET_KEY_URL = "https://t.me/Anos0fficial/get-key"


local prefs = activity.getSharedPreferences("loginPrefs", Context.MODE_PRIVATE)


local function getDeviceSerial()
  local savedSerial = prefs.getString("deviceSerial", nil)
  if savedSerial and savedSerial ~= "" then return savedSerial end
  local newSerial=""
  math.randomseed(os.time())
  for i=1,16 do
    local c=string.char(math.random(97,122))
    local n=math.random(0,9)
    newSerial=newSerial..c..n
  end
  prefs.edit().putString("deviceSerial",newSerial).apply()
  return newSerial
end


local URL = luajava.bindClass("java.net.URL")
local BufferedReader = luajava.bindClass("java.io.BufferedReader")
local InputStreamReader = luajava.bindClass("java.io.InputStreamReader")
local OutputStreamWriter = luajava.bindClass("java.io.OutputStreamWriter")

local function httpPost(urlString,params)
  local result=""
  local success=false
  local body=""
  for k,v in pairs(params) do
    if #body>0 then body=body.."&" end
    body=body..k.."="..v
  end
  local pcallSuccess,pcallResult = pcall(function()
    local conn=URL(urlString).openConnection()
    conn.setRequestMethod("POST")
    conn.setRequestProperty("Content-Type","application/x-www-form-urlencoded")
    conn.setDoOutput(true)
    conn.setConnectTimeout(5000)
    conn.setReadTimeout(5000)
    local writer=OutputStreamWriter(conn.getOutputStream())
    writer.write(body)
    writer.flush()
    writer.close()
    local reader=BufferedReader(InputStreamReader(conn.getInputStream()))
    local line
    while true do
      line=reader.readLine()
      if not line then break end
      result=result..line
    end
    reader.close()
    success=true
  end)
  if not pcallSuccess or not success then
    return false,{status=false,reason="HTTP request failed: "..tostring(pcallResult)}
  end
  local jsonSuccess,data=pcall(json.decode,result)
  if not jsonSuccess then
    return false,{status=false,reason="Failed to parse JSON response."}
  end
  return true,data
end


local function authenticate(userKey)
  local serial=getDeviceSerial()
  if not userKey or userKey=="" or not serial or serial=="" then
    return false,"User Key and Device Serial are required."
  end
  local success,response=httpPost(API_URL,{
    game=GAME_PRODUCT,
    user_key=userKey,
    serial=serial
  })
  if success and response.status==true then
    return true,response.data
   else
    return false,response.reason or "Authentication failed."
  end
end


local function startBlinking(view,minAlpha,maxAlpha,speed)
  local alpha=minAlpha
  local delta=0.05
  local increasing=true
  local handler=Handler()
  local runnable
  runnable=luajava.createProxy("java.lang.Runnable",{
    run=function()
      if increasing then
        alpha=alpha+delta
        if alpha>=maxAlpha then
          alpha=maxAlpha
          increasing=false
        end
       else
        alpha=alpha-delta
        if alpha<=minAlpha then
          alpha=minAlpha
          increasing=true
        end
      end
      view.setAlpha(alpha)
      handler.postDelayed(runnable,speed)
    end
  })
  handler.post(runnable)
end


local function startBorderGlow(drawable)
  local colors={0xFF00FF00,0xFF00FFFF,0xFF00FF00}
  local index=1
  local handler=Handler()
  local runnable
  runnable=luajava.createProxy("java.lang.Runnable",{
    run=function()
      drawable.setStroke(4,colors[index])
      index=index+1
      if index>#colors then
        index=1
      end
      handler.postDelayed(runnable,250)
    end
  })
  handler.post(runnable)
end


local function rotateIcon(view)
  local anim=RotateAnimation(
  0,360,
  Animation.RELATIVE_TO_SELF,0.5,
  Animation.RELATIVE_TO_SELF,0.5)
  anim.setDuration(5000) -- slower rotation
  anim.setRepeatCount(Animation.INFINITE)
  anim.setInterpolator(LinearInterpolator())
  view.startAnimation(anim)
end


local function showLoginDialog()
  local layout=LinearLayout(activity)
  layout.setOrientation(1)
  layout.setPadding(60,60,60,60)
  layout.setGravity(Gravity.CENTER)

  local bgDrawable=GradientDrawable()
  bgDrawable.setColor(0xFF0A0A0A)
  bgDrawable.setCornerRadius(50)
  bgDrawable.setStroke(4,0xFF00FF00)
  layout.setBackgroundDrawable(bgDrawable)
  startBorderGlow(bgDrawable)


  local title=TextView(activity)
  title.setText("𝗞𝗜𝗥𝗢 𝗟𝗢𝗚𝗜𝗡")
  title.setTextSize(28)
  title.setTextColor(0xFF00FF00)
  title.setGravity(Gravity.CENTER)
  title.setShadowLayer(20,0,0,0xFF00FF00)
  startBlinking(title,0.7,1.0,80)
  layout.addView(title)
  typeface = Typeface.createFromFile(activity.getLuaDir() .. "/font/orb.ttf");


  local labelRow=LinearLayout(activity)
  labelRow.setOrientation(0)
  labelRow.setGravity(Gravity.CENTER_VERTICAL)
  labelRow.setPadding(0,40,0,10)

  local userKeyLabel=TextView(activity)
  userKeyLabel.setText("Enter Your Key : ")
  userKeyLabel.setTextSize(15)
  userKeyLabel.setTextColor(0xFF00FF00)
  userKeyLabel.setTypeface(Typeface.DEFAULT_BOLD)

  local icon=ImageView(activity)
  icon.setImageBitmap(loadbitmap("icon.png"))
  local iconParams=LinearLayout.LayoutParams(100,100) -- bigger icon
  iconParams.setMargins(10,0,0,0)
  icon.setLayoutParams(iconParams)
  rotateIcon(icon) -- start rotation

  labelRow.addView(userKeyLabel)
  labelRow.addView(icon)
  layout.addView(labelRow)


  local userInputDrawable=GradientDrawable()
  userInputDrawable.setColor(0xFF141414)
  userInputDrawable.setCornerRadius(40)
  userInputDrawable.setStroke(3,0xFF00FF00)

  local userKeyInput=EditText(activity)
  userKeyInput.setHint("Enter Your Key")
  userKeyInput.setTextSize(16)
  userKeyInput.setPadding(40,30,40,30)
  userKeyInput.setBackgroundDrawable(userInputDrawable)
  userKeyInput.setHintTextColor(0xFF888888)
  userKeyInput.setTextColor(0xFF00FF00)
  layout.addView(userKeyInput)


  local rememberBox=CheckBox(activity)
  rememberBox.setText("Remember Key")
  rememberBox.setTextColor(0xFF00FF00)
  rememberBox.setPadding(10,20,0,20)
  local savedKey=prefs.getString("savedUserKey","")
  local isRemembered=prefs.getBoolean("isKeyRemembered",false)
  if isRemembered then
    userKeyInput.setText(savedKey)
    rememberBox.setChecked(true)
  end
  layout.addView(rememberBox)


  local buttonLayout=LinearLayout(activity)
  buttonLayout.setOrientation(0)
  buttonLayout.setGravity(Gravity.CENTER)
  local buttonParams=LinearLayout.LayoutParams(0,LinearLayout.LayoutParams.WRAP_CONTENT,1)
  buttonParams.setMargins(10,0,10,0)

  local buttonDrawable=GradientDrawable()
  buttonDrawable.setColor(0xFF1B1B1B)
  buttonDrawable.setCornerRadius(40)
  buttonDrawable.setStroke(3,0xFF00FF00)

  local loginButton=Button(activity)
  loginButton.setText("LOGIN")
  loginButton.setBackgroundDrawable(buttonDrawable)
  loginButton.setTextColor(Color.WHITE)
  loginButton.setLayoutParams(buttonParams)
  startBlinking(loginButton,0.7,1.0,80)

  local getKeyButton=Button(activity)
  getKeyButton.setText("GET KEY")
  getKeyButton.setBackgroundDrawable(buttonDrawable)
  getKeyButton.setTextColor(Color.WHITE)
  getKeyButton.setLayoutParams(buttonParams)

  local exitButton=Button(activity)
  exitButton.setText("EXIT")
  exitButton.setBackgroundDrawable(buttonDrawable)
  exitButton.setTextColor(Color.WHITE)
  exitButton.setLayoutParams(buttonParams)

  buttonLayout.addView(loginButton)
  buttonLayout.addView(getKeyButton)
  buttonLayout.addView(exitButton)
  layout.addView(buttonLayout)

  local dialogBuilder=AlertDialog.Builder(activity)
  dialogBuilder.setView(layout)
  dialogBuilder.setCancelable(false)
  local dialog=dialogBuilder.create()
  dialog.getWindow().setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
  dialog.show()


  loginButton.setOnClickListener(function()
    local key=userKeyInput.getText().toString()
    if key=="" then
      Toast.makeText(activity,"Please enter a user key.",Toast.LENGTH_SHORT).show()
      return
    end
    loginButton.setText("Wait...")
    loginButton.setEnabled(false)
    getKeyButton.setEnabled(false)
    exitButton.setEnabled(false)

    local handler=Handler()
    handler.post(function()
      local success,data=authenticate(key)
      loginButton.setText("LOGIN")
      loginButton.setEnabled(true)
      getKeyButton.setEnabled(true)
      exitButton.setEnabled(true)

      if success then
        Toast.makeText(activity,"Login successful!",Toast.LENGTH_SHORT).show()
        local editor=prefs.edit()
        if rememberBox.isChecked() then
          editor.putString("savedUserKey",key)
          editor.putBoolean("isKeyRemembered",true)
         else
          editor.remove("savedUserKey")
          editor.putBoolean("isKeyRemembered",false)
        end
        editor.apply()
        print("Mod Name: "..tostring(data.modname))
        print("Token: "..tostring(data.token))
        dialog.dismiss()
       else
        Toast.makeText(activity,"Login failed: "..tostring(data),Toast.LENGTH_LONG).show()
      end
    end)
  end)

  getKeyButton.setOnClickListener(function()
    local intent=Intent(Intent.ACTION_VIEW)
    intent.setData(Uri.parse(GET_KEY_URL))
    intent.setPackage("com.android.chrome")
    pcall(function()
      activity.startActivity(intent)
    end)
  end)

  exitButton.setOnClickListener(function()
    activity.finish()
  end)

end

showLoginDialog()