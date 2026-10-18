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

-- Logika tombol
button.MouseButton1Click:Connect(function()
 running = not running
 if running then
 button.Text = "AUTO WALK: ON"
 status.Text = "Berjalan..."
 
 task.spawn(function()
 while running do
 local character = player.Character
 local humanoid = character and character:FindFirstChild("Humanoid")
 if humanoid then
 humanoid:Move(Vector3.new(0, 0, -1))
 end
 task.wait(0.1)
 end
 end)
 else
 button.Text = "AUTO WALK: OFF"
 status.Text = "Siap"
 end
end)
