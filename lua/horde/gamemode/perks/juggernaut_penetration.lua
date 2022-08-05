PERK.PrintName = "Hollow-point Rounds"
PERK.Description = "Guns have 30mm extra penetration. \nDeal {1} extra damage to limbs. Deal {2} more ballistic damage against non-elites. \n {2} increased headshot damage."
PERK.Icon = "materials/perks/kinetic_impact.png"
PERK.Params = {
    [1] = {value = 3, percent = true},
    [2] = {value = 0.25, percent = true}
}
PERK.Hooks = {}
local limbs = {HITGROUP_LEFTARM, HITGROUP_LEFTLEG, HITGROUP_RIGHTARM, HITGROUP_RIGHTLEG}
-- RecalcAllBuffs() may be necessary for certain stats that aren't calculated all the time.
-- It is unnecessary here but can be uncommented depending on use
--[[]
local recalc = function(ply, perk)
    if perk == "arccw_shotgun_penetration" then
        for _, wpn in pairs(ply:GetWeapons()) do
            if wpn.ArcCW then
                wpn:RecalcAllBuffs()
            end
        end
    end
end
PERK.Hooks.Horde_OnSetPerk = recalc
PERK.Hooks.Horde_OnUnsetPerk = recalc
]]

-- You can modify ArcCW weapon stats with specially named hooks.
-- Specifically: O_Hook_STAT for overrides, M_Hook_STAT for multipliers and A_Hook_STAT for addition.
-- Edit the value in data.current
PERK.Hooks.O_Hook_Override_Penetration = function(wpn, data)
    local ply = wpn:GetOwner()
    if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("juggernaut_penetration") then
        data.current = (data.current or 0) + 30
    end
end

PERK.Hooks.Hook_BulletHit = function(wpn, data)
    local attacker = wpn:GetOwner()
    if SERVER and IsValid(attacker) and attacker:IsPlayer()
            and (table.HasValue(limbs, data.tr.HitGroup))
            and attacker:Horde_GetPerk("juggernaut_penetration") then
        data.damage = data.damage * 4		
    end
	if SERVER and IsValid(attacker) and attacker:IsPlayer()
            and data.tr.HitGroup == HITGROUP_HEAD and attacker:Horde_GetPerk("juggernaut_penetration") then
        data.damage = data.damage * 1.25
		end
end

--PERK.Hooks.Hook_BulletHit = function(wpn, data)
  --  local attacker = wpn:GetOwner()
  --  if SERVER and IsValid(attacker) and attacker:IsPlayer()
    --        and data.tr.HitGroup == HITGROUP_HEAD and attacker:Horde_GetPerk("juggernaut_penetration") then
    --    data.damage = data.damage * 1.25
   -- end
--end

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_penetration") then return end
    if HORDE:IsBallisticDamage(dmginfo) then
        if not npc:GetVar("is_elite") then
            bonus.increase = bonus.increase + 0.25
        end
		
    end
end