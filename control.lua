local character = data.raw.character.character

if character then
  character.mining_speed = 9999
  character.deconstruction_speed_modifier = 9999
end

-- Universal function: applies to every entity in data.raw
for _, entity_type in pairs(data.raw) do
  for _, entity in pairs(entity_type) do
    if entity.minable and entity.minable.mining_time then
      entity.minable.mining_time = 0.0001
    end
  end
end
