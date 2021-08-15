local module = {}

--{ Copie une variable
function copier(obj)
    local copie
    --> Cas d'une table : on redirique 
    if type(obj) == 'table' then error("argument #1 table fournie, pour ce type utiliser tablePlus !", 2)
    --> Autres types de variables : number, string boolean etc.
    else copie = obj end

    --> Retour
    return copie
end
module["copier"] = copier
module["copy"] = copier
module["cp"] = copier


return module