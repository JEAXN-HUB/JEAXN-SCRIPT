-- JEAXN | KEY SYSTEM 6H + AIM MOBILE + ESP CONFIG - FINAL
local Players = game:GetService("Players")
local HS = game:GetService("HttpService")
local UIS = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LP = Players.LocalPlayer
local Camera = Workspace.CurrentCamera

local API = "https://blacklink.site/api/llave.php"
local LINK = "https://blacklink.site/keyscript"

-- CONFIGURACION
local CONFIG = {
    Smooth = 0.2,
    MaxDistance = 400,
    TeamCheck = true,
    ESP_Color = Color3.fromRGB(255, 0, 0), -- CAMBIA COLOR AQUI: Rojo, Azul, Verde, etc
    ESP_Enabled = true
}

local function checkKey(k)
    if not k or #k < 5 then return false end
    local ok, res = pcall(function()
        if syn and syn.request then
            return syn.request({Url = API.."?k="..k, Method = "GET"}).Body
        elseif http_request then
            return http_request({Url = API.."?k="..k, Method = "GET"}).Body
        else
            return game:HttpGet(API.."?k="..k)
        end
    end)
    if not ok then return false end
    local ok2, data = pcall(function() return HS:JSONDecode(res) end)
    return ok2 and data.valida == true
end

local function LoadJEAXN()
    local Enabled = true
    local Enemies = {}

    -- GUI AIM
    local g2 = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
    g2.Name = "JEAXN_AIM"
    g2.ResetOnSpawn = false

    local btn = Instance.new("TextButton", g2)
    btn.Size = UDim2.new(0, 110, 0, 45)
    btn.Position = UDim2.new(1, -120, 1, -90)
    btn.Text = "🎯 AIM: ON"
    btn.BackgroundColor3 = Color3.fromRGB(0, 170, 0)
    btn.TextColor3 = Color3.new(1,1,1)
    btn.TextSize = 14
    btn.Font = Enum.Font.GothamBold
    Instance.new("UICorner", btn).CornerRadius = UDim.new(0,8)

    local function updateBtn()
        btn.Text = Enabled and "🎯 AIM: ON" or "🎯 AIM: OFF"
        btn.BackgroundColor3 = Enabled and Color3.fromRGB(0,170,0) or Color3.fromRGB(170,0,0)
    end
    btn.MouseButton1Click:Connect(function() Enabled = not Enabled updateBtn() end)

    -- ESP FUNCIONES
    local function AddESP(p)
        if p == LP then return end
        local function create(char)
            if not CONFIG.ESP_Enabled then return end
            if char:FindFirstChild("JEAXN_ESP") then char.JEAXN_ESP:Destroy() end
            local hl = Instance.new("Highlight", char)
            hl.Name = "JEAXN_ESP"
            hl.FillTransparency = 0.6
            hl.OutlineTransparency = 0
            hl.OutlineColor = CONFIG.ESP_Color
            hl.FillColor = CONFIG.ESP_Color
            hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
        end
        if p.Character then create(p.Character) end
        p.CharacterAdded:Connect(function(char) task.wait(1) create(char) end)
    end

    for _, p in pairs(Players:GetPlayers()) do AddESP(p) end
    Players.PlayerAdded:Connect(AddESP)

    -- CAMBIAR COLOR ESP EN TIEMPO REAL
    local function UpdateAllESP()
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and p.Character:FindFirstChild("JEAXN_ESP") then
                p.Character.JEAXN_ESP.FillColor = CONFIG.ESP_Color
                p.Character.JEAXN_ESP.OutlineColor = CONFIG.ESP_Color
            end
        end
    end

    -- LOGICA AIM
    local function updateCache()
        local newE = {}
        local MyChar = LP.Character
        if not MyChar or not MyChar:FindFirstChild("HumanoidRootPart") then return end
        local MyPos = MyChar.HumanoidRootPart.Position
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= LP and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
                if CONFIG.TeamCheck and p.Team == LP.Team then continue end
                local hrp = p.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local d = (MyPos - hrp.Position).Magnitude
                    if d < CONFIG.MaxDistance then table.insert(newE, {RootPart = hrp, Distance = d}) end
                end
            end
        end
        Enemies = newE
    end

    local function FindClosest()
        local best, bestD = nil, math.huge
        updateCache()
        for _, e in pairs(Enemies) do if e.Distance < bestD then bestD = e.Distance best = e.RootPart end end
        return best
    end

    RunService.RenderStepped:Connect(function()
        if not Enabled then return end
        local target = FindClosest()
        if target then
            local look = (target.Position - Camera.CFrame.Position).Unit
            local new = Camera.CFrame.LookVector:Lerp(look, CONFIG.Smooth)
            Camera.CFrame = CFrame.new(Camera.CFrame.Position, Camera.CFrame.Position + new)
        end
    end)

    -- MENU DE COLOR ESP (MOBILE)
    local colorBtn = Instance.new("TextButton", g2)
    colorBtn.Size = UDim2.new(0, 110, 0, 35)
    colorBtn.Position = UDim2.new(1, -120, 1, -135)
    colorBtn.Text = "🎨 ESP COLOR"
    colorBtn.BackgroundColor3 = Color3.fromRGB(30,30,30)
    colorBtn.TextColor3 = Color3.new(1,1,1)
    colorBtn.Font = Enum.Font.GothamBold
    colorBtn.TextSize = 12
    Instance.new("UICorner", colorBtn).CornerRadius = UDim.new(0,8)

    local colors = {Color3.fromRGB(255,0,0), Color3.fromRGB(0,255,0), Color3.fromRGB(0,120,255), Color3.fromRGB(255,255,0), Color3.fromRGB(255,0,255)}
    local idx = 1
    colorBtn.MouseButton1Click:Connect(function()
        idx = idx + 1 if idx > #colors then idx = 1 end
        CONFIG.ESP_Color = colors[idx]
        colorBtn.BackgroundColor3 = colors[idx]
        UpdateAllESP()
    end)

    game.StarterGui:SetCore("SendNotification", {Title="JEAXN"; Text="Aim + ESP Activado!"; Duration=3})
