local module = {}


function indexCle(tab, objet, mult)
    if mult == nil then mult = true end
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if objet == nil then error("argument #2 variable attendue, nil fournit", 2) end
    if type(mult) ~= "boolean" then error("argument #3 boolean attendue, " .. type(mult) .. " fournit ", 2) end

    --> Variable de boucle : la liste des valeurs
    local valeurs = {}
    --> Pour chaque clé et valeur dans <tab> ..
    for cle, val in pairs(tab) do
        --> .. si la clé coïncide avec <objet> .. ..
        if cle == objet then
            --> .. .. ajouer la valeur à la liste .. ..
            table.insert(valeurs, val)
            --> .. .. et casser la boucle si on ne veut que la première occurence
            if not mult then break end
        end
    end

    --> Retour
    return valeurs
end
module["xk"] = indexCle
module["indexCle"] = indexCle
module["indexKey"] = indexCle


function indexVal(tab, objet, mult)
    if mult == nil then mult = true end
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if objet == nil then error("argument #2 variable attendue, nil fournit", 2) end
    if type(mult) ~= "boolean" then error("argument #3 boolean attendue, " .. type(mult) .. " fournit ", 2) end

    --> Variable de boucle : la liste des clés
    local cles = {}
    --> Pour chaque clé et valeur dans <tab> ..
    for cle, val in pairs(tab) do
        --> .. si la valeur coïncide avec <objet> .. ..
        if val == objet then
            --> .. .. ajouer la cle à la liste .. ..
            table.insert(cles, cle)
            --> .. .. et casser la boucle si on ne veut que la première occurence
            if not mult then break end
        end
    end

    --> Retour
    return cles
end
module["xv"] = indexVal
module["indexVal"] = indexVal


--{ Indique si <tab> contient <objet> en tant que clé
function contientCle(tab, objet)
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if objet == nil then error("argument #2 variable attendue, nil fournit", 2) end
    
    local retour = false
    for cle, val in pairs(tab) do
        if cle == objet then retour = true; break end
    end

    --> Retour
    return retour
end
module["hk"] = contient
module["contientCle"] = contient
module["containKey"] = contient
module["hasKey"] = contient


--{ Indique si <tab> contient <objet> en tant que valeur
function contientVal(tab, objet)
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if objet == nil then error("argument #2 variable attendue, nil fournit", 2) end
    
    local retour = false
    for cle, val in pairs(tab) do
        if val == objet then retour = true; break end
    end

    --> Retour
    return retour
end
module["hv"] = contient
module["contientVal"] = contient
module["containVal"] = contient
module["hasVal"] = contient


--{ Copie une table
function copier(tab, prof)
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if type(prof) ~= "boolean" then error("argument #2 boolean attendu, " .. type(prof) .. " fournit ", 2) end

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
module["cp"] = copier


--{ Donne la longeur d'une table, remplace #<table> lorsque les clés ne sont pas des entiers
function longeur(tab)
    if type(tab) ~= "table" then error("table attendue, type fournit : " .. type(tab), 2) end

    local longeur = 0
    for _ in pairs(tab) do longeur = longeur + 1 end
    
    --> Retour
    return longeur
end
module["longeur"] = longeur
module["length"] = longeur
module["len"] = longeur


--{ Affiche le contenu de <tab>
function afficher(tab, read)
    if read == nil then read = false end
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if type(read) ~= "boolean" then error("argument #2 boolean attendu, " .. type(read) .. " fournit ", 2) end

    if read then term = require("term") end
    for k, v in pairs(tab) do 
        print(k, v, "\n")
        if read then term.read() end
    end
end
module["ls"] = afficher
module["aff"] = afficher
module["afficher"] = afficher
module["print"] = afficher


--{ Affiche les clés de <tab>
function afficherCles(tab, read)
    if read == nil then read = false end
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if type(read) ~= "boolean" then error("argument #2 boolean attendu, " .. type(read) .. " fournit ", 2) end

    if read then term = require("term") end
    for cle, val in pairs(tab) do 
        print(cle, "\n")
        if read then term.read() end
    end
end
module["keys"] = afficherCles
module["cles"] = afficherCles


--{ Affiche les valeurs de <tab>
function afficherVal(tab, read)
    if read == nil then read = false end
    if type(tab) ~= "table" then error("argument #1 table attendue, " .. type(tab) .. " fournit ", 2) end
    if type(read) ~= "boolean" then error("argument #2 boolean attendu, " .. type(read) .. " fournit ", 2) end

    if read then term = require("term") end
    for cle, val in pairs(tab) do 
        print(val, "\n")
        if read then term.read() end
    end
end
module["vals"] = afficherVal
module["valeurs"] = afficherVal
module["values"] = afficherVal


function estEgale(tab, prof)
end


return module