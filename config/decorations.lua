-- Look and feel configuration (matched to binnewbs/arch-hyprland's looknfeel.conf)

hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 2,
        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        col = {
            active_border = MTG_OUTLINE,
            inactive_border = MTG_OUTLINE_VARIANT,
        },
    },
    group = {
        col = {
            border_active = MTG_SECONDARY,
            border_inactive = MTG_OUTLINE_VARIANT,
            border_locked_active = MTG_SURFACE,
            border_locked_inactive = MTG_OUTLINE_VARIANT,
        },
        groupbar = {
            col = {
                active = MTG_PRIMARY,
                inactive = MTG_OUTLINE_VARIANT,
                locked_active = MTG_SURFACE,
                locked_inactive = MTG_OUTLINE_VARIANT,
            },
        },
    },
    decoration = {
        rounding = 10,
        rounding_power = 2,
        active_opacity = 1.0,
        inactive_opacity = 0.8,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = true,
            size = 5,
            passes = 3,
            ignore_opacity = true,
            new_optimizations = true,
            special = false,
            popups = true,
            xray = true,
            vibrancy = 0.1696,
        },
    },
})
