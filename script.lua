local Players = game:GetService("Players")
local player = Players.LocalPlayer

local savedCFrame = nil

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(230, 190)
frame.Position = UDim2.new(0.5, -115, 0.5, -95)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 35)
title.BackgroundTransparency = 1
title.Text = "VERITY HUB"
title.TextColor3 = Color3.fromRGB(100, 220, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = frame

local function makeButton(text, y)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, -20, 0, 38)
    button.Position = UDim2.fromOffset(10, y)
    button.BackgroundColor3 = Color3.fromRGB(45, 50, 65)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.TextSize = 14
    button.Font = Enum.Font.GothamBold
    button.Text = text
    button.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = button

    return button
end

local saveButton = makeButton("SAVE POSITION", 42)
local backButton = makeButton("TELEPORT BACK", 86)
local resetButton = makeButton("RESET SAVE", 130)

saveButton.Activated:Connect(function()
    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")

    if root then
        savedCFrame = root.CFrame
        saveButton.Text = "POSITION SAVED!"
    end
end)

backButton.Activated:Connect(function()
    if not savedCFrame then
        backButton.Text = "SAVE POSITION FIRST"
        return
    end

    local char = player.Character
    local root = char and char:FindFirstChild("HumanoidRootPart")

    if root then
        root.CFrame = savedCFrame
        backButton.Text = "TELEPORTED
