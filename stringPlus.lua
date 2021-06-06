local module = {}

function contient(chaine, sousChaine)
 local estPresent = false
 if string.match(chaine, sousChaine) ~= nil then 
  estPresent = true
 end
 return estPresent
end
module["contient"] = contient


return module

--[[
--Itérer à travers un string
for i = 1, #s do
    local c = s.sub(i,i)
    --stuff
end
]]--