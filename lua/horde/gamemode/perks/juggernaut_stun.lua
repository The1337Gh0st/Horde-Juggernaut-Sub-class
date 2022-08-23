PERK.PrintName = "Weakness Display"
PERK.Description = "Ballistic damage increases Stun buildup.\nEnemies affected by Stun is paralyzed for {1} seconds with a cooldown of {2} seconds. \nHeadshots restore {3} ammo from reserve."
PERK.Icon = "materials/perks/gunslinger/deadeye.png"
PERK.Hooks = {}
PERK.Params = {
    [1] = {value = 3},
    [2] = {value = 10},
	[3] = {value = 1},
}
PERK.Hooks.PostEntityTakeDamage = function (ent, dmginfo, took)
    local attacker = dmginfo:GetAttacker()
    if took and ent:IsNPC() and attacker:IsPlayer() and attacker:Horde_GetPerk("juggernaut_stun") and HORDE:IsBallisticDamage(dmginfo) then
        ent:Horde_AddStun(dmginfo:GetDamage())
    end
end


PERK.Hooks.Hook_BulletHit = function(wpn, data)
    local attacker = wpn:GetOwner()
	if SERVER and IsValid(attacker) and attacker:IsPlayer()
            and attacker:Horde_GetPerk("juggernaut_stun") and data.tr.HitGroup == HITGROUP_HEAD then
        wpn:RestoreAmmo(1)
		end
end

--att.Hook_BulletHit = function(wep, data)
   -- if CLIENT then return end

  --  if data.tr.Hit and data.tr.Entity:IsPlayer() then
  --      local ply = data.tr.Entity
  --      local vel = ply:GetVelocity()
  --      ply:SetVelocity(-vel * 0.75)
  --  end
--end