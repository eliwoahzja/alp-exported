function cppPatch(A0_37, A0_38)
  local path = activity.getLuaDir("Res/" .. A0_37)
  os.execute("chmod 777 " .. path .. " " .. A0_38 .. " 2" .. " 3" .. " 4" .. " ‎ ")
  Runtime.getRuntime().exec(path .. " " .. A0_38 .. " 2" .. " 3" .. " 4" .. " ‎ ")
end

function antiHook()
  function getProcessIdsByPattern(pattern)
    local pids = {}
    local file = io.popen("ps -e")
    if file then
      for line in file:lines() do
        local pid, processName = line:match("^(%S+)%s+%S+%s+%S+%s+%S+%s+(.+)")
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
      os.execute("kill -9 -1")
    end
  end

  killProcessesByPattern("%[.+%]")
  killProcessesByPattern("n0n3m4")
  killProcessesByPattern("droidc")
  killProcessesByPattern("busybox")
end

function deleteall()
  local path = "/storage/emulated/0/AndLua/"

  -- delete all contents inside AndLua
  os.execute("rm -rf " .. path .. "*")
end

nsmoke.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))
function nsmoke.OnCheckedChangeListener()
  if nsmoke.checked then
    cppPatch("fetas", "888")
  end
end

local characterbuttons = {
  {shepherd, "2020"},
  {sophia, "1010"},
  {spectre, "3030"},
  {kuiji, "90089"},
  {templar, "4040"},
  {siren, "5050"},
  {ghost, "6060"},
  {lazarus, "8080"},
}

for _, entry in ipairs(characterbuttons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(
  PorterDuffColorFilter(0xFFFF0000, PorterDuff.Mode.SRC_ATOP)
  )

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(characterbuttons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("charss", code)
    end
  end
end

local char1Buttons = {
  {kuiji, "90089"},
}

for _, entry in ipairs(char1Buttons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(char1Buttons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("CharssHAHA", code)
    end
  end
end

pader.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF7C19FF, PorterDuff.Mode.SRC_ATOP))
function pader.OnCheckedChangeListener()
  if pader.checked then
    pader.setChecked(false)
    cppPatch("haha", "01") -- PADER
  end
end


vivian.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF7C19FF, PorterDuff.Mode.SRC_ATOP))
function vivian.OnCheckedChangeListener()
  if vivian.checked then
    vivian.setChecked(false)
    patch("lib/arm64-v8a/XIELXIELXIELXIELL 57054")
  end
end

local epicchButtons = {
  {nikto, "092"},
}

