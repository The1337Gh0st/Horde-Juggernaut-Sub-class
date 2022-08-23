PERK.PrintName = "Heavy Armor"
PERK.Description = "Max health and max armor is set to {1}. \n+{2} damage block. \n{3} physical damage resist."
PERK.Icon = "materials/perks/liquid_armor.png"
PERK.Hooks = {}
PERK.Params = {
    [1] = {value = 150},
	[2] = {value = 10},
	[3] = {value = 0.15, percent = true},
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
    if HORDE:IsPhysicalDamage(dmginfo) then
       bonus.resistance = bonus.resistance + 0.15
    end
end