-- ==========================================
-- 🎵 MÓDULO DE MÚSICAS | IMPERIAL HUB (OFUSCADO)
-- ==========================================

return function(container)
    local Players = game:GetService("Players")
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local LocalPlayer = Players.LocalPlayer

    -- ==========================================
    -- 🔒 CHAVE XOR (0x5A) PARA OFUSCAR REMOTES
    -- ==========================================
    local CHAVE_XOR = 0x5A

    local function decodificar(str)
        local resultado = {}
        for i = 1, #str do
            local byte = string.byte(str, i)
            table.insert(resultado, string.char(bit32.bxor(byte, CHAVE_XOR)))
        end
        return table.concat(resultado)
    end

    -- Remotes codificados (nome do remote e nome do evento)
    local remotesCodificados = {
        { name = string.char(42,54,59,35,63,40,14,53,53,54,31,40,63,52,46), event = string.char(62,55,53,35,20,41,52,54,35,46,40) },
        { name = string.char(107,42,54,59,35,63,40,107,41,18,53,47,41,107,63), event = string.char(62,55,53,35,20,41,52,54,35,46,40) },
        { name = string.char(107,42,54,59,35,63,40,107,41,25,59,107,40), event = string.char(34,52,49,55,52,40) },
        { name = string.char(107,20,53,23,53,46,53,107,40,12,63,50,51,57,54,63,107,41), event = string.char(62,55,53,35,20,41,52,54,35,46,40) },
        { name = string.char(107,18,53,40,41,107,63,8,63,51,53,46,107,63), event = string.char(24,63,44,49,52,35,46,40) },
        { name = string.char(42,40,53,42,41), event = string.char(62,55,53,35,20,41,52,54,35,46,40) },
    }

    -- Eventos codificados (podem ser diferentes para cada remote)
    local eventoParar = string.char(26,53,53,63,40,53,35,46,40)  -- "StopMusic" (ajuste se necessário)

    -- ==========================================
    -- 🎵 LISTA DE MÚSICAS (substitua pela sua)
    -- ==========================================
    local Audios = {
       {"Áudio Extra 1", "76478166396249"},
        {"Áudio Extra 2", "108593274701669"},
        {"Áudio Extra 3", "137469629660199"},
        {"Áudio Extra 4", "78497754841773"},
        {"Áudio Extra 5", "129385045610593"},
        {"Áudio Extra 6", "125468306810575"},
        {"Áudio Raro 1", "94263928522459"},
        {"Áudio Raro 2", "81294859039025"},
        {"Áudio Raro 3", "106178215819303"},
        {"Mandela SP", "7970023957031"},
        {"Que menina, perigosa Respost", "99316998084000"},
        {"Eu vim na Captura", "110126354319981"},
        {"Cocota do Helipa", "130758596227702"},
        {"Montagem Malvada", "93517492369858"},
        {"Tijolos XL 3", "84193648374486"},
        {"Tijolos XL 4", "103715298147699"},
        {"Balinha Proibida", "128512104863934"},
        {"Maestros do Mandelão", "86162096510351"},
        {"Seu Romeu", "70791355308103"},
        {"Brotei Funk", "139877575020614"},
        {"No Daily", "137149487552633"},
        {"Parado no Bailão", "117704589011831"},
        {"Berimbau Amostrado", "77712236704085"},
        {"Beat Latrel", "94165015928539"},
        {"Assobio Turbulento", "88975584625558"},
        {"Montagem Passa Esfrega", "130991649454424"},
        {"Ritmo da 011", "110204841162999"},
        {"Palhaço do Club da Dz7", "91976386006545"},
        {"Montagem Aniquiladora", "101119121510308"},
        {"Vapo Vapo CLXYAL x COLD", "135903820233276"},
        {"Montagem Tapete Mágico LFT", "85342255264364"},
        {"Mico me da um Lança", "78352220341424"},
        {"Montagem de Bandido", "82532904086636"},
        {"Montagem Ataque do Trem", "94878081234467"},
        {"Tropa do 7 Funk", "125784363463466"},
        {"Montagem Arabiana", "112757588991967"},
        {"Montagem Nitrosa", "83485310054195"},
        {"Berimbau do Paquistão", "99812493978684"},
        {"Montagem A Quarta Dimensão", "73727576640380"},
        {"Risada Maligna 2", "130325561271289"},
        {"Tijolos XL 1", "94958386697956"},
        {"Montagem A lua Cheia Ilumina", "94310677651339"},
        {"Antares", "90617634718635"},
        {"Livro Funk", "112448027542021"},
        {"Montagem do Futuro", "82493734590818"},
        {"Bonde do Discord", "113766043014562"},
        {"Montagem arabiana DJ Das FVLs", "138090818340605"},
        {"Montagem do calor", "101882948595303"},
        {"Beat soft Dudah", "76981625332079"},
        {"Montagem agudo espacial", "83544432960430"},
        {"Com as best friends", "132844032191120"},
        {"MTG BH nestan", "125075789394341"},
        {"Ingratidão é FDA", "102878660090014"},
        {"Montagem 2025", "138274205313969"},
        {"Os cria ta de radinho", "122271413003280"},
        {"Montagem Sinistra Dz7", "78098390943739"},
        {"Montagem Ta sem nada pra fazer", "78191562534501"},
        {"Montagem na onda da Loló Dj Das Favela", "73032470197284"},
        {"Montagem paredão Morcegão 😈", "138120757806690"},
        {"Brota com a Tcheka na Divisa", "82117652303865"},
        {"Montagem Bruxaria sinistra 1.0", "111814302789203"},
        {"Montagem fica de 4 no quadradrin", "124016354240775"},
        {"Uniao Frasco", "100989716917693"},
        {"Beat Coreano", "74821532812377"},
        {"Mega das trevas", "105560536796330"},
        {"DJ Das Favela", "131489289833086"},
        {"Comprei um lança (raro)", "128441181589899"},
        {"Montagem submundo GH7", "137107451922636"},
        {"Montagem Mini game", "85014780788991"},
        {"Montagem do magrão diferenciado", "112164486056611"},
        {"Montagem Terror dos 7 mares DJ OBC", "101658851913310"},
        {"na onda berimbau", "140530013819453"},
        {"Montagem quebra cama", "104976012074245"},
        {"Liu Kang Funk", "128352122850913"},
        {"Pocket Renk do Halloween", "94600803570382"},
        {"Montagem da uma baforada", "76983583262607"},
        {"Mc Tuto Barbie", "134879044098791"},
        {"Na brisa uma japonesinha", "134130716324734"},
        {"Audio loud Tortão..", "91874603007591"},
        {"Eu ja sofri por amor", "128011871344522"},
        {"Tu vai sastfze o Bonde", "104531371981996"},
        {"Amor é mentira DJ Arana", "78544797215218"},
        {"O cheiro bom é o de BCT", "117476956542254"},
        {"O meu carro bixo, motel de motor", "135005299702467"},
        {"Montagem Espanca mente 2", "135729578171550"},
        {"Montagem meridiana 2 DJ C4", "125970939764588"},
        {"Montagem Emirados Arabe", "98412934676146"},
        {"Montagem do indio sinistro", "133318423431098"},
        {"Recebi uma menssagem da sua amiguinha MC Lan", "130637458480604"},
        {"Automotivo do pou 2.0 DJ NK3", "104826703821683"},
        {"Beat Malvado 1.0", "83174160244345"},
        {"Montagem ???", "108084546406686"},
        {"Montagem sirene Dz7", "87655745800335"},
        {"Montagem aqui no seu zé", "82889452939550"},
        {"Montagem soca na danada", "100337717591420"},
        {"Montagem os 3 macete", "138730944430517"},
        {"Montagem Espanca Loli", "98623641908787"},
        {"Automotivo no bico da garrafa", "107047372509033"},
        {"Capturado 1", "127587901595282"},
        {"Capturado 2", "119738878921996"},
        {"Capturado 3", "109337680029292"},
        {"Capturado 4", "101483901475189"},
        {"Capturado 5", "104500091160463"},
        {"Capturado 6", "78312089943968"},
        {"Capturado 7", "128730685516895"},
        {"Capturado 8", "124478512057763"},
        {"Capturado 9", "135648634110254"},
        {"Capturado 10", "117634275895085"},
        {"Capturado 11", "139059061493558"},
        {"Capturado 12", "126152928520174"},
        {"Capturado 13", "122379348696948"},
        {"Capturado 14", "81002139735874"},
        {"Capturado 15", "109347979566607"},
        {"Capturado 16", "101864243033211"},
        {"Capturado 17", "3148329638"},
        {"Capturado 18", "123268013026823"},
        {"Capturado 19", "112783541496955"},
        {"Capturado 20", "116546457407236"},
        {"Capturado 21", "106412079335663"},
        {"Capturado 22", "111551362636063"},
        {"Capturado 23", "127786586963377"},
        {"Capturado 24", "93590122047380"},
        {"Capturado 25", "133190351316780"},
        {"Capturado 26", "74812784884330"},
        {"Capturado 27", "72200166265935"},
        {"Capturado 28", "71531533552899"},
        {"Capturado 29", "107088620814881"},
        {"Capturado 30", "120973520531216"},
        {"Capturado 31", "74404168179733"},
        {"Capturado 32", "106364874935196"},
        {"Capturado 33", "76524290482399"},
        {"Capturado 34", "92295159623916"},
        {"Capturado 35", "71153532555470"},
        {"Capturado 36", "88937498361674"},
        {"Capturado 37", "112959083808887"},
        {"Capturado 38", "135738534706063"},
        {"Capturado 39", "79953696595578"},
        {"Capturado 41", "139693447546059"},
        {"Capturado 42", "86839065790068"},
        {"Capturado 43", "140336018782383"},
        {"Capturado 44", "97708834121472"},
        {"Capturado 45", "110176270788146"},
        {"Capturado 48", "81384105684889"},
        {"Capturado 49", "127775034804421"},
        {"Capturado 50", "135958179501280"},
        {"Capturado 51", "100258273816054"},
        {"Capturado 52", "107513285979080"},
        {"Capturado 53", "130071638363509"},
        {"Capturado 54", "116272171755349"},
        {"Capturado 55", "131891110268352"},
        {"Capturado 56", "112143944982807"},
        {"Capturado 57", "129546408528391"},
        {"Capturado 58", "136869502216760"},
        {"Capturado 59", "124244582950595"},
        {"Capturado 60", "99399643204701"},
        {"Capturado 61", "86876136192157"},
        {"Capturado 62", "78076624091098"},
        {"Capturado 63", "132642647937688"},
        {"Capturado 64", "121187736532042"},
        {"Capturado 65", "93928823862203"},
        {"Capturado 66", "79349174602261"},
        {"Capturado 67", "139147474886402"},
        {"Capturado 68", "97011217688307"},
        {"Capturado 69", "124085422276732"},
        {"Capturado 70", "106958630419629"},
        {"Capturado 71", "80348640826643"},
        {"Capturado 72", "82894376737849"},
        {"Capturado 73", "110091098283354"},
        {"Capturado 74", "132733033157915"},
        {"Capturado 75", "122114766584918"},
        {"Capturado 76", "122488203955460"},
        {"Capturado 77", "100162235063839"},
        {"Capturado 78", "82746224492420"},
        {"Capturado 79", "95504533309589"},
        {"Capturado 81", "106869028772242"},
        {"Capturado 82", "139748606209287"},
        {"Capturado 83", "140637230317256"},
        {"Capturado 84", "78309234849039"},
        {"Capturado 85", "119554282991865"},
        {"Capturado 86", "99806916812608"},
        {"Capturado 88", "89460438416730"},
        {"Capturado 89", "125154299082694"},
        {"Capturado 90", "92524227941055"},
        {"Capturado 91", "126036553384258"},
        {"Capturado 94", "78631447496051"},
        {"Capturado 95", "115837046053738"},
        {"Capturado 96", "11505819302675"},
        {"Capturado 97", "82816587043443"},
        {"Capturado 98", "94410505324605"},
        {"Capturado 99", "84434631780133"},
        {"Capturado 100", "137888824649807"},
        {"Capturado 101", "136574160308808"},
        {"Capturado 102", "72559750723073"},
        {"Capturado 103", "112984167725214"},
        {"Capturado 104", "96934467275534"},
        {"Capturado 106", "81628621752701"},
        {"Capturado 107", "112214814544629"},
        {"Capturado 108", "107314654399868"},
        {"Capturado 109", "112406825739796"},
        {"Capturado 110", "96259351729049"},
        {"Capturado 112", "131267110896054"},
        {"Capturado 113", "89473100926016"},
        {"Capturado 114", "73937969824874"},
        {"Capturado 115", "97063553131882"},
        {"Capturado 116", "76860168288557"},
        {"Capturado 117", "126196231406971"},
        {"Capturado 118", "108226178439659"},
        {"Capturado 119", "122938948937941"},
        {"Capturado 120", "123238370098753"},
        {"Capturado 121", "94214367115154"},
        {"Capturado 123", "91007045451630"},
        {"Capturado 125", "110363768678499"},
        {"Capturado 126", "121405804171398"},
        {"Capturado 128", "73198805524530"},
        {"Capturado 129", "94672348312515"},
        {"Capturado 130", "140655042547224"},
        {"Capturado 131", "127052251825619"},
        {"Capturado 132", "95197852052116"},
        {"Capturado 133", "103288558732219"},
        {"Capturado 134", "93451391025129"},
        {"Capturado 136", "6696589252"},
        {"Capturado 137", "112903678064836"},
        {"Capturado 138", "72720721570850"},
        {"Passinho Do Barão", "127786586963377"},
        {"seleção", "107991235917983"},
        {"TO FUNK", "115837046053738"},
        {"dromedario", "11505819302675"},
        {"radio", "122271413003280"},
        {"funk 1", "99250885177756"},
        {"Vuqlzx.zip", "95197852052116"},
        {"Calculadora", "119738878921996"},
        {"Não Sou by Z3UXSS", "82816587043443"},
        {"Boom!", "113769816770209"},
        {"Tls", "126036553384258"},
        {"sayoaru", "140655042547224"},
        {"montagem", "91095521861290"},
        {"surfa beat", "105087432835452"},
        {"aqui!", "94596157966965"},
        {"9plx", "77654661905802"},
        {"tuyi", "95833787419501"},
        {"meia noite", "101726315590824"},
        {"Lilzee", "140472521093719"},
        {"jnew", "72559750723073"},
        {"Lucky", "96259351729049"},
        {"bonde do alan", "106489677491984"},
        {"pedido", "112416262448027"},
        {"SO UMA su", "122259510323980"},
        {"Japão", "109337680029292"},
        {"Meia Noite (Remake)", "86617433885915"},
        {"vq", "96206133933291"},
        {"anarran", "122488679897031"},
        {"eu ja sei", "94090546957206"},
        {"Luck&Vq(loira)", "125415203699674"},
        {"Aniversario do alan", "111673000907258"},
        {"eu vou", "133208997220334"},
        {"i like trains", "94410505324605"},
        {"cadeira cinza", "137254194634453"},
        {"supremo", "123295964560127"},
        {"777", "76261718144090"},
        {"faz o sinal", "104383515745988"},
        {"pipokinha", "70725650826656"},
        {"guenta", "83400946888030"},
        {"Beco", "73607045201707"},
        {"pai (estorado)", "108808025565103"},
        {"vqluckJESICA", "111118068516413"},
        {"witorluck", "122369808511994"},
        {"vitor muita aBUNDAn", "111078444478729"},
        {"(Conteúdo Explícito)", "129902784040741"},
        {"bob", "117319578838604"},
        {"TREMBALA FUNK", "137828639403630"},
        {"SE JOGA FUNK", "81102632991320"},
        {"BX Matheus HGBr shad", "116224648054652"},
        {"Ajoelhas", "127052251825619"},
        {"eletro", "122871552019283"},
        {"Pulse Ritual", "129793988394147"},
        {"SET MC MN FUNK", "78631447496051"},
        {"#####", "126682676484892"},
        {"ANCA O GUARDA CHUVA-dra", "126988068303069"},
        {"anuncio", "74362964495890"},
        {"vaiiiiii", "101519980567219"},
        {"Funk rato", "74885231607109"},
        {"dragondotta", "109558489133619"},
        {"sobe2", "135575369963734"},
        {"uber moto", "115729538399089"},
        {"cheiro", "112719344337564"},
        {"onefiveseven", "123955428810663"},
        {"WitorDone", "94384686700395"},
        {"sinal (Audio made by", "94880156546772"},
        {"KAIKY ROBSAU", "138345050819224"},
        {"MTG SARRA-dragon,1", "88526654938622"},
        {"special", "132897595613483"},
        {"MTG", "86564647594257"},
        {"Onion", "80937607674721"},
        {"Exclusive plenax", "92248692807220"},
        {"rlk do aztex", "122126177666117"},
        {"CLT/0zPlxx", "13917111803301"},
        {"romeu e julieta", "86803379923289"},
        {"Pneu", "85386484414649"},
        {"egito", "117196903794161"},
        {"frontiers", "107819089007268"},
        {"lei dos 3", "118279338474223"},
        {"Antares", "79075022796596"},
        {"nunca será eu", "122871200237533"},
        {"louvando", "105862685513093"},
        {"ID 102333419023382", "102333419023382"},
        {"ID 111668097052966", "111668097052966"},
        {"ID 122871512353520", "122871512353520"},
        {"ID 82805460494325", "82805460494325"},
        {"ID 91502410121438", "91502410121438"},
        {"ID 93786060174790", "93786060174790"},
        {"Capturado 47", "107416893652681"},
        {"Capturado 80", "113039342592508"},
        {"Capturado 92", "127870629973068"},
        {"Capturado 105", "125354466627612"},
        {"Automotivo Bibi Fogosa", "7477390357"},
        {"Montagem Orquestra Sinfonica", "8078396617"},
        {"Automotivo Ritmado", "6587889911"},
        {"Funk do Pão de Queijo", "6472812050"},
        {"Mega Funk Montagem", "6828174814"},
        {"Funk Estourado", "6499742716"},
        {"Beat Bolha", "6386791045"},
        {"Toma Toma Funk", "6516147123"},
        {"Vem Ca deixa eu te falar", "6538082732"},
        {"Ela é da Zona", "6554839120"},
        {"Bota a Mão no Chão", "6848212710"},
        {"Sequência da Dz7", "6907311111"},
        {"Automotivo Insano", "7023154859"},
        {"Mega do Akon", "7329492300"},
        {"Montagem Congelante", "7504829134"},
        {"Berimbau Eletronico", "7698823001"},
        {"Passinho do Romano", "7845123609"},
        {"Funk do Google", "7986214502"},
        {"Senta na Vara", "8123456709"},
        {"Trem Bala Funk", "8256478123"},
        {"Mandelão Atualizado", "8391254761"},
        -- 👉 COLE AQUI TODAS AS SUAS MÚSICAS
    }

    -- ==========================================
    -- 📡 FUNÇÃO TOCAR GLOBAL (OFUSCADA)
    -- ==========================================
    local RE = ReplicatedStorage:WaitForChild("RE", 5)
    local function TocarGlobal(id)
        if not id or id == "" or not RE then return end
        local idReal = tostring(id)

        for _, remoteData in ipairs(remotesCodificados) do
            local remoteName = decodificar(remoteData.name)
            local eventName = decodificar(remoteData.event)
            pcall(function()
                local remote = RE:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer(eventName, idReal, nil, true)
                end
            end)
        end
    end

    local function PararMusica()
        for _, remoteData in ipairs(remotesCodificados) do
            local remoteName = decodificar(remoteData.name)
            pcall(function()
                local remote = RE:FindFirstChild(remoteName)
                if remote then
                    remote:FireServer("StopMusic", "0", nil, true) -- tenta evento de parada
                    remote:FireServer(decodificar(remoteData.event), "0", nil, true)
                end
            end)
        end
    end

    -- ==========================================
    -- 🔊 BOOMBOX SEMPRE NA MÃO
    -- ==========================================
    local BoomboxAtivo = false
    local BoomboxThread = nil

    local function EquiparBoombox()
        local char = LocalPlayer.Character
        if not char then return end
        local humanoid = char:FindFirstChildOfClass("Humanoid")
        if not humanoid then return end
        local backpack = LocalPlayer:FindFirstChild("Backpack")
        if not backpack then return end
        local boombox = backpack:FindFirstChild("Boombox")
        if boombox and boombox:IsA("Tool") then
            if humanoid:FindFirstChild("Boombox") == nil then -- não está equipada
                humanoid:EquipTool(boombox)
            end
        end
    end

    local function IniciarLoopBoombox()
        if BoomboxThread then
            task.cancel(BoomboxThread)
        end
        BoomboxThread = task.spawn(function()
            while BoomboxAtivo do
                pcall(EquiparBoombox)
                task.wait(1.5)
            end
        end)
    end

    -- ==========================================
    -- 🎨 INTERFACE
    -- ==========================================
    -- Caixa de pesquisa
    local SearchBox = Instance.new("TextBox", container)
    SearchBox.Size = UDim2.new(1, -10, 0, 35)
    SearchBox.Position = UDim2.new(0, 5, 0, 5)
    SearchBox.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
    SearchBox.PlaceholderText = "🔍 Pesquisar música..."
    SearchBox.TextColor3 = Color3.fromRGB(255, 255, 255)
    SearchBox.Font = Enum.Font.Gotham
    SearchBox.TextSize = 12
    SearchBox.Parent = container
    Instance.new("UICorner", SearchBox).CornerRadius = UDim.new(0, 6)

    -- Botões de controle
    local BtnParar = Instance.new("TextButton", container)
    BtnParar.Size = UDim2.new(0.45, 0, 0, 30)
    BtnParar.Position = UDim2.new(0, 5, 0, 45)
    BtnParar.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
    BtnParar.Text = "⏹ PARAR MÚSICA"
    BtnParar.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnParar.Font = Enum.Font.GothamBold
    BtnParar.TextSize = 11
    BtnParar.Parent = container
    Instance.new("UICorner", BtnParar).CornerRadius = UDim.new(0, 6)
    BtnParar.MouseButton1Click:Connect(PararMusica)

    local BtnBoombox = Instance.new("TextButton", container)
    BtnBoombox.Size = UDim2.new(0.45, 0, 0, 30)
    BtnBoombox.Position = UDim2.new(0.5, 5, 0, 45)
    BtnBoombox.BackgroundColor3 = Color3.fromRGB(60, 140, 255)
    BtnBoombox.Text = "📻 BOOMBOX: OFF"
    BtnBoombox.TextColor3 = Color3.fromRGB(255, 255, 255)
    BtnBoombox.Font = Enum.Font.GothamBold
    BtnBoombox.TextSize = 11
    BtnBoombox.Parent = container
    Instance.new("UICorner", BtnBoombox).CornerRadius = UDim.new(0, 6)
    BtnBoombox.MouseButton1Click:Connect(function()
        BoomboxAtivo = not BoomboxAtivo
        if BoomboxAtivo then
            BtnBoombox.Text = "📻 BOOMBOX: ON"
            BtnBoombox.BackgroundColor3 = Color3.fromRGB(46, 204, 113)
            IniciarLoopBoombox()
        else
            BtnBoombox.Text = "📻 BOOMBOX: OFF"
            BtnBoombox.BackgroundColor3 = Color3.fromRGB(60, 140, 255)
            if BoomboxThread then
                task.cancel(BoomboxThread)
                BoomboxThread = nil
            end
        end
    end)

    -- Lista de músicas com paginação
    local ScrollMusic = Instance.new("ScrollingFrame", container)
    ScrollMusic.Size = UDim2.new(1, -10, 1, -85)
    ScrollMusic.Position = UDim2.new(0, 5, 0, 85)
    ScrollMusic.BackgroundTransparency = 1
    ScrollMusic.ScrollBarThickness = 3
    ScrollMusic.Parent = container
    local ListMusic = Instance.new("UIListLayout", ScrollMusic)
    ListMusic.Padding = UDim.new(0, 4)

    local ITENS_POR_PAGINA = 10
    local paginaAtual = 1
    local listaFiltrada = {}

    local function AtualizarPagina()
        for _, child in ipairs(ScrollMusic:GetChildren()) do
            if child:IsA("Frame") then child:Destroy() end
        end

        local inicio = (paginaAtual - 1) * ITENS_POR_PAGINA + 1
        local fim = math.min(inicio + ITENS_POR_PAGINA - 1, #listaFiltrada)

        for i = inicio, fim do
            local audio = listaFiltrada[i]
            if audio then
                local Item = Instance.new("Frame", ScrollMusic)
                Item.Size = UDim2.new(1, -4, 0, 38)
                Item.BackgroundColor3 = Color3.fromRGB(22, 28, 38)
                Item.Parent = ScrollMusic
                Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 6)

                local Label = Instance.new("TextLabel", Item)
                Label.Size = UDim2.new(1, -140, 1, 0)
                Label.Position = UDim2.new(0, 10, 0, 0)
                Label.BackgroundTransparency = 1
                Label.Text = audio[1]
                Label.TextColor3 = Color3.fromRGB(220, 225, 235)
                Label.Font = Enum.Font.GothamSemibold
                Label.TextSize = 11
                Label.TextXAlignment = Enum.TextXAlignment.Left
                Label.Parent = Item

                local CopyBtn = Instance.new("TextButton", Item)
                CopyBtn.Size = UDim2.new(0, 45, 0, 25)
                CopyBtn.Position = UDim2.new(1, -100, 0.5, -12.5)
                CopyBtn.BackgroundColor3 = Color3.fromRGB(60, 50, 65)
                CopyBtn.Text = "COPIAR"
                CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
                CopyBtn.Font = Enum.Font.GothamBold
                CopyBtn.TextSize = 9
                CopyBtn.Parent = Item
                Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 4)
                CopyBtn.MouseButton1Click:Connect(function()
                    if setclipboard then pcall(setclipboard, audio[2]) elseif toclipboard then pcall(toclipboard, audio[2]) end
                    CopyBtn.Text = "✔"
                    task.wait(1)
                    CopyBtn.Text = "COPIAR"
                end)

                local PlayBtn = Instance.new("TextButton", Item)
                PlayBtn.Size = UDim2.new(0, 45, 0, 25)
                PlayBtn.Position = UDim2.new(1, -50, 0.5, -12.5)
                PlayBtn.BackgroundColor3 = Color3.fromRGB(60, 140, 255)
                PlayBtn.Text = "TOCAR"
                PlayBtn.TextColor3 = Color3.fromRGB(255,255,255)
                PlayBtn.Font = Enum.Font.GothamBold
                PlayBtn.TextSize = 9
                PlayBtn.Parent = Item
                Instance.new("UICorner", PlayBtn).CornerRadius = UDim.new(0, 4)
                PlayBtn.MouseButton1Click:Connect(function()
                    TocarGlobal(audio[2])
                end)
            end
        end

        ScrollMusic.CanvasSize = UDim2.new(0, 0, 0, math.max(1, #listaFiltrada) * 42 + 10)
    end

    local function FiltrarEAtualizar(texto)
        listaFiltrada = {}
        if texto == "" then
            listaFiltrada = Audios
        else
            for _, audio in ipairs(Audios) do
                if string.find(string.lower(audio[1]), string.lower(texto)) then
                    table.insert(listaFiltrada, audio)
                end
            end
        end
        paginaAtual = 1
        AtualizarPagina()
        local totalPaginas = math.max(1, math.ceil(#listaFiltrada / ITENS_POR_PAGINA))
        PageInfo.Text = "1/" .. totalPaginas
    end

    -- Paginação
    local PageInfo = Instance.new("TextLabel", container)
    PageInfo.Size = UDim2.new(0, 100, 0, 20)
    PageInfo.Position = UDim2.new(0, 5, 1, -30)
    PageInfo.BackgroundTransparency = 1
    PageInfo.Text = "1/1"
    PageInfo.TextColor3 = Color3.fromRGB(220, 225, 235)
    PageInfo.Font = Enum.Font.GothamBold
    PageInfo.TextSize = 12
    PageInfo.Parent = container

    local PrevBtn = Instance.new("TextButton", container)
    PrevBtn.Size = UDim2.new(0, 40, 0, 25)
    PrevBtn.Position = UDim2.new(0, 5, 1, -30)
    PrevBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    PrevBtn.Text = "◀"
    PrevBtn.TextColor3 = Color3.fromRGB(255,255,255)
    PrevBtn.Font = Enum.Font.GothamBold
    PrevBtn.TextSize = 14
    PrevBtn.Parent = container
    Instance.new("UICorner", PrevBtn).CornerRadius = UDim.new(0, 4)

    local NextBtn = Instance.new("TextButton", container)
    NextBtn.Size = UDim2.new(0, 40, 0, 25)
    NextBtn.Position = UDim2.new(1, -45, 1, -30)
    NextBtn.BackgroundColor3 = Color3.fromRGB(40, 40, 60)
    NextBtn.Text = "▶"
    NextBtn.TextColor3 = Color3.fromRGB(255,255,255)
    NextBtn.Font = Enum.Font.GothamBold
    NextBtn.TextSize = 14
    NextBtn.Parent = container
    Instance.new("UICorner", NextBtn).CornerRadius = UDim.new(0, 4)

    PrevBtn.MouseButton1Click:Connect(function()
        if paginaAtual > 1 then
            paginaAtual -= 1
            AtualizarPagina()
            local totalPaginas = math.max(1, math.ceil(#listaFiltrada / ITENS_POR_PAGINA))
            PageInfo.Text = paginaAtual .. "/" .. totalPaginas
        end
    end)
    NextBtn.MouseButton1Click:Connect(function()
        local totalPaginas = math.max(1, math.ceil(#listaFiltrada / ITENS_POR_PAGINA))
        if paginaAtual < totalPaginas then
            paginaAtual += 1
            AtualizarPagina()
            PageInfo.Text = paginaAtual .. "/" .. totalPaginas
        end
    end)

    -- Busca com debounce
    local ultimoFiltro = ""
    local searchConn
    searchConn = SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
        local novo = SearchBox.Text
        if novo ~= ultimoFiltro then
            ultimoFiltro = novo
            task.spawn(function()
                FiltrarEAtualizar(novo)
            end)
        end
    end)

    -- Inicializar
    FiltrarEAtualizar("")

    -- Limpeza ao sair
    container.AncestryChanged:Connect(function(_, parent)
        if not parent then
            BoomboxAtivo = false
            if BoomboxThread then task.cancel(BoomboxThread) end
        end
    end)
end
