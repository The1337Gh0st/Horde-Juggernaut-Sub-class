PERK.PrintName = "Pack-a-Punch"
PERK.Description = "{1} increased Ballistic damage against elites. Additional {2} against bosses. \nBallistic damage deals {3} to {4} of an enemy's current health as extra damage. \n Percent damage does not apply against bosses."
PERK.Icon = "materials/perks/headhunter.png"
PERK.Params = {
    [1] = {value = 0.15, percent = true},
	[2] = {value = 0.35, percent = true},
    [3] = {value = 0.01, percent = true},
    [4] = {value = 0.02, percent = true}
}
PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_percent") then return end
    if HORDE:IsBallisticDamage(dmginfo) then
        if npc:GetVar("is_elite") then
            bonus.increase = bonus.increase + 0.15
        end
		if npc:GetVar("is_boss") then
            bonus.increase = bonus.increase + 0.35
        end
		
		if not npc:GetVar("is_boss") then
        bonus.post_add = npc:Health() * math.min(0.02, dmginfo:GetDamage() / 3000)
		end
    end
end