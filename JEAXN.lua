-- JEAXN HUB | FIX FLY MOBILE + SPEED 35 + NAME | BY JEAXN
local BLACKLINK_URL = "https://blacklink.site/keyscript"
local ADMIN_KEY = "JEAXN-ADMIN"
local player = game.Players.LocalPlayer
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JEAXN_KEY_SYSTEM"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 320, 0, 230)
main.Position = UDim2.new(0.5, -160, 0.5, -115)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", main).CornerRadius = UDim.new(0,14)
Instance.new("UIStroke", main).Color = Color3.fromRGB(40,40,40)
local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,50)
title.Text = "JEAXN HUB | KEY SYSTEM"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16
local box = Instance.new("TextBox", main)
box.Size = UDim2.new(0.9,0,0,42)
box.Position = UDim2.new(0.05,0,0,70)
box.PlaceholderText = "Pon tu Key aquí..."
box.BackgroundColor3 = Color3.fromRGB(25,25,25)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.GothamMedium
box.TextSize = 14
Instance.new("UICorner", box).CornerRadius = UDim.new(0,10)
local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Size = UDim2.new(0.42,0,0,42)
getKeyBtn.Position = UDim2.new(0.05,0,0,130)
getKeyBtn.Text = "GET KEY"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0,10)
local validateBtn = Instance.new("TextButton", main)
validateBtn.Size = UDim2.new(0.42,0,0,42)
validateBtn.Position = UDim2.new(0.53,0,0,130)
validateBtn.Text = "VALIDAR"
validateBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
validateBtn.TextColor3 = Color3.new(1,1,1)
validateBtn.Font = Enum.Font.GothamBold
Instance.new("UICorner", validateBtn).CornerRadius = UDim.new(0,10)
local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1,0,0,30)
status.Position = UDim2.new(0,0,0,185)
status.Text = "Powered by BlackLink - JEAXN HUB"
status.TextColor3 = Color3.fromRGB(110,110,110)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 11
getKeyBtn.MouseButton1Click:Connect(function() setclipboard(BLACKLINK_URL) status.Text = "Link copiado!" end)

