local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Sidhsksjsjsh/VAPE-UI-MODDED/main/.lua"))()
local wndw = lib:Window("VIP Turtle Hub V4")
local T1 = wndw:Tab("Main")
local T2 = wndw:Tab("Character")
local T3 = wndw:Tab("Enemies")

local workspace = game:GetService("Workspace")

local var = {
  swing = false,
  id = 577401600,
  parry = false,
  ability = {false,false},
  self = game.Players.LocalPlayer,
  speed = 20,
  jump = 50,
  ls = false,
  lj = false,
  cd = false
}
--client.Character.Humanoid.WalkSpeed = 
--client.Character.Humanoid.JumpPower = 

T3:Label(lib:ColorFonts("You dont have access to see this feature.","Red"))

T2:Slider("Custom speed",0,100,20,function(value)
    var.speed = value
end)

T2:Slider("Custom jump",0,500,50,function(value)
    var.jump = value
end)

T2:Toggle("Speed bypass",false,function(value)
    var.ls = value
    while wait() do
      if var.ls == false then break end
      var.self.Character.Humanoid.WalkSpeed = var.speed
    end
end)

T2:Toggle("Jump bypass",false,function(value)
    var.lj = value
    while wait() do
      if var.lj == false then break end
      var.self.Character.Humanoid.JumpPower = var.jump
    end
end)

T1:Label("Attack first to use this.")

T1:Toggle("Auto swing enemy",false,function(value)
    var.swing = value
    while wait() do
      if var.swing == false then break end
        lib:children(workspace["SpawnedEnemies"],function(array)
          game:GetService("ReplicatedStorage")["Events"]["damageEnemy"]:FireServer(1,array,var.id)
        end)
    end
end)

T1:Toggle("Auto parry",false,function(value)
    var.swing = value
    while wait() do
      if var.swing == false then break end
        lib:children(workspace["SpawnedEnemies"],function(array)
          game:GetService("ReplicatedStorage")["Events"]["damageEnemy"]:FireServer(2,array,var.id)
        end)
    end
end)

T1:Toggle("Auto use ability1 to enemy",false,function(value)
    var.ability[1] = value
    while wait() do
      if var.ability[1] == false then break end
        lib:children(workspace["SpawnedEnemies"],function(array)
          game:GetService("ReplicatedStorage")["Events"]["damageEnemy"]:FireServer("Ability1",array,var.id)
        end)
    end
end)

T1:Toggle("Auto use ability2 to enemy",false,function(value)
    var.ability[2] = value
    while wait() do
      if var.ability[2] == false then break end
        lib:children(workspace["SpawnedEnemies"],function(array)
          game:GetService("ReplicatedStorage")["Events"]["damageEnemy"]:FireServer("Ability2",{array},var.id)
        end)
    end
end)

lib:HookFunction(function(method,name,args)
    if method == "FireServer" and name == "damageEnemy" and args[1] == 1 or args[1] == 2 or args[1] == "Ability1" or args[1] == "Ability2" and type(args[3]) == "userdata" or type(args[3]) == "number" then
      var.id = args[3]
    end
end)
