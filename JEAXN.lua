-- JEAXN HUB | COMPLETO + FLY + SPEED | BY JEAXN
local BLACKLINK_URL = "https://blacklink.site/keyscript"
local ADMIN_KEY = "JEAXN-ADMIN"
local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

-- KEY SYSTEM GUI (COMPLETO)
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JEAXN_KEY_SYSTEM"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 230)
main.Position = UDim2.new(0.5, -160, 0.5, -115)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.BorderSizePixel = 0
main.ClipsDescendants = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(40,40,40)
stroke.Thickness = 1.5
stroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border

local topBar = Instance.new("Frame", main)
topBar.Size = UDim2.new(1,0,0,50)
topBar.BackgroundColor3 = Color3.fromRGB(20,20,20)
topBar.BorderSizePixel = 0
Instance.new("UICorner", topBar).CornerRadius = UDim.new(0,14)
local fixCorner = Instance.new("Frame", topBar)
fixCorner.Size = UDim2.new(1,0,0,14)
fixCorner.Position = UDim2.new(0,0,1,-7)
fixCorner.BackgroundColor3 = Color3.fromRGB(20,20,20)
fixCorner.BorderSizePixel = 0
fixCorner.ZIndex = 0

local title = Instance.new("TextLabel", topBar)
title.Size = UDim2.new(1, -20, 1, 0)
title.Position = UDim2.new(0,10,0,0)
title.Text = "JEAXN HUB | KEY SYSTEM"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
title.TextXAlignment = Enum.TextXAlignment.Left
title.ZIndex = 2

local box = Instance.new("TextBox", main)
box.Size = UDim2.new(0.9,0,0,42)
box.Position = UDim2.new(0.05,0,0,70)
box.PlaceholderText = "Pon tu Key aquí..."
box.Text = ""
box.PlaceholderColor3 = Color3.fromRGB(100,100,100)
box.BackgroundColor3 = Color3.fromRGB(25,25,25)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.GothamMedium
box.TextSize = 14
box.ClearTextOnFocus = false
Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)
Instance.new("UIStroke", box).Color = Color3.fromRGB(35,35,35)

local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Size = UDim2.new(0.42,0,0,42)
getKeyBtn.Position = UDim2.new(0.05,0,0,130)
getKeyBtn.Text = "GET KEY"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 13
getKeyBtn.AutoButtonColor = false
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0,10)

local validateBtn = Instance.new("TextButton", main)
validateBtn.Size = UDim2.new(0.42,0,0,42)
validateBtn.Position = UDim2.new(0.53,0,0,130)
validateBtn.Text = "VALIDAR"
validateBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
validateBtn.TextColor3 = Color3.new(1,1,1)
validateBtn.Font = Enum.Font.GothamBold
validateBtn.TextSize = 13
validateBtn.AutoButtonColor = false
Instance.new("UICorner", validateBtn).CornerRadius = UDim.new(0,10)

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1,0,0,30)
status.Position = UDim2.new(0,0,0,185)
status.Text = "Powered by BlackLink - JEAXN HUB"
status.TextColor3 = Color3.fromRGB(110,110,110)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 11

-- ANIMACIONES BOTONES
local function tweenBtn(btn, color)
    local t = TweenService:Create(btn, TweenInfo.new(0.15), {BackgroundColor3 = color})
    t:Play()
end
getKeyBtn.MouseEnter:Connect(function() tweenBtn(getKeyBtn, Color3.fromRGB(90,90,90)) end)
getKeyBtn.MouseLeave:Connect(function() tweenBtn(getKeyBtn, Color3.fromRGB(70,70,70)) end)
validateBtn.MouseEnter:Connect(function() tweenBtn(validateBtn, Color3.fromRGB(20,190,255)) end)
validateBtn.MouseLeave:Connect(function() tweenBtn(validateBtn, Color3.fromRGB(0,170,255)) end)

getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(BLACKLINK_URL)
    status.TextColor3 = Color3.fromRGB(80,255,120)
    status.Text = "Link copiado al portapapeles!"
    task.wait(2.5)
    status.TextColor3 = Color3.fromRGB(110,110,110)
    status.Text = "Powered by BlackLink - JEAXN HUB"
end)

-- FUNCIONES FLY Y SPEED (BOT ON/OFF)
local flying = false
local speedOn = false
local flyBV, flyBG, flyConn

local function toggleFly()
    flying = not flying
    local char = player.Character
    if not char then return end
    local hrp = char:FindFirstChild("HumanoidRootPart")
    if not hrp then return end

    if flying then
        flyBV = Instance.new("BodyVelocity", hrp)
        flyBV.Name = "JEAXN_FLY_V"
        flyBV.Velocity = Vector3.new(0,0,0)
        flyBV.MaxForce = Vector3.new(9e9,9e9,9e9)
        flyBG = Instance.new("BodyGyro", hrp)
        flyBG.Name = "JEAXN_FLY_G"
        flyBG.MaxTorque = Vector3.new(9e9,9e9,9e9)
        flyBG.P = 9e4
        flyBG.D = 1000
        flyConn = RunService.Heartbeat:Connect(function()
            if not flying or not hrp:FindFirstChild("JEAXN_FLY_V") then return end
            local cam = workspace.CurrentCamera.CFrame
            local vel = Vector3.new(0,0,0)
            if UserInputService:IsKeyDown(Enum.KeyCode.W) then vel = vel + cam.LookVector * 70 end
            if UserInputService:IsKeyDown(Enum.KeyCode.S) then vel = vel - cam.LookVector * 70 end
            if UserInputService:IsKeyDown(Enum.KeyCode.A) then vel = vel - cam.RightVector * 70 end
            if UserInputService:IsKeyDown(Enum.KeyCode.D) then vel = vel + cam.RightVector * 70 end
            if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,70,0) end
            if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) or UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0,70,0) end
            flyBV.Velocity = vel
            flyBG.CFrame = cam
        end)
    else
        if flyConn then flyConn:Disconnect() end
        if hrp:FindFirstChild("JEAXN_FLY_V") then hrp.JEAXN_FLY_V:Destroy() end
        if hrp:FindFirstChild("JEAXN_FLY_G") then hrp.JEAXN_FLY_G:Destroy() end
    end
