SUBCLASS.PrintName = "Juggernaut" -- Required
SUBCLASS.UnlockCost = 100
SUBCLASS.ParentClass = HORDE.Class_Heavy -- Required for any new classes
SUBCLASS.Icon = "subclasses/golem.png" -- Required
SUBCLASS.Description = [[
Heavy subclass.
Focuses on improving guns and being tanky.]] -- Required
SUBCLASS.BasePerk = "juggernaut_base"
SUBCLASS.Perks = {
    [1] = {title = "Provisions", choices = {"juggernaut_magazine", "juggernaut_tank"}},
    [2] = {title = "Super Serum", choices = {"juggernaut_stun", "juggernaut_shockproof"}},
    [3] = {title = "Bigger Bullets", choices = {"juggernaut_percent", "juggernaut_penetration"}},
    [4] = {title = "Ultimatum", choices = {"juggernaut_speed", "juggernaut_armor"}},
} -- Required

--SUBCLASS.Perks = {
  --  [1] = {title = "Provisions", choices = {"juggernaut_magazine", "juggernaut_tank"}},
  --  [2] = {title = "Super Serum", choices = {"juggernaut_stun", "juggernaut_shockproof"}},
  --  [3] = {title = "Bigger Bullets", choices = {"juggernaut_percent", "juggernaut_penetration"}},
  --  [4] = {title = "Ultimatum", choices = {"juggernaut_speed", "juggernaut_armor"}},
--} -- Required