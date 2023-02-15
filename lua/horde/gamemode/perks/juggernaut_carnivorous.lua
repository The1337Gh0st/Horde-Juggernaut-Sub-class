PERK.PrintName = "Carnivorous"
PERK.Description = "Kills restore {2} of your max health."
PERK.Icon = "materials/perks/bloodlust.png"
PERK.Params = {
    [1] = {value = 1},
	[2] = {value = 0.05, percent = true},
}

PERK.Hooks = {}

PERK.Hooks.Horde_OnNPCKilled = function(victim, killer, inflictor)
    if not killer:Horde_GetPerk("juggernaut_carnivorous") then return end
   
 --  local leech = math.min(killer:GetMaxHealth() * 0.05, 1)
        HORDE:SelfHeal(killer, killer:GetMaxHealth() * 0.05)
   
end