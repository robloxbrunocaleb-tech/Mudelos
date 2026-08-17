-- ==========================================
-- 🏡 MÓDULO DE CASA | IMPERIAL HUB
-- ==========================================

return function(container)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    -- ==========================================
    -- 🎨 FUNÇÃO DE MUDAR COR DA CASA
    -- ==========================================
    local function MudarCorDaCasa(cor)
        pcall(function()
            local pastaRE = ReplicatedStorage:FindFirstChild("RE")
            if pastaRE and pastaRE:FindFirstChild("1Player1sHous1e") then
                pastaRE["1Player1sHous1e"]:FireServer("ColorPickHouse", cor)
            end
        end)
        pcall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes and remotes:FindFirstChild("Property:SetColor") then
                remotes["Property:SetColor"]:FireServer(cor)
            end
        end)
        pcall(function()
            if LocalPlayer:FindFirstChild("SetColor") then
                LocalPlayer.SetColor:FireServer(cor)
            end
        end)
    end

    -- ==========================================
    -- 🔁 CONTROLE DE LOOP RGB (sem vazamento)
    -- ==========================================
    local rgbAtivo = false
    local rgbThread = nil

    local function PararLoopRGB()
        rgbAtivo = false
        if rgbThread then
            task.cancel(rgbThread)
            rgbThread = nil
        end
    end

    local function IniciarLoopRGB()
        if rgbThread then
            PararLoopRGB()
        end
        rgbAtivo = true
        rgbThread = task.spawn(function()
            local hue = 0
            while rgbAtivo do
                MudarCorDaCasa(Color3.fromHSV(hue, 1, 1))
                hue = hue + 0.05
                if hue >= 1 then hue = 0 end
                task.wait(0.5)
            end
        end)
    end

    -- ==========================================
    -- 🎛️ INTERFACE
    -- ==========================================
    local ScrollHouse = Instance.new("ScrollingFrame", container)
    ScrollHouse.Size = UDim2.new(1, -10, 1, -10)
    ScrollHouse.Position = UDim2.new(0, 5, 0, 5)
    ScrollHouse.BackgroundTransparency = 1
    ScrollHouse.ScrollBarThickness = 3
    ScrollHouse.Parent = container
    local ListHouse = Instance.new("UIListLayout", ScrollHouse)
    ListHouse.Padding = UDim.new(0, 6)

    -- Botão RGB
    local BtnRGB = Instance.new("TextButton", ScrollHouse)
    BtnRGB.Size = UDim2.new(1, -4, 0, 40)
    BtnRGB.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
    BtnRGB.Text = "🌈 ATIVAR RGB CASA"
    BtnRGB.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnRGB.TextSize = 12
    BtnRGB.Font = Enum.Font.GothamBlack
    BtnRGB.Parent = ScrollHouse
    Instance.new("UICorner", BtnRGB).CornerRadius = UDim.new(0, 6)

    BtnRGB.MouseButton1Click:Connect(function()
        if rgbAtivo then
            PararLoopRGB()
            BtnRGB.Text = "🌈 ATIVAR RGB CASA"
            BtnRGB.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
        else
            IniciarLoopRGB()
            BtnRGB.Text = "⏹️ PARAR RGB CASA"
            BtnRGB.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        end
    end)

    -- Função para criar botões de cor
    local function CriarBotaoCor(nome, cor3)
        local btn = Instance.new("TextButton", ScrollHouse)
        btn.Size = UDim2.new(1, -4, 0, 32)
        btn.BackgroundColor3 = cor3
        btn.Text = nome
        local brightness = (cor3.R + cor3.G + cor3.B) / 3
        btn.TextColor3 = brightness > 0.6 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamBold
        btn.Parent = ScrollHouse
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

        btn.MouseButton1Click:Connect(function()
            -- Para o RGB se estiver ativo
            if rgbAtivo then
                PararLoopRGB()
                BtnRGB.Text = "🌈 ATIVAR RGB CASA"
                BtnRGB.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            end
            MudarCorDaCasa(cor3)
        end)
    end

    -- Cores estáticas
    CriarBotaoCor("🔴 Vermelho Intenso", Color3.new(1, 0, 0.047))
    CriarBotaoCor("⚫ Preto Sombrio", Color3.fromRGB(15, 15, 15))
    CriarBotaoCor("⚪ Branco Puro", Color3.fromRGB(240, 240, 240))
    CriarBotaoCor("🔵 Azul Neon", Color3.fromRGB(0, 150, 255))
    CriarBotaoCor("🌸 Rosa Festa", Color3.fromRGB(255, 20, 147))

    -- Ajustar canvas
    ListHouse:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollHouse.CanvasSize = UDim2.new(0, 0, 0, ListHouse.AbsoluteContentSize.Y + 10)
    end)

    -- Limpeza automática ao sair do módulo
    container.AncestryChanged:Connect(function(_, parent)
        if not parent then
            PararLoopRGB()
        end
    end)
end
