PERK.PrintName = "Shockproof"
PERK.Description = "75% damage resist to non-melee damage. \nRegen {1} max health per second."
PERK.Icon = "materials/perks/ballistic_shock.png"
PERK.Hooks = {}
PERK.Params = {
    [1] = {value = 0.02, percent = true},
}

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_shockproof") then return end
    if dmginfo:GetDamageType() == DMG_BLAST then
        bonus.resistance = bonus.resistance + 0.75
    end
	if dmginfo:GetDamageType() == DMG_BALLISTIC then
        bonus.resistance = bonus.resistance + 0.75
    end
	if dmginfo:GetDamageType() == DMG_FIRE then
        bonus.resistance = bonus.resistance + 0.75
    end
	if dmginfo:GetDamageType() == DMG_COLD then
        bonus.resistance = bonus.resistance + 0.75
    end
	if dmginfo:GetDamageType() == DMG_LIGHTNING then
        bonus.resistance = bonus.resistance + 0.75
    end
	if dmginfo:GetDamageType() == DMG_POISON then
        bonus.resistance = bonus.resistance + 0.75
    end
end

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_shockproof" then
        ply:Horde_SetHealthRegenEnabled(true)
        ply:Horde_SetHealthRegenPercentage(0.02)
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_shockproof" then
        ply:Horde_SetHealthRegenEnabled(nil)
    end
end