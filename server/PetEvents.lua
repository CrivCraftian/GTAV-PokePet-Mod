
PetEventController = {

}

function PetEventController.init()
    print("[PetEventClient] Client script loaded")
    CreateThread(function()
        while true do
            Wait(1000)

            local players = GetPlayers()
            if #players > 0 then
                local event = PetEvents[math.random(#PetEvents)]

                TriggerClientEvent("PetEvent:Start", -1, event)
                print("[PetEvent] Triggering event at", event.coords.x, event.coords.y, event.coords.z)
                Wait(event.duration)

                TriggerClientEvent("PetEvent:End", -1, event)
            else
                Wait(10000)
            end
        end
    end)
end
