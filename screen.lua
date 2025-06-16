local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()

-- Freeze movement
local Humanoid = Character:FindFirstChildOfClass("Humanoid")
if Humanoid then
	Humanoid.WalkSpeed = 0
	Humanoid.JumpPower = 0
end

-- Disable chat UI and CoreGui
pcall(function()
	for _, v in ipairs(Enum.CoreGuiType:GetEnumItems()) do
		StarterGui:SetCoreGuiEnabled(v, false)
	end
end)

-- Destroy all visible ScreenGuis (optional, aggressive)
for _, gui in ipairs(LocalPlayer:WaitForChild("PlayerGui"):GetChildren()) do
	if gui:IsA("ScreenGui") and gui.Name ~= "FakeLoadingUI" then
		gui:Destroy()
	end
end

-- Create full-screen loading UI
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "FakeLoadingUI"
ScreenGui.ResetOnSpawn = false
ScreenGui.IgnoreGuiInset = true
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Global
ScreenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")

local Background = Instance.new("Frame", ScreenGui)
Background.Size = UDim2.new(1, 0, 1, 0)
Background.Position = UDim2.new(0, 0, 0, 0)
Background.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
Background.ZIndex = 10

-- Loading Text
local LoadingText = Instance.new("TextLabel", Background)
LoadingText.Size = UDim2.new(1, 0, 0, 60)
LoadingText.Position = UDim2.new(0, 0, 0.4, 0)
LoadingText.TextColor3 = Color3.new(1, 1, 1)
LoadingText.TextStrokeTransparency = 0.7
LoadingText.BackgroundTransparency = 1
LoadingText.Font = E
