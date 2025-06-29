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

-- Carregar a UI 
local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/Library-ui/refs/heads/main/Redzhubui"))()

--window
local Window = redzlib:MakeWindow({
  Title = "Kz Hub : Universal",
  SubTitle = "by kzscripts",
  SaveFolder = "kzhubsave.com"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://71567579053009", BackgroundTransparency = 1 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({"Discord", "mail"})

Tab1:AddDiscordInvite({
    Name = "Kz Hub",
    Description = "Join server",
    Logo = "rbxassetid://71567579053009",
    Invite = "https://discord.gg/mv6uWsNqSY",
})


local TabMain = Window:MakeTab({"Main", "home"})

local Section = TabMain:AddSection({"Combate"})

-- Toggle ESP
local ESPEnabled = false
TabMain:AddToggle({
    Name = "Ativar ESP",
    Flag = "ESP",
    Callback = function(state)
        ESPEnabled = state
        if ESPEnabled then
            -- Exemplo básico de ESP com Highlight
            for _, player in ipairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    local char = player.Character
                    if char and not char:FindFirstChild("KZ_ESP") then
                        local highlight = Instance.new("Highlight")
                        highlight.Name = "KZ_ESP"
                        highlight.FillColor = Color3.fromRGB(255, 0, 0) -- vermelho padrão
                        highlight.FillTransparency = 0.5
                        highlight.OutlineColor = Color3.new(0, 0, 0)
                        highlight.OutlineTransparency = 0
                        highlight.Adornee = char
                        highlight.Parent = char
                    end
                end
            end
        else
            for _, player in ipairs(game.Players:GetPlayers()) do
                local char = player.Character
                if char and char:FindFirstChild("KZ_ESP") then
                    char.KZ_ESP:Destroy()
                end
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

        for _, player in ipairs(game.Players:GetPlayers()) do
            local char = player.Character
            if char and char:FindFirstChild("KZ_ESP") then
                char.KZ_ESP.FillColor = cores[color] or Color3.fromRGB(255, 0, 0)
            end
        end
    end
})


local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local VirtualInputManager = game:GetService("VirtualInputManager")
local Camera = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local FOV = 200
local aimbotEnabled = false
local aimbotConnection = nil

-- Função para encontrar inimigo mais próximo dentro da FOV
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

-- Função para mover o mouse até o alvo
local function AimMouseAtTarget(target)
    if not target or not target.Character or not target.Character:FindFirstChild("Head") then return end

    local head = target.Character.Head  
    local screenPos, onScreen = Camera:WorldToViewportPoint(head.Position)  

    if onScreen then  
        VirtualInputManager:SendMouseMoveEvent(screenPos.X, screenPos.Y, game, 0)  
    end
end

-- Toggle na Redz Library
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
                    AimMouseAtTarget(target)
                end
            end)
        end
    end
})


--aqui
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para obter nomes dos jogadores (exceto você)
local function GetPlayerNames()
	local names = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end

-- Referência do dropdown (vai ser recriado no refresh)
local playerDropdown

-- Função para criar o dropdown
local function CreateDropdown()
	-- Se já existe, destrói antes de criar de novo
	if playerDropdown and playerDropdown.Destroy then
		playerDropdown:Destroy()
	end

	playerDropdown = TabMain:AddDropdown({
		Name = "Players Teleport",
		Default = nil,
		Options = GetPlayerNames(),
		Callback = function(selectedName)
			local targetPlayer = Players:FindFirstChild(selectedName)
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if myHRP then
					myHRP.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
	})
end

-- Cria o dropdown inicial
CreateDropdown()

-- Botão que "reinicia" o dropdown
TabMain:AddButton({
	Name = "Refresh Players",
	Callback = function()
		CreateDropdown()
		print("Dropdown recriado com sucesso.")
	end
})

-- Atualiza automaticamente se jogadores entram ou saem
Players.PlayerAdded:Connect(CreateDropdown)
Players.PlayerRemoving:Connect(CreateDropdown)

--final

local TabPlayer = Window:MakeTab({"Player", "user"})

local Section = TabPlayer:AddSection({"Player"})

-- Infinite Jump
TabPlayer:AddButton({
    Name = "Infinite Jump",
    Callback = function()
        game:GetService("UserInputService").JumpRequest:Connect(function()
            game.Players.LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
        end)
    end
})

-- Fly (simples)
TabPlayer:AddButton({
    Name = "Fly",
    Callback = function()
        loadstring(game:HttpGet("https://rawscripts.net/raw/Universal-Script-Gui-Fly-v3-37111"))()
    end
})

TabPlayer:AddSlider({
    Name = "JumpPower",
    Min = 1,
    Max = 750,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.JumpPower = Value
        end

        -- Reaplica ao morrer
        game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            local newHum = newChar:WaitForChild("Humanoid")
            newHum.JumpPower = Value
        end)
    end
})

TabPlayer:AddSlider({
    Name = "Dash Length",
    Min = 1,
    Max = 500,
    Increase = 1,
    Default = 50,
    Callback = function(Value)
        getgenv().DashLength = Value
    end
})
TabPlayer:AddSlider({
    Name = "Speed",
    Min = 1,
    Max = 500,
    Increase = 1,
    Default = 16,
    Callback = function(Value)
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local hum = char:FindFirstChild("Humanoid")
        if hum then
            hum.WalkSpeed = Value
        end

        -- Reaplica ao morrer
        game.Players.LocalPlayer.CharacterAdded:Connect(function(newChar)
            local newHum = newChar:WaitForChild("Humanoid")
            newHum.WalkSpeed = Value
        end)
    end
})

local Section = TabPlayer:AddSection({"Adionais"})

