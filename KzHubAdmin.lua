-- KZ HUB - VERSÃO CORRIGIDA
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Workspace = game:GetService("Workspace")
local LocalPlayer = Players.LocalPlayer

-- Aguarda o jogador carregar completamente
if not LocalPlayer.Character then
    LocalPlayer.CharacterAdded:Wait()
end

wait(1) -- Aguarda um pouco mais para garantir carregamento

-- LOADING SCREEN
do
    local screenGui = Instance.new("ScreenGui")
    screenGui.Name = "KzHubLoading"
    screenGui.IgnoreGuiInset = true
    screenGui.ResetOnSpawn = false
    screenGui.Parent = LocalPlayer:WaitForChild("PlayerGui")
    
    local mainFrame = Instance.new("Frame")
    mainFrame.Size = UDim2.new(1, 0, 1, 0)
    mainFrame.BackgroundColor3 = Color3.new(0, 0, 0)
    mainFrame.BorderSizePixel = 0
    mainFrame.Parent = screenGui
    
    local logoImage = Instance.new("ImageLabel")
    logoImage.Size = UDim2.new(0, 96, 0, 96)
    logoImage.Position = UDim2.new(0.5, -48, 0.25, 0)
    logoImage.BackgroundTransparency = 1
    logoImage.ImageTransparency = 1
    logoImage.Image = "rbxassetid://71567579053009"
    logoImage.Parent = mainFrame
    
    local imageCorner = Instance.new("UICorner")
    imageCorner.CornerRadius = UDim.new(0.5, 0)
    imageCorner.Parent = logoImage
    
    local titleLabel = Instance.new("TextLabel")
    titleLabel.Size = UDim2.new(1, 0, 0, 70)
    titleLabel.Position = UDim2.new(0, 0, 0.42, 0)
    titleLabel.BackgroundTransparency = 1
    titleLabel.Text = "Logando Como Admin"
    titleLabel.Font = Enum.Font.GothamBlack
    titleLabel.TextSize = 42
    titleLabel.TextColor3 = Color3.new(1, 1, 1)
    titleLabel.TextStrokeTransparency = 0.2
    titleLabel.TextXAlignment = Enum.TextXAlignment.Center
    titleLabel.TextYAlignment = Enum.TextYAlignment.Center
    titleLabel.TextTransparency = 1
    titleLabel.Parent = mainFrame
    
    local subtitleLabel = Instance.new("TextLabel")
    subtitleLabel.Size = UDim2.new(1, 0, 0, 30)
    subtitleLabel.Position = UDim2.new(0, 0, 0.56, 0)
    subtitleLabel.BackgroundTransparency = 1
    subtitleLabel.Text = "Bem Vindo Ao Kz Hub "
    subtitleLabel.Font = Enum.Font.GothamBold
    subtitleLabel.TextSize = 22
    subtitleLabel.TextColor3 = Color3.new(1, 1, 1)
    subtitleLabel.TextStrokeTransparency = 0.25
    subtitleLabel.TextXAlignment = Enum.TextXAlignment.Center
    subtitleLabel.TextYAlignment = Enum.TextYAlignment.Center
    subtitleLabel.TextTransparency = 1
    subtitleLabel.Parent = mainFrame
    
    local creditLabel = Instance.new("TextLabel")
    creditLabel.Size = UDim2.new(1, 0, 0, 26)
    creditLabel.Position = UDim2.new(0, 0, 0.62, 0)
    creditLabel.BackgroundTransparency = 1
    creditLabel.Text = "Dev Team KzHub"
    creditLabel.Font = Enum.Font.Gotham
    creditLabel.TextSize = 19
    creditLabel.TextColor3 = Color3.new(1, 1, 1)
    creditLabel.TextStrokeTransparency = 0.35
    creditLabel.TextXAlignment = Enum.TextXAlignment.Center
    creditLabel.TextYAlignment = Enum.TextYAlignment.Center
    creditLabel.TextTransparency = 1
    creditLabel.Parent = mainFrame
    
    -- Função de animação
    local function tweenElement(element, property, value, duration)
        local tween = TweenService:Create(element, TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {[property] = value})
        tween:Play()
        return tween
    end
    
    -- Animações de entrada
    tweenElement(logoImage, "ImageTransparency", 0, 0.7)
    wait(0.3)
    tweenElement(titleLabel, "TextTransparency", 0, 0.7)
    wait(0.1)
    tweenElement(subtitleLabel, "TextTransparency", 0, 0.6)
    wait(0.05)
    tweenElement(creditLabel, "TextTransparency", 0, 0.6)
    wait(2.1)
    wait(1.2)
    
    -- Animações de saída
    tweenElement(logoImage, "ImageTransparency", 1, 0.6)
    tweenElement(titleLabel, "TextTransparency", 1, 0.6)
    tweenElement(subtitleLabel, "TextTransparency", 1, 0.6)
    tweenElement(creditLabel, "TextTransparency", 1, 0.6)
    wait(0.65)
    screenGui:Destroy()
