local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local positions = {}
local running = false

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(250, 235)
frame.Position = UDim2.new(0.5, -125, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(25, 25, 35)
frame.BorderSizePixel = 0
frame.Active = true
frame.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = frame

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -40, 0, 40)
title.Position = UDim2.fromOffset(10, 0)
title.BackgroundTransparency = 1
title.Text = "VERITY HUB"
title.TextColor3 = Color3.fromRGB(80, 200, 255)
title.TextSize = 20
title.Font = Enum.Font.GothamBold
title.Parent = frame

local close = Instance.new("TextButton")
close.Size = UDim2.fromOffset(30, 30)
close.Position = UDim2.new(1, -35, 0, 5)
close.Text = "X"
close.Parent = frame

local function makeButton(text, y)
    local b = Instance.new("TextButton")
    b.Size = UDim2.new(1, -20, 0, 42)
    b.Position = UDim2.fromOffset(10, y)
    b.BackgroundColor3 = Color3.fromRGB(45, 55, 75)
    b.TextColor3 = Color3.new(1, 1, 1)
    b.TextSize = 14
    b.Font = Enum.Font.GothamBold
    b.Text = text
    b.Parent = frame

    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, 8)
    c.Parent = b
    return b
end

local save1 = makeButton("SAVE POSITION 1", 45)
local save2 = makeButton("SAVE POSITION 2", 92)
local travel = makeButton("TELEPORT: 1 > 2", 139)

local function getRoot()
    local char = player.Character
    return char and char:FindFirstChild("HumanoidRootPart")
end

save1.Activated:Connect(function()
    local root = getRoot()
    if root then
        positions[1] = root.CFrame
        save1.Text = "POSITION 1 SAVED!"
    end
end)

save2.Activated:Connect(function()
    local root = getRoot()
    if root then
        positions[2] = root.CFrame
        save2.Text = "POSITION 2 SAVED!"
    end
end)

travel.Activated:Connect(function()
    if running then return end

    if not positions[1] or not positions[2] then
        travel.Text = "SAVE BOTH POSITIONS!"
        return
    end

    running = true

    task.spawn(function()
        for slot = 1, 2 do
            local root = getRoot()
            if not root then break end

            travel
