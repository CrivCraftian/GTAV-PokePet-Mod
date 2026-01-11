
local activeBlips = {}
local activeRadius = {}

RegisterNetEvent("PetEvent:Start")
AddEventHandler("PetEvent:Start", function(event)
    print("Event Recieved")

    local blip = AddBlipForCoord(event.coords.x, event.coords.y, event.coords.z)
    SetBlipSprite(blip, 442)
    SetBlipColour(blip, 0)
    SetBlipScale(blip, 0.8)
    SetBlipAsShortRange(blip, false)

    local radiusBlip = AddBlipForRadius(event.coords.x, event.coords.y, event.coords.z, event.radius)
    SetBlipColour(radiusBlip, 2)
    SetBlipAlpha(radiusBlip, 128)
    SetBlipAsShortRange(radiusBlip, false)

    SetBlipDisplay(radiusBlip, 4)
    
    table.insert(activeBlips, blip)
    table.insert(activeRadius, radiusBlip)
end)

RegisterNetEvent("PetEvent:End")
AddEventHandler("PetEvent:End", function(event)
    for _, blip in ipairs(activeBlips) do
        if DoesBlipExist(blip) then RemoveBlip(blip) end
    end
    for _, blip in ipairs(activeRadius) do
        if DoesBlipExist(blip) then RemoveBlip(blip) end
    end
    activeBlips = {}
    activeRadius = {}
end)