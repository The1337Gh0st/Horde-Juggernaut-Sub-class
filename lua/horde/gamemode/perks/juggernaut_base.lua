PERK.PrintName = "Juggernaut Base"
PERK.Description = [[

The Juggernaut is a sub-class of the Heavy that focuses on improving its guns and being tankier than Heavy in exchange for being slower.
Complexity: EASY

40% less walking and running speed.
{1} increased Global damage resistance. (0%, 1% per level, up to 25%)
{2} increased ballistic damage. (0%, 1% per level, up to 25%)

]]

--{1} increased Global damage resistance.
--{2} decreased walking and running speed.

PERK.Params = {
    [1] = {percent = true, base = 0, level = 0.01, max = 0.25, classname = "Juggernaut"},
	[2] = {percent = true, base = 0, level = 0.01, max = 0.25, classname = "Juggernaut"},
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



hook.Add("Horde_PlayerMoveBonus", "Horde_JuggernautBaseSpeed", function(ply, bonus)
    if ply:Horde_GetPerk("juggernaut_base") then
        bonus.walkspd = bonus.walkspd * 0.6
        bonus.sprintspd = bonus.sprintspd * 0.6
    end
end)

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if ply:Horde_GetPerk("juggernaut_base") then
       bonus.increase = bonus.increase + ply:Horde_GetPerkLevelBonus("juggernaut_base")
    end
end

