-- Function to spawn a ped at a specific location
function SpawnPed(model, pos, heading)
    local pedModel = GetHashKey("A_C_Buffalo_Tatanka_01")

    Citizen.CreateThread(function()
        RequestModel(pedModel)
        while not HasModelLoaded(pedModel) do
            Wait(500)
        end

        local ped = CreatePed(1, pedModel, pos.x, pos.y, pos.z, heading, false, true)
        Config.AddSpawnedPed(ped)

        print("Ped spawned:", ped)
    end)
end

RegisterCommand("spawnped", function(source, args, rawCommand)
    local model = args[1]
    local x, y, z = tonumber(args[2]), tonumber(args[3]), tonumber(args[4])
    local heading = tonumber(args[5]) or 0.0
    local pos = vector3(-5258.53, -2484.13, -8.67)
    
    SpawnPed(model, pos, heading)
end)
