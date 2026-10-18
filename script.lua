local Players = game:GetService("Players")
local player = Players.LocalPlayer

local function autoCollect()
 while true do
 local character = player.Character
 if character and character:FindFirstChild("HumanoidRootPart") then
 local hrp = character.HumanoidRootPart
 
 for _, obj in pairs(workspace:GetDescendants()) do
 if obj:IsA("TouchTransmitter") and obj.Parent.Name == "Box" then
 local target = obj.Parent
 if (target.Position - hrp.Position).Magnitude < 15 then
 firetouchinterest(hrp, target, 0)
 firetouchinterest(hrp, target, 1)
 end
 end
 end
 end
 task.wait(0.5)
 end
end

task.spawn(autoCollect)