local function loadJeaxnHub()
    gui:Destroy()
    -- AIMBOT ORIGINAL
    loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flick-script-201842"))()
    task.wait(1.5)

    -- PANEL JEAXN EXTRA FIX
    local botGui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
    botGui.Name = "JEAXN_EXTRA"
    botGui.ResetOnSpawn = false

    local panel = Instance.new("Frame", botGui)
    panel.Size = UDim2.new(0, 160, 0, 160)
    panel.Position = UDim2.new(0, 20, 0.5, -80)
    panel.BackgroundColor3 = Color3.fromRGB(15,15,15)
    panel.Active = true
    panel.Draggable = true
    Instance.new("UICorner", panel).CornerRadius = UDim.new(0,12)
    Instance.new("UIStroke", panel).Color = Color3.fromRGB(40,40,40)

    local panelTitle = Instance.new("TextLabel", panel)
    panelTitle.Size = UDim2.new(1,0,0,28)
    panelTitle.Text = "JEAXN HUB"
    panelTitle.TextColor3 = Color3.new(1,1,1)
    panelTitle.BackgroundTransparency = 1
    panelTitle.Font = Enum.Font.GothamBold
    panelTitle.TextSize = 13

    local flyBtn = Instance.new("TextButton", panel)
    flyBtn.Size = UDim2.new(0.9,0,0,32)
    flyBtn.Position = UDim2.new(0.05,0,0,35)
    flyBtn.Text = "FLY: OFF"
    flyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    flyBtn.TextColor3 = Color3.new(1,1,1)
    flyBtn.Font = Enum.Font.GothamBold
    flyBtn.TextSize = 12
    Instance.new("UICorner", flyBtn).CornerRadius = UDim.new(0,8)

    local upBtn = Instance.new("TextButton", panel)
    upBtn.Size = UDim2.new(0.42,0,0,30)
    upBtn.Position = UDim2.new(0.05,0,0,75)
    upBtn.Text = "SUBIR"
    upBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    upBtn.TextColor3 = Color3.new(1,1,1)
    upBtn.Font = Enum.Font.GothamBold
    upBtn.TextSize = 11
    Instance.new("UICorner", upBtn).CornerRadius = UDim.new(0,8)

    local downBtn = Instance.new("TextButton", panel)
    downBtn.Size = UDim2.new(0.42,0,0,0,30)
    downBtn.Size = UDim2.new(0.42,0,0,30)
    downBtn.Position = UDim2.new(0.53,0,0,75)
    downBtn.Text = "BAJAR"
    downBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    downBtn.TextColor3 = Color3.new(1,1,1)
    downBtn.Font = Enum.Font.GothamBold
    downBtn.TextSize = 11
    Instance.new("UICorner", downBtn).CornerRadius = UDim.new(0,8)

    local speedBtn = Instance.new("TextButton", panel)
    speedBtn.Size = UDim2.new(0.9,0,0,32)
    speedBtn.Position = UDim2.new(0.05,0,0,115)
    speedBtn.Text = "SPEED: OFF [16]"
    speedBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
    speedBtn.TextColor3 = Color3.new(1,1,1)
    speedBtn.Font = Enum.Font.GothamBold
    speedBtn.TextSize = 12
    Instance.new("UICorner", speedBtn).CornerRadius = UDim.new(0,8)

    -- LOGICA FLY PARA CELULAR (ARREGLADO)
    local flying = false
    local flySpeed = 35
    local bv, bg, conn
    local up, down = false, false

    upBtn.MouseButton1Down:Connect(function() up = true end)
    upBtn.MouseButton1Up:Connect(function() up = false end)
    downBtn.MouseButton1Down:Connect(function() down = true end)
    downBtn.MouseButton1Up:Connect(function() down = false end)

    flyBtn.MouseButton1Click:Connect(function()
        flying = not flying
        local char = player.Character
        local hrp = char and char:FindFirstChild("HumanoidRootPart")
        local hum = char and char:FindFirstChild("Humanoid")
        if not hrp then return end
        if flying then
            flyBtn.Text = "FLY: ON"
            flyBtn.BackgroundColor3 = Color3.fromRGB(80,255,120)
            hum.PlatformStand = true
            bv = Instance.new("BodyVelocity", hrp)
            bv.Name = "JEAXN_FLY_V"
            bv.MaxForce = Vector3.new(9e9,9e9,9e9)
            bg = Instance.new("BodyGyro", hrp)
            bg.Name = "JEAXN_FLY_G"
            bg.MaxTorque = Vector3.new(9e9,9e9,9e9)
            bg.P = 9e4
            conn = RunService.Heartbeat:Connect(function()
                if not flying then return end
                local cam = workspace.CurrentCamera.CFrame
                local moveDir = hum.MoveDirection
                local vel = (cam.RightVector * moveDir.X + cam.LookVector * moveDir.Z * -1) * flySpeed * 1.5
                -- Si no se mueve el joystick, queda quieto (no se va solo)
                if moveDir.Magnitude < 0.1 then vel = Vector3.new(0,0,0) end
                if up then vel = vel + Vector3.new(0,flySpeed,0) end
                if down then vel = vel - Vector3.new(0,flySpeed,0) end
                -- Controles PC tambien
                if UserInputService:IsKeyDown(Enum.KeyCode.Space) then vel = vel + Vector3.new(0,flySpeed,0) end
                if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) then vel = vel - Vector3.new(0,flySpeed,0) end
                bv.Velocity = vel
                bg.CFrame = cam
            end)
        else
            flyBtn.Text = "FLY: OFF"
            flyBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            if conn then conn:Disconnect() end
            if hrp:FindFirstChild("JEAXN_FLY_V") then hrp.JEAXN_FLY_V:Destroy() end
            if hrp:FindFirstChild("JEAXN_FLY_G") then hrp.JEAXN_FLY_G:Destroy() end
            hum.PlatformStand = false
        end
    end)

    -- SPEED BAJO
    local speedOn = false
    speedBtn.MouseButton1Click:Connect(function()
        speedOn = not speedOn
        if speedOn then
            speedBtn.Text = "SPEED: ON [35]"
            speedBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
        else
            speedBtn.Text = "SPEED: OFF [16]"
            speedBtn.BackgroundColor3 = Color3.fromRGB(60,60,60)
            pcall(function() player.Character.Humanoid.WalkSpeed = 16 end)
        end
    end)
    RunService.Stepped:Connect(function()
        if speedOn then
            pcall(function() if player.Character.Humanoid then player.Character.Humanoid.WalkSpeed = 35 end end)
        end
    end)

    -- PONER TU NOMBRE EN TODO EL MENU
    task.spawn(function()
        while true do
            pcall(function()
                for _, v in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    if v:IsA("TextLabel") then
                        local t = v.Text:lower()
                        if t:find("snipe") or t:find("syrex") or t:find("flick") or t:find("aimbot") then
                            v.Text = "JEAXN HUB"
                        end
                        if t:find("esp") then
                            v.Text = "JEAXN ESP"
                        end
                    end
                end
            end)
            task.wait(0.2)
        end
    end)
end

validateBtn.MouseButton1Click:Connect(function()
    if box.Text:gsub("%s+","") ~= "" then loadJeaxnHub() end
end)
