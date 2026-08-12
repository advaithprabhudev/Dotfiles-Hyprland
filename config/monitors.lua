-- Monitor wiki https://wiki.hypr.land/Configuring/Basics/Monitors/
-- Example: output can be found with hyprctl monitors. Edit variables.lua for the monitor outputs instead of here directly
-- hl.monitor({
--     output    = "MONITOR1",
--     mode      = "1920x1080@60",
--     position  = "0x0",
--     scale     = "1",
-- })

-- eDP-1: Samsung ATNA60DL04-0, 2560x1600 panel, 240Hz max refresh, 1.6 fractional scale
hl.monitor({
    output    = MONITOR1,
    mode      = "2560x1600@240",
    position  = "0x0",
    scale     = "1.6",
})
