PERK.PrintName = "Heavy Armor"
PERK.Description = "Max health and max armor is set to 150. \n+10 damage block. \n{1} extra physical damage resist."
PERK.Icon = "materials/perks/liquid_armor.png"
PERK.Hooks = {}
PERK.Params = {
    [1] = {value = 0.25, percent = true},
}

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_tank" then
        ply:SetMaxHealth(150)
        ply:SetHealth(ply:GetMaxHealth())
		ply:SetMaxArmor(150)
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_tank" then
        ply:SetMaxHealth(100)
        ply:SetHealth(ply:GetMaxHealth())
		ply:SetMaxArmor(100)
		if ply:Armor() >= 101 then
	ply:SetArmor(100)
	end
    end
end


PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_tank") then return end
    bonus.block = bonus.block + 10
end

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_tank") then return end
    if dmginfo:GetDamageType() == DMG_PURE then
        bonus.resistance = bonus.resistance + 0.25
    end
	if dmginfo:GetDamageType() == DMG_PHYSICAL then
        bonus.resistance = bonus.resistance + 0.25
    end
	if dmginfo:GetDamageType() == DMG_BLUNT then
        bonus.resistance = bonus.resistance + 0.25
    end
	if dmginfo:GetDamageType() == DMG_SLASH then
        bonus.resistance = bonus.resistance + 0.25
    end
end