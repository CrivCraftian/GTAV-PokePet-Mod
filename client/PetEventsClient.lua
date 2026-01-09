
local activeBlips = {}

RegisterNetEvent("PetEvent:Start")
AddEventHandler("PetEvent:Start", function(event)
    print("Event Recieved")

    local blip = AddBlipForCoord(event.coords.x, event.coords.y, event.coords.z)
    SetBlipSprite(blip, 442) -- dog paw
    SetBlipColour(blip, 2)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, false)
    table.insert(activeBlips, blip)
end)

RegisterNetEvent("PetEvent:End")
AddEventHandler("PetEvent:End", function(event)
    for _, blip in ipairs(activeBlips) do
        if DoesBlipExist(blip) then RemoveBlip(blip) end
    end
    activeBlips = {}
end)