end

-- Tenta carregar a biblioteca com tratamento de erro
local success, redzlib = pcall(function()
    return loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()
end)

if not success then
    warn("Erro ao carregar a biblioteca UI. Tentando método alternativo...")
    -- Método alternativo ou notificação de erro
    local StarterGui = game:GetService("StarterGui")
    StarterGui:SetCore("SendNotification", {
        Title = "KZ Hub Error";
        Text = "Falha ao carregar interface. Verifique sua conexão.";
        Duration = 5;
    })
    return
end

-- Criação da janela principal
local Window = redzlib:MakeWindow({
    Title = "Kz Hub : Universal",
    SubTitle = "by kzscripts",
    SaveFolder = "kzhubsave.com"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71567579053009", BackgroundTransparency = 1 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

-- ABA DISCORD
local Tab1 = Window:MakeTab({"Discord", "mail"})

Tab1:AddDiscordInvite({
    Name = "Kz Hub",
    Description = "Join server",
    Logo = "rbxassetid://71567579053009",
    Invite = "https://discord.gg/mv6uWsNqSY",
})

-- ABA MAIN
local TabMain = Window:MakeTab({"Main", "home"})
local Section = TabMain:AddSection({"Combate"})

-- ESP SYSTEM
local ESPEnabled = false
local espObjects = {}

local function createESP(player)
    if player == LocalPlayer or not player.Character then return end
    
    local char = player.Character
    if char:FindFirstChild("KZ_ESP") then return end
    
    local highlight = Instance.new("Highlight")
    highlight.Name = "KZ_ESP"
    highlight.FillColor = Color3.fromRGB(255, 0, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.new(0, 0, 0)
    highlight.OutlineTransparency = 0
    highlight.Adornee = char
    highlight.Parent = char
    
    espObjects[player] = highlight
end

local function removeESP(player)
    if espObjects[player] then
        espObjects[player]:Destroy()
        espObjects[player] = nil
    end
end

TabMain:AddToggle({
    Name = "Ativar ESP",
    Flag = "ESP",
    Callback = function(state)
        ESPEnabled = state
        if ESPEnabled then
            for _, player in ipairs(Players:GetPlayers()) do
                createESP(player)
            end
        else
            for _, player in ipairs(Players:GetPlayers()) do
                removeESP(player)
            end
        end
    end
})

-- Dropdown de Cor do ESP
TabMain:AddDropdown({
    Name = "Cor do ESP",
    Default = "Vermelho",
    Options = {"Vermelho", "Azul", "Amarelo", "Roxo"},
    Callback = function(color)
        local cores = {
            ["Vermelho"] = Color3.fromRGB(255, 0, 0),
            ["Azul"] = Color3.fromRGB(0, 0, 255),
            ["Amarelo"] = Color3.fromRGB(255, 255, 0),
            ["Roxo"] = Color3.fromRGB(128, 0, 128)
        }

        for _, highlight in pairs(espObjects) do
            if highlight and highlight.Parent then
                highlight.FillColor = cores[color] or Color3.fromRGB(255, 0, 0)
            end
        end
    end
})

-- AIMBOT SYSTEM
local Camera = workspace.CurrentCamera
local FOV = 200
local aimbotEnabled = false
local aimbotConnection = nil

local function GetClosestEnemy()
    local closest = nil
    local shortestDist = FOV

    for _, player in pairs(Players:GetPlayers()) do  
        if player ~= LocalPlayer and player.Character and player.Character:FindFirstChild("Head") then  
            local head = player.Character.Head  
            local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)  

            if onScreen then  
                local mousePos = UserInputService:GetMouseLocation()  
                local dist = (Vector2.new(screenPos.X, screenPos.Y) - mousePos).Magnitude  

                if dist < shortestDist then  
                    shortestDist = dist  
                    closest = player  
                end  
            end  
        end  
    end  

    return closest
end

local function AimAtTarget(target)
    if not target or not target.Character or not target.Character:FindFirstChild("Head") then return end

    local head = target.Character.Head  
    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)  

    if onScreen then  
        -- Usa método mais compatível para mover o mouse
        local VirtualInputManager = game:GetService("VirtualInputManager")
        pcall(function()
            VirtualInputManager:SendMouseMoveEvent(screenPos.X, screenPos.Y, game, 0)
        end)
    end
end

TabMain:AddToggle({
    Name = "Aimbot",
    Flag = "AimbotMouse",
    Default = false,
    Callback = function(Value)
        aimbotEnabled = Value

        if aimbotConnection then
            aimbotConnection:Disconnect()
            aimbotConnection = nil
        end

        if Value then
            aimbotConnection = RunService.RenderStepped:Connect(function()
                local target = GetClosestEnemy()
                if target then
                    AimAtTarget(target)
                end
            end)
        end
    end
})

-- PLAYER TELEPORT SYSTEM
local function GetPlayerNames()
    local names = {}
    for _, player in ipairs(Players:GetPlayers()) do
        if player ~= LocalPlayer then
            table.insert(names, player.Name)
        end
    end
    return names
end

local playerDropdown

local function CreatePlayerDropdown()
    if playerDropdown and playerDropdown.Destroy then
        pcall(function() playerDropdown:Destroy() end)
    end

    playerDropdown = TabMain:AddDropdown({
        Name = "Players Teleport",
        Default = nil,
        Options = GetPlayerNames(),
        Callback = function(selectedName)
            local targetPlayer = Players:FindFirstChild(selectedName)
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local myChar = LocalPlayer.Character
                if myChar and myChar:FindFirstChild("HumanoidRootPart") then
                    myChar.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
                end
            end
        end
    })
end

CreatePlayerDropdown()

TabMain:AddButton({
    Name = "Refresh Players",
    Callback = function()
        CreatePlayerDropdown()
    end
})

-- ABA PLAYER
local TabPlayer = Window:MakeTab({"Player", "user"})
local Section = TabPlayer:AddSection({"Player"})

-- Infinite Jump
TabPlayer:AddButton({
    Name = "Infinite Jump",
    Callback = function()
        UserInputService.JumpRequest:Connect(function()
            if LocalPlayer.Character and LocalPlayer.Character:FindFirstChildOfClass("Humanoid") then
                LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
            end
        end)
    end
})

-- Fly
TabPlayer:AddButton({
    Name = "Fly",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
        end)
    end
})

