-- JEAXN HUB - FLICK ORIGINAL + KEY SYSTEM
local HS = game:GetService("HttpService")
local LP = game:GetService("Players").LocalPlayer
local API = "https://blacklink.site/api/llave.php"
local FLICK_URL = "https://rawscripts.net/raw/Universal-Script-Flick-script-201842"

if LP.PlayerGui:FindFirstChild("JEAXN_KEY") then
    LP.PlayerGui.JEAXN_KEY:Destroy()
end

local function checkKey(k)
    if not k then return false end
    local clean = string.upper(string.gsub(k, "%s+", ""))
    if clean == "JEAXN-ADMIN" then
        return true, "admin"
    end
    local ok, res = pcall(function()
        return game:HttpGet(API.."?k="..k)
    end)
    if not ok then return false end
    local ok2, data = pcall(function() return HS:JSONDecode(res) end)
    if ok2 and data.valida == true then
        return true, "normal"
    end
    return false
end

-- GUI
local g = Instance.new("ScreenGui", LP.PlayerGui)
g.Name = "JEAXN_KEY"
g.ResetOnSpawn = false
g.IgnoreGuiInset = true

local f = Instance.new("Frame", g)
f.Size = UDim2.new(0,320,0,180)
f.Position = UDim2.new(0.5,-160,0.5,-90)
f.BackgroundColor3 = Color3.fromRGB(18,18,18)
f.BorderSizePixel = 0
Instance.new("UICorner", f).CornerRadius = UDim.new(0,12)
local stroke = Instance.new("UIStroke", f)
stroke.Color = Color3.fromRGB(0,120,255)
stroke.Thickness = 2

local title = Instance.new("TextLabel", f)
title.Size = UDim2.new(1,0,0,45)
title.Text = "JEAXN HUB | KEY SYSTEM"
title.TextColor3 = Color3.fromRGB(255,255,255)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 16

local box = Instance.new("TextBox", f)
box.Size = UDim2.new(0.85,0,0,40)
box.Position = UDim2.new(0.075,0,0,55)
box.PlaceholderText = "Pon tu key aqui..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
box.TextColor3 = Color3.fromRGB(255,255,255)
box.Font = Enum.Font.Gotham
box.TextSize = 14
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

local btn = Instance.new("TextButton", f)
btn.Size = UDim2.new(0.85,0,0,42)
btn.Position = UDim2.new(0.075,0,0,110)
btn.Text = "VALIDAR KEY"
btn.BackgroundColor3 = Color3.fromRGB(0,120,255)
btn.TextColor3 = Color3.fromRGB(255,255,255)
btn.Font = Enum.Font.GothamBold
btn.TextSize = 14
Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

local info = Instance.new("TextLabel", f)
info.Size = UDim2.new(1,0,0,20)
info.Position = UDim2.new(0,0,0,155)
info.Text = "Admin: JEAXN-ADMIN = Permanente | Users = 6 Horas"
info.TextColor3 = Color3.fromRGB(150,150,150)
info.BackgroundTransparency = 1
info.Font = Enum.Font.Gotham
info.TextSize = 10

btn.MouseButton1Click:Connect(function()
    local valid, tipo = checkKey(box.Text)
    if valid then
        g:Destroy()
        if tipo == "admin" then
            game.StarterGui:SetCore("SendNotification", {Title="JEAXN HUB", Text="ADMIN ACTIVADO - PERMANENTE", Duration=4})
        else
            game.StarterGui:SetCore("SendNotification", {Title="JEAXN HUB", Text="KEY VALIDA - 6 HORAS", Duration=4})
        end
        -- CARGAR TU FLICK ORIGINAL SIN TOCAR NADA
        loadstring(game:HttpGet(FLICK_URL))()
    else
        box.Text = ""
        box.PlaceholderText = "KEY INVALIDA!"
        task.wait(0.5)
        box.PlaceholderText = "Pon tu key aqui..."
    end
end)
