-- JEAXN HUB | FLICK AIMBOT ORIGINAL + TU KEY SYSTEM + FOV + ESP
local Players = game:GetService("Players")
local HS = game:GetService("HttpService")
local LP = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local RunService = game:GetService("RunService")

local API = "https://blacklink.site/api/llave.php"
local LINK = "https://blacklink.site/keyscript"

local function checkKey(k)
    if not k or #k < 5 then return false end
    local ok, res = pcall(function()
        if syn and syn.request then return syn.request({Url=API.."?k="..k, Method="GET"}).Body
        elseif http_request then return http_request({Url=API.."?k="..k, Method="GET"}).Body
        else return game:HttpGet(API.."?k="..k) end
    end)
    if not ok then return false end
    local ok2, data = pcall(function() return HS:JSONDecode(res) end)
    return ok2 and data.valida == true
end

local function JEAXN_LOAD()
    -- CONFIG JEAXN
    getgenv().JEAXN_FOV = 150
    getgenv().JEAXN_ESP_COLOR = Color3.fromRGB(255,0,0)

    -- FOV CIRCLE
    local FOVCircle = Drawing.new("Circle")
    FOVCircle.Thickness = 2
    FOVCircle.NumSides = 100
    FOVCircle.Filled = false
    FOVCircle.Visible = true
    FOVCircle.Color = Color3.fromRGB(255,255,255)
    RunService.RenderStepped:Connect(function()
        FOVCircle.Position = Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)
        FOVCircle.Radius = getgenv().JEAXN_FOV
    end)

    -- === AIMBOT FLICK ORIGINAL (TUVO QUE PEGARTE AQUI) ===
    local Settings = {
        ["AimAssist"] = true,
        ["FlickAimAssist"] = true,
        ["FEHitboxExpanded"] = false,
        ["Size"] = 55,
        ["Debug"] = false,
    }

    local function GetClosePlayer()
        local closest = nil
        local shortest = getgenv().JEAXN_FOV
        for _,player in pairs(Players:GetPlayers()) do
            if player ~= LP and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
                local screenPos, onScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
                if onScreen then
                    local dist = (Vector2.new(screenPos.X, screenPos.Y) - Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                    if dist < shortest then
                        closest = player
                        shortest = dist
                    end
                end
            end
        end
        return closest
    end

    -- FLICK AIMBOT
    RunService.RenderStepped:Connect(function()
        if Settings["AimAssist"] then
            local target = GetClosePlayer()
            if target and target.Character and target.Character:FindFirstChild("Head") then
                Camera.CFrame = CFrame.new(Camera.CFrame.Position, target.Character.Head.Position)
            end
        end
    end)
    -- === FIN AIMBOT FLICK ===

    -- ESP JEAXN CON COLORES
    local function AddESP(p)
        if p == LP then return end
        local function create(char)
            if char:FindFirstChild("JEAXN_ESP") then char.JEAXN_ESP:Destroy() end
            local hl = Instance.new("Highlight", char)
            hl.Name = "JEAXN_ESP"
            hl.FillTransparency = 0.6
            hl.OutlineTransparency = 0
            hl.FillColor = get