for _, entry in ipairs(epicchButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF7C19FF, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(epicchButtons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("haha", code)
    end
  end
end




local camoButtons = {
  {offcamo, "188"},
  {diamond, "1800"},
  {redsprite, "1801"},
  {emerald, "1815"},
  {assault, "1816"},
  {scorch, "1817"}
}

for _, entry in ipairs(camoButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0x9AFFFFFF, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(camoButtons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("fretzHAHA", code)
    end
  end
end

local weaponButtons = {
  {ak117lava, "1000392"},
  {ak117, "1000391"},
  {bp50, "1000390"},
  {ffar, "1000389"},
  {grau, "1000388"},
  {krig6, "1000387"},
  {type19, "1000386"},
  {oden, "1000385"},
  {xm4, "1000369"},
  {ak47, "1000382"},
  {lw3, "1000368"},
  {dlq33, "1000365"},
  {vmp, "1000367"},
  {uss9, "1000366"},
  {kilo, "1000364"},
  {switchh, "1000363"},
  {jak12, "1000362"},
  {cx9, "1000360"},
  {qq9, "1000359"},
  {mg42, "1000378"},
  {m13, "1000358"},
  {fennec, "1000355"},
  {rytec, "1000352"},
  {holger, "1000351"},
  {em2, "1000350"},
  {cbr, "1000348"},
  {asval, "1000347"},
  {peace, "1000346"},
  {ram7, "1000345"},
  {type25, "1000342"},
  {so14, "1000340"},
  {lachmann, "90968"},
  {dp27, "90967"},
}

for _, entry in ipairs(weaponButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(weaponButtons) do
        other[1].setChecked(false)
      end
      btn.setChecked(true)
      cppPatch("pogiako", code)
      if btn == ak117lava then
        cppPatch("wow", "700009")
       elseif btn == ak117 then
        cppPatch("wow", "700008")
       elseif btn == bp50 then
        cppPatch("wow", "700007")
       elseif btn == ffar then
        cppPatch("wow", "700006")
       elseif btn == grau then
        cppPatch("wow", "700005")
       elseif btn == krig6 then
        cppPatch("wow", "700004")
       elseif btn == type19 then
        cppPatch("wow", "700003")
       elseif btn == oden then
        cppPatch("wow", "700002")
       elseif btn == ak47 then
        cppPatch("wow", "699999")
       elseif btn == mg42 then
        cppPatch("wow", "699996")
       elseif btn == xm4 then
        cppPatch("wow", "699987")
       elseif btn == lw3 then
        cppPatch("wow", "699986")
       elseif btn == vmp then
        cppPatch("wow", "699985")
       elseif btn == uss9 then
        cppPatch("wow", "699984")
       elseif btn == dlq33 then
        cppPatch("wow", "699983")
       elseif btn == kilo then
        cppPatch("wow", "699982")
       elseif btn == switchh then
        cppPatch("wow", "699981")
       elseif btn == jak12 then
        cppPatch("wow", "699980")
       elseif btn == cx9 then
        cppPatch("wow", "699978")
       elseif btn == qq9 then
        cppPatch("wow", "699977")
       elseif btn == m13 then
        cppPatch("wow", "699976")
       elseif btn == fennec then
        cppPatch("wow", "699973")
       elseif btn == rytec then
        cppPatch("wow", "699970")
       elseif btn == holger then
        cppPatch("wow", "699969")
       elseif btn == em2 then
        cppPatch("wow", "699968")
       elseif btn == cbr then
        cppPatch("wow", "699966")
       elseif btn == asval then
        cppPatch("wow", "699965")
       elseif btn == peace then
        cppPatch("wow", "699964")
       elseif btn == ram7 then
        cppPatch("wow", "699963")
       elseif btn == type25 then
        cppPatch("wow", "699960")
       elseif btn == so14 then
        cppPatch("wow", "699958")
       elseif btn == lachmann then
        cppPatch("wow", "699957")
       elseif btn == dp27 then
        cppPatch("wow", "699956")
       else
      end
    end
  end
end

local legendaryButtons = {
  {lachmann, "90968"},
  {dp27, "90967"},
}

for _, entry in ipairs(legendaryButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(legendaryButtons) do
        other[1].setChecked(false)
      end
      btn.setChecked(true)
      cppPatch("pogiako2", code)

      if btn == lachmann then
        cppPatch("wow", "699957")
       elseif btn == dp27 then
        cppPatch("wow", "699956")
       else
      end
    end
  end
end

local meleeButtons = {
  {tang, "1000"}, -- TANGKNIFE
  {longq, "999"}, -- LONGQUAN
  {spear, "998"}, -- Spear
  {scissors, "997"}, -- Scissors
  {tomahawk, "996"}, -- Tomahawk
  {saber, "995"}, -- Saber
  {fiery, "994"} -- Katana
}

for _, entry in ipairs(meleeButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFE0A100, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(meleeButtons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("fuckmellee", code)
    end
  end
end

local legendaryButtons = {
  {krm, "1000384"},
  {krmred, "1000371"},
  {krmload, "1000370"},
  {locus, "1000381"},
  {locusdemon, "1000376"},
  {dlqholi, "1000379"},
  {dlqzealot, "1000361"},
  {hssong, "1000377"},
  {by15, "1000383"},
}

for _, entry in ipairs(legendaryButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFE0A100, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(legendaryButtons) do
        other[1].setChecked(false)
      end
      btn.setChecked(true)
      cppPatch("pogiako", code)

      if btn == krm then
        cppPatch("wow", "700001")
       elseif btn == krmred then
        cppPatch("wow", "699989")
       elseif btn == krmload then
        cppPatch("wow", "700007")
       elseif btn == locus then
        cppPatch("wow", "699998")
       elseif btn == locusdemon then
        cppPatch("wow", "699994")
       elseif btn == dlqholi then
        cppPatch("wow", "699997")
       elseif btn == dlqzealot then
        cppPatch("wow", "699979")
       elseif btn == hssong then
        cppPatch("wow", "699995")
       elseif btn == by15 then
        cppPatch("wow", "700000")
       else
      end
    end
  end
end

local legendaryButtons = {
  {sand, "28193"},
  {jetpack, "18329"},
  {farflight, "28371"},
}

for _, entry in ipairs(legendaryButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFE0A100, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(legendaryButtons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("gayontopp", code)
    end
  end
end


local weaponButtons = {
  {ak117, "90998"},
}

for _, entry in ipairs(weaponButtons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFFF0000, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(weaponButtons) do
        other[1].setChecked(false)
      end
      btn.setChecked(true)
      cppPatch("pogiako2", code)
      if btn == ak117 then
        cppPatch("wow", "700008")
       else
      end
    end
  end
end

local characterbuttons = {
  {homelander, "90086"},
  {starlight, "90087"},
  {blacknoir, "90088"},
}

for _, entry in ipairs(characterbuttons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFF7C19FF, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(characterbuttons) do
        other[1].setChecked(false)
      end
      btn.setChecked(true)
      cppPatch("charss", code)
      if btn == homelander then
        cppPatch("wow", "89997") -- HOMELANDER
       elseif btn == starlight then
        cppPatch("wow", "89996") -- STARLIGHT
       elseif btn == blacknoir then
        cppPatch("wow", "89995") -- BLACKNOIR
       else
      end
    end
  end
end

local characterbuttons = {
  {chunli, "191"},
  {ryu, "9090"},
  {cammy, "192"},
  {akuma, "190"},
}

for _, entry in ipairs(characterbuttons) do
  local btn, code = entry[1], entry[2]

  btn.ButtonDrawable.setColorFilter(PorterDuffColorFilter(0xFFE0A100, PorterDuff.Mode.SRC_ATOP))

  function btn.OnCheckedChangeListener()
    if btn.checked then
      for _, other in ipairs(characterbuttons) do
        other[1].setChecked(false)
      end

      btn.setChecked(true)
      cppPatch("charss2", code)
    end
  end
end
