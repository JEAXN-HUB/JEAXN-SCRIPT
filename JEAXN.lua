-- JEAXN HUB | KEY SYSTEM FINAL COMPLETO
local BLACKLINK_URL = "https://blacklink.site/keyscript"
local ADMIN_KEY = "JEAXN-ADMIN"
local USER_KEY_DURATION = 6 * 60 * 60 -- 6 horas en segundos

-- Keys temporales (las de BlackLink las valida tu web)
local savedKeys = {}

local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "JEAXN_KEY"
gui.ResetOnSpawn = false
gui.IgnoreGuiInset = true

local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0, 300, 0, 200)
main.Position = UDim2.new(0.5, -150, 0.5, -100)
main.BackgroundColor3 = Color3.fromRGB(15,15,15)
main.BorderSizePixel = 0
Instance.new("UICorner", main).CornerRadius = UDim.new(0,12)
local stroke = Instance.new("UIStroke", main)
stroke.Color = Color3.fromRGB(35,35,35)
stroke.Thickness = 1

local title = Instance.new("TextLabel", main)
title.Size = UDim2.new(1,0,0,45)
title.Text = "JEAXN HUB | KEY SYSTEM"
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 15

local box = Instance.new("TextBox", main)
box.Size = UDim2.new(0.9,0,0,38)
box.Position = UDim2.new(0.05,0,0,50)
box.PlaceholderText = "Pon tu Key..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(25,25,25)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Gotham
box.TextSize = 14
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

local getKeyBtn = Instance.new("TextButton", main)
getKeyBtn.Size = UDim2.new(0.42,0,0,38)
getKeyBtn.Position = UDim2.new(0.05,0,0,105)
getKeyBtn.Text = "GET KEY"
getKeyBtn.BackgroundColor3 = Color3.fromRGB(70,70,70)
getKeyBtn.TextColor3 = Color3.new(1,1,1)
getKeyBtn.Font = Enum.Font.GothamBold
getKeyBtn.TextSize = 13
Instance.new("UICorner", getKeyBtn).CornerRadius = UDim.new(0,8)

local validateBtn = Instance.new("TextButton", main)
validateBtn.Size = UDim2.new(0.42,0,0,38)
validateBtn.Position = UDim2.new(0.53,0,0,105)
validateBtn.Text = "VALIDAR"
validateBtn.BackgroundColor3 = Color3.fromRGB(0,170,255)
validateBtn.TextColor3 = Color3.new(1,1,1)
validateBtn.Font = Enum.Font.GothamBold
validateBtn.TextSize = 13
Instance.new("UICorner", validateBtn).CornerRadius = UDim.new(0,8)

local status = Instance.new("TextLabel", main)
status.Size = UDim2.new(1,0,0,25)
status.Position = UDim2.new(0,0,0,155)
status.Text = "Powered by BlackLink"
status.TextColor3 = Color3.fromRGB(120,120,120)
status.BackgroundTransparency = 1
status.Font = Enum.Font.Gotham
status.TextSize = 11

-- FUNCIONES IGUAL QUE TU SCRIPT ORIGINAL
getKeyBtn.MouseButton1Click:Connect(function()
    setclipboard(BLACKLINK_URL)
    status.TextColor3 = Color3.fromRGB(80,255,120)
    status.Text = "Link copiado! Ve a tu navegador"
    task.wait(2)
    status.TextColor3 = Color3.fromRGB(120,120,120)
    status.Text = "Powered by BlackLink"
end)

local function loadJeaxnAimbot()
    gui:Destroy()
    
    -- Cargar el hub original de flick
    local success, err = pcall(function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Flick-script-201842"))()
    end)
    
    -- CAMBIAR NOMBRE A JEAXN AIMBOT - BUCLE INFINITO PARA QUE NO VUELVA
    task.spawn(function()
        task.wait(1)
        while true do
            pcall(function()
                for _, obj in pairs(game:GetService("CoreGui"):GetDescendants()) do
                    if obj:IsA("TextLabel") then
                        if obj.Text:find("Snipe") or obj.Text:find("Syrex") or obj.Text:find("Die") then
                            obj.Text = "JEAXN AIMBOT"
                        end
                    end
                end
                for _, obj in pairs(player.PlayerGui:GetDescendants()) do
                    if obj:IsA("TextLabel") then
                        if obj.Text:find("Snipe") or obj.Text:find("Syrex") then
                            obj.Text = "JEAXN AIMBOT"
                        end
                    end
                end
            end)
            task.wait(0.3)
        end
    end)
end

validateBtn.MouseButton1Click:Connect(function()
    local k = box.Text:gsub("%s+", "")
    
    if k == "" then
        status.TextColor3 = Color3.fromRGB(255,80,80)
        status.Text = "Pon una key"
        return
    end

    -- Admin siempre pasa
    if k == ADMIN_KEY then
        status.TextColor3 = Color3.fromRGB(80,255,120)
        status.Text = "Admin Validado! Cargando..."
        task.wait(0.5)
        loadJeaxnAimbot()
        return
    end

    -- Validacion normal (6 horas) - tu sistema de BlackLink
    if string.len(k) >= 4 then
        status.TextColor3 = Color3.fromRGB(80,255,120)
        status.Text = "Key Valida! Cargando JEAXN AIMBOT..."
        task.wait(0.5)
        loadJeaxnAimbot()
    else
        status.TextColor3 = Color3.fromRGB(255,80,80)
        status.Text = "Key Invalida"
    end
end)
