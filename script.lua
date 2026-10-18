local Players = game:GetService("Players")
local player = Players.LocalPlayer

local savedPosition = nil
local busy = false

local gui = Instance.new("ScreenGui")
gui.Name = "VerityTeleport"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(240, 165)
frame.Position = UDim2.new(0.5, -120, 0.5, -82)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "VERITY HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(1, -20, 0, 45)
saveButton.Position = UDim2.fromOffset(10, 40)
saveButton.Text = "SAVE POSITION"
saveButton.Parent = frame

local backButton = Instance.new("TextButton")
backButton.Size = UDim2.new(1, -20, 0, 45)
backButton.Position = UDim2.fromOffset(10, 95)
backButton.Text = "TELEPORT BACK"
backButton.Parent = frame

saveButton.Activated:Connect(function()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root then
        savedPosition = root.CFrame
        saveButton.Text = "POSITION SAVED!"
    else
        saveButton.Text = "CHARACTER NOT FOUND
gui.Parent = player:WaitForChild("PlayerGui")
