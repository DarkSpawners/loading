--// Full-Screen Fake Loading Screen Script
local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local Humanoid = Character:WaitForChild("Humanoid")

-- Freeze movement
Humanoid.WalkSpeed = 0
Humanoid.JumpPower = 0

-- Disable chat
pcall(function()
	for _, s in pairs(LocalPlayer.PlayerScripts:GetChildren()) do
		if s.Name:lower():find("chat") then
			s.Disabled = true
		end
	end
end)

-- UI Setup
local screenGui = Instance.new("ScreenGui", LocalPlayer:WaitForChild("PlayerGui"))
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false

local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(1, 0, 1, 0)
frame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)

local loadingText = Instance.new("TextLabel", frame)
loadingText.Size = UDim2.new(1, 0, 1, 0)
loadingText.Text = "Loading.. 0%"
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.BackgroundTransparency = 1
loadingText.Font = Enum.Font.SourceSansLight
loadingText.TextSize = 40
loadingText.TextStrokeTransparency = 0.7

-- Fake progress
local totalDuration = 180 -- 3 minutes in seconds
local steps = 100
local waitTime = totalDuration / steps

for i = 1, steps do
	task.wait(waitTime)
	loadingText.Text = "Loading.. " .. tostring(i) .. "%"
end

-- Stuck at 100%
loadingText.Text = "Loading.. 100%"
