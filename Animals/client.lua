local spawnPosition = Config.defaultSpawnPosition
local heading = Config.defaultHeading
local pedModel = Config.pedModel
local cleanupDelay = Config.cleanupDelay


function SpawnPedAtLocation(model, pos, heading)
    local pedModel = GetHashKey("a_c_buffalo_tatanka_01")

    Citizen.CreateThread(function()
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(500)
        end

        local ped = CreatePed(pedModel, pos.x, pos.y, pos.z, heading, false, true)
        Config.AddSpawnedPed(ped)

        print("Ped spawned:", ped)

        Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- SetRandomOutfitVariation
        SetEntityVisible(ped, true) -- visible

    end)
end

-- Example usage: spawn a ped at a specific location
SpawnPedAtLocation(pedModel, spawnPosition, heading)

-- Clean up spawned peds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(cleanupDelay)
        local spawnedPeds = Config.GetSpawnedPeds()
        for i = #spawnedPeds, 1, -1 do
            if not DoesEntityExist(spawnedPeds[i]) then
                table.remove(spawnedPeds, i)
            end
        end
    end
end)
