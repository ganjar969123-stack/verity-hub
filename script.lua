task.spawn(function()
 while running do
 local character = player.Character
 local humanoid = character and character:FindFirstChild("Humanoid")
 local rootPart = character and character:FindFirstChild("HumanoidRootPart")
 
 if humanoid and rootPart then
 -- Menggerakkan karakter ke arah depan posisi karakter saat ini
 local moveDirection = rootPart.CFrame.LookVector
 humanoid:Move(moveDirection, true)
 end
 task.wait(0.1)
 end
 end)
