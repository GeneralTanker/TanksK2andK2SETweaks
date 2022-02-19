if mods ["space-exploration-postprocess"] then

--- Krastorio 2 Space Exploration Electric Boiler Recipes 

krastorio.technologies.addUnlockRecipe("se-electric-boiler", "se-electric-boiling-steam-415")
krastorio.technologies.addUnlockRecipe("se-electric-boiler", "se-electric-boiling-steam-975")

-- Krastorio 2 Advanced radar intergration 

krastorio.recipes.replaceIngredient("se-pylon-construction-radar", "radar", {"advanced-radar", 1})

end

-- K2+bzlead additions for other mods 

if mods ["bzlead"] then

local util = require("__bzlead__.data-util");

    if (not mods["pyrawores"] and not mods["bobplates"] and not mods["angelssmelting"]) then

    util.add_ingredient("kr-substation-mk2", "lead-plate", 2)

	end 
    
    if mods ["RealisticFusionWeaponry"] then

    util.add_ingredient("rfw-plasma-thrower-turret", "lead-plate", 5)

    end

    if mods ["Combat-Robot-Automation"] then
	
	util.add_ingredient("capsule-ammo-turret-rampant-arsenal", "lead-plate", 10)
	
	end

end

-- RTG & Personal Nuclear Replacement 

if mods ["space-exploration-postprocess"] then

   if mods["aai-vehicles-miner"] then 
   
   krastorio.recipes.replaceIngredient("vehicle-miner-mk5", "fusion-reactor-equipment", {"se-rtg-equipment", 1})
   
   end

   krastorio.recipes.replaceIngredient("spidertron", "se-rtg-equipment", {"nuclear-reactor-equipment", 2})

end
    
if mods["smr"] then
	
krastorio.recipes.replaceIngredient("smr-generator-3", "fusion-reactor-equipment", {"nuclear-reactor-equipment", 5})

end

-- K2 Alternatives recipe changes 

--if settings.startup["k2-alternatives-recipe-changes"] == true then

    if mods ["deadlock-beltboxes-loaders"] then

       krastorio.recipes.addIngredient("transport-belt-loader", { "iron-beam", 2 })

    end

    if mods ["aai-containers"] then

       krastorio.recipes.overrideIngredients("aai-strongbox", {
         { "steel-plate", 20 },
         { "steel-beam", 2 },
       })

       krastorio.recipes.overrideIngredients("aai-storehouse", {
         { "steel-plate", 50 },
         { "steel-beam", 5 },
         { "concrete", 50 },
       })

       krastorio.recipes.overrideIngredients("aai-warehouse", {
         { "steel-plate", 100 },
         { "steel-beam", 10 },
         { "concrete", 100 },
       })

    end

--end

--Soild Fuel to K2 Fuel replacement ingredient

--if settings.startup["solid-fuel-to-k2-fuel"] == true then

    if mods ["Aircraft"] then 
	
    krastorio.recipes.replaceIngredient("aircraft-afterburner", "solid-fuel", {"fuel", 5})

    end

    if mods ["aai-vehicles-laser-tank"] then   
	
    krastorio.recipes.replaceIngredient("laser-cannon-battery-focussed", "solid-fuel", {"fuel", 5})
    krastorio.recipes.replaceIngredient("laser-cannon-battery-piercing", "solid-fuel", {"fuel", 5})

    end
	
--end


-- K2 Companion Drones Fuel Compat

if mods["Companion_Drones"] then

  krastorio.entities.addFuelCategory("spider-vehicle", "companion", "vehicle-fuel")
  
  end
  
  -- krastorio.general.getSafeSettingValue("kr-rebalance-vehicles&fuels")
  --data.raw["spider-vehicle"]["companion"].burner.fuel_categories = { "chemical", "vehicle-fuel" }