-- Cachy colors (fallback defaults, used until matugen has generated a palette)

CACHYLGREEN = "rgba(82dcccff)"
CACHYMGREEN = "rgba(00aa84ff)"
CACHYDGREEN = "rgba(007d6fff)"
CACHYLBLUE  = "rgba(01ccffff)"
CACHYMBLUE  = "rgba(182545ff)"
CACHYDBLUE  = "rgba(111826ff)"
CACHYWHITE  = "rgba(ffffffff)"
CACHYGREY   = "rgba(ddddddff)"
CACHYGRAY   = "rgba(798bb2ff)"

-- Matugen (Material You) palette, regenerated per-wallpaper into
-- ~/.config/hypr/colors.conf by `matugen image <wallpaper>` (see scripts/wppicker.sh).
-- matugen's post_hook runs `hyprctl reload`, which re-executes this file, so the
-- MTG_* globals below pick up the new palette automatically.
local function load_matugen_colors(path)
    local colors = {}
    local file = io.open(path, "r")
    if not file then return colors end
    for line in file:lines() do
        local name, value = line:match("^%$([%a][%w_]*)%s*=%s*(rgba%([0-9a-fA-F]+%))")
        if name and value then
            colors[name] = value
        end
    end
    file:close()
    return colors
end

local mg = load_matugen_colors(os.getenv("HOME") .. "/.config/hypr/colors.conf")

MTG_PRIMARY            = mg.primary or CACHYLGREEN
MTG_SECONDARY          = mg.secondary or CACHYLBLUE
MTG_OUTLINE            = mg.outline or CACHYGRAY
MTG_OUTLINE_VARIANT    = mg.outline_variant or CACHYDBLUE
MTG_SURFACE            = mg.surface or CACHYMBLUE
MTG_SURFACE_CONTAINER  = mg.surface_container or CACHYDBLUE
