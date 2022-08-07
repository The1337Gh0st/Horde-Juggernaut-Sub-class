PERK.PrintName = "Shockproof"
PERK.Description = "{1} damage resist to non-melee damage. \nRegen {2} max health per second. \nImmunity to poison damage, necrosis, and bleeding."
PERK.Icon = "materials/perks/ballistic_shock.png"
PERK.Hooks = {}
PERK.Params = {
    [1] = {value = 0.5, percent = true},
	[2] = {value = 0.02, percent = true}
}


PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_shockproof")  then return end
    if HORDE:IsFireDamage(dmginfo) then
        bonus.resistance = bonus.resistance + 0.5
    end
	if HORDE:IsBlastDamage(dmginfo) then
       bonus.resistance = bonus.resistance + 0.5
    end
	if HORDE:IsColdDamage(dmginfo) then
       bonus.resistance = bonus.resistance + 0.5
    end
	if HORDE:IsLightningDamage(dmginfo) then
       bonus.resistance = bonus.resistance + 0.5
    end
	if HORDE:IsPoisonDamage(dmginfo) then
       bonus.resistance = bonus.resistance + 1
    end
end

PERK.Hooks.Horde_OnPlayerDebuffApply = function (ply, debuff, bonus)
    if ply:Horde_GetPerk("juggernaut_shockproof") and debuff == HORDE.Status_Bleeding then
        bonus.apply = 0
        return true
    end
	if ply:Horde_GetPerk("juggernaut_shockproof") and debuff == HORDE.Status_Necrosis then
        bonus.apply = 0
        return true
    end
	if ply:Horde_GetPerk("juggernaut_shockproof") and debuff == HORDE.Status_Break then
        bonus.apply = 0
        return true
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