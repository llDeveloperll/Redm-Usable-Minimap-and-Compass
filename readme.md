

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
- **Note**: If you're using the **RSG HUD** mod, follow the instructions below to prevent conflicts.

## Installation
1. Download the mod files from the repository.
2. Place the mod folder into your RedM resources directory.
3. Add the mod to your `server.cfg`:
   ```bash
   ensure usable_minimap_compass
   ```
4. Restart your server.

## RSG HUD Configuration
If you are using the **RSG HUD** mod, you'll need to disable certain settings in its `config.lua` file to avoid conflicts with this mod. The **RSG HUD** modifies the minimap and compass, which may overwrite the functionality of this script.

Open the `config.lua` file of **RSG HUD** and set the following options as shown:

```lua
Config.OnFootMinimap = false -- set to true/false to disable/enable minimap when on foot
Config.OnFootCompass = false -- true = have the minimap set to a compass instead of off or normal minimap
Config.MounttMinimap = false  -- set to false if you want to disable the minimap when on mount
Config.MountCompass  = false -- set to true if you want to have a compass instead of normal minimap while on a mount
```

This ensures that **RSG HUD** doesn't interfere with the minimap and compass toggling mechanics of this mod.

## Usage
- To use the minimap or compass, open your inventory and equip the respective item.
- Unequipping the item will hide the minimap or compass from the screen.

## License
This project is licensed under the MIT License.
