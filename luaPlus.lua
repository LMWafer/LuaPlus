local module = {}

function copier(obj, prof)
    prof = prof or false
    local typ = type(obj)
    local copie
    
    --[] Cas d'une table sans copie profonde : si une des valeurs est une table elle ne sera pas copiée mais directement utilisée
    if typ == 'table' and not prof then
        copie = {}
        for cle, val in pairs(obj) do
            copie[cle] = val
        end
    
    --[] Cas d'une table avec copie profonde : si une des valeurs est une table elle sera elle-même copiée par copie profonde
    elseif typ == 'table' and prof then
        copie = {}
        for cle, val in pairs(obj) do
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

    --[] Autres types de variables : number, string boolean etc.
    else
        copie = obj
    end

    return copie
end
module["copier"] = copier


return module