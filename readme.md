Here's the updated README with the additional instructions for adding the images and item registration:

---

# Usable Minimap and Compass for RedM (RSG Framework)

## Description
This mod converts the minimap and compass into usable in-game items. Players can equip or unequip the items from their inventory to toggle their visibility, enhancing immersion and realism. When equipped, the minimap and compass function as usual, offering navigational assistance.

## Features
- Minimap and compass are now items that can be toggled on/off.
- Adds a new layer of realism by allowing players to choose when to display the UI elements.
- Seamless integration with the RedM framework.

## Requirements
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

## RSG HUD Configuration
If you're using the **RSG HUD** mod, you'll need to disable specific settings in its `config.lua` file to avoid conflicts:

```lua
Config.OnFootMinimap = false -- set to true/false to disable/enable minimap when on foot
Config.OnFootCompass = false -- true = have the minimap set to a compass instead of off or normal minimap
Config.MountMinimap = false  -- set to false if you want to disable the minimap when on mount
Config.MountCompass  = false -- set to true if you want to have a compass instead of normal minimap while on a mount
```

## Usage
- Equip the compass or minimap from your inventory to toggle their visibility.
- Unequip to hide the minimap or compass from the screen.

## License
This project is licensed under the MIT License.

---

Let me know if you'd like further tweaks!