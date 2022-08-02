PERK.PrintName = "Tough Skin"
PERK.Description = "25% increased Global damage resistance and {1} regen per second."
PERK.Icon = "materials/perks/bloodlust.png"
PERK.Params = {
    [1] = {value = 0.02, percent = true},
}
PERK.Hooks = {}
PERK.Hooks.Horde_OnPlayerDamageTaken = function (ply, dmg, bonus)
    if not ply:Horde_GetPerk("juggernaut_tough_skin") then return end
    bonus.resistance = bonus.resistance + 0.25
end

PERK.Hooks.Horde_OnSetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_tough_skin" then
        ply:Horde_SetHealthRegenEnabled(true)
        ply:Horde_SetHealthRegenPercentage(0.02)
    end
end

PERK.Hooks.Horde_OnUnsetPerk = function(ply, perk)
    if SERVER and perk == "juggernaut_tough_skin" then
        ply:Horde_SetHealthRegenEnabled(nil)
    end
end