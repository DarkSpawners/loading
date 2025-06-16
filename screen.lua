local player = game.Players.LocalPlayer
local backpack = player:WaitForChild("Backpack")
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui", playerGui)
screenGui.Name = "ZenqPetSpawner"
screenGui.ResetOnSpawn = false

-- Main UI Frame (Smaller & Draggable)
local frame = Instance.new("Frame", screenGui)
frame.Size = UDim2.new(0, 300, 0, 220)
frame.Position = UDim2.new(0.35, 0, 0.35, 0)
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
frame.Active = true
frame.Draggable = true
Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

-- Category Labels: PET and SEED
local petLabel = Instance.new("TextLabel", frame)
petLabel.Text = "PET"
petLabel.Size = UDim2.new(0.5, 0, 0, 30)
petLabel.Position = UDim2.new(0, 10, 0, 0)
petLabel.BackgroundTransparency = 1
petLabel.TextColor3 = Color3.new(1, 1, 1)
petLabel.Font = Enum.Font.SourceSans
petLabel.TextSize = 24
petLabel.TextXAlignment = Enum.TextXAlignment.Left

local seedLabel = Instance.new("TextLabel", frame)
seedLabel.Text = "SEED"
seedLabel.Size = UDim2.new(0.5, 0, 0, 30)
seedLabel.Position = UDim2.new(0.5, -10, 0, 0)
seedLabel.BackgroundTransparency = 1
seedLabel.TextColor3 = Color3.new(1, 1, 1)
seedLabel.Font = Enum.Font.SourceSans
seedLabel.TextSize = 24
seedLabel.TextXAlignment = Enum.TextXAlignment.Right

-- Close Button
local closeBtn = Instance.new("TextButton", frame)
closeBtn.Size = UDim2.new(0, 30, 0, 30)
closeBtn.Position = UDim2.new(1, -35, 0, 5)
closeBtn.Text = "X"
closeBtn.Font = Enum.Font.SourceSans
closeBtn.TextSize = 18
closeBtn.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
closeBtn.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", closeBtn).CornerRadius = UDim.new(0, 8)

-- Floating Reopen Button
local floatBtn = Instance.new("TextButton", screenGui)
floatBtn.Size = UDim2.new(0, 120, 0, 30)
floatBtn.Position = UDim2.new(0, 10, 1, -50)
floatBtn.Text = "Open Pet UI"
floatBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
floatBtn.TextColor3 = Color3.new(1, 1, 1)
floatBtn.Visible = false
floatBtn.Font = Enum.Font.SourceSans
floatBtn.TextSize = 16
Instance.new("UICorner", floatBtn).CornerRadius = UDim.new(0, 10)

closeBtn.MouseButton1Click:Connect(function()
    frame.Visible = false
    floatBtn.Visible = true
end)

floatBtn.MouseButton1Click:Connect(function()
    frame.Visible = true
    floatBtn.Visible = false
end)

-- Pet Name Box
local nameBox = Instance.new("TextBox", frame)
nameBox.Size = UDim2.new(0.9, 0, 0, 30)
nameBox.Position = UDim2.new(0.05, 0, 0.18, 0)
nameBox.PlaceholderText = "Pet Name"
nameBox.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
nameBox.PlaceholderColor3 = Color3.new(1, 1, 1)
nameBox.TextColor3 = Color3.new(1, 1, 1)
nameBox.Text = ""
nameBox.Font = Enum.Font.SourceSans
nameBox.TextSize = 18
nameBox.ClearTextOnFocus = false
Instance.new("UICorner", nameBox).CornerRadius = UDim.new(0, 6)

-- Weight Box
local weightBox = Instance.new("TextBox", frame)
weightBox.Size = UDim2.new(0.42, 0, 0, 30)
weightBox.Position = UDim2.new(0.05, 0, 0.38, 0)
weightBox.PlaceholderText = "Weight"
weightBox.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
weightBox.PlaceholderColor3 = Color3.new(1, 1, 1)
weightBox.TextColor3 = Color3.new(1, 1, 1)
weightBox.Text = ""
weightBox.Font = Enum.Font.SourceSans
weightBox.TextSize = 18
Instance.new("UICorner", weightBox).CornerRadius = UDim.new(0, 6)

-- Age Box
local ageBox = Instance.new("TextBox", frame)
ageBox.Size = UDim2.new(0.42, 0, 0, 30)
ageBox.Position = UDim2.new(0.53, 0, 0.38, 0)
ageBox.PlaceholderText = "Age"
ageBox.BackgroundColor3 = Color3.fromRGB(140, 140, 140)
ageBox.PlaceholderColor3 = Color3.new(1, 1, 1)
ageBox.TextColor3 = Color3.new(1, 1, 1)
ageBox.Text = ""
ageBox.Font = Enum.Font.SourceSans
ageBox.TextSize = 18
Instance.new("UICorner", ageBox).CornerRadius = UDim.new(0, 6)

-- Numbers only
local function numericOnly(box)
    box:GetPropertyChangedSignal("Text"):Connect(function()
        box.Text = box.Text:gsub("%D", "")
    end)
end
numericOnly(weightBox)
numericOnly(ageBox)

-- SPAWN Button
local spawnBtn = Instance.new("TextButton", frame)
spawnBtn.Text = "SPAWN PET"
spawnBtn.Size = UDim2.new(0.9, 0, 0, 30)
spawnBtn.Position = UDim2.new(0.05, 0, 0.6, 0)
spawnBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.Font = Enum.Font.SourceSans
spawnBtn.TextSize = 18
Instance.new("UICorner", spawnBtn).CornerRadius = UDim.new(0, 8)

spawnBtn.MouseButton1Click:Connect(function()
    print("Spawning:", nameBox.Text, " | Weight:", weightBox.Text, " | Age:", ageBox.Text)
end)

-- DUPE Button
local dupeBtn = Instance.new("TextButton", frame)
dupeBtn.Text = "DUPE PET"
dupeBtn.Size = UDim2.new(0.9, 0, 0, 30)
dupeBtn.Position = UDim2.new(0.05, 0, 0.78, 0)
dupeBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
dupeBtn.TextColor3 = Color3.new(1, 1, 1)
dupeBtn.Font = Enum.Font.SourceSans
dupeBtn.TextSize = 18
Instance.new("UICorner", dupeBtn).CornerRadius = UDim.new(0, 8)

local knownPets = { "Bee", "Slime", "Chick", "Bat", "Pupper" }

dupeBtn.MouseButton1Click:Connect(function()
    local character = player.Character
    if not character then return end

    local held = character:FindFirstChildOfClass("Tool")
    if not held then return end

    local isPet = false
    for _, name in ipairs(knownPets) do
        if held.Name:lower():find(name:lower()) then
            isPet = true
            break
        end
    end

    if isPet then
        local clone = held:Clone()
        clone.Parent = backpack

        local handle = clone:FindFirstChild("Handle")
        if handle then
            local animator = handle:FindFirstChildWhichIsA("Animator") or handle:FindFirstChildWhichIsA("AnimationController")
            if not animator then
                animator = Instance.new("AnimationController")
                animator.Name = "Animator"
                animator.Parent = handle
            end

            local anim = handle:FindFirstChildWhichIsA("Animation")
            if anim then
                local track = animator:LoadAnimation(anim)
                track:Play()
            end
        end
    else
        warn("That item is not a supported pet.")
    end
end)
