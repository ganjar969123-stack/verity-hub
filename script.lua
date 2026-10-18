setfflag("ProximityPromptInputUseNewGamepad", false)

local UIS = game:GetService("UserInputService")
local player = game.Players.LocalPlayer

task.spawn(function()
 while task.wait(3) do
 for _, v in workspace:GetDescendants() do
 if v:IsA("ProximityPrompt") and v.Parent.Name == "Verity" then
 pcall(function()
 fireproximityprompt(v, 0)
 player.Character.HumanoidRootPart.CFrame = v.Parent.CFrame + Vector3.new(0, 1, 0)
 end)
 end
 end
 end
end)

while task.wait(10) do
 pcall(function()
 UIS:InputButtonPress(Enum.KeyCode.Space)
 task.wait(0.1)
 UIS:InputButtonRelease(Enum.KeyCode.Space)
 end)
end
