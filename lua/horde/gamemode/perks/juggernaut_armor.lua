PERK.PrintName = "Carnivorous"
PERK.Description = "Ballistic damage leeches {1} armor per target hit."
PERK.Icon = "materials/perks/bloodlust.png"
PERK.Params = {
    [1] = {value = 1},
}

PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamagePost = function (ply, npc, bonus, hitgroup, dmginfo)
    if ply:Horde_GetPerk("juggernaut_armor") and (HORDE:IsBallisticDamage(dmginfo)) then
	ply:SetArmor(ply:Armor() + 1)
    end
	if ply:Horde_GetPerk("juggernaut_armor") and ply:Armor() >= ply:GetMaxArmor() then
	ply:SetArmor(ply:GetMaxArmor())
	end
end
