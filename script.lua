local Players = game:GetService("Players")
local PathfindingService = game:GetService("PathfindingService")

local player = Players.LocalPlayer
local running = false

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false

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

button.Activated:Connect(function()
    running = not running
    button.Text = running and "AUTO WALK: ON" or "AUTO WALK: OFF"

    if running then
        status.Text = "Tujuan base belum ditemukan"
    else
        status.Text = "Berhenti"
    end
end)

gui.Parent = player:WaitForChild("PlayerGui")
