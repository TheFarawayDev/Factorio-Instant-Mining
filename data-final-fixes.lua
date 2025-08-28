local instant_miners = settings.startup["instant-mining-miners"].value

-- Make everything except miners and trees instant
for prototype_type_name, prototype_type in pairs(data.raw) do
  if prototype_type_name ~= "tree" and prototype_type_name ~= "mining-drill" and prototype_type_name ~= "burner-mining-drill" and prototype_type_name ~= "electric-mining-drill" then
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
  local miner_types = {"mining-drill", "burner-mining-drill", "electric-mining-drill"}
  for _, miner_type in ipairs(miner_types) do
    if data.raw[miner_type] then
      for _, prototype in pairs(data.raw[miner_type]) do
        if prototype.minable and type(prototype.minable) == "table" then
          prototype.minable.mining_time = 0.001
        elseif prototype.minable == true then
          prototype.minable = { mining_time = 0.001 }
        end
      end
    end
  end
end