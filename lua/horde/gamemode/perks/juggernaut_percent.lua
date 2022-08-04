PERK.PrintName = "Pack-a-Punch"
PERK.Description = "{1} increased Ballistic damage against non-elites.\nBallistic damage deals {2} to {3} of an enemy's current health as extra damage."
PERK.Icon = "materials/perks/headhunter.png"
PERK.Params = {
    [1] = {value = 0.15, percent = true},
    [2] = {value = 0.01, percent = true},
    [3] = {value = 0.08, percent = true}
}
PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_percent") then return end
    if HORDE:IsBallisticDamage(dmginfo) then
        if not npc:GetVar("is_elite") then
            bonus.increase = bonus.increase + 0.15
        end
        bonus.post_add = npc:Health() * math.min(0.08, dmginfo:GetDamage() / 2000)
    end
end