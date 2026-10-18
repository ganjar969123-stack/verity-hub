local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 230, 0, 130)
frame.Position = UDim2.new(0.5, -115, 0.5, -65)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = gui

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 45)
button.Position = UDim2.new(0, 10, 0, 40)
button.Text = "AUTO WALK: OFF"
button.Parent = frame

local running = false

button.MouseButton1Click:Connect(function()
 running = not running
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 
 if hum then
 if running then
 button.Text = "AUTO WALK: ON"
 hum.WalkSpeed = 16
 task.spawn(function()
 while running do
 hum:Move(Vector3.new(0, 0, -1), true)
 task.wait()
 end
 end)
 else
 button.Text = "AUTO WALK: OFF"
 hum:Move(Vector3.new(0, 0, 0), true)
 end
 end
end)
