-- JEAXN V3 FINAL FIX DELTA MOBILE - NO DRAWING VERSION
local KEY = "JEAXN-ADMIN"
local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local PlayerGui = LP:WaitForChild("PlayerGui")

if PlayerGui:FindFirstChild("JEAXN_KEY") then PlayerGui:FindFirstChild("JEAXN_KEY"):Destroy() end
if PlayerGui:FindFirstChild("JEAXN_GOD") then PlayerGui:FindFirstChild("JEAXN_GOD"):Destroy() end

local KeyGui = Instance.new("ScreenGui", PlayerGui) 
KeyGui.Name = "JEAXN_KEY" 
KeyGui.ResetOnSpawn = false

local Main = Instance.new("Frame", KeyGui) 
Main.Size = UDim2.new(0,300,0,180) 
Main.Position = UDim2.new(0.5,-150,0.5,-90) 
Main.BackgroundColor3 = Color3.fromRGB(15,15,15) 
Main.Active = true 
Main.Draggable = true
Instance.new("UICorner",Main)
Instance.new("UIStroke",Main).Color = Color3.fromRGB(0,255,127)

local Title = Instance.new("TextLabel",Main) 
Title.Size = UDim2.new(1,0,0,50) 
Title.BackgroundTransparency = 1 
Title.Text = "JEAXN HUB V3" 
Title.TextColor3 = Color3.fromRGB(0,255,127) 
Title.Font = Enum.Font.GothamBold 
Title.TextSize = 22

local Box = Instance.new("TextBox",Main) 
Box.Size = UDim2.new(0.8,0,0,40) 
Box.Position = UDim2.new(0.1,0,0,60) 
Box.PlaceholderText = "Enter Key..." 
Box.Text = "" 
Box.BackgroundColor3 = Color3.fromRGB(25,25,25) 
Box.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Box)

local Btn = Instance.new("TextButton",Main) 
Btn.Size = UDim2.new(0.8,0,0,40) 
Btn.Position = UDim2.new(0.1,0,0,110) 
Btn.Text = "UNLOCK" 
Btn.BackgroundColor3 = Color3.fromRGB(0,255,127) 
Btn.TextColor3 = Color3.new(0,0,0)
Instance.new("UICorner",Btn)

local Info = Instance.new("TextLabel",Main) 
Info.Size = UDim2.new(1,0,0,20) 
Info.Position = UDim2.new(0,0,0,155) 
Info.BackgroundTransparency = 1 
Info.TextColor3 = Color3.fromRGB(255,60,60) 
Info.Text = ""

local function LoadHUB()
KeyGui:Destroy()
local HubGui = Instance.new("ScreenGui",PlayerGui) 
HubGui.Name = "JEAXN_GOD" 
HubGui.ResetOnSpawn = false

local FOVValue = 130
getgenv().JEAXN = {Silent=false, ESP=false}

-- CIRCULO CON FRAME (NO DRAWING) PARA DELTA
local CircleGui = Instance.new("Frame", HubGui)
CircleGui.Name = "FOVCircle"
CircleGui.Size = UDim2.new(0,260,0,260)
CircleGui.Position = UDim2.new(0.5,-130,0.5,-130)
CircleGui.BackgroundTransparency = 1
CircleGui.Visible = false
local CircleStroke = Instance.new("UIStroke", CircleGui)
CircleStroke.Color = Color3.fromRGB(0,255,0)
CircleStroke.Thickness = 2
local CircleCorner = Instance.new("UICorner", CircleGui)
CircleCorner.CornerRadius = UDim.new(1,0)

