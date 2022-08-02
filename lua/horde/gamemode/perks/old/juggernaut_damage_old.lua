PERK.PrintName = "Pack-a-Punch"
PERK.Description = "Deal 25% more ballistic damage and 25% more headshot damage."
PERK.Icon = "materials/perks/gunslinger/puncture.png"
PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_damage")  then return end
    if (HORDE:IsBallisticDamage(dmginfo)) then
        bonus.increase = bonus.increase + 0.25
    end
end

PERK.Hooks.Hook_BulletHit = function(wpn, data)
    local attacker = wpn:GetOwner()
    if SERVER and IsValid(attacker) and attacker:IsPlayer()
            and data.tr.HitGroup == HITGROUP_HEAD and attacker:Horde_GetPerk("juggernaut_damage") then
        data.damage = data.damage * 1.25
    end
end