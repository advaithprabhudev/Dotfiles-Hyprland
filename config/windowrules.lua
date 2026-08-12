-- Window rules, matched to binnewbs/arch-hyprland's tags.conf + windowrules.conf
-- wiki: https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Picture-in-Picture (kept from base config, not in the rice but universally useful)
hl.window_rule({
    match             = { title = "^([Pp]icture[-\\s]?[Ii]n[-\\s]?[Pp]icture)(.*)$" },
    float             = true,
    keep_aspect_ratio = true,
    size              = { "max(monitor_w, monitor_h)*0.25", "min(monitor_w, monitor_h)*0.25" },
    pin               = true,
})

-- Opacity by app (rice's "APPLICATIONS BLUR" section, tags resolved to their classes)
hl.window_rule({ match = { class = "^([Mm]pv|vlc)$" }, opacity = "1.0 override" })
hl.window_rule({ match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller|org.gnome.DiskUtility)$" }, opacity = "0.8 override" })
hl.window_rule({ match = { class = "^(org.gnome.Nautilus)$" }, opacity = "0.8 override" })
hl.window_rule({ match = { class = "^(gedit|org.gnome.TextEditor|mousepad)$" }, opacity = "0.9 override" })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, opacity = "0.9 override" })
hl.window_rule({ match = { class = "^(kitty)$" }, opacity = "0.9 override" })
hl.window_rule({ match = { class = "^(discord|vesktop|org.telegram.desktop)$" }, opacity = "0.85 override" })
hl.window_rule({ match = { class = "^(Spotify)$" }, opacity = "0.8 override" })
hl.window_rule({ match = { class = "^(zen)$" }, opacity = "0.9 override" })

-- Layer rules
hl.layer_rule({ match = { namespace = "^waybar$" }, blur = true, ignore_alpha = 0.5 })
hl.layer_rule({ match = { namespace = "^logout_dialog$" }, blur = true })
hl.layer_rule({ match = { namespace = "^swaync-control-center$" }, blur = true, ignore_alpha = 0.5, xray = false })
hl.layer_rule({ match = { namespace = "^swaync-notification-window$" }, blur = true, ignore_alpha = 0.5, xray = false })

-- Float: settings / viewer / video apps (tag:settings*, tag:viewer*, tag:multimedia_video*)
hl.window_rule({ match = { class = "^(nm-applet|nm-connection-editor|blueman-manager|org.gnome.FileRoller|org.gnome.DiskUtility)$" }, float = true })
hl.window_rule({ match = { class = "^(org.gnome.SystemMonitor|org.gnome.Evince|eog|org.gnome.Loupe)$" }, float = true })
hl.window_rule({ match = { class = "^([Mm]pv|vlc)$" }, float = true, size = { "900", "506" } })
hl.window_rule({ match = { class = "^(org.pulseaudio.pavucontrol)$" }, float = true, size = { "monitor_w*0.50", "monitor_h*0.60" } })

-- Ignore maximize requests from apps
hl.window_rule({
    name  = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-- Pop-ups and dialogues
hl.window_rule({ match = { title = "^(Save As|Save a File|Pick Files)$" }, float = true, size = { "monitor_w*0.50", "monitor_h*0.60" }, center = true })
hl.window_rule({ match = { initial_title = "^(Open Files)$" }, float = true, size = { "monitor_w*0.70", "monitor_h*0.60" } })
