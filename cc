-- ==========================================
-- 🚗 MÓDULO DE VEÍCULOS | IMPERIAL HUB
-- ==========================================

return function(container)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    -- ==========================================
    -- 🎨 FUNÇÃO DE PINTAR VEÍCULOS
    -- ==========================================
    local function MudarCoresVeiculos(cor)
        pcall(function()
            if LocalPlayer:FindFirstChild("SetColor") then
                LocalPlayer.SetColor:FireServer(cor)
            end
        end)
        pcall(function()
            local pastaRE = ReplicatedStorage:FindFirstChild("RE")
            if pastaRE and pastaRE:FindFirstChild("1Player1sCa1r") then
                pastaRE["1Player1sCa1r"]:FireServer("NoMotorColor", cor)
            end
        end)
        pcall(function()
            local remotes = ReplicatedStorage:FindFirstChild("Remotes")
            if remotes then
                if remotes:FindFirstChild("SetUnderglow") then
                    remotes.SetUnderglow:InvokeServer("Scrolling Beams")
                end
                if remotes:FindFirstChild("SetUnderglowColor") then
                    remotes.SetUnderglowColor:InvokeServer(1, cor)
                end
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
                MudarCoresVeiculos(Color3.fromHSV(hue, 1, 1))
                hue = hue + 0.05
                if hue >= 1 then hue = 0 end
                task.wait(0.5)
            end
        end)
    end

    -- ==========================================
    -- 🎛️ INTERFACE
    -- ==========================================
    local ScrollVeiculos = Instance.new("ScrollingFrame", container)
    ScrollVeiculos.Size = UDim2.new(1, -10, 1, -10)
    ScrollVeiculos.Position = UDim2.new(0, 5, 0, 5)
    ScrollVeiculos.BackgroundTransparency = 1
    ScrollVeiculos.ScrollBarThickness = 3
    ScrollVeiculos.Parent = container
    local ListVeiculos = Instance.new("UIListLayout", ScrollVeiculos)
    ListVeiculos.Padding = UDim.new(0, 6)

    -- Botão RGB
    local BtnRGB = Instance.new("TextButton", ScrollVeiculos)
    BtnRGB.Size = UDim2.new(1, -4, 0, 40)
    BtnRGB.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
    BtnRGB.Text = "🌈 ATIVAR RGB VEÍCULOS"
    BtnRGB.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnRGB.TextSize = 12
    BtnRGB.Font = Enum.Font.GothamBlack
    BtnRGB.Parent = ScrollVeiculos
    Instance.new("UICorner", BtnRGB).CornerRadius = UDim.new(0, 6)

    BtnRGB.MouseButton1Click:Connect(function()
        if rgbAtivo then
            PararLoopRGB()
            BtnRGB.Text = "🌈 ATIVAR RGB VEÍCULOS"
            BtnRGB.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
        else
            IniciarLoopRGB()
            BtnRGB.Text = "⏹️ PARAR RGB VEÍCULOS"
            BtnRGB.BackgroundColor3 = Color3.fromRGB(231, 76, 60)
        end
    end)

    -- Função para criar botões de cor
    local function CriarBotaoCor(nome, cor3)
        local btn = Instance.new("TextButton", ScrollVeiculos)
        btn.Size = UDim2.new(1, -4, 0, 32)
        btn.BackgroundColor3 = cor3
        btn.Text = nome
        local brightness = (cor3.R + cor3.G + cor3.B) / 3
        btn.TextColor3 = brightness > 0.6 and Color3.fromRGB(0, 0, 0) or Color3.fromRGB(255, 255, 255)
        btn.TextSize = 11
        btn.Font = Enum.Font.GothamBold
        btn.Parent = ScrollVeiculos
        Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 4)

        btn.MouseButton1Click:Connect(function()
            -- Para o RGB se estiver ativo
            if rgbAtivo then
                PararLoopRGB()
                BtnRGB.Text = "🌈 ATIVAR RGB VEÍCULOS"
                BtnRGB.BackgroundColor3 = Color3.fromRGB(255, 165, 0)
            end
            MudarCoresVeiculos(cor3)
        end)
    end

    -- Cores estáticas
    CriarBotaoCor("🟢 Verde Ciano", Color3.new(0.28, 1, 0.89))
    CriarBotaoCor("⚫ Preto Total", Color3.fromRGB(15, 15, 15))
    CriarBotaoCor("⚪ Branco Puro", Color3.fromRGB(240, 240, 240))
    CriarBotaoCor("🔴 Vermelho", Color3.fromRGB(255, 0, 0))
    CriarBotaoCor("🟣 Roxo Neon", Color3.fromRGB(150, 0, 255))

    -- Ajustar canvas
    ListVeiculos:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
        ScrollVeiculos.CanvasSize = UDim2.new(0, 0, 0, ListVeiculos.AbsoluteContentSize.Y + 10)
    end)

    -- Limpeza automática ao sair do módulo (destruir thread)
    container.AncestryChanged:Connect(function(_, parent)
        if not parent then
            PararLoopRGB()
        end
    end)
end