local function GetClosest()
    local closest,dist=nil,math.huge
    local center = Vector2.new(workspace.CurrentCamera.ViewportSize.X/2, workspace.CurrentCamera.ViewportSize.Y/2)
    for _,plr in pairs(Players:GetPlayers()) do
        if plr~=LP and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChild("Humanoid") and plr.Character.Humanoid.Health>0 then
            local pos,onScreen=workspace.CurrentCamera:WorldToViewportPoint(plr.Character.HumanoidRootPart.Position)
            if onScreen then
                local mag=(Vector2.new(pos.X,pos.Y)-center).Magnitude
                if mag<dist and mag<FOVValue then dist=mag closest=plr end
            end
        end
    end
    return closest
end

-- AIM BUTTON MOBILE
local AimBtn=Instance.new("TextButton",HubGui) 
AimBtn.Size=UDim2.new(0,80,0,80) 
AimBtn.Position=UDim2.new(1,-95,0.5,-40) 
AimBtn.Text="AIM" 
AimBtn.BackgroundColor3=Color3.fromRGB(0,255,127) 
AimBtn.TextColor3=Color3.new(0,0,0) 
AimBtn.Font=Enum.Font.GothamBlack 
AimBtn.TextSize=20 
AimBtn.Visible=false 
Instance.new("UICorner",AimBtn).CornerRadius=UDim.new(1,0)

AimBtn.MouseButton1Click:Connect(function() 
    local t=GetClosest() 
    if t and t.Character and t.Character:FindFirstChild("HumanoidRootPart") then 
        workspace.CurrentCamera.CFrame=CFrame.new(workspace.CurrentCamera.CFrame.Position, t.Character.HumanoidRootPart.Position) 
    end 
end)

-- HUB MENU
local Hub=Instance.new("Frame",HubGui) 
Hub.Size=UDim2.new(0,340,0,420) 
Hub.Position=UDim2.new(0.5,-170,0.5,-210) 
Hub.BackgroundColor3=Color3.fromRGB(12,12,12) 
Hub.Active=true 
Hub.Draggable=true 
Instance.new("UICorner",Hub) 
Instance.new("UIStroke",Hub).Color=Color3.fromRGB(0,255,127)

local Title2=Instance.new("TextLabel",Hub) 
Title2.Size=UDim2.new(1,0,0,45) 
Title2.BackgroundTransparency=1 
Title2.Text="  JEAXN V3 FIX" 
Title2.TextXAlignment=Enum.TextXAlignment.Left 
Title2.TextColor3=Color3.fromRGB(0,255,127) 
Title2.Font=Enum.Font.GothamBold 
Title2.TextSize=18

local Close=Instance.new("TextButton",Hub) 
Close.Size=UDim2.new(0,30,0,30) 
Close.Position=UDim2.new(1,-40,0,7) 
Close.Text="X" 
Close.BackgroundColor3=Color3.fromRGB(30,30,30) 
Close.TextColor3=Color3.new(1,1,1) 
Instance.new("UICorner",Close) 
Close.MouseButton1Click:Connect(function() HubGui:Destroy() end)

local Container=Instance.new("ScrollingFrame",Hub) 
Container.Size=UDim2.new(1,0,1,-45) 
Container.Position=UDim2.new(0,0,0,45) 
Container.BackgroundTransparency=1 
Container.CanvasSize=UDim2.new(0,0,0,600) 
Container.ScrollBarThickness=2

local List=Instance.new("UIListLayout",Container) 
List.Padding=UDim.new(0,8)

local function CreateToggle(name,callback)
    local F=Instance.new("Frame",Container) 
    F.Size=UDim2.new(1,-15,0,50) 
    F.BackgroundColor3=Color3.fromRGB(22,22,22) 
    Instance.new("UICorner",F)
    local L=Instance.new("TextLabel",F) 
    L.Size=UDim2.new(0.6,0,1,0) 
    L.Position=UDim2.new(0,10,0,0) 
    L.BackgroundTransparency=1 
    L.Text=name 
    L.TextXAlignment=Enum.TextXAlignment.Left 
    L.TextColor3=Color3.new(1,1,1) 
    L.Font=Enum.Font.GothamBold 
    L.TextSize=13
    local T=Instance.new("TextButton",F) 
    T.Size
