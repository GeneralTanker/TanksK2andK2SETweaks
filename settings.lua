if mods ["space-exploration-postprocess"] then
    data:extend(
    {
      {
        type = "bool-setting",
        name = "noble-se-tweaks-bettermk3",
        setting_type = "startup",
        default_value = true,
	    order = "a"
      }
    }
    )
end

if mods["Rich-Rocks-Requiem"] then
    data:extend(
    {
      {
        type = "bool-setting",
        name = "early-rich-rocks-processing",
        setting_type = "startup",
        default_value = false,
	    order = "b"
      }
    }
    )
end

    data:extend(
    {
      {
        type = "bool-setting",
        name = "remove-creep-virus",
        setting_type = "startup",
        default_value = true,
	    order = "d"
      }
    }
    )
	
    data:extend(
    {
      {
        type = "bool-setting",
        name = "remove-biter-virus",
        setting_type = "startup",
        default_value = true,
	    order = "e"
      }
    }
    )
	
    data:extend(
    {
      {
        type = "bool-setting",
        name = "new-tank-graphics",
        setting_type = "startup",
        default_value = true,
	    order = "f"
      }
    }
    )

--    data:extend(
--    {
--      {
--        type = "bool-setting",
--        name = "k2-alternatives-recipe-changes",
--        setting_type = "startup",
--        default_value = true,
--	    order = "g"
--      }
--    }
--    )

--    data:extend(
--    {
--      {
--        type = "bool-setting",
--        name = "solid-fuel-to-k2-fuel",
--        setting_type = "startup",
--        default_value = true,
--	    order = "h"
--      }
--    }
--    )