local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")

local player = Players.LocalPlayer
local running = false

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui -- Pastikan GUI muncul di layar

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(230, 130)
frame.Position = UDim2.new(0.5, -115, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "VERITY HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 45)
button.Position = UDim2.fromOffset(10, 40)
button.Text = "AUTO WALK: OFF"
button.Parent = frame

local status = Instance.new("TextLabel")
status.Size = UDim2.new(1, -10, 0, 30)
status.Position = UDim2.fromOffset(5, 90)
status.Text = "Siap"
status.TextColor3 = Color3.new(1, 1, 1)
status.BackgroundTransparency = 1
status.Parent = frame

-- Logika tombol
button.MouseButton1Click:Connect(function()
 running = not running
 if running then
 button.Text = "AUTO WALK: ON"
 status.Text = "Berjalan..."
 
 local character = player.Character or player.CharacterAdded:Wait()
 local humanoid = character:FindFirstChild("Humanoid")
 
 task.spawn(function()
 while running and humanoid do
 humanoid:Move(Vector3.new(0, 0, -1)) 
 task.wait(0.1)
 end
 end)
 else
 button.Text = "AUTO WALK: OFF"
 status.Text = "Siap"
 end
end)
