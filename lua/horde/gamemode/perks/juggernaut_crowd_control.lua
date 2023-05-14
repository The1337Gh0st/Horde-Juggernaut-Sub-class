PERK.PrintName = "Crowd Control"
PERK.Description = "Regenerate a special version of Shrapnel Grenade every {1} seconds. \nSpecial Shrapnel Grenades do not take up any weight. \nShrapnel Grenades now deal {2} more damage and inflict Stun."
PERK.Icon = "materials/perks/frag_impact.png"
PERK.Params = {
    [1] = {value = 10},
    [2] = {value = 2, percent = true}
}
PERK.Hooks = {}

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_crowd_control" then
        timer.Create("Horde_JuggernautCrowdControl" .. ply:SteamID(), 10, 0, function ()
            if not ply:IsValid() or not ply:Alive() then return end
				--regenerate fake but similar shrapnel grenades to ensure that it can be used regardless of item config / player weight
                if not ply:HasWeapon("arccw_horde_shrapnel_backup") then
                    ply:Give("arccw_horde_shrapnel_backup", ply:GetAmmoCount("arccw_horde_shrapnel_backup") > 0)
                end
            end)
        end
    end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_crowd_control" then
        timer.Remove("Horde_JuggernautCrowdControl" .. ply:SteamID())
		ply:StripWeapon("arccw_horde_shrapnel_backup")
    end
end

PERK.Hooks.Horde_OnPlayerDamage = function (ply, npc, bonus, hitgroup, dmginfo)
    if not ply:Horde_GetPerk("juggernaut_crowd_control")  then return end
    if dmginfo:GetInflictor():GetClass() == "arccw_thr_shrapnel" then
        bonus.more = bonus.more * 3
		npc:Horde_AddDebuffBuildup(HORDE.Status_Stun, 200, ply, npc:GetPos())
    end
end

