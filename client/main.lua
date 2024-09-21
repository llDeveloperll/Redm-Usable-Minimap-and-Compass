local showMinimap = false
local showCompass = false
local player = PlayerPedId();

CreateThread(function()
    while true do
        Wait(0.01*1000)

        local interiorId = GetInteriorFromEntity(player)
        local isMounted = IsPedOnMount(player) or IsPedInAnyVehicle(player)
        
        if isMounted then
            if showMinimap then
                if showCompass then
                    SetMinimapType(3)
                else
                    SetMinimapType(1)
                end
            else
                SetMinimapType(0)
            end
        else
            if showMinimap then
                SetMinimapType(1)
                -- interior zoom
                if interiorId ~= 0 then
                    -- ped entered an interior
                    SetRadarConfigType(0xDF5DB58C, 0) -- zoom in the map by 10x
                else
                    -- ped left an interior
                    SetRadarConfigType(0x25B517BF, 0) -- zoom in the map by 0x (return the minimap back to normal)
                end
            else
                if showCompass then
                    SetMinimapType(3)
                else
                    SetMinimapType(0)
                end
            end
        end
    end
end)


RegisterNetEvent('vl:client:handleMinimap', function(item)
    if item == "minimap" then
        showMinimap = not showMinimap
    elseif item == "compass" then
        showCompass = not showCompass
    end
end)
