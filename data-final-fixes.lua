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

-- Make everything except miners and trees instant
for prototype_type_name, prototype_type in pairs(data.raw) do
  if prototype_type_name ~= "tree" and prototype_type_name ~= "mining-drill" then
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