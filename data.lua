-- Fix character mining and deconstruction speeds
local character = data.raw.character and data.raw.character.character

if character then
  character.mining_speed = 9999
  character.deconstruction_speed_modifier = 9999
end

-- Universal function: applies to every entity in data.raw
-- Added safety checks to prevent errors
for entity_type_name, entity_type in pairs(data.raw) do
  if type(entity_type) == "table" then
    for entity_name, entity in pairs(entity_type) do
      if type(entity) == "table" and entity.minable then
        if type(entity.minable) == "table" and entity.minable.mining_time then
          -- Ensure mining_time is a valid number and set minimum time
          if type(entity.minable.mining_time) == "number" and entity.minable.mining_time > 0 then
            entity.minable.mining_time = 0.0001
          end
        end
      end
    end
  end
end