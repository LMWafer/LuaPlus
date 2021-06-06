local module = {}

function Contains(chaine, sousChaine)
 local estPresent = false
 if string.match(chaine, sousChaine) ~= nil then 
  estPresent = true
 end
 return estPresent
end
module["Contains"] = Contains

return module

--[[
--Iterate trough string
for i = 1, #s do
    local c = s.sub(i,i)
    --stuff
end
]]--