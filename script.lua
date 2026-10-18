local savedPosition = nil

local saveBtn = createButton("Save Position", scrollingFrame)
saveBtn.MouseButton1Click:Connect(function()
 if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
 savedPosition = player.Character.HumanoidRootPart.CFrame
 saveBtn.Text = "Saved!"
 task.wait(1)
 saveBtn.Text = "Save Position"
 end
end)

local loadBtn = createButton("Load Position", scrollingFrame)
loadBtn.MouseButton1Click:Connect(function()
 if savedPosition and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
 player.Character.HumanoidRootPart.CFrame = savedPosition
 end
end)
