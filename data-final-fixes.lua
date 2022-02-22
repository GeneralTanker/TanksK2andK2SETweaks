--- Krastorio 2 Truce 

data.raw["tile"]["kr-creep"].collision_mask = { "ghost-layer", "ground-tile", "not-colliding-with-itself" }; -- "floor-layer"

if settings.startup["remove-creep-virus"].value == true then

data.raw["technology"]["kr-creep-virus"].hidden = true;
data.raw["capsule"   ]["kr-creep-virus"].hidden = true;
data.raw["recipe"    ]["kr-creep-virus"].hidden = true;
--	if mods ["deadlock_stacked_recipes"] then
--	data.raw["recipe"    ]["DSR_HighPressure-kr-creep-virus"].hidden = true;
--	end

end

if settings.startup["remove-biter-virus"].value == true then

data.raw["technology"]["kr-biter-virus"].hidden = true;
data.raw["capsule"   ]["kr-biter-virus"].hidden = true;
data.raw["recipe"    ]["kr-biter-virus"].hidden = true;
--	if mods ["deadlock_stacked_recipes"] then
--	data.raw["recipe"    ]["DSR_HighPressure-kr-biter-virus"].hidden = true;
--	end

end

--- Krastorio 2 Nuclear Fuel More Fixes

if mods ["Nuclear Fuel"] then

data.raw["technology"]["nuclear-rocket-fuel"].hidden = true;
data.raw["recipe"    ]["nuclear-fuel"].hidden = true;
data.raw["recipe"    ]["nuclear-fuel-pu"].hidden = true;
--	if mods ["deadlock_stacked_recipes"] then
--	data.raw["recipe"    ]["StackedRecipe-nuclear-fuel"].hidden = true;
--		if mods ["DeadlockCratingandStackingMiscellaneous"] then
--		data.raw["recipe"    ]["StackedRecipe-nuclear-fuel-pu"].hidden = true;
--		end
--	end

end

-- Stack size Fix

local kr_stack_size_value = krastorio.general.getSafeSettingValue("kr-stack-size")

   if kr_stack_size_value and kr_stack_size_value ~= "No changes" then 

  -- Special stack size
  kr_stack_size_value = tonumber(kr_stack_size_value)
  local special_stack_size = 100
  if kr_stack_size_value > 100 then
     special_stack_size = kr_stack_size_value
  end
  
   -- Vanilla

   if mods ["DeadlockLargerLamp"] then  
       
   data.raw.item["small-lamp"].stack_size = kr_stack_size_value*0.5
   
   end
   
   if mods ["aai-industry"] then  
   -- AAI Industry 
   data.raw.item["motor"].stack_size = kr_stack_size_value
   data.raw.item["electric-motor"].stack_size = kr_stack_size_value
   end
   
   if mods ["Rich-Rocks-Requiem"] then
   --- Rich-Rocks-Requiem
   data.raw.item["rrr-rich-rocks"].stack_size = kr_stack_size_value
   data.raw.item["rrr-raw-ores"].stack_size = kr_stack_size_value
   data.raw.item["rrr-raw-minerals"].stack_size = kr_stack_size_value
   end
      
end

-- Hide intermediate bulk containers crafting from player menu

