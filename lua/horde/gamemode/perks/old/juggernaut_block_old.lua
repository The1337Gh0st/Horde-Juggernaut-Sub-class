PERK.PrintName = "Heavy Armor"
PERK.Description =
[[+10 damage block.]]
PERK.Icon = "materials/perks/samurai/resolution.png"
PERK.Hooks = {}

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_block") then return end
    bonus.block = bonus.block + 10
end