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
button.Text = "SPEED: NORMAL"
button.Parent = frame

local speedEnabled = false

button.MouseButton1Click:Connect(function()
 speedEnabled = not speedEnabled
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 
 if hum then
 if speedEnabled then
 button.Text = "SPEED: FAST"
 hum.WalkSpeed = 50
 else
 button.Text = "SPEED: NORMAL"
 hum.WalkSpeed = 16
 end
 end
end)