TabPlayer:AddToggle({
    Name = "Invisibilidade",
    Flag = "InvisToggle",
    Default = false,
    Callback = function(state)
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()

        if not character then return end

        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") or part:IsA("Decal") then
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

-- Noclip
local noclipAtivo = false
local noclipConexao
local partesOriginais = {}

local function atualizarNoClip()
    if not character then return end
    
    for _, parte in pairs(character:GetDescendants()) do
        if parte:IsA("BasePart") then
            if noclipAtivo then
                if partesOriginais[parte] == nil then
                    partesOriginais[parte] = parte.CanCollide
                end
                parte.CanCollide = false
            else
                if partesOriginais[parte] ~= nil then
                    parte.CanCollide = partesOriginais[parte]
                end
            end
        end
    end
end

TabPlayer:AddToggle({
    Title = "No Clip",
    Default = false,
    Callback = function(state)
        noclipAtivo = state
        
        if noclipAtivo then
            if not noclipConexao then
                noclipConexao = RunService.Stepped:Connect(atualizarNoClip)
            end
        else
            if noclipConexao then
                noclipConexao:Disconnect()
                noclipConexao = nil
            end
            atualizarNoClip()
        end
    end
})

TabPlayer:AddTextBox({
    Name = "Gravity",
    Description = "Digite o valor da gravidade",
    PlaceholderText = "Gravity",
    Callback = function(Value)
        local num = tonumber(Value)
        if num and num > 0 then
            game.Workspace.Gravity = num
            print("Gravidade definida para: " .. num)
        else
            warn("Valor inválido. Digite um número maior que 0.")
        end
    end
})

local TabTeleport= Window:MakeTab({"Teleport", "trending-up"})

local Section = TabTeleport:AddSection({"Local Teleport"})

local posSalva = nil

TabTeleport:AddButton({
    Name = "Setar Local",
    Callback = function()
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            posSalva = char.HumanoidRootPart.CFrame
            print("Local salvo com sucesso!")
        end
    end
})

TabTeleport:AddButton({
    Name = "Voltar",
    Callback = function()
        if not posSalva then
            warn("Nenhum local foi salvo!")
            return
        end
        local char = game.Players.LocalPlayer.Character
        if char and char:FindFirstChild("HumanoidRootPart") then
            local humanoid = char:FindFirstChildOfClass("Humanoid")
            local root = char.HumanoidRootPart
            if humanoid then
                humanoid.PlatformStand = true
                local tempo = 5.5
                local inicio = tick()
                local origem = root.Position
                local destino = posSalva.Position
                while tick() - inicio < tempo do
                    local alpha = (tick() - inicio) / tempo
                    root.CFrame = CFrame.new(origem:Lerp(destino, alpha), destino)
                    root.Velocity = Vector3.zero
                    game:GetService("RunService").Heartbeat:Wait()
                end
                root.CFrame = posSalva
                task.wait(0.5)
                humanoid.PlatformStand = false
            end
        end
    end
})

local Section = TabTeleport:AddSection({"Teleport Player"})

--aqui
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

-- Função para obter nomes dos jogadores (exceto você)
local function GetPlayerNames()
	local names = {}
	for _, player in ipairs(Players:GetPlayers()) do
		if player ~= LocalPlayer then
			table.insert(names, player.Name)
		end
	end
	return names
end

-- Referência do dropdown (vai ser recriado no refresh)
local playerDropdown

-- Função para criar o dropdown
local function CreateDropdown()
	-- Se já existe, destrói antes de criar de novo
	if playerDropdown and playerDropdown.Destroy then
		playerDropdown:Destroy()
	end

	playerDropdown = TabTeleport:AddDropdown({
		Name = "Players Teleport",
		Default = nil,
		Options = GetPlayerNames(),
		Callback = function(selectedName)
			local targetPlayer = Players:FindFirstChild(selectedName)
			if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
				local myHRP = LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
				if myHRP then
					myHRP.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame
				end
			end
		end
	})
end

-- Cria o dropdown inicial
CreateDropdown()

-- Botão que "reinicia" o dropdown
TabTeleport:AddButton({
	Name = "Refresh Players",
	Callback = function()
		CreateDropdown()
		print("Dropdown recriado com sucesso.")
	end
})

-- Atualiza automaticamente se jogadores entram ou saem
Players.PlayerAdded:Connect(CreateDropdown)
Players.PlayerRemoving:Connect(CreateDropdown)
--final


local TabMisc= Window:MakeTab({"Misc", "folder"})

local Section = TabMisc:AddSection({"Scripts"})

--infinity yeld
TabMisc:AddButton({
    Name = "Infinite Yeld",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end
})

TabMisc:AddButton({
    Name = "Roblox Realms ",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/lucaszedamanga/key_system/refs/heads/main/README.md"))()
    end
})

local Section = TabMisc:AddSection({"Teams"})

local Paragraph = TabMisc:AddParagraph({"Kz Hub Team", "This is my Team, KZ Hub developers, if you want to be part of it, join Discord. "})

local Paragraph = TabMisc:AddParagraph({"Roblox Realms Team", "This is my friend's Team, Roblox Realms developers, if you want to be part of it, join Discord. "})


local TabSettings = Window:MakeTab({"Settings", "settings"})



-- Anti-AFK
local AntiAfkConnection

TabSettings:AddToggle({
    Name = "Anti-AFK",
    Flag = "AntiAFK",
    Default = false,
    Callback = function(enabled)
        -- Se ativar
        if enabled then
            -- Previne múltiplas conexões
            if AntiAfkConnection then
                AntiAfkConnection:Disconnect()
            end

            AntiAfkConnection = game:GetService("Players").LocalPlayer.Idled:Connect(function()
                local vu = game:GetService("VirtualUser")
                vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
                task.wait(1)
                vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            end)

        -- Se desativar
        elseif AntiAfkConnection then
       
