local module = {}

--{ Retourne true + clé de la première occurence d'object si tab contient object en tant que clé ou valeur (à indiquer en paramètre)
function contient(tab, objet, cle_)
    cle_ = cle_ or false
    if type(tab) ~= "table" then error("table attendue, type fournit : " .. type(tab), 2) end
    
    local retour = false, nil
    for cle, val in pairs(tab) do
        if (cle_ and cle == objet) or (not cle_ and val == objet) then retour = true, cle
    end
    return retour
end
module["contient"] = contient
module["contain"] = contient


--{ Retourne l'index de la première occurence d'objet si tab contient object
function indice(tab, objet)
    if type(tab) ~= "table" then error("table expected, type fournit : " .. type(tab), 2) end

    retour = nil
    for cle, val in pairs(tab) do
        if val == objet then
            retour = cle
        end
    end
    return retour
end
module["indice"] = indice
module["index"] = indice


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
module["copy"] = copier


--{ Donne la longeur d'une table, remplace #<table> lorsque les clés ne sont pas des entiers
function longeur(tab)
    local longeur = 0
    for _ in pairs(tab) do longeur = longeur + 1 end
    return longeur
end
module["longeur"] = longeur
module["length"] = longeur

return module