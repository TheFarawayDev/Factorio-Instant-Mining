local instant_miners = settings.startup["instant-mining-miners"].value

-- Helper function to make an entity instantly minable
local function make_instant_minable(prototype)
  if prototype.minable then
    if type(prototype.minable) == "table" then
      prototype.minable.mining_time = 0.001
    elseif prototype.minable == true then
      prototype.minable = { 
        mining_time = 0.001,
        result = prototype.name -- Ensure it drops itself
      }
    end
  end
end

-- Make everything except trees instant for players
-- This includes resources (ore patches) and other entities
for prototype_type_name, prototype_type in pairs(data.raw) do
  if prototype_type_name ~= "tree" then
    for _, prototype in pairs(prototype_type) do
      make_instant_minable(prototype)
    end
  end
end

-- Make trees instant (they often have special minable properties)
if data.raw["tree"] then
  for _, prototype in pairs(data.raw["tree"]) do
    make_instant_minable(prototype)
  end
end

-- If instant_miners is DISABLED, revert resource mining times to normal
-- so that mining drills will mine at normal speed
if not instant_miners then
  -- Restore normal mining times for resources that mining drills extract
  local resource_types = {"resource", "fish"} -- Add other resource types if needed
  
  for _, resource_type in pairs(resource_types) do
    if data.raw[resource_type] then
      for _, prototype in pairs(data.raw[resource_type]) do
        if prototype.minable and type(prototype.minable) == "table" then
          -- Restore a reasonable mining time for machines
          -- You can adjust this value based on your preferences
          prototype.minable.mining_time = 1 -- 1 second default, adjust as needed
        end
      end
    end
  end
end