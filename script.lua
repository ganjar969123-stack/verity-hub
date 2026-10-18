local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Name = "MainFrame"
frame.Size = UDim2.new(0, 230, 0, 130)
frame.Position = UDim2.new(0.5, -115, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Visible = true
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "VERITY HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 45)
button.Position = UDim2.new(0, 10, 0, 40)
button.Text = "AUTO WALK: OFF"
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -10, 0, 30)
status.Position = UDim2.new(0, 5, 0, 90)
status.Text = "Siap"
status.TextColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.Parent = frame

local running = false

button.MouseButton1Click:Connect(function()
 running = not running
 if running then
 button.Text = "AUTO WALK: ON"
 status.Text = "Berjalan..."
 task.spawn(function()
 while running do
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 local root = char and char:FindFirstChild("HumanoidRootPart")
 if hum and root then
 hum:MoveTo(root.Position + (root.CFrame.LookVector  10))
 end
 task.wait(0.1)
 end
 end)
 else
 button.Text = "AUTO WALK: OFF"
 status.Text = "Siap"
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 if hum then
 hum:MoveTo(char.HumanoidRootPart.Position)
 end
 end
end)
