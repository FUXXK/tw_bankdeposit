---------------------------------------------------------------------
--                   tw_bankdeposit by Twinkle                     --
--                     Discord: Twinkle#0110                       --
--     This script was based on esx_bankdeposit by FrostyLucas     --
--            Don't Change the name and don't reupload.            --
--                 https://forum.fivem.net/u/il_creon              --
---------------------------------------------------------------------

Keys = {
    ["E"] = 38,
}

ESX = nil
Player = nil
VaultCache = {}

local Bank = {

    {title="Pacific Bank | Bank Deposit ", colour=2, id=408, scale=1.2, x = 242.629, y = 222.513, z = 106.287},
  
    }

    Citizen.CreateThread(function()
        while ESX == nil do
            Citizen.Wait(100)
    
            TriggerEvent("esx:getSharedObject", function(library)
                ESX = library
            end)
        end
    end)

Citizen.CreateThread(function()
	while true do

	Citizen.Wait(0)

		local playerPed = PlayerPedId()
		local coords    = GetEntityCoords(playerPed)
			
		if GetDistanceBetweenCoords(coords, 242.793, 224.521, 106.287, true) then
			DrawMarker(-0, 242.793, 224.521, 106.287, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 242.793, 224.521, 106.287, true) < 1.0 then
                DisplayHelpText('Premi ~INPUT_PICKUP~ per richiedere l\'accesso alla tua cassetta privata')
                if IsControlJustReleased(1, 51) then
                    OnLoad()
				end
			end
        end
        
		if GetDistanceBetweenCoords(coords,256.134,226.562,101.876, true) then
			DrawMarker(-0, 256.134,226.562,101.876,  0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 256.134,226.562,101.876,  true) < 0.5 then
                DisplayHelpText('Premi ~INPUT_PICKUP~ per richiedere l\'apertura del bunker')
                if IsControlJustReleased(1, 51) then
                  AperturaPorta()
                  Citizen.Wait(1)
                  ChiusuraPorta()
                end
            end
        end
        
        if GetDistanceBetweenCoords(coords,265.102, 213.952, 101.688, true) then
			DrawMarker(-0, 265.102, 213.952, 101.688, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 265.102, 213.952, 101.688, true) < 1.0 then
                DisplayHelpText('Premi ~INPUT_PICKUP~ per accedere alla tua Cassetta')
                if IsControlJustReleased(1, 51) then
                    OpenVault()
                end
			end
        end
        
        if GetDistanceBetweenCoords(coords, 253.479, 220.738, 106.287, true) then
			DrawMarker(-0, 253.479, 220.738, 106.287, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 253.479, 220.738, 106.287, true) < 1.0 then
                DisplayHelpText('Premi ~INPUT_PICKUP~ per registrare una cassetta di sicurezza')
                if IsControlJustReleased(1, 51) then
                    registra()
                end
			end
        end

        if GetDistanceBetweenCoords(coords,253.226,222.994,101.683, true) then
			DrawMarker(-0, 253.226,222.994,101.683, 0.0, 0.0, 0.0, 0, 0.0, 0.0, 0.5, 0.5, 0.5, 255, 0, 0, 100, false, true, 2, false, false, false, false)
			if GetDistanceBetweenCoords(coords, 253.226,222.994,101.683, true) < 0.5 then
                DisplayHelpText('Premi ~INPUT_PICKUP~ per richiedere l\'apertura del bunker')
                if IsControlJustReleased(1, 51) then
                  AperturaPorta()
                  Citizen.Wait(1)
                  ChiusuraPorta()
                end
            end
        end
        
        for _, info in pairs(Bank) do
            info.blip = AddBlipForCoord(info.x, info.y, info.z)
            SetBlipSprite(info.blip, info.id)
            SetBlipDisplay(info.blip, 4)
            SetBlipScale(info.blip, info.scale)
            SetBlipColour(info.blip, info.colour)
            SetBlipAsShortRange(info.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString(info.title)
            EndTextCommandSetBlipName(info.blip)
          end
	end
end)


function seguimi()
    RequestModel( GetHashKey( "ig_bankman" ) )
    while ( not HasModelLoaded( GetHashKey( "ig_bankman" ) ) ) do
    Citizen.Wait( 1 )
    end
    local ped = CreatePed(4, 0x909D9E7F, 244.764, 227.603, 106.287, true)
    SetEntityAsMissionEntity(ped)
    Wait(1000)
    TaskGoStraightToCoord(ped, 248.422, 226.244, 106.287, 1.0, -1, 238.812, 0.0)
    ESX.ShowNotification('Mi segua, ora andremo Giù per accedere alla cassetta')
    Wait(2000)
    TaskGoStraightToCoord(ped, 254.165, 223.183, 106.286, 1.0, -1, 117.241, 0.0)
    Wait(3000)
    ESX.ShowNotification('Posso darti del tu giusto? Hai l\'età di mio figlio! Potrei essere tuo padre')
    TaskGoStraightToCoord(ped, 257.165, 223.183, 106.286, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    TaskGoStraightToCoord(ped, 258.165, 223.183, 106.286, 1.0, -1, 117.241, 0.0)
    Wait(4000) 
    ESX.ShowNotification('Stiamo Scendendo, ora entra dalla porta e seguimi, arriveremo subito')
    TaskGoStraightToCoord(ped, 259.538, 222.012, 106.284, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Abbiamo tutto pronto giusto? Hai già la chiave della tua cassetta?')
    TaskGoStraightToCoord(ped, 260.949, 222.244, 106.284, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Perfetto, Adesso arriverà la guardia Joan ad aprirci') 
    TaskGoStraightToCoord(ped, 263.413, 221.416, 106.282, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Joan è un pò particolare, è paranoico stai tranquillo')
    TaskGoStraightToCoord(ped, 266.952, 219.066, 104.889, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Ecco ci siamo, sei mai stato in un bunker? Qui è pieno di Contanti!')
    TaskGoStraightToCoord(ped, 268.53, 222.963, 103.662, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Per questo devo farti seguire da 2 Guardie')
    TaskGoStraightToCoord(ped, 263.937, 224.426, 101.613, 1.0, -1, 117.241, 0.0)
    Wait(4000)
    ESX.ShowNotification('Ora richiedi l\'apertura tu personalmente mostrando i tuoi documenti')
    TaskGoStraightToCoord(ped, 259.94, 226.079, 101.683, 1.0, -1, 117.241, 0.0)
    Wait(20000)
        DeletePed(ped)
end


function AperturaPorta()
    local coords = {x,y,z}
    local obs, distance = ESX.Game.GetClosestObject(doortype, coords)

    SetEntityHeading(obs, 160.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 150.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 140.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 130.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 120.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 110.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 100.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 90.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 80.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 70.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 60.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 50.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 40.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 30.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 20.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 10.0, -0, 85.0, false, true)
    Citizen.Wait(200)
    SetEntityHeading(obs, 0.0, -0, 85.0, false, true)

  end

  function ChiusuraPorta()
    local coords = {x,y,z}
    local obs, distance = ESX.Game.GetClosestObject(doortype, coords)

    SetEntityHeading(obs, 0.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 10.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 20.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 30.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 40.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 50.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 60.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 70.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 80.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 90.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 100.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 110.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 120.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 130.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 140.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 150.0, -0, 85.0, false, true)
    Citizen.Wait(300)
    SetEntityHeading(obs, 160.0, -0, 85.0, false, true)

  end

  function DisplayHelpText(str)
	SetTextComponentFormat("STRING")
	AddTextComponentString(str)
	DisplayHelpTextFromStringLabel(0, 0, 1, -1)
end

function guardie()
    RequestModel( GetHashKey( "S_M_M_Security_01" ) )
    local ped1 = CreatePed(4, 0xD768B228, 252.41, 217.532, 101.683, true)
    local ped2 = CreatePed(4, 0xD768B228, 258.224, 214.55, 101.683, true)
    Wait(40000)
       DeletePed(ped1)
       DeletePed(ped2)
end


function registra()
    Player = ESX.GetPlayerData()

    ESX.TriggerServerCallback("Bank.Deposit.FetchCache", function(cache)
        if cache == nil then
            ESX.UI.Menu.CloseAll()

                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Bank_Deposit_Purchase",
                    {
                        title = "Central Pacific Bank",
                        align = "top-left",
                        elements = {
                            { label = ('Registra una Cassetta di Sicurezza'), value = "registra" },

                        }
                    },
                    function(data, menu)
                        menu.close()
                        if data.current.value == "registra" then
                            ESX.TriggerServerCallback("Bank.Deposit.Purchase", function(response)
                                    UnlockVault()
                            end)
                        end
                    end,
                    function(data, menu)
                        menu.close()
                    end)
        end
    end)
end

function OnLoad()

                ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Bank_Deposit_Visit",
                    {
                        title = "Central Pacific Bank",
                        align = "top-left",
                        elements = {
                            { label = ('Accedi alla tua cassetta di sicurezza'), value = "visita" },

                        }
                    },
                    function(data, menu)
                        menu.close()
                        if data.current.value == "visita" then
                                seguimi()
                                end
    end)
end

function OpenVault()
    ESX.TriggerServerCallback("Bank.Deposit.FetchCache", function(cache)

    local elements = {}

    for k, v in pairs(VaultCache) do
        if v["amount"] > 0 then
            table.insert(elements, { value = k, amount = v["amount"], label = v["label"] .. " x" .. v["amount"] })
        end
    end

    table.insert(elements, { label = 'Deposita Oggetto', value = "__add" })

    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Bank_Deposit_Vault",
        {
            title = "Cassetta di Sicurezza | PBank",
            align = "top-left",
            elements = elements
        },
        function(data, menu)
            menu.close()

            if data.current.value == "__add" then
                OpenInventory(function(item, label, amount)
                    ESX.TriggerServerCallback("Bank.Deposit.RemoveItem", function(response)
                        if response == 0 then
                            local existing = VaultCache[item]

                            if existing ~= nil and existing["amount"] ~= nil then
                                existing = tonumber(existing["amount"])
                            else
                                existing = 0
                            end

                            VaultCache[item] = { ["label"] = label, ["amount"] = existing + amount }

                            TriggerServerEvent("Bank.Deposit.UpdateCache", GetPlayerServerId(PlayerId()), json.encode(VaultCache))
                        else
                            ESX.ShowNotification('Valore non Valido')
                        end

                        OpenVault()
                    end, item, amount)
                end, function()
                    OpenVault()
                end)
            else
                RetrieveItem(data.current.value, data.current.amount)
            end
        end,
        function(data, menu)
            menu.close()
        end)
    end)
end

function RetrieveItem(item, itemAmount)
    if itemAmount > 1 then
        ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "Bank_Deposit_Inventory_Retrieve_Amount",
            {
                title = "Ritira"
            },
            function(data, menu)
                menu.close()

                local amount = tonumber(data.value)

                if amount == nil or amount > itemAmount then
                    ESX.ShowNotification('Valore non Valido')

                    OpenVault()
                else
                    VaultCache[item]["amount"] = VaultCache[item]["amount"] - amount

                    TriggerServerEvent("Bank.Deposit.AddItem", GetPlayerServerId(PlayerId()), item, amount)
                    TriggerServerEvent("Bank.Deposit.UpdateCache", GetPlayerServerId(PlayerId()), json.encode(VaultCache))
                end
            end,
            function(data, menu)
                OpenVault()
            end)
    else
        VaultCache[item]["amount"] = VaultCache[item]["amount"] - 1

        TriggerServerEvent("Bank.Deposit.AddItem", GetPlayerServerId(PlayerId()), item, 1)
        TriggerServerEvent("Bank.Deposit.UpdateCache", GetPlayerServerId(PlayerId()), json.encode(VaultCache))
    end
end

function OpenInventory(submitFunc, cancelFunc)
    local elements = {}

    ESX.TriggerServerCallback("Bank.Deposit.FetchInventory", function(inventory)
        for k, v in pairs(inventory) do
            if v["count"] > 0 then
                table.insert(elements, { label = v["label"] .. " x" .. v["count"], itemLabel = v["label"], value = v["name"], amount = v["count"] })
            end
        end

        ESX.UI.Menu.CloseAll()
        ESX.UI.Menu.Open("default", GetCurrentResourceName(), "Bank_Deposit_Inventory",
            {
                title = "Trasferisci Nella Cassetta",
                align = "top-left",
                elements = elements
            },
            function(data, menu)
                menu.close()

                if data.current.amount > 1 then
                    local item = data.current.value
                    local label = data.current.itemLabel

                    ESX.UI.Menu.Open("dialog", GetCurrentResourceName(), "Bank_Deposit_Inventory_Amount",
                        {
                            title = "Quantità?"
                        },
                        function(data, menu)
                            menu.close()

                            local amount = tonumber(data.value)

                            if amount == nil then
                                ESX.ShowNotification('Valore non Valido')

                                OpenInventory(submitFunc, cancelFunc)
                            else
                                submitFunc(item, label, amount)
                            end
                        end,
                        function(data, menu)
                            OpenInventory(submitFunc, cancelFunc)
                        end)
                else
                    submitFunc(data.current.value, data.current.itemLabel, 1)
                end
            end,
            function(data, menu)
                menu.close()

                cancelFunc()
            end)
    end)
end