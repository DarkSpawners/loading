--// Full-Screen Fake Loading Screen with Anti-UI Bypass
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Freeze movement
Humanoid.WalkSpeed = 0
Humanoid.JumpPower = 0

-- Disable chat scripts (client-side)
pcall(function()
	for _, s in pairs(LocalPlayer.PlayerScripts:GetChildren()) do
		if s:IsA("LocalScript") and s.Name:lower():find("chat") then
			s.Disabled = true
		end
	end
end)

-- Hide CoreGui elements (backpack, health, etc.)
pcall(function()
	for _, type in pairs(Enum.CoreGuiType:GetEnumItems()) do
		StarterGui:SetCoreGuiEnabled(type, false)
	end
end)

-- UI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.Name = "FakeLoadingUI"

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.Position = UDim2.new(0, 0, 0, 0)
frame.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
frame.ZIndex = 10

-- Loading Text
local loadingText = Instance.new("TextLabel", frame)
loadingText.Size = UDim2.new(1, 0, 1, 0)
loadingText.Text = "Loading.. 0%"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.SourceSansLight
loadingText.TextSize = 42
loadingText.TextStrokeTransparency = 0.7
loadingText.Position = UDim2.new(0, 0, 0.4, 0)

-- Bypass Text
local bypassText = Instance.new("TextLabel", frame)
bypassText.Size = UDim2.new(1, 0, 1, 0)
bypassText.Text = "Bypassing Anticheat... please wait"
bypassText.TextColor3 = Color3.fromRGB(200, 200, 200)
bypassText.BackgroundTransparency = 1
bypassText.Font = Enum.Font.SourceSans
bypassText.TextSize = 26
bypassText.TextStrokeTransparency = 0.8
bypassText.Position = UDim2.new(0, 0, 0.48, 0)

-- Fake Progress
local totalDuration = 180 -- 3 minutes
local steps = 100
local waitTime = totalDuration / steps

for i = 1, steps do
	task.wait(waitTime)
	loadingText.Text = "Loading.. " .. tostring(i) .. "%"
end

-- Freeze at 100%
loadingText.Text = "Loading.. 100%"
