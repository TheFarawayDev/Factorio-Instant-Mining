local instant_miners = settings.startup["instant-mining-miners"].value

-- Make everything except miners and trees instant
for prototype_type_name, prototype_type in pairs(data.raw) do
  if prototype_type_name ~= "tree" and prototype_type_name ~= "mining-drill" then
    for _, prototype in pairs(prototype_type) do
      if prototype.minable and type(prototype.minable) == "table" then
        prototype.minable.mining_time = 0.001
      elseif prototype.minable == true then
        prototype.minable = { mining_time = 0.001 }
      end
    end
  end
end

-- Make trees instant
for _, prototype in pairs(data.raw["tree"]) do
  if prototype.minable and type(prototype.minable) == "table" then
    prototype.minable.mining_time = 0.001
  end
end

-- Make miners instant if the setting is true
if instant_miners then
  if data.raw["mining-drill"] then
    for _, prototype in pairs(data.raw["mining-drill"]) do
      if prototype.minable and type(prototype.minable) == "table" then
        prototype.minable.mining_time = 0.001
      elseif prototype.minable == true then
        prototype.minable = { mining_time = 0.001 }
      end
    end
  end
end