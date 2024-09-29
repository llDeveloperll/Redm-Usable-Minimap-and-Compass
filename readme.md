# Usable Minimap and Compass for RedM (RSG Framework)

## Description
This mod converts the minimap and compass into usable in-game items. Players can equip or unequip the items from their inventory to toggle their visibility, enhancing immersion and realism. When equipped, the minimap and compass function as usual, offering navigational assistance.

## Features
- Minimap and compass are now items that can be toggled on/off.
- Adds a new layer of realism by allowing players to choose when to display the UI elements.
- Seamless integration with the RedM framework.

## Requirements
- RedM
- RSG Framework
- RSG HUD (with configuration adjustments, see below)
- RSG Inventory
- RSG Core

## Installation
1. Download the mod files from the repository.
2. Place the mod folder into your RedM resources directory.
3. Add the mod to your `server.cfg`:
   ```bash
   ensure usable_minimap_compass
   ```
4. Restart your server.

## Additional Installation Steps
1. **Images for Inventory**  
   In the `installation` folder, you will find two images (`compass.png` and `minimap.png`).  
   - Copy these images and paste them into the `rsg-inventory > html > images` directory.  
   These icons will appear in the player’s inventory when they possess the items.

2. **Registering the Items in RSG Core**  
   In the `installation` folder, there is a file called `items_shared.txt` with the following item registration lines:
   
   ```lua
   ['compass'] = {['name'] = 'compass', ['label'] = 'Compass', ['weight'] = 100, ['type'] = 'item', ['image'] = 'compass.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A handy compass for navigation.'},
   ['minimap'] = {['name'] = 'minimap', ['label'] = 'Minimap', ['weight'] = 100, ['type'] = 'item', ['image'] = 'minimap.png', ['unique'] = true, ['useable'] = true, ['shouldClose'] = true, ['combinable'] = nil, ['level'] = 0, ['description'] = 'A useful minimap for quick navigation.'},
   ```

   - Add these lines to the `rsg-core > shared > items.lua` file to register the compass and minimap items in the framework.

3. **RSG HUD Configuration (Prevent Flickering)**  
   To prevent flickering issues when using a custom minimap or compass, you need to add a couple of modifications to **RSG HUD**.

   - In the file `rsg-hud > config.lua`, add the following line near line 32:
     ```lua
     Config.UsingCustomMinimapCompass  = true -- set to true if you have a custom minimap or compass
     ```

   - In the file `rsg-hud > client > client.lua`, around line 260, modify the following function to avoid the minimap flickering:

     ```lua
     if not Config.UsingCustomMinimapCompass then
         CreateThread(function()
             while true do
                 Wait(500)
                 local interiorId = GetInteriorFromEntity(cache.ped)
                 local isMounted = IsPedOnMount(cache.ped) or IsPedInAnyVehicle(cache.ped)
                 local IsBirdPostApproaching = exports['rsg-telegram']:IsBirdPostApproaching()

                 if isMounted or IsBirdPostApproaching then
                     if Config.MounttMinimap and showUI then
                         if Config.MountCompass then
                             SetMinimapType(3)
                         else
                             SetMinimapType(1)
                         end
                     else
                         SetMinimapType(0)
                     end
                 else
                     if Config.OnFootMinimap and showUI then
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
                         if Config.OnFootCompass and showUI then
                             SetMinimapType(3)
                         else
                             SetMinimapType(0)
                         end
                     end
                 end
             end
         end)
     end
     ```

   This ensures that the minimap and compass functionality is not overwritten by the **RSG HUD** and avoids flickering when toggling the minimap or compass as items.

## Usage
- Equip the compass or minimap from your inventory to toggle their visibility.
- Unequip to hide the minimap or compass from the screen.

## License
This project is licensed under the MIT License.
