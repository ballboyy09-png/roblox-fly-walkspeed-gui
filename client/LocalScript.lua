-- LocalScript.lua
walkBox.Parent = walkRow


local walkSet = Instance.new("TextButton")
walkSet.Size = UDim2.new(0.2, 0, 1, 0)
walkSet.Position = UDim2.new(0.82, 0, 0, 0)
walkSet.Text = "Set"
walkSet.Font = Enum.Font.SourceSansBold
walkSet.TextSize = 14
walkSet.Parent = walkRow


local closeBtn = Instance.new("TextButton")
closeBtn.Name = "Close"
closeBtn.Size = UDim2.new(1, -12, 0, 28)
closeBtn.Text = "Close"
closeBtn.Font = Enum.Font.SourceSans
closeBtn.TextSize = 14
closeBtn.Parent = main


flyButton.MouseButton1Click:Connect(function()
if flying then
disableFly()
flyButton.Text = "Toggle Fly (F)"
else
enableFly()
flyButton.Text = "Disable Fly"
end
end)


flyPlus.MouseButton1Click:Connect(function()
local val = tonumber(flyBox.Text) or flySpeed
val = clamp(val + 5, MIN_FLY_SPEED, MAX_FLY_SPEED)
flyBox.Text = tostring(math.floor(val))
flySpeed = val
end)


flyBox.FocusLost:Connect(function(enterPressed)
local val = tonumber(flyBox.Text)
if val then
flySpeed = clamp(val, MIN_FLY_SPEED, MAX_FLY_SPEED)
flyBox.Text = tostring(math.floor(flySpeed))
else
flyBox.Text = tostring(math.floor(flySpeed))
end
end)


walkSet.MouseButton1Click:Connect(function()
local val = tonumber(walkBox.Text)
if not val then
walkBox.Text = tostring(humanoid and humanoid.WalkSpeed or DEFAULT_WALKSPEED)
return
end
val = clamp(val, MIN_WALKSPEED, MAX_WALKSPEED)
if humanoid then
humanoid.WalkSpeed = val
end
walkBox.Text = tostring(math.floor(val))
end)


closeBtn.MouseButton1Click:Connect(function()
screenGui.Enabled = not screenGui.Enabled
end)


flyBox.Text = tostring(math.floor(flySpeed))
if humanoid then walkBox.Text = tostring(math.floor(humanoid.WalkSpeed or DEFAULT_WALKSPEED)) end
end


spawn(function()
createGui()
end)


print("Fly & WalkSpeed GUI script loaded (client-only)")