end

local function toggleSpeed()
    speedOn = not speedOn
end

RunService.Stepped:Connect(function()
    if speedOn then
        pcall(function()
            if player.Character and player.Character:FindFirstChild("Humanoid") then
                player.Character.Humanoid.WalkSpeed = 100
            end
        end)
    end
end)

-- CARGAR HUB PRINCIPAL
local function loadJeaxnHub()
    gui:Destroy()

    -- CARGAR TU AIMBOT ORIGINAL LARGO
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flick-script-201842"))()

    task.wait(1.2)

    -- PANEL BOT ON/OFF FLY Y SPEED (AGREGADO AL CODIGO LARGO)
    local botGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    botGui.Name = "JEAXN_EXTRA_BOT"
    botGui.ResetOnSpawn = false
    botGui.IgnoreGuiInset = true
    botGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

    local panel = Instance.new("Frame", botGui)
    panel.Size = UDim2.new(0, 150, 0, 100)
    panel.Position = UDim2.new(0, 20, 0.5, -50)
    panel.BackgroundColor3 = Color3.fromRGB(15,15,15)
    panel.BorderSizePixel = 0
    panel.Active = true
    panel.Draggable = true
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", panel).Color = Color3.fromRGB(40,40,40)

    local panelTitle = Instance.new("TextLabel", panel)
    panelTitle.Size = UDim2.new(1,0,0,25)
    panelTitle.Text = "JEAXN EXTRA"
    panelTitle.TextColor3 = Color3.new(1,1,1)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Font = Enum.Font.GothamBold
    panelTitle.TextSize = 12

    local flyBtn = Instance.new("TextButton", panel)
    flyBtn.Size = UDim2.new(0.9,0,0,30)
    flyBtn.Position = UDim2.new(0.05,0,0,30)
    flyBtn.Text = "FLY: OFF"
    flyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    flyBtn.TextColor3 = Color3.new(1,1,1)
    flyBtn.Font = Enum.Font.GothamBold
    flyBtn.TextSize = 12
    flyBtn.AutoButtonColor = false
    Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,8)

    local speedBtn = Instance.new("TextButton", panel)
    speedBtn.Size = UDim2.new(0.9,0,0,30)
    speedBtn.Position = UDim2.new(0.05,0,0,65)
    speedBtn.Text = "SPEED: OFF"
    speedBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    speedBtn.TextColor3 = Color3.new(1,1,1)
    speedBtn.Font = Enum.Font.GothamBold
    speedBtn.TextSize = 12
    speedBtn.AutoButtonColor = false
    Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0,8)

    flyBtn.MouseButton1Click:Connect(function()
        toggleFly()
        if flying then
            flyBtn.Text = "FLY: ON"
            flyBtn.BackgroundColor3 = Color3.fromRGB(80,255,120)
        else
            flyBtn.Text = "FLY: OFF"
            flyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
        end
    end)

    speedBtn.MouseButton1Click:Connect(function()
        toggleSpeed()
        if speedOn then
            speedBtn.Text = "SPEED: ON [100]"
            speedBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
        else
            speedBtn.Text = "SPEED: OFF"
            speedBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            pcall(function() player.Character.Humanoid.WalkSpeed = 16 end)
        end
    end)

    -- CAMBIAR NOMBRE A JEAXN AIMBOT (LOOP LARGO)
    task.spawn(function()
        while true do
            pcall(function()
                for _, obj in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    if obj:IsA("TextLabel") then
                        if obj.Text:find("Snipe") or obj.Text:find("Syrex") or obj.Text:find("Flick") then
                            obj.Text = "JEAXN AIMBOT"
                        end
                    end
                end
                for _, obj in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    if obj:IsA("TextLabel") and obj.Text:lower():find("perma") then
                        obj.Parent.Visible = false
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end

validateBtn.MouseButton1Click:Connect(function()
    local k = box.Text:gsub("%s+", ""):gsub("\n","")
    if k == ADMIN_KEY then
        status.TextColor3 = Color3.fromRGB(80,255,120)
        status.Text = "Admin Validado! Cargando..."
        task.wait(0.5)
        loadJeaxnHub()
        return
    end
    if string.len(k) >= 3 then
        status.TextColor3 = Color3.fromRGB(80,255,120)
        status.Text = "Key Valida! Cargando..."
        task.wait(0.5)
        loadJeaxnHub()
    else
        status.TextColor3 = Color3.fromRGB(255,80,80)
        status.Text = "Key Invalida, saca otra"
        TweenService:Create(main, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -155, 0.5, -115)}):Play()
        task.wait(0.1)
        TweenService:Create(main, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -165, 0.5, -115)}):Play()
        task.wait(0.1)
        TweenService:Create(main, TweenInfo.new(0.1), {Position = UDim2.new(0.5, -160, 0.5, -115)}):Play()
    end
end)

-- DRAG PARA EL MAIN
local dragging, dragInput, dragStart, startPos
main.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = main.Position
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then dragging = false end
        end)
    end
end)
main.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then dragInput = input end
end)
UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        local delta = input.Position - dragStart
        main.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
