PERK.PrintName = "Heavy Armor"
PERK.Description = "Max health and max armor is set to 150. \n+10 damage block."
PERK.Icon = "materials/perks/liquid_armor.png"
PERK.Hooks = {}

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
	--if ply:Horde_GetPerk("juggernaut_tank") and ply:Armor() >= 100 then
	--ply:SetArmor(100)
	--end
end

--PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
  --  if SERVER and perk == "juggernaut_tank" then
   --     ply:SetMaxArmor(150)
   --     ply:SetArmor(0)
  --  end
--end

--PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
   -- if SERVER and perk == "juggernaut_tank" then
   --     ply:SetMaxArmor(100)
   --     ply:SetArmor(0)
  --  end
--end

PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_tank") then return end
    bonus.block = bonus.block + 10
end