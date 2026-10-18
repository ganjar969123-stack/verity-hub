-- Steal a Verity - Automation Script
-- Peringatan: Gunakan script ini dengan bijak. 
-- Penggunaan script pihak ketiga dapat melanggar ketentuan layanan game.

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")

-- Fungsi untuk mengambil Verity secara otomatis
local function autoCollectVerity()
 for _, item in pairs(workspace:GetDescendants()) do
 if item.Name == "Verity" and item:IsA("BasePart") then
 -- Teleport pemain ke lokasi Verity
 rootPart.CFrame = item.CFrame
 wait(0.5)
 
 -- Interaksi dengan object (sesuaikan dengan mekanisme game)
 local proximityPrompt = item:FindFirstChildOfClass("ProximityPrompt")
 if proximityPrompt then
 fireproximityprompt(proximityPrompt)
 end
 end
 end
end

-- Loop utama untuk menjalankan fitur
spawn(function()
 while true do
 autoCollectVerity()
 wait(5) -- Delay agar tidak terdeteksi spam
 end
end)

-- Fitur tambahan: Anti-AFK
local virtualUser = game:GetService("VirtualUser")
player.Idled:Connect(function()
 virtualUser:CaptureController()
 virtualUser:ClickButton2(Vector2.new())
end)