-- JumpPower Slider
TabPlayer:AddSlider({
    Name = "JumpPower",
    Min = 1,
    Max = 750,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        local function setJumpPower(char)
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.JumpPower = Value
            end
        end
        
        if LocalPlayer.Character then
            setJumpPower(LocalPlayer.Character)
        end

        LocalPlayer.CharacterAdded:Connect(setJumpPower)
    end
})

-- Speed Slider
TabPlayer:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 500,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        local function setSpeed(char)
            local hum = char:FindFirstChild("Humanoid")
            if hum then
                hum.WalkSpeed = Value
            end
        end
        
        if LocalPlayer.Character then
            setSpeed(LocalPlayer.Character)
        end

        LocalPlayer.CharacterAdded:Connect(setSpeed)
    end
})

-- Invisibilidade
TabPlayer:AddToggle({
    Name = "Invisibilidade",
    Flag = "InvisToggle",
    Default = false,
    Callback = function(state)
        local character = LocalPlayer.Character
        if not character then return end

        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = state and 1 or 0
            elseif part:IsA("Decal") then
                part.Transparency = state and 1 or 0
            elseif part:IsA("Accessory") then
                local handle = part:FindFirstChild("Handle")
                if handle then
                    handle.Transparency = state and 1 or 0
                end
            end
        end
    end
})

