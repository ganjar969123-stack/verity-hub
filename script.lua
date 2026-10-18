local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "TestUI"
gui.ResetOnSpawn = false

local button = Instance.new("TextButton")
button.Size = UDim2.fromOffset(200, 60)
button.Position = UDim2.new(0.5, -100, 0.5, -30)
button.Text = "UI BERHASIL MUNCUL"
button.TextScaled = true
button.BackgroundColor3 = Color3.fromRGB(0, 170, 255)
button.Parent = gui

gui.Parent = player:WaitForChild("PlayerGui")
