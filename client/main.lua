
PetSystem.Init()

CreateThread(function()
    while true do
        Wait(0)

        local coords = GetEntityCoords(PlayerPedId())
        DrawText2D(
            ("X: %.2f  Y: %.2f  Z: %.2f"):format(coords.x, coords.y, coords.z),
            0.01, 0.01
        )
    end
end)

function DrawText2D(text, x, y)
    SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextOutline()
    BeginTextCommandDisplayText("STRING")
    AddTextComponentString(text)
    EndTextCommandDisplayText(x, y)
end