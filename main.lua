local tp = require("luaPlus")

t = {1, 2, 3, 4, {5, 6, 7}}
a = tp.copier(t)

table.remove(t, 1)
print(table.unpack(t))
print(table.unpack(t[4]))
print(table.unpack(a))
print(table.unpack(a[5]))
print()

table.remove(a, 3)
print(table.unpack(t))
print(table.unpack(t[4]))
print(table.unpack(a))
print(table.unpack(a[4]))
print()

table.remove(a[4], 1)
print(table.unpack(t))
print(table.unpack(t[4]))
print(table.unpack(a))
print(table.unpack(a[4]))