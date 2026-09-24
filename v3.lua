-- JEAXN HUB V3 FINAL - SILENT + ESP + FOV - MOBILE | BY JEAXN
local KEY = "JEAXN-ADMIN"
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")
local Camera = workspace.CurrentCamera
local UserInput = game:GetService("UserInputService")

if PlayerGui:FindFirstChild("JEAXN_KEY") then PlayerGui:FindFirstChild("JEAXN_KEY"):Destroy() end
if PlayerGui:FindFirstChild("JEAXN_GOD") then PlayerGui:FindFirstChild("JEAXN_GOD"):Destroy() end

-- KEY SYSTEM GOD
local KeyGui = Instance.new("ScreenGui", PlayerGui) KeyGui.Name="JEAXN_KEY" KeyGui.ResetOnSpawn=false
local BG = Instance.new("Frame", KeyGui) BG.Size=UDim2.new(1,0,1,0) BG.BackgroundColor3=Color3.new(0,0,0) BG.BackgroundTransparency=0.3
local Main = Instance.new("Frame", KeyGui) Main.Size=UDim2.new(0,340,0,220) Main.Position=UDim2.new(0.5,-170,0.5,-110) Main.BackgroundColor3=Color3.fromRGB(15,15,15) Main.Active=true Main.Draggable=true Instance.new("UICorner",Main).CornerRadius=UDim.new(0,16) Instance.new("UIStroke",Main).Color=Color3.fromRGB(0,255,127)
local Title=Instance.new("TextLabel",Main) Title.Size=UDim2.new(1,0,0,50) Title.Position=UDim2.new(0,0,0,10) Title.BackgroundTransparency=1 Title.Text="JEAXN HUB" Title.TextColor3=Color3.fromRGB(0,255,127) Title.Font=Enum.Font.GothamBlack Title.TextSize=30
local Box=Instance.new("TextBox",Main) Box.Size=UDim2.new(0.85,0,0,45) Box.Position=UDim2.new(0.075,0,0,70) Box.PlaceholderText="Enter Key..." Box.Text="" Box.BackgroundColor3=Color3.fromRGB(25,25,25) Box.TextColor3=Color3.new(1,1,1) Box.Font=Enum.Font.GothamMedium Box.TextSize=15 Instance.new("UICorner",Box)
local Btn=Instance.new("TextButton",Main) Btn.Size=UDim2.new(0.85,0,0,45) Btn.Position=UDim2.new(0.075,0,0,125) Btn.Text="UNLOCK" Btn.BackgroundColor3=Color3.fromRGB(0,255,127) Btn.TextColor3=Color3.new(0,0,0) Btn.Font=Enum.Font.GothamBold Btn.TextSize=16 Instance.new("UICorner",Btn)
local Info=Instance.new("TextLabel",Main) Info.Size=UDim2.new(1,0,0,20) Info.Position=UDim2.new(0,0,0,185) Info.BackgroundTransparency=1 Info.TextColor3=Color3.fromRGB(255,60,60) Info.Font=Enum.Font.GothamMedium Info.TextSize=13 Info.Text=""

local function LoadHUB()
KeyGui:Destroy()
local HubGui=Instance.new("ScreenGui",PlayerGui) HubGui.Name="JEAXN_GOD" HubGui.ResetOnSpawn=false
getgenv().JEAXN = {FOV=130, Silent=false, ESP=false}

local FOVCircle=Drawing.new("Circle") FOVCircle.Color=Color3.fromRGB(0,255,0) FOVCircle.Thickness=2.5 FOVCircle.Radius=getgenv().JEAXN.FOV FOVCircle.Visible=false FOVCircle.NumSides=80 FOVCircle.Transparency=1
RunService.RenderStepped:Connect(function() FOVCircle.Position=Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2) FOVCircle.Radius=getgenv().JEAXN.FOV end)

local function GetClosest()
    local closest,dist=nil,math.huge
    for _,plr in pairs(Players:GetPlayers()) do
        if plr~=LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character.Humanoid.Health>0 then
            local pos,onScreen=Camera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local mag=(Vector2.new(pos.X,pos.Y)-Vector2.new(Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2)).Magnitude
                if mag<dist and mag<getgenv().JEAXN.FOV then dist=mag closest=plr end
            end
        end
    end
    return closest
end

pcall(function()
    local Old; Old = hookmetamethod(game, "__namecall", function(self,...)
        local args={...} local method=getnamecallmethod()
        if getgenv().JEAXN.Silent and not checkcaller() and method=="FindPartOnRayWithIgnoreList" then
            local target=GetClosest()
            if target and target.Character:FindFirstChild("Head") then
                args[1]=Ray.new(Camera.CFrame.Position, (target.Character.Head.Position-Camera.CFrame.Position).Unit*1000)
                return Old(self, unpack(args))
            end
        end
        return Old(self,...)
    end)
end)

local AimBtn=Instance.new("TextButton",HubGui) AimBtn.Size=UDim2.new(0,80,0,80) AimBtn.Position=UDim2.new(1,-95,0.55,-40) Aim