for fluid_name, _ in pairs(data.raw.fluid) do
  if krastorio.recipes.exist("empty-" .. fluid_name .. "-pallet") then
    data.raw.recipe["empty-" .. fluid_name .. "-pallet"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("fill-" .. fluid_name .. "-pallet") then
    data.raw.recipe["fill-" .. fluid_name .. "-pallet"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("empty-" .. fluid_name .. "-ibc") then
    data.raw.recipe["empty-" .. fluid_name .. "-ibc"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("fill-" .. fluid_name .. "-ibc") then
    data.raw.recipe["fill-" .. fluid_name .. "-ibc"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("empty-" .. fluid_name .. "-tank") then
    data.raw.recipe["empty-" .. fluid_name .. "-tank"].hide_from_player_crafting = true
  end
  if krastorio.recipes.exist("fill-" .. fluid_name .. "-tank") then
    data.raw.recipe["fill-" .. fluid_name .. "-tank"].hide_from_player_crafting = true
  end
end

if mods ["space-exploration"] then

  local data_util = require("__space-exploration-postprocess__/data_util")

  -- K2+SE Mk5 and Mk6 shields 

  table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk5-equipment"].categories, "universal-equipment")
  table.insert(data.raw["energy-shield-equipment"]["energy-shield-mk6-equipment"].categories, "universal-equipment")
 
  -- Krastorio 2 Miner tweaks (from Noble's Space Exploration Tweaks)

  if settings.startup["noble-se-tweaks-bettermk3"].value == true then
     data.raw['mining-drill']["kr-electric-mining-drill-mk2"].module_specification.module_slots = 4
     --   if settings.startup["aai-wide-drill"].value == true then
     data.raw['mining-drill']["area-mining-drill"].module_specification.module_slots = 6
     --   end
     data.raw['mining-drill']["kr-electric-mining-drill-mk3"].module_specification.module_slots = 6
  end



  -- K2+SE Tech Fix

    -- Electric energy distribution 3

      if krastorio.general.getSafeSettingValue("kr-substation-mk2") then
      
        data.raw.technology["electric-energy-distribution-3"].unit.ingredients = {
            {"production-science-pack", 1},
            {"utility-science-pack", 1},
            {"se-rocket-science-pack", 1} 
          }
          --data.raw.technology["electric-energy-distribution-3"].unit.count = 300
          data.raw.technology["electric-energy-distribution-3"].prerequisites = {
            "electric-energy-distribution-2",
          "kr-imersium-processing"
          }
      
    end

  -- Other mods that addon to K2 or support K2

      if mods ["Krastorio2-more-locomotives"] then

          data.raw.technology["kr-fusion-locomotive"].unit.ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1},
            {"production-science-pack", 1},
        {"se-energy-science-pack-3", 1}
          }
          --data.raw.technology["kr-fusion-locomotive"].unit.count = 500
          data.raw.technology["kr-fusion-locomotive"].prerequisites = {
            "fusion-reactor-equipment",
  --		  "railway",
  --		  "production-science-pack",
        "kr-ai-core"
          }

    end

    --Rich rocks processing

  if mods ["Rich-Rocks-Requiem"] then

      if settings.startup["early-rich-rocks-processing"] == true then

          data.raw.technology["rrr-rich-rocks-processing"].unit.ingredients = {
            {"automation-science-pack", 1},
            {"logistic-science-pack", 1},
            {"chemical-science-pack", 1} 
          }
          data.raw.technology["rrr-rich-rocks-processing"].unit.count = 550
          data.raw.technology["rrr-rich-rocks-processing"].prerequisites = {
            "kr-advanced-chemistry"
          }

    end
    
  end

  -- SE subgroup fixes

  local data_util = require("__space-exploration-postprocess__/data_util")
  local types = {"item", "item-with-entity-data", "rail-planner", "capsule"}

  local function change_subgroup (name, subgroup, order)
    for _, type in pairs(types) do
      if data.raw[type][name] then
        data.raw[type][name].subgroup = subgroup
        if order then
          data.raw[type][name].order = order
        end
      end
    end
  end

  -- K2 Shelter 

  if mods ["aai-containers"] then

    change_subgroup("kr-shelter","container-1")
    
  end

  -- Pipes and Tanks

  change_subgroup("kr-steel-pipe", "pipe")
  change_subgroup("kr-steel-pipe-to-ground", "pipe")
  change_subgroup("kr-steel-pump", "pipe")
  change_subgroup("kr-fluid-storage-1", "pipe")
  change_subgroup("kr-fluid-storage-2", "pipe")


  -- Chemistry 

  change_subgroup("kr-electrolysis-plant", "chemistry")
  change_subgroup("kr-filtration-plant", "chemistry")
  change_subgroup("kr-atmospheric-condenser", "chemistry")
  change_subgroup("kr-fluid-burner", "chemistry")
  change_subgroup("kr-advanced-chemical-plant", "chemistry")
  change_subgroup("kr-fuel-refinery", "chemistry")

  -- Crusher

  change_subgroup("kr-crusher", "mechanical")

  -- Lab

  change_subgroup("kr-research-server", "lab")
  change_subgroup("kr-quantum-computer", "lab")

end