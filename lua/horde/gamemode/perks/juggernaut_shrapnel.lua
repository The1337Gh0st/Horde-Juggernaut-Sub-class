PERK.PrintName = "Shrapnel"
PERK.Description = "{2} increased Ballistic damage. \n{1} of Ballistic damage builds up Bleeding."
PERK.Icon = "materials/perks/headhunter.png"
PERK.Params = {
    [1] = {value = 0.3, percent = true},
	[2] = {value = 0.2, percent = true},
    [3] = {value = 0.01, percent = true},
    [4] = {value = 0.08, percent = true},
	[5] = {value = 0.25, percent = true},
}
PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_shrapnel") then return end
    if HORDE:IsBallisticDamage(dmginfo) then 

bonus.increase = bonus.increase + 0.2	
		
		npc:Horde_AddDebuffBuildup(HORDE.Status_Bleeding, dmginfo:GetDamage() * 0.3 , ply, dmginfo:GetDamagePosition())
		
    end
end
