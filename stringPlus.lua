local module = {}

--{ Vérifie si le string contient un sous-string
function contient(chaine, sousChaine)
 local estPresent = false
 if string.match(chaine, sousChaine) ~= nil then 
  estPresent = true
 end
 return estPresent
end
module["contient"] = contient


--{ Retourne un pourcentage du string
function pourcentage()
end


return module

--[[
--Itérer à travers un string
for i = 1, #s do
    local c = s.sub(i,i)
    --stuff
end
]]--