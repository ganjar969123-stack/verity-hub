local Players = game:GetService("Players")
local player = Players.LocalPlayer

local savedPosition = nil

local gui = Instance.new("ScreenGui")
gui.Name = "SaveTeleport"
gui.ResetOnSpawn = false

local frame = Instance.new("Frame")
frame.Size = UDim2.fromOffset(230, 145)
frame.Position = UDim2.new(0.5, -115, 0.5, -72)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 40)
frame.Parent = gui

local saveButton = Instance.new("TextButton")
saveButton.Size = UDim2.new(1, -20, 0, 45)
saveButton.Position = UDim2.fromOffset(10, 10)
saveButton.Text = "SAVE POSITION"
saveButton.Parent = frame

local backButton.Activated:Connect(function()
    if not savedPosition then
        backButton.Text = "SAVE POSITION FIRST!"
        return
    end

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if not root then
        backButton.Text = "CHARACTER NOT FOUND"
        return
    end

    backButton.Text = "MOVING..."

    local target = savedPosition.Position
    local distance = (target - root.Position).Magnitude
    local steps = math.max(1, math.ceil(distance / 10))

    for i = 1, steps do
        if not root.Parent then break end

        local alpha = i / steps
        local nextPosition = root.Position:Lerp(target, alpha)

        root.CFrame = CFrame.new(nextPosition)
        task.wait(0.15)
    end

    backButton.Text = "TELEPORT BACK"
end)

saveButton.Activated:Connect(function()
    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root then
        savedPosition = root.CFrame
        saveButton.Text = "POSITION SAVED!"
    end
end)

backButton.Activated:Connect(function()
    if not savedPosition then
        backButton.Text = "SAVE POSITION FIRST!"
        return
    end

    local character = player.Character
    local root = character and character:FindFirstChild("HumanoidRootPart")

    if root then
        root.CFrame = savedPosition
        backButton.Text = "TELEPORTED!"
    end
end)

gui.Parent = player:WaitForChild("PlayerGui")
