Config = {}
spawnedPeds = {} 

-- Default spawn position for peds
Config.defaultSpawnPosition = vector3(-5258.53, -2484.13, -8.67)

-- Default heading for spawned peds
Config.defaultHeading = 0.0

-- Model of the ped to spawn
Config.pedModel = 'A_C_Buffalo_Tatanka_01'

-- Delay for the cleanup loop in milliseconds
Config.cleanupDelay = 5000

-- Function to get the spawned peds table
function Config.GetSpawnedPeds()
    return spawnedPeds
end

-- Function to add a spawned ped to the table
function Config.AddSpawnedPed(ped)
    table.insert(spawnedPeds, ped)
end
