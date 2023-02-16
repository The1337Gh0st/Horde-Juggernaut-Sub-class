PERK.PrintName = "High-Explosive Rounds"
PERK.Description = "Ballistic damage has a {2} chance to cause an explosion. \nExplosion deals {1} base blast damage."
PERK.Icon = "materials/perks/seismic_wave.png"
PERK.Params = {
    [1] = {value = 15},
    [2] = {value = 0.25, percent = true}
}
PERK.Hooks = {}

PERK.Hooks.PostEntityTakeDamage = function (ent, dmginfo, took)
    local attacker = dmginfo:GetAttacker()
    if took and ent:IsNPC() and attacker:IsPlayer() and attacker:Horde_GetPerk("juggernaut_he_rounds") and HORDE:IsBallisticDamage(dmginfo) then
	local p = math.random()
	 if p < 0.25 then
        ent:Horde_AddHighExplosive(100, ent, attacker)
		end
    end
end

local entmeta = FindMetaTable("Entity")

function entmeta:Horde_AddHighExplosive(damage, inflictor, attacker)
    if not self.Horde_HighExplosivePower then self.Horde_HighExplosivePower = 0 end
    self.Horde_HighExplosivePower = self.Horde_HighExplosivePower + damage
    if self.Horde_HighExplosivePower >= 100 then
        self.Horde_HighExplosivePower = 0
        local dmginfo = DamageInfo()
        dmginfo:SetInflictor(inflictor)
		dmginfo:SetAttacker(attacker)
		dmginfo:SetDamageType(DMG_BLAST)
		dmginfo:SetDamage(15)
        util.BlastDamageInfo(dmginfo, inflictor:GetPos(), 200)
        local e = EffectData()
        e:SetOrigin(inflictor:GetPos())
        util.Effect("Explosion", e)
    end
end

hook.Add("Horde_ResetStatus", "Horde_HighExplosiveReset", function(ply)
    ply.Horde_HighExplosive = 0
end)
