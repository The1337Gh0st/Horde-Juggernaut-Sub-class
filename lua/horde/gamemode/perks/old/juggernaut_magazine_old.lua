PERK.PrintName = "Loaded Box"
PERK.Description = "50% increase in magazine size, >=31 magazine size gets increased by 100% instead."
PERK.Icon = "materials/perks/ballistic_shock.png"
PERK.Hooks = {}
PERK.Hooks.Hook_GetCapacity = function(wpn, data)
    local ply = wpn:GetOwner()
	
    if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("juggernaut_magazine")
            and data <= 30 then
        return math.ceil(data * 1.5)
    end
	
	if IsValid(ply) and ply:IsPlayer() and ply:Horde_GetPerk("juggernaut_magazine")
            and data >= 31 then
        return math.ceil(data * 2)
    end
	
end
