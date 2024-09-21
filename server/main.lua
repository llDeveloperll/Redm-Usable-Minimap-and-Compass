local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem('minimap', function(source)
    local src = source
    TriggerClientEvent('vl:client:handleMinimap', src, 'minimap')
end)

RSGCore.Functions.CreateUseableItem('compass', function(source)
    local src = source
    TriggerClientEvent('vl:client:handleMinimap', src, 'compass')
end)