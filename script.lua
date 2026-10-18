local Players = game:GetService("Players")
local player = Players.LocalPlayer

local savedCFrame = nil
local busy = false

-- GUI
local gui = Instance.new("ScreenGui")
gui.Name = "VerityTeleport"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 240, 0, 165)
frame.Position = UDim2.new(0.5, -120, 0.5, -82)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.BorderSizePixel = 0
frame.Parent = gui

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.Text = "VERITY HUB"
title.TextColor3 = Color3.new(1, 1, 1)
title.BackgroundTransparency = 1
title.Parent = frame

local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(1, -20, 0, 45)
saveButton.Position = UDim2.new(0, 10, 0, 40)
saveButton.Text = "SAVE POSITION"
saveButton.Parent = frame

local backButton = Instance.new("TextButton")
backButton.Size = UDim2.new(1, -20, 0, 45)
backButton.Position = UDim2.new(0, 10, 0, 95)
backButton.Text = "TELEPORT BACK"
backButton.Parent = frame

local function getRoot()
    local character = player.Character
    return character and character:FindFirstChild("HumanoidRootPart")
end

saveButton.Activated:Connect(function()
    local root = getRoot()

    if root then
        savedCFrame = root.CFrame
        saveButton.Text = "POSITION SAVED!"
    else
        saveButton.Text = "CHARACTER NOT FOUND"
    end
end)

backButton.Activated:Connect(function()
    if busy then return end

    if not savedCFrame then
        backButton.Text = "SAVE POSITION FIRST!"
        return
    end

    local root = getRoot()
    if not root then
        backButton.Text = "CHARACTER NOT FOUND"
        return
    end

    busy = true
    backButton.Text = "MOVING..."

    local start = root.Position
    local target = savedCFrame.Position
    local distance = (target - start).Magnitude