end

-- KEY SYSTEM
if getgenv().Key and checkKey(getgenv().Key) then LoadJEAXN() return end

local g = Instance.new("ScreenGui", LP:WaitForChild("PlayerGui"))
g.Name = "JEAXN_KEY"
g.ResetOnSpawn = false

local f = Instance.new("Frame", g)
f.Size = UDim2.new(0,320,0,210)
f.Position = UDim2.new(0.5,-160,0.5,-105)
f.BackgroundColor3 = Color3.fromRGB(15,15,15)
Instance.new("UICorner", f).CornerRadius = UDim.new(0,12)

local t = Instance.new("TextLabel", f)
t.Size = UDim2.new(1,0,0,40)
t.Text = "JEAXN - KEY SYSTEM (6H)"
t.BackgroundTransparency = 1
t.TextColor3 = Color3.new(1,1,1)
t.Font = Enum.Font.GothamBold
t.TextSize = 16
t.Parent = f

local box = Instance.new("TextBox", f)
box.Size = UDim2.new(0,280,0,45)
box.Position = UDim2.new(0,20,0,50)
box.PlaceholderText = "Pega tu key aqui..."
box.Text = ""
box.BackgroundColor3 = Color3.fromRGB(30,30,30)
box.TextColor3 = Color3.new(1,1,1)
box.Font = Enum.Font.Gotham
Instance.new("UICorner", box).CornerRadius = UDim.new(0,8)

local verify = Instance.new("TextButton", f)
verify.Size = UDim2.new(0,280,0,40)
verify.Position = UDim2.new(0,20,0,105)
verify.Text = "VERIFY KEY"
verify.BackgroundColor3 = Color3.fromRGB(0,170,0)
verify.TextColor3 = Color3.new(1,1,1)
verify.Font = Enum.Font.GothamBold
Instance.new("UICorner", verify).CornerRadius = UDim.new(0,8)

local get = Instance.new("TextButton", f)
get.Size = UDim2.new(0,280,0,35)
get.Position = UDim2.new(0,20,0,155)
get.Text = "GET KEY [6H]"
get.BackgroundColor3 = Color3.fromRGB(0,120,255)
get.TextColor3 = Color3.new(1,1,1)
get.Font = Enum.Font.GothamBold
Instance.new("UICorner", get).CornerRadius = UDim.new(0,8)

get.MouseButton1Click:Connect(function() setclipboard(LINK) get.Text = "LINK COPIADO!" task.wait(2) get.Text = "GET KEY [6H]" end)
verify.MouseButton1Click:Connect(function()
    if checkKey(box.Text) then getgenv().Key = box.Text g:Destroy() LoadJEAXN()
    else verify.Text = "KEY INVALIDA!" verify.BackgroundColor3 = Color3.fromRGB(170,0,0) task.wait(1.2) verify.Text = "VERIFY KEY" verify.BackgroundColor3 = Color3.fromRGB(0,170,0) end
end)
