local matriz = {
    {".",".","."},
    {".",".","."},
    {".",".","."}
}

local jogador = {
    nome = "Jogador 1",
    posicao_x = 2,
    posicao_y = 2
}
matriz[jogador.posicao_x][jogador.posicao_y] = "P"

while true do
    for i=1, #matriz do
        for j=1, #matriz[i] do
            io.write(matriz[i][j] .. " ")
        end
        print()
    end

    print("Digite a direção para mover (w/a/s/d): ")
    local direcao = io.read()

    matriz[jogador.posicao_x][jogador.posicao_y] = "."

    if direcao == "w" then
        jogador.posicao_x = math.max(1, jogador.posicao_x - 1)
    elseif direcao == "s" then
        jogador.posicao_x = math.min(#matriz, jogador.posicao_x + 1)
    elseif direcao == "a" then
        jogador.posicao_y = math.max(1, jogador.posicao_y - 1)
    elseif direcao == "d" then
        jogador.posicao_y = math.min(#matriz[1], jogador.posicao_y + 1)
    else
        print("Direção inválida! Use w/a/s/d.")
    end

    matriz[jogador.posicao_x][jogador.posicao_y] = "P"
end