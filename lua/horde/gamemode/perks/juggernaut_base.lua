PERK.PrintName = "Juggernaut Base"
PERK.Description = [[

The Juggernaut is a sub-class of the Heavy that focuses on improving its guns and being tankier than Heavy in exchange for being slower.
Complexity: EASY


{1} increased Global damage resistance. ({2} per level, up to {3})
{1} increased ballistic damage. ({2} per level, up to {3})
{5} walking and running speed. ({2} per level, up to {4})
]]

--40% less walking and running speed.
--{1} increased Global damage resistance.
--{2} decreased walking and running speed.

PERK.Params = {
    [1] = {percent = true, base = 0, level = 0.01, max = 0.25, classname = "Juggernaut"},
	[2] = {value = 0.01, percent = true},
	[3] = {value = 0.25, percent = true},
	[4] = {value = 0.75, percent = true},
	[5] = {percent = true, base = 0.5, level = 0.01, max = 0.75, classname = "Juggernaut"},
}

	
PERK.Hooks = {}


-- This is a required function if you are planning to use bonuses based on levels.
PERK.Hooks.Horde_PrecomputePerkLevelBonus = function (ply)
    if SERVER then
        ply:Horde_SetPerkLevelBonus("juggernaut_base", math.min(0.25, 0.01 * ply:Horde_GetLevel("Juggernaut")))
    end
end

PERK.Hooks.Horde_OnPlayerDamageTaken = function(ply, dmginfo, bonus)
    if not ply:Horde_GetPerk("juggernaut_base")  then return end
    bonus.resistance = bonus.resistance + ply:Horde_GetPerkLevelBonus("juggernaut_base")
end

PERK.Hooks.OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    local attacker = dmginfo:GetAttacker()
    if attacker:IsPlayer() and (dmginfo:IsDamageType(DMG_BALLISTIC) or dmginfo:IsBallisticDamage())
            and attacker:Horde_GetPerk("juggernaut_base") then
        bonus.more = bonus.more * ply:Horde_GetPerkLevelBonus("juggernaut_base")
    end
end


--PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
  --  if ply:Horde_GetPerk("juggernaut_base") then
  --     bonus.increase = bonus.increase + ply:Horde_GetPerkLevelBonus("juggernaut_base")
   -- end
--end


hook.Add("Horde_PlayerMoveBonus", "Horde_JuggernautBaseLevelSpeed", function(ply, bonus)
    if ply:Horde_GetPerk("juggernaut_base") then
	local j = ply:Horde_GetPerkLevelBonus("juggernaut_base")
        bonus.walkspd = bonus.walkspd * (0.5 + j)
            bonus.sprintspd = bonus.sprintspd * (0.5 + j)
    end
end)

