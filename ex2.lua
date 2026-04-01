local vida = 100
local defesa = 15
local personagemVivo = true
local critico = false
math.randomseed(os.time())

for i= 1,5 do
    local dano = math.random(10,30)
    if dano > 20 then
        critico = true
    else
        critico = false
    end
    dano = dano - defesa
    if dano < 0 then
        dano = 0
    end
    vida = vida - dano
    if critico then
        if vida > 0 then
            print("Dano critico! Vida restante: " .. vida)
        else
            print("Dano critico! Vida restante: 0")
        end

    else
        if vida > 0 then
            print("Dano normal. Vida restante: " .. vida)
        else
            print("Dano normal. Vida restante: 0")
        end
    end

    if  vida <=0 then
        print("Personagem morreu")
        personagemVivo = false
        break
    end

end
if personagemVivo then
    print("Personagem sobreviveu!")
end