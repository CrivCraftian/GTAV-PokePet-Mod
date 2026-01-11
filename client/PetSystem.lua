
PetSystem = {
    active = false,
    entity = nil,
    model = "a_c_chimp",
    following = false,
    currentPet = 0
}

function PetSystem.Init()
    PetSystem.active = false
    PetSystem.entity = nil
end

function PetSystem.Deploy()
    if PetSystem.active then return end
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    local spawnX = coords.x
    local spawnY = coords.y
    local spawnZ = coords.z

    local model = GetHashKey(PetSystem.model)

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(0)
    end

    local pet = CreatePed(
    28, 
    model,
    spawnX, 
    spawnY, 
    spawnZ,
    GetEntityHeading(playerPed),
    true,
    false
)

    PetSystem.entity = pet
    PetSystem.active = true
    PetSystem.startFollow()

    SetEntityAsMissionEntity(PetSystem.entity, true, true)
    SetBlockingOfNonTemporaryEvents(PetSystem.entity, true)
    SetPedCanRagdoll(PetSystem.entity, false)
    SetPedSuffersCriticalHits(PetSystem.entity, false)


    SetEntityInvincible(PetSystem.entity, true)
end

function PetSystem.startFollow()
    if not PetSystem.active or not DoesEntityExist(PetSystem.entity) then return end
    PetSystem.following = true

    CreateThread(function()
        while PetSystem.following do
            Wait(1000)

            if not PetSystem.active or not DoesEntityExist(PetSystem.entity) then
                PetSystem.following = false
                break
            end

            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local dogCoords = GetEntityCoords(PetSystem.entity)
            local distance = #(playerCoords - dogCoords)

            if distance > 10.0 then
                SetEntityCoords(PetSystem.entity, playerCoords.x - 1.0, playerCoords.y - 1.0, playerCoords.z, true, false, false, false)
            end

                if not IsPedInAnyVehicle(playerPed, false) then
                    TaskFollowToOffsetOfEntity(
                        PetSystem.entity,
                        playerPed,
                        0.0, -1.5, 0.0,
                        2.0,
                        -1,
                        2.0,
                        true
                    )
                end
            end
        end)
end

function PetSystem.stopFollow()
    PetSystem.following = false
end

function PetSystem.Recall()
    if not PetSystem.active then return end
    DeleteEntity(PetSystem.entity)

    PetSystem.active = false
    PetSystem.entity = nil
end

function PetSystem.Swap()
    if not PetSystem.active then return end
    PetSystem.Recall()
    local i = PetSystem.currentPet
    PetSystem.currentPet = (i + 1) % 3
    if i == 0 then
        PetSystem.model = "a_c_chimp"
    elseif i == 1 then
        PetSystem.model = "a_c_coyote"
    else
        PetSystem.model = "a_c_mtlion"
    end
    --PetSystem.model = PetSystem.petList[i]
    print(PetSystem.model)
    print(PetSystem.currentPet)
    PetSystem.Deploy()
end