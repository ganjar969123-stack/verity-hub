local Players = game:GetService("Players")
local player = Players.LocalPlayer
local playerGui = player:FindFirstChild("PlayerGui") or player:WaitForChild("PlayerGui")

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.Parent = playerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 230, 0, 170)
frame.Position = UDim2.new(0.5, -115, 0.5, -85)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local input = Instance.new("TextBox")
input.Size = UDim2.new(1, -20, 0, 40)
input.Position = UDim2.new(0, 10, 0, 20)
input.PlaceholderText = "Masukkan Speed (Max 100)"
input.Text = ""
input.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 45)
button.Position = UDim2.new(0, 10, 0, 70)
button.Text = "SET SPEED"
button.Parent = frame

local reset = Instance.new("TextButton")
reset.Size = UDim2.new(1, -20, 0, 45)
reset.Position = UDim2.new(0, 10, 0, 120)
reset.Text = "RESET SPEED"
reset.Parent = frame

button.MouseButton1Click:Connect(function()
 local val = tonumber(input.Text)
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 if hum and val then
 if val > 100 then val = 100 end
 hum.WalkSpeed = val
 end
end)

reset.MouseButton1Click:Connect(function()
 local char = player.Character
 local hum = char and char:FindFirstChild("Humanoid")
 if hum then
 hum.WalkSpeed = 16
 end
end)