-- NoClip
local noclipEnabled = false
local noclipConnection

TabPlayer:AddToggle({
    Name = "No Clip",
    Default = false,
    Callback = function(state)
        noclipEnabled = state
        
        if noclipConnection then
            noclipConnection:Disconnect()
        end
        
        if noclipEnabled then
            noclipConnection = RunService.Stepped:Connect(function()
                local character = LocalPlayer.Character
                if character then
                    for _, part in pairs(character:GetDescendants()) do
                        if part:IsA("BasePart") then
                            part.CanCollide = false
                        end
                    end
                end
            end)
        end
    end
})

-- Gravity
TabPlayer:AddTextBox({
    Name = "Gravity",
    Description = "Digite o valor da gravidade",
    PlaceholderText = "196.2",
    Callback = function(Value)
        local num = tonumber(Value)
        if num and num >= 0 then
            Workspace.Gravity = num
        end
    end
})

-- ABA TELEPORT
local TabTeleport = Window:MakeTab({"Teleport", "trending-up"})
local Section = TabTeleport:AddSection({"Local Teleport"})

local savedPosition = nil

TabTeleport:AddButton({
    Name = "Setar Local",
    Callback = function()
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            savedPosition = char.HumanoidRootPart.CFrame
        end
    end
})

TabTeleport:AddButton({
    Name = "Voltar",
    Callback = function()
        if not savedPosition then return end
        
        local char = LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            char.HumanoidRootPart.CFrame = savedPosition
        end
    end
})

-- ABA MISC
local TabMisc = Window:MakeTab({"Misc", "folder"})
local Section = TabMisc:AddSection({"Scripts"})

TabMisc:AddButton({
    Name = "Infinite Yield",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
        end)
    end
})

TabMisc:AddButton({
    Name = "Roblox Realms",
    Callback = function()
        pcall(function()
            loadstring(game:HttpGet("https://raw.githubusercontent.com/lucaszedamanga/key_system/refs/heads/main/README.md"))()
        end)
    end
})

-- ABA SETTINGS
local TabSettings = Window:MakeTab({"Settings", "settings"})

-- Anti-AFK
local AntiAfkConnection

TabSettings:AddToggle({
    Name = "Anti-AFK",
    Flag = "AntiAFK",
    Default = false,
    Callback = function(enabled)
        if AntiAfkConnection then
            AntiAfkConnection:Disconnect()
            AntiAfkConnection = nil
        end

        if enabled then
            AntiAfkConnection = LocalPlayer.Idled:Connect(function()
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                VirtualUser:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)
        end
    end
})

-- FPS Boost
TabSettings:AddButton({
    Name = "FPS Boost",
    Callback = function()
        local lighting = game:GetService("Lighting")
        lighting.GlobalShadows = false
        lighting.FogEnd = 1e10
        lighting.Brightness = 0
        
        for _, v in ipairs(workspace:GetDescendants()) do
            if v:IsA("BasePart") then
                v.Material = Enum.Material.SmoothPlastic
                v.Reflectance = 0
            elseif v:IsA("Decal") or v:IsA("Texture") then
                v:Destroy()
            elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
                v.Enabled = false
            end
        end
        
        pcall(function()
            setfpscap(60)
        end)
    end
})

-- Reset Player
TabSettings:AddButton({
    Name = "Reset Player",
    Callback = function()
        if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
            LocalPlayer.Character.Humanoid.Health = 0
        end
    end
})

-- Conecta eventos para ESP automático
Players.PlayerAdded:Connect(function(player)
    if ESPEnabled then
        player.CharacterAdded:Connect(function()
            wait(1)
            createESP(player)
        end)
    end
end)

Players.PlayerRemoving:Connect(function(player)
    removeESP(player)
end)

print("KZ Hub carregado com sucesso!")
