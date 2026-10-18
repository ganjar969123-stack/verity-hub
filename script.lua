local Players = game:GetService("Players")
local player = Players.LocalPlayer

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 120)
frame.Position = UDim2.new(0.5, -120, 0.5, -60)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Parent = gui

local label = Instance.new("TextLabel")
label.Size = UDim2.new(1, 0, 0, 50)
label.BackgroundTransparency = 1
label.Text = "VERITY HUB AKTIF"
label.TextColor3 = Color3.new(1, 1, 1)
label.TextScaled = true
label.Parent = frame

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 40)
button.Position = UDim2.new(0, 10, 0, 65)
button.Text = "TES TOMBOL"
button.Parent = frame

button.Activated:Connect(function()
    label.Text = "UI BERHASIL!"
end)

gui.Parent = player:WaitForChild("PlayerGui")
