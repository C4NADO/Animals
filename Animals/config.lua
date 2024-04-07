Config = {}

-- Default spawn position for peds
Config.defaultSpawnPosition = vector3(1006.76, 693.63, 111.27)

-- Default heading for spawned peds
Config.defaultHeading = 0.0

-- Model of the ped to spawn
Config.pedModel = "a_c_buffalo_tatanka_01"

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
