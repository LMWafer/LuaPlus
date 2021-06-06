local module = {}

--Retourne true + index de la première occurence d'object si tab contient object
function Contains(tab, object)
 if type(tab) ~= "table" then error("table expected, got " .. type(tab), 2) end
 
 for index, value in pairs(tab) do
  if value == object then
   return true, index
  end
 end
 return false, -1
end
module["Contains"]=Contains

--Retourne l'index de la première occurence d'objet si tab contient object
function Index(tab, object)
 if type(tab) ~= "table" then error("table expected, got " .. type(tab), 2) end

 for index, value in pairs(tab) do
  if value == object then
   return index
  end
 end
 return -1
end
module["Index"]=Index

return module