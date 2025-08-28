for prototype_type_name, prototype_type in pairs(data.raw) do
  if prototype_type_name ~= "tree" then
    for _, prototype in pairs(prototype_type) do
      if prototype.minable and type(prototype.minable) == "table" then
        prototype.minable.mining_time = 0.01
      elseif prototype.minable == true then
        prototype.minable = { mining_time = 0.01 }
      end
    end
  end
end