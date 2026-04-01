while true do
    print("Digite um email:")
    local email = io.read()
    email = email:gsub("^%s*(.-)%s*$", "%1")
    email = email:lower()
    local valido = true
    local usuario= ""
    local dominio= ""
    if email:find("@", 1, true) then
        usuario, dominio = email:match("([^@]+)@([^@]+)")
    else
        print("Email invalido, sem @")
        valido = false
    end
    print("Valido: " .. tostring(valido))
    print ("Usuario: " .. usuario)
    print("Dominio: " .. dominio)
    print ("Email: " .. email)

end