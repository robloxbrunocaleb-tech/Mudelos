-- ==========================================
-- 👑 IMPERIAL AUDIO HUB | BOT & MASTER EDITION
-- ==========================================

local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Player = Players.LocalPlayer

-- ==========================================
-- ⚙️ CONFIGURAÇÃO MESTRE & BOT
-- ==========================================
local MASTER_NAME = "mudinho0975"

-- Proteção contra duplicação
local guiParent = CoreGui:FindFirstChild("RobloxGui") or Player:WaitForChild("PlayerGui")
if guiParent:FindFirstChild("ImperialAudioHub") then
    guiParent.ImperialAudioHub:Destroy()
end

local function CopiarID(texto)
    if setclipboard then pcall(setclipboard, texto)
    elseif toclipboard then pcall(toclipboard, texto) end
end

-- ==========================================
-- 🎵 LISTA BRUTA DE MÚSICAS
-- ==========================================
local RawAudios = {
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
}

-- Remove duplicatas
local Audios = {}
local Vistos = {}
for _, item in ipairs(RawAudios) do
    local nome = item[1]
    local id = tostring(item[2]):gsub("%s+", "")
    if not Vistos[id] then
        Vistos[id] = true
        table.insert(Audios, {nome, id})
    end
end

-- ==========================================
-- ⚙️ MOTOR DE DISPARO GLOBAL (BROOKHAVEN)
-- ==========================================
local RE = ReplicatedStorage:WaitForChild("RE")

local function TocarGlobal(id)
    if id == "" or id == nil then return end

    pcall(function() RE:WaitForChild("PlayerToolEvent"):FireServer("ToolMusicText", id, nil, true) end)
    pcall(function() RE:WaitForChild("1Player1sHous1e"):FireServer("PickHouseMusicText", id, nil, true) end)
    pcall(function() RE:WaitForChild("1Player1sCa1r"):FireServer("Music", id, nil, true) end)
    pcall(function() RE:WaitForChild("1NoMoto1rVehicle1s"):FireServer("PickingScooterMusicText", id, nil, true) end)
    pcall(function() RE:WaitForChild("1Hors1eRemot1e"):FireServer("HorseMusicText", id, nil, true) end)
    pcall(function() RE:WaitForChild("Props"):FireServer("PropMusicText", id, nil, true) end)
end

-- ==========================================
-- 🗣️ SISTEMA DE CHAT & MESTRE
-- ==========================================
local function FalarNoChat(mensagem)
    pcall(function()
        ReplicatedStorage.DefaultChatSystemChatEvents.SayMessageRequest:FireServer(mensagem, "All")
    end)
    pcall(function()
        local textChannel = game:GetService("TextChatService").TextChannels.RBXGeneral
        textChannel:SendAsync(mensagem)
    end)
end

local function ProcessarComando(msg)
    local comando = string.lower(msg)

    if comando == "/desligar musica" then
        FalarNoChat("selecionando musica")
        task.wait(1.5)
        TocarGlobal("0")
        FalarNoChat("Adicionado")

    elseif comando == "/ligar" then
        local currentID = guiParent.ImperialAudioHub.MainFrame.InputID.Text
        if currentID == "" then
            currentID = Audios[1][2]
            guiParent.ImperialAudioHub.MainFrame.InputID.Text = currentID
        end
        FalarNoChat("selecionando musica")
        task.wait(1.5)
        TocarGlobal(currentID)
        FalarNoChat("Adicionado")

    elseif comando == "/ligar favoritos" then
        FalarNoChat("selecionando musica")
        task.wait(1.5)
        local musicaAleatoria = Audios[math.random(1, #Audios)][2]
        guiParent.ImperialAudioHub.MainFrame.InputID.Text = musicaAleatoria
        TocarGlobal(musicaAleatoria)
        FalarNoChat("Adicionado")
    end
end

local function EscutarJogador(p)
    if p.Name:lower() == MASTER_NAME:lower() or p == Player then
        p.Chatted:Connect(function(msg)
            ProcessarComando(msg)
        end)
    end
end

for _, p in ipairs(Players:GetPlayers()) do
    EscutarJogador(p)
end
Players.PlayerAdded:Connect(EscutarJogador)

-- ==========================================
-- 🎨 INTERFACE GRÁFICA (GUI)
-- ==========================================
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "ImperialAudioHub"
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = guiParent

-- ===== BOTÃO MOBILE FLUTUANTE =====
local MobileBtn = Instance.new("TextButton", ScreenGui)
MobileBtn.Size = UDim2.new(0, 50, 0, 50)
MobileBtn.Position = UDim2.new(0, 20, 0.5, -25)
MobileBtn.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
MobileBtn.Text = "👑"
MobileBtn.TextSize = 25
MobileBtn.AutoButtonColor = false
Instance.new("UICorner", MobileBtn).CornerRadius = UDim.new(1, 0)
local MobileStroke = Instance.new("UIStroke", MobileBtn)
MobileStroke.Color = Color3.fromRGB(255, 215, 0)
MobileStroke.Thickness = 2

-- ===== JANELA PRINCIPAL =====
local MainFrame = Instance.new("Frame", ScreenGui)
MainFrame.Name = "MainFrame"
MainFrame.Size = UDim2.new(0, 420, 0, 450)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -225)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 17)
MainFrame.Visible = false
MainFrame.ClipsDescendants = true
Instance.new("UICorner", MainFrame).CornerRadius = UDim.new(0, 10)
local MainStroke = Instance.new("UIStroke", MainFrame)
MainStroke.Color = Color3.fromRGB(255, 215, 0)
MainStroke.Thickness = 1.5

