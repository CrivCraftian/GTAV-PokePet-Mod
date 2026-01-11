
RegisterCommand("pet_deploy", function()
    PetSystem.Deploy()
end, false)

RegisterCommand("pet_recall", function()
    PetSystem.Recall()
end, false)

RegisterCommand("pet_startfollow", function()
    PetSystem.startFollow()
end, false)

RegisterCommand("pet_stopfollow", function()
    PetSystem.stopFollow()
end, false)

RegisterCommand("testblip", function()
    local coords = GetEntityCoords(PlayerPedId())
    local blip = AddBlipForRadius(coords.x, coords.y, coords.z, 20.0)
    SetBlipColour(blip, 2)
    SetBlipAlpha(blip, 128)
end, false)

RegisterCommand("pet_swap", function()
    PetSystem.Swap()
end, false)

RegisterKeyMapping('pet_deploy', 'Deploy Pet', 'keyboard', 'o')
RegisterKeyMapping('pet_recall', 'Recall Pet', 'keyboard', 'k')
RegisterKeyMapping('pet_swap', 'Swap Pet', 'keyboard', 'm')