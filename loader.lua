local ok,A=pcall(function()return loadstring(game:HttpGet('https://sirius.me'..'n/rayfield'))()end)
if not ok or not A then warn('Rayfield yuklenemedi',A) return end
local B=game.Players.LocalPlayer
local C=game:GetService('UserInputService')
local D,E,F,G,H,I,J,K=false,0.01,0.01,false,16,50,false,50
local L,M,N,O
local AL={}
local P,Q
local function R(c)if not G then return end for _,p in ipairs(c:GetDescendants())do if p:IsA('BasePart')then p.CanCollide=false end end end
B.CharacterAdded:Connect(function(c)task.wait(0.1)R(c)end)
task.spawn(function()while true do if G and B.Character then R(B.Character)end task.wait(0.1)end end)
local function S()local c=B.Character if c then return c:FindFirstChildOfClass('Humanoid')end return nil end
local function T()local h=S()if h then h.WalkSpeed=H h.JumpPower=I end end
B.CharacterAdded:Connect(function()task.wait(0.2)T()end)
local function U(on)local c=B.Character local r=c and c:FindFirstChild('HumanoidRootPart')if on then if not r then J=false return end if P then P:Destroy()end if Q then Q:Destroy()end P=Instance.new('BodyVelocity')P.MaxForce=Vector3.new(9e9,9e9,9e9)P.Velocity=Vector3.zero P.Parent=r Q=Instance.new('BodyGyro')Q.MaxTorque=Vector3.new(9e9,9e9,9e9)Q.P=9e4 Q.CFrame=r.CFrame Q.Parent=r task.spawn(function()local cam=workspace.CurrentCamera while J and P and Q and r and r.Parent do local d=Vector3.zero if C:IsKeyDown(Enum.KeyCode.W)then d=d+cam.CFrame.LookVector end if C:IsKeyDown(Enum.KeyCode.S)then d=d-cam.CFrame.LookVector end if C:IsKeyDown(Enum.KeyCode.A)then d=d-cam.CFrame.RightVector end if C:IsKeyDown(Enum.KeyCode.D)then d=d+cam.CFrame.RightVector end if C:IsKeyDown(Enum.KeyCode.Space)then d=d+Vector3.new(0,1,0)end if C:IsKeyDown(Enum.KeyCode.LeftShift)then d=d-Vector3.new(0,1,0)end if d.Magnitude>0 then d=d.Unit end P.Velocity=d*K Q.CFrame=cam.CFrame task.wait()end end)else if P then P:Destroy()P=nil end if Q then Q:Destroy()Q=nil end end
local function V(pos)for _,z in ipairs(AL)do if (pos-z.center).Magnitude<=z.radius then return true end end return false end
local function W(o)if o:IsA('BasePart')then return o.Position end if o:IsA('Model')then return (o.PrimaryPart and o.PrimaryPart.Position)or o:GetBoundingBox()end if o:IsA('Tool')then local h=o:FindFirstChild('Handle')if h then return h.Position end if o.Parent and o.Parent:IsA('BasePart')then return o.Parent.Position end if o.Parent and o.Parent:IsA('Model')and o.Parent.PrimaryPart then return o.Parent.PrimaryPart.Position end end return nil end
local function X(o)if o:IsA('BasePart')then return o.Size end if o:IsA('Model')then local _,s=o:GetBoundingBox()return s end if o:IsA('Tool')then local h=o:FindFirstChild('Handle')if h then return h.Size end if o.Parent and o.Parent:IsA('BasePart')then return o.Parent.Size end end return Vector3.new(1,1,1) end
local function Y(o)if o:IsA('Tool')then return true end if o:IsA('ClickDetector')then return true end if (o:IsA('BasePart')or o:IsA('Model'))then if o:FindFirstChildWhichIsA('ProximityPrompt',true)then return true end if o:FindFirstChildWhichIsA('ClickDetector',true)then return true end end return false end
local function Z(o)if M[o]then return end M[o]=true table.insert(L,o)end
local function AA()local c=workspace:FindFirstChild('Cups')if not c then c=workspace:WaitForChild('Cups',30)end return c end
local function AB()local c=AA()if not c then return end for _,x in ipairs(c:GetDescendants())do if Y(x)then Z(x)end end end
local function AC()local c=AA()if not c then return end if N then N:Disconnect() end N=c.DescendantAdded:Connect(function(d)if Y(d)then Z(d)elseif d:IsA('ProximityPrompt')and d.Parent and Y(d.Parent)then Z(d.Parent)end end)end
local function AD()local c=AA()if not c then return end for _,x in ipairs(c:GetDescendants())do if Y(x)then Z(x)end end end
local function AE(o)local c=B.Character if not c then return end local p=W(o)if not p or V(p)then return end local s=X(o)local t=Vector3.new(p.X,p.Y-s.Y/2+1,p.Z)if c:IsA('Model')and c.PrimaryPart then c:SetPrimaryPartCFrame(CFrame.new(t))elseif c:FindFirstChild('HumanoidRootPart')then c.HumanoidRootPart.CFrame=CFrame.new(t)end end
local function AF(o)if o:IsA('Tool')then if o.Parent~=B.Character and o.Parent~=B:FindFirstChild('Backpack')then local c=B.Character if c then o.Parent=c task.wait(0.05)end end else local pr=o:FindFirstChildWhichIsA('ProximityPrompt',true)if pr then if fireproximityprompt then fireproximityprompt(pr,0)else pr.MaxActivationDistance=100 pr.HoldDuration=0 pcall(function()pr:Trigger()end)end return end local cd=o:FindFirstChildWhichIsA('ClickDetector',true)if cd then if fireclickdetector then fireclickdetector(cd)else pcall(function()cd:FireServer()end)end return end end
local function AG()if O and coroutine.status(O)~='dead' then return end L={}M={}AB()AC()task.spawn(function()while D do AD()task.wait(1)end end)O=task.spawn(function()while D do if #L==0 then task.wait(0.5)continue end local o=table.remove(L,1)if not o or not o:IsDescendantOf(workspace)then M[o]=nil continue end if o.Parent==B.Character or o.Parent==B:FindFirstChild('Backpack')then M[o]=nil continue end if not V(W(o)or Vector3.zero)then local c=B.Character if c and c:FindFirstChild('HumanoidRootPart')then AE(o)task.wait(E)AF(o)AD()task.wait(F)else table.insert(L,1,o)task.wait(0.3)end else M[o]=nil end end end)end
local function AH()D=false J=false U(false)G=false if N then N:Disconnect()N=nil end end
local AI=A:CreateWindow({Name='Trollge Alternate Realities',LoadingTitle='Yukleniyor...',LoadingSubtitle='by EgehanWsa',ConfigurationSaving={Enabled=true,FolderName='TrollgeAlternateRealities',FileName='settings'}})
local AJ=AI:CreateTab('Farm',4483362458)
AJ:CreateSection('Cups Farmer')
AJ:CreateToggle({Name='Auto Farm Cups',CurrentValue=false,Flag='Farm',Callback=function(v)D=v if v then AG()else if N then N:Disconnect()N=nil end end end})
AJ:CreateSlider({Name='TP Delay (sn)',Range={0,0.5},Increment=0.01,Suffix='s',CurrentValue=0.01,Flag='TP',Callback=function(v)E=v end})
AJ:CreateSlider({Name='Collect CD (sn)',Range={0,0.5},Increment=0.01,Suffix='s',CurrentValue=0.01,Flag='CD',Callback=function(v)F=v end})
local AK=AI:CreateTab('Player',4483362458)
AK:CreateSection('Hareket')
AK:CreateSlider({Name='Yuruyus Hizi',Range={16,500},Increment=1,Suffix='',CurrentValue=16,Flag='Walk',Callback=function(v)H=v T()end})
AK:CreateSlider({Name='Ziplama Yuksekligi',Range={50,500},Increment=5,Suffix='',CurrentValue=50,Flag='Jump',Callback=function(v)I=v T()end})
AK:CreateSlider({Name='Ucus Hizi',Range={10,200},Increment=5,Suffix='',CurrentValue=50,Flag='FlySpeed',Callback=function(v)K=v end})
AK:CreateToggle({Name='Uc (Fly)',CurrentValue=false,Flag='Fly',Callback=function(v)J=v U(v)end})
AK:CreateToggle({Name='NoClip',CurrentValue=false,Flag='NoClip',Callback=function(v)G=v if v and B.Character then R(B.Character)elseif not v and B.Character then for _,p in ipairs(B.Character:GetDescendants())do if p:IsA('BasePart')then p.CanCollide=true end end end end})
AK:CreateButton({Name='Her Seyi Durdur',Callback=function()AH()end})
T()