-- Barra Superior
local TopBar = Instance.new("Frame", MainFrame)
TopBar.Size = UDim2.new(1, 0, 0, 40)
TopBar.BackgroundTransparency = 1

local Title = Instance.new("TextLabel", TopBar)
Title.Size = UDim2.new(1, -50, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "👑 IMPERIAL AUDIO | MASTER BOT"
Title.TextColor3 = Color3.fromRGB(255, 215, 0)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 15
Title.TextXAlignment = Enum.TextXAlignment.Left

local CloseBtn = Instance.new("TextButton", TopBar)
CloseBtn.Size = UDim2.new(0, 40, 0, 40)
CloseBtn.Position = UDim2.new(1, -40, 0, 0)
CloseBtn.BackgroundTransparency = 1
CloseBtn.Text = "✖"
CloseBtn.TextColor3 = Color3.fromRGB(255, 80, 80)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 18

-- Caixas e Botões Principais
local InputID = Instance.new("TextBox", MainFrame)
InputID.Name = "InputID"
InputID.Size = UDim2.new(0.9, 0, 0, 35)
InputID.Position = UDim2.new(0.05, 0, 0, 45)
InputID.BackgroundColor3 = Color3.fromRGB(25, 25, 30)
InputID.TextColor3 = Color3.fromRGB(255, 255, 255)
InputID.PlaceholderText = "ID Manual da Música..."
InputID.Font = Enum.Font.GothamSemibold
InputID.TextSize = 14
Instance.new("UICorner", InputID).CornerRadius = UDim.new(0, 6)
Instance.new("UIStroke", InputID).Color = Color3.fromRGB(50, 50, 50)

local BtnPlay = Instance.new("TextButton", MainFrame)
BtnPlay.Size = UDim2.new(0.43, 0, 0, 35)
BtnPlay.Position = UDim2.new(0.05, 0, 0, 90)
BtnPlay.BackgroundColor3 = Color3.fromRGB(40, 160, 70)
BtnPlay.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnPlay.Text = "▶ TOCAR GLOBAL"
BtnPlay.Font = Enum.Font.GothamBold
BtnPlay.TextSize = 12
Instance.new("UICorner", BtnPlay).CornerRadius = UDim.new(0, 6)

local BtnStop = Instance.new("TextButton", MainFrame)
BtnStop.Size = UDim2.new(0.43, 0, 0, 35)
BtnStop.Position = UDim2.new(0.52, 0, 0, 90)
BtnStop.BackgroundColor3 = Color3.fromRGB(200, 50, 50)
BtnStop.TextColor3 = Color3.fromRGB(255, 255, 255)
BtnStop.Text = "⏹ PARAR TUDO"
BtnStop.Font = Enum.Font.GothamBold
BtnStop.TextSize = 12
Instance.new("UICorner", BtnStop).CornerRadius = UDim.new(0, 6)

BtnPlay.MouseButton1Click:Connect(function()
    local id = string.gsub(InputID.Text, "%s+", "")
    TocarGlobal(id)
end)

BtnStop.MouseButton1Click:Connect(function()
    TocarGlobal("0")
end)

-- Lista Rolável
local ScrollFrame = Instance.new("ScrollingFrame", MainFrame)
ScrollFrame.Size = UDim2.new(1, -20, 1, -160)
ScrollFrame.Position = UDim2.new(0, 10, 0, 150)
ScrollFrame.BackgroundTransparency = 1
ScrollFrame.ScrollBarThickness = 5
ScrollFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 215, 0)

