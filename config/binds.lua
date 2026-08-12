-- Keybindings, matched to binnewbs/arch-hyprland's keybinds.conf
local mainMod = "SUPER"
local scripts = os.getenv("HOME") .. "/.config/hypr/scripts"

---------------------------
---- WINDOW MANAGEMENT ----
---------------------------

hl.bind(mainMod .. " + Return",       hl.dsp.exec_cmd(TERMINAL))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd("[float; size 800 550] " .. TERMINAL))
hl.bind(mainMod .. " + Q",            hl.dsp.window.close())
hl.bind("CONTROL + ALT + Delete",     hl.dsp.exit())
hl.bind(mainMod .. " + E",            hl.dsp.exec_cmd(FILE_MANAGER))
hl.bind(mainMod .. " + Space",        hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + D",            hl.dsp.exec_cmd("rofi -show drun"))
hl.bind(mainMod .. " + P",            hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",            hl.dsp.layout("togglesplit"))
hl.bind(mainMod .. " + R",            hl.dsp.exec_cmd(scripts .. "/wbrestart.sh"))
hl.bind(mainMod .. " + B",            hl.dsp.exec_cmd(BROWSER))
hl.bind(mainMod .. " + L",            hl.dsp.exec_cmd(scripts .. "/hyprlock.sh"))
hl.bind(mainMod .. " + SHIFT + F",    hl.dsp.window.fullscreen())
hl.bind(mainMod .. " + SHIFT + S",    hl.dsp.exec_cmd(scripts .. "/screenshot.sh"))
hl.bind(mainMod .. " + W",            hl.dsp.exec_cmd(scripts .. "/wppicker.sh"))
hl.bind(mainMod .. " + SHIFT + Q",    hl.dsp.exec_cmd(scripts .. "/KillActiveProcess.sh"))
hl.bind(mainMod .. " + C",            hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mainMod .. " + CONTROL + B",  hl.dsp.exec_cmd(scripts .. "/WaybarStyles.sh"))
hl.bind(mainMod .. " + ALT + B",      hl.dsp.exec_cmd(scripts .. "/WaybarLayout.sh"))
hl.bind(mainMod .. " + H",            hl.dsp.exec_cmd("pkill -SIGUSR1 waybar"))
hl.bind(mainMod .. " + SHIFT + E",    hl.dsp.exec_cmd(TERMINAL .. " yazi"))

-- Change focus
hl.bind(mainMod .. " + Left",  hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + Right", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + Up",    hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + Down",  hl.dsp.focus({ direction = "d" }))

-- Move windows
hl.bind(mainMod .. " + CONTROL + Left",  hl.dsp.window.move({ direction = "l" }))
hl.bind(mainMod .. " + CONTROL + Right", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainMod .. " + CONTROL + Up",    hl.dsp.window.move({ direction = "u" }))
hl.bind(mainMod .. " + CONTROL + Down",  hl.dsp.window.move({ direction = "d" }))

-- Resize windows
hl.bind(mainMod .. " + SHIFT + Left",  hl.dsp.exec_raw("resizeactive -50 0"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Right", hl.dsp.exec_raw("resizeactive 50 0"),  { repeating = true })
hl.bind(mainMod .. " + SHIFT + Up",    hl.dsp.exec_raw("resizeactive 0 -50"), { repeating = true })
hl.bind(mainMod .. " + SHIFT + Down",  hl.dsp.exec_raw("resizeactive 0 50"),  { repeating = true })

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind(mainMod .. " + 0", hl.dsp.focus({ workspace = 10 }))

-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 9 do
    hl.bind(mainMod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = tostring(i) }))
end
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = "10" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())

-- Zoom (not part of the rice, kept from base config as a bonus)
local function zoomfunction(value)
    local zoomvalue = hl.get_config("cursor:zoom_factor")
    if (zoomvalue + value) > 3.0 then
        hl.config({ cursor = { zoom_factor = 3.0 } })
    elseif (zoomvalue + value) < 1.0 then
        hl.config({ cursor = { zoom_factor = 1.0 } })
    else
        hl.config({ cursor = { zoom_factor = zoomvalue + value } })
    end
end
hl.bind(mainMod .. " + Minus", function() zoomfunction(-0.3) end, { repeating = true })
hl.bind(mainMod .. " + Plus",  function() zoomfunction(0.3) end,  { repeating = true })

-------------------------------
---- HARDWARE / MULTIMEDIA ----
-------------------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --inc"),    { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(scripts .. "/volume.sh --dec"),    { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd(scripts .. "/volume.sh --toggle"), { locked = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { locked = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd(scripts .. "/brightness.sh --inc"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(scripts .. "/brightness.sh --dec"), { locked = true, repeating = true })

hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
