backButton.Activated:Connect(function()
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
