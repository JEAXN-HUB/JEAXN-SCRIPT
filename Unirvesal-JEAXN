-- JEAXN V3 UNDETECTED + KEY SYSTEM 6H
local KEY_CORRECT="JEAXN-ADMIN"
local KEY_TIME=21600 -- 6 horas en segundos

if getgenv().JEAXN_KeyValid and os.time() < getgenv().JEAXN_KeyExpire then
else
getgenv().JEAXN_KeyValid=false
local LP=game.Players.LocalPlayer
local gui=Instance.new("ScreenGui",LP.PlayerGui) gui.Name="JEAXN_KEY" gui.ResetOnSpawn=false
local main=Instance.new("Frame",gui) main.Size=UDim2.new(0,260,0,160) main.Position=UDim2.new(0.5,-130,0.5,-80) main.BackgroundColor3=Color3.fromRGB(15,15,15) main.Active=true main.Draggable=true Instance.new("UICorner",main)
local title=Instance.new("TextLabel",main) title.Size=UDim2.new(1,0,0,35) title.Text="JEAXN HUB - KEY" title.BackgroundColor3=Color3.fromRGB(0,120,255) title.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",title)
local box=Instance.new("TextBox",main) box.Size=UDim2.new(0.9,0,0,35) box.Position=UDim2.new(0.05,0,0,50) box.PlaceholderText="Ingresa Key: JEAXN-ADMIN" box.Text="" box.BackgroundColor3=Color3.fromRGB(30,30,30) box.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",box)
local btn=Instance.new("TextButton",main) btn.Size=UDim2.new(0.9,0,0,35) btn.Position=UDim2.new(0.05,0,0,95) btn.Text="Verificar Key" btn.BackgroundColor3=Color3.fromRGB(0,170,0) btn.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",btn)
local info=Instance.new("TextLabel",main) info.Size=UDim2.new(1,0,0,25) info.Position=UDim2.new(0,0,0,130) info.Text="Key dura 6H" info.BackgroundTransparency=1 info.TextColor3=Color3.new(1,1,1) info.TextScaled=true

btn.MouseButton1Click:Connect(function()
if box.Text==KEY_CORRECT then getgenv().JEAXN_KeyValid=true getgenv().JEAXN_KeyExpire=os.time()+KEY_TIME gui:Destroy() 
else info.Text="KEY INCORRECTA" info.TextColor3=Color3.fromRGB(255,0,0) end
end)
repeat task.wait() until getgenv().JEAXN_KeyValid
end

-- AQUI EMPIEZA EL HUB V3 UNDETECTED
local LP=game.Players.LocalPlayer local Camera=workspace.CurrentCamera local Players=game.Players local RunService=game:GetService("RunService")
getgenv().JEAXN_Aim=false getgenv().JEAXN_FOV=150 getgenv().JEAXN_Team=true
local gui=Instance.new("ScreenGui",LP.PlayerGui) gui.Name="JEAXN_V3" gui.ResetOnSpawn=false
local main=Instance.new("Frame",gui) main.Size=UDim2.new(0,260,0,180) main.Position=UDim2.new(0.5,-130,0.5,-90) main.BackgroundColor3=Color3.fromRGB(15,15,15) main.Active=true main.Draggable=true Instance.new("UICorner",main)
local title=Instance.new("TextLabel",main) title.Size=UDim2.new(1,0,0,35) title.Text="JEAXN V3 UNDETECTED" title.BackgroundColor3=Color3.fromRGB(0,170,90) title.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",title)
local b1=Instance.new("TextButton",main) b1.Size=UDim2.new(0.9,0,0,35) b1.Position=UDim2.new(0.05,0,0,50) b1.Text="CamLock: OFF" b1.BackgroundColor3=Color3.fromRGB(35,35,35) b1.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",b1)
local b2=Instance.new("TextButton",main) b2.Size=UDim2.new(0.9,0,0,35) b2.Position=UDim2.new(0.05,0,0,95) b2.Text="FOV: 150" b2.BackgroundColor3=Color3.fromRGB(35,35,35) b2.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",b2)
local b3=Instance.new("TextButton",main) b3.Size=UDim2.new(0.9,0,0,35) b3.Position=UDim2.new(0.05,0,0,135) b3.Text="TeamCheck: ON" b3.BackgroundColor3=Color3.fromRGB(35,35,35) b3.TextColor3=Color3.new(1,1,1) Instance.new("UICorner",b3)
local circle=Drawing.new("Circle") circle.Radius=150 circle.Color=Color3.fromRGB(0,255,0) circle.Thickness=2 circle.NumSides=60 circle.Filled=false circle.Visible=true
local function getClosest() local closest=nil local dist=math.huge for _,v in pairs(Players:GetPlayers()) do if v~=LP and v.Character and v.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health>0 then if getgenv().JEAXN_Team and v.Team==LP.Team then continue end local pos,vis=Camera:WorldToViewportPoint(v.Character.Head.Position) if vis then local mag=(Vector2.new(pos.X,pos.Y)-Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2)).Magnitude if mag<getgenv().JEAXN_FOV and mag<dist then closest=v dist=mag end end end end return closest end
b1.MouseButton1Click:Connect(function() getgenv().JEAXN_Aim=not getgenv().JEAXN_Aim b1.Text="CamLock: "..(getgenv().JEAXN_Aim and "ON" or "OFF") b1.BackgroundColor3=getgenv().JEAXN_Aim and Color3.fromRGB(0,170,0) or Color3.fromRGB(35,35,35) end)
b2.MouseButton1Click:Connect(function() getgenv().JEAXN_FOV=getgenv().JEAXN_FOV==150 and 300 or getgenv().JEAXN_FOV==300 and 500 or 150 b2.Text="FOV: "..getgenv().JEAXN_FOV circle.Radius=getgenv().JEAXN_FOV end)
b3.MouseButton1Click:Connect(function() getgenv().JEAXN_Team=not getgenv().JEAXN_Team b3.Text="TeamCheck: "..(getgenv().JEAXN_Team and "ON" or "OFF") end)
RunService.RenderStepped:Connect(function() circle.Position=Vector2.new(Camera.ViewportSize.X/2,Camera.ViewportSize.Y/2) if getgenv().JEAXN_Aim then local target=getClosest() if target and target.Character.Head then Camera.CFrame=CFrame.new(Camera.CFrame.Position, target.Character.Head.Position) end end end)
