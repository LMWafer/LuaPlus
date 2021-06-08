local module = {}

--{ Retourne true + index de la première occurence d'object si tab contient object
function contient(tab, objet)
    if type(tab) ~= "table" then error("table attendue, type fournit : " .. type(tab), 2) end
 
    for index, value in pairs(tab) do
        if value == objet then
            return true, index
        end
    end
    return false, -1
end
module["contient"] = contient

--{ Retourne l'index de la première occurence d'objet si tab contient object
function indice(tab, objet)
    if type(tab) ~= "table" then error("table expected, type fournit : " .. type(tab), 2) end

    for index, value in pairs(tab) do
        if value == objet then
            return index
        end
    end
    return -1
end
module["indice"] = indice


--{ Copie une table
function copier(tab, prof)
    prof = prof or false
    local copie = {}
    
    --[] Cas d'une table sans copie profonde : si une des valeurs est une table elle ne sera pas copiée mais directement utilisée
    if not prof then
        for cle, val in pairs(tab) do
            copie[cle] = val
        end
    
    --[] Cas d'une table avec copie profonde : si une des valeurs est une table elle sera elle-même copiée par copie profonde
    else
        for cle, val in pairs(tab) do
            --> Si on tombe sur une sous-table ..
            if type(val) == 'table' then
                --> .. on la copie profondément
                copie[cle] = copier(val, true)
            --> Si on tombe sur un autre type de variable.. 
            else
                --> .. on la copie classiquement
                copie[cle] = val
            end
        end
    end

    --> Retour
    return copie
end
module["copier"] = copier

return module