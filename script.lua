
-- VERITY HUB | Mobile UI
-- TP TO BASE masih placeholder

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local old = playerGui:FindFirstChild("VerityHub")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "VerityHub"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = playerGui

local main = Instance.new("Frame")
main.Size = UDim2.fromOffset(270, 175)
main.Position = UDim2.new(0.5, -135, 0.4, 0)
main.BackgroundColor3 = Color3.fromRGB(22, 25, 36)
main.BorderSizePixel = 0
main.Active = true
main.Parent = gui

local corner = Instance.new("UICorner")
corner.CornerRadius = UDim.new(0, 12)
corner.Parent = main

local stroke = Instance.new("UIStroke")
stroke.Color = Color3.fromRGB(65, 130, 255)
stroke.Thickness = 1.5
stroke.Parent = main

local header = Instance.new("TextButton")
header.Size = UDim2.new(1, 0, 0, 44)
header.BackgroundColor3 = Color3.fromRGB(35, 42, 61)
header.BorderSizePixel = 0
header.Text = "VERITY HUB       [—]"
header.TextColor3 = Color3.new(1, 1, 1)
header.Font = Enum.Font.GothamBold
header.TextSize = 16
header.Active = true
header.Parent = main

local hc = Instance.new("UICorner")
hc.CornerRadius = UDim.new(0, 12)
hc.Parent = header

local tp = Instance.new("TextButton")
tp.Size = UDim2.new(1, -24, 0, 48)
tp.Position = UDim2.fromOffset(12, 58)
tp.BackgroundColor3 = Color3.fromRGB(48, 103, 220)
tp.Text = "TP TO BASE"
tp.TextColor3 = Color3.new(1, 1, 1)
tp.Font = Enum.Font.GothamBold
tp.TextSize = 16
tp.Parent = main

local tc = Instance.new("UICorner")
tc.CornerRadius = UDim.new(0, 9)
tc.Parent = tp

local info = Instance.new("TextLabel")
info.Size = UDim2.new(1, -20, 0, 35)
info.Position = UDim2.fromOffset(10, 118)
info.BackgroundTransparency = 1
info.Text = "Teleport belum aktif"
info.TextColor3 = Color3.fromRGB(190, 200, 220)
info.TextSize = 12
info.Font = Enum.Font.Gotham
info.Parent = main

local restore = Instance.new("TextButton")
restore.Size = UDim2.fromOffset(145, 42)
restore.Position = UDim2.new(0, 18, 0.65, 0)
restore.BackgroundColor3 = Color3.fromRGB(35, 42, 61)
restore.Text = "VERITY HUB  [+]"
restore.TextColor3 = Color3.new(1, 1, 1)
restore.Font = Enum.Font.GothamBold
restore.TextSize = 14
restore.Visible = false
restore.Active = true
restore.Parent = gui

local rc = Instance.new("UICorner")
rc.CornerRadius = UDim.new(0, 10)
rc.Parent = restore

local function minimize()
    main.Visible = false
    restore.Visible = true
end

local function show()
    main.Visible = true
    restore.Visible = false
end

header.Activated:Connect(minimize)
restore.Activated:Connect(show)

tp.Activated:Connect(function()
    info.Text = "TP masih placeholder!"
end)

-- Drag support untuk mouse dan sentuhan
local function makeDraggable(frame, handle)
    local dragging = false
    local startPos, framePos

    handle.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            startPos = input.Position
            framePos = frame.Position
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if not dragging then return end

        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - startPos
            frame.Position = UDim2.new(
                framePos.X.Scale,
                framePos.X.Offset + delta.X,
                framePos.Y.Scale,
                framePos.Y.Offset + delta.Y
            )
        end
    end)

    UserInputService.InputEnded:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.Touch
        or input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = false
        end
    end)
end

makeDraggable(main, header)
makeDraggable(restore, restore)

print("VERITY HUB UI loaded")
