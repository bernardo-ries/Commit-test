local lista ={1,2,3,4,5}
print("Valor na lista na posicao 1: ", lista[1])
print("Valor na lista na posicao 5: ", lista[5])

lista[2] = 20
lista[4] = 40

table.insert(lista,23)

for i=1, #lista do
    print("Valor na lista na posicao " .. i .. ": ", lista[i])
end

variavel = 103
table.insert(lista, variavel)
print("Valor da variavel: ", variavel)
print("Valor da variavel na lista: ", lista [#lista])
variavel = 200
print("Valor da variavel apos a troca: ",variavel)
print("Valor da variavel na lista apos a troca de valor da variavel: ", lista [#lista])