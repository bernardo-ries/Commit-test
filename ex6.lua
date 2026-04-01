-- Tabela
local usuarios = {}



-- Funções

function validar(nome, idade)
    if #nome < 4 then
        return false, "Nome deve conter pelo menos 4 caracteres"
    end
    if idade <= 18 then
        return false, "Idade deve ser maior que 18 anos"
    end
    return true
end

function adicionar_usuario(nome, idade)
    local valido, erro = validar(nome,idade)
    if valido then
        table.insert(usuarios, {nome = nome, idade = idade})
        print("Usuario adicionado com sucesso!")
    else
        print("Falha ao adicionar usuario: " .. erro)
    end
end

function listar_usuarios()
    print("Lista de usuarios: ")
    for i=1, #usuarios do
        print(i .. " - Nome: " .. usuarios[i].nome .. " - Idade: " .. usuarios[i].idade)
    end
end

function remover_usuario(indice)
    if indice >= 1 and indice <= #usuarios then
        table.remove(usuarios, indice)
        print("Usuario removido com sucesso!")
    else
        print("Indice invalido")
    end
end


-- Teste:

adicionar_usuario("Claudio", 53)
adicionar_usuario("Carlos", 30)
adicionar_usuario("Luana", 22)
adicionar_usuario("Joao", 17)
adicionar_usuario("Ana", 25)
adicionar_usuario("Andre", 18)

listar_usuarios()

remover_usuario(2)
remover_usuario(5)

listar_usuarios()
