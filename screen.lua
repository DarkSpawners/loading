local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Disable player controls
local function disableMovement()
	local character = player.Character or player.CharacterAdded:Wait()
	local humanoid = character:FindFirstChildOfClass("Humanoid")
	if humanoid then
		humanoid.WalkSpeed = 0
		humanoid.JumpPower = 0
	end
end

disableMovement()
player.CharacterAdded:Connect(disableMovement)

-- Create the loading screen
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "FullCoverLoading"
screenGui.IgnoreGuiInset = true
screenGui.ResetOnSpawn = false
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
screenGui.Parent = playerGui

local background = Instance.new("Frame")
background.Size = UDim2.new(1, 0, 1, 0)
background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
background.ZIndex = 10000
background.Parent = screenGui

local loadingText = Instance.new("TextLabel")
loadingText.Size = UDim2.new(1, 0, 0.1, 0)
loadingText.Position = UDim2.new(0, 0, 0.4, 0)
loadingText.BackgroundTransparency = 1
loadingText.TextColor3 = Color3.new(1, 1, 1)
loadingText.Font = Enum.Font.SourceSansLight
loadingText.TextScaled = true
loadingText.Text = "Loading.. 0%"
loadingText.ZIndex = 10001
loadingText.Parent = background

local bypassText = Instance.new("TextLabel")
bypassText.Size = UDim2.new(1, 0, 0.05, 0)
bypassText.Position = UDim2.new(0, 0, 0.5, 0)
bypassText.BackgroundTransparency = 1
bypassText.TextColor3 = Color3.new(0.8, 0.8, 0.8)
bypassText.Font = Enum.Font.SourceSans
bypassText.TextScaled = true
bypassText.Text = "Bypassing anticheat... please wait"
bypassText.ZIndex = 10001
bypassText.Parent = background

-- Block all input
UserInputService.InputBegan:Connect(function(input, gameProcessed)
	if not gameProcessed then
		return Enum.ContextActionResult.Sink
	end
end)

-- Fake loading progress (3 minutes)
local totalTime = 180
local steps = 100
for i = 1, steps do
	task.wait(totalTime / steps)
	loadingText.Text = "Loading.. " .. i .. "%"
end

-- Stay stuck at 100%
loadingText.Text = "Loading.. 100%"