local ListLayout = Instance.new("UIListLayout", ScrollFrame)
ListLayout.Padding = UDim.new(0, 8)
ListLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- Preenchendo a lista de músicas
for _, audio in ipairs(Audios) do
    local Item = Instance.new("Frame", ScrollFrame)
    Item.Size = UDim2.new(1, -10, 0, 45)
    Item.BackgroundColor3 = Color3.fromRGB(25, 25, 28)
    Instance.new("UICorner", Item).CornerRadius = UDim.new(0, 6)

    local Label = Instance.new("TextLabel", Item)
    Label.Size = UDim2.new(0.5, 0, 1, 0)
    Label.Position = UDim2.new(0, 10, 0, 0)
    Label.BackgroundTransparency = 1
    Label.Text = audio[1]
    Label.TextColor3 = Color3.fromRGB(220, 220, 220)
    Label.Font = Enum.Font.GothamSemibold
    Label.TextSize = 12
    Label.TextXAlignment = Enum.TextXAlignment.Left

    local CopyBtn = Instance.new("TextButton", Item)
    CopyBtn.Size = UDim2.new(0, 65, 0, 30)
    CopyBtn.Position = UDim2.new(1, -145, 0.5, -15)
    CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
    CopyBtn.Text = "COPIAR"
    CopyBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
    CopyBtn.Font = Enum.Font.GothamBold
    CopyBtn.TextSize = 10
    Instance.new("UICorner", CopyBtn).CornerRadius = UDim.new(0, 5)

    CopyBtn.Activated:Connect(function()
        CopiarID(audio[2])
        CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 200, 50)
        CopyBtn.Text = "✔"
        task.wait(1)
        CopyBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 55)
        CopyBtn.Text = "COPIAR"
    end)

    local PlayDiretoBtn = Instance.new("TextButton", Item)
    PlayDiretoBtn.Size = UDim2.new(0, 65, 0, 30)
    PlayDiretoBtn.Position = UDim2.new(1, -75, 0.5, -15)
    PlayDiretoBtn.BackgroundColor3 = Color3.fromRGB(255, 215, 0)
    PlayDiretoBtn.Text = "TOCAR"
    PlayDiretoBtn.TextColor3 = Color3.fromRGB(0, 0, 0)
    PlayDiretoBtn.Font = Enum.Font.GothamBold
    PlayDiretoBtn.TextSize = 10
    Instance.new("UICorner", PlayDiretoBtn).CornerRadius = UDim.new(0, 5)

    PlayDiretoBtn.Activated:Connect(function()
        InputID.Text = audio[2]
        TocarGlobal(audio[2])
    end)
end

ScrollFrame.CanvasSize = UDim2.new(0, 0, 0, ListLayout.AbsoluteContentSize.Y + 20)

-- ==========================================
-- ⚙️ MOVIMENTAÇÃO E ABERTURA
-- ==========================================
local isMainOpen = false
local function ToggleMain()
    isMainOpen = not isMainOpen
    MainFrame.Visible = isMainOpen
end
CloseBtn.Activated:Connect(ToggleMain)

local dragToggle, dragStart, startPos, isDragging = false, nil, nil, false
MobileBtn.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle, isDragging = true, false
        dragStart, startPos = input.Position, MobileBtn.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragStart
        if delta.Magnitude > 5 then isDragging = true end
        MobileBtn.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end
end)
MobileBtn.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragToggle = false
        if not isDragging then ToggleMain() end
    end
end)

local dragMainToggle, dragMainStart, startMainPos
TopBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragMainToggle, dragMainStart, startMainPos = true, input.Position, MainFrame.Position
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragMainToggle and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
        local delta = input.Position - dragMainStart
        MainFrame.Position = UDim2.new(startMainPos.X.Scale, startMainPos.X.Offset + delta.X, startMainPos.Y.Scale, startMainPos.Y.Offset + delta.Y)
    end
end)
TopBar.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragMainToggle = false
    end
end)
