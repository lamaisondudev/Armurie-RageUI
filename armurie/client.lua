ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)  
	PlayerData.job = job  
	Citizen.Wait(5000) 
end)

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
    end
    while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
    end
    if ESX.IsPlayerLoaded() then

		ESX.PlayerData = ESX.GetPlayerData()

    end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)


RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

local function sendNotification(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(true, false)
end


RMenu.Add("armurie", "acceuil", RageUI.CreateMenu("Armurie","Catalogue :"))
RMenu.Add("arme", "lourde", RageUI.CreateMenu("Arme lourde","Catalogue :"))
RMenu.Add("arme", "legere", RageUI.CreateMenu("Arme legere","Catalogue :"))
RMenu.Add("arme", "access", RageUI.CreateMenu("Accessoire","Catalogue :"))

function menuarme()
    if open then 
        open = false 
        RageUI.Visible(RMenu:Get("armurie", "acceuil"),false)
    else
        open = true 
        RageUI.Visible(RMenu:Get("armurie", "acceuil"), true)
        Citizen.CreateThread(function()
            while open do 
                RageUI.IsVisible(RMenu:Get("armurie", "acceuil"), true,true,true,function()

                    RageUI.ButtonWithStyle("Arme lourde", nil, {}, true, function(h,a,s)
                    end, RMenu:Get("arme", "lourde"))

                    RageUI.ButtonWithStyle("Arme legere", nil, {}, true, function(h,a,s)
                    end, RMenu:Get("arme", "legere"))

                    RageUI.ButtonWithStyle("Accessoire", nil, {}, true, function(h,a,s)
                    end, RMenu:Get("arme", "access"))

                    RageUI.ButtonWithStyle("Rendre ces armes", nil, {}, true, function(h,a,s)
                        if s then
                            RemoveAllPedWeapons(GetPlayerPed(-1), true)
                            sendNotification("Tu a rendu tes arme ! ~b~Merci a toi !")
                        end
                    end)

                end, function()end, 1)


                RageUI.IsVisible(RMenu:Get("arme", "lourde"), true,true,true,function()

                    RageUI.ButtonWithStyle("M4A1", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_carbinerifle"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 200, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                    RageUI.ButtonWithStyle("Fusil a pompe", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_pumpshotgun"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 70, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                end, function()end, 1)

                RageUI.IsVisible(RMenu:Get("arme", "legere"), true,true,true,function()

                    RageUI.ButtonWithStyle("Pistolet de combat", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_combatpistol"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 200, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                    RageUI.ButtonWithStyle("Pistolet lourd", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_heavypistol"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 200, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                end, function()end, 1)

                RageUI.IsVisible(RMenu:Get("arme", "access"), true,true,true,function()

                    RageUI.ButtonWithStyle("Matraque", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_nightstick"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 1, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                    RageUI.ButtonWithStyle("Tazer", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_stungun"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 10, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                    RageUI.ButtonWithStyle("Lampe de poche", nil, {}, true, function(h,a,s)
                        if s then
                            local ped = PlayerPedId()
                            local arme = "weapon_flashlight"
                            local weaponhash = GetHashKey(arme)
                        
                            GiveWeaponToPed(ped, weaponhash, 1, false, true)
                            sendNotification("Tu a reçu ton arme ! ~r~Prend en soin")
                        end
                    end)

                end, function()end, 1)

                Wait(0)
            end
        end)
    end
end

local armurie = {
    {x = 481.72, y = -996.19, z = 30.69 }
}

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)

        for k in pairs(armurie) do

            local plyCoords = GetEntityCoords(GetPlayerPed(-1), false)
            local dist = Vdist(plyCoords.x, plyCoords.y, plyCoords.z, armurie[k].x, armurie[k].y, armurie[k].z)

            if dist <= 1.0 and ESX.PlayerData.job and ESX.PlayerData.job.name == 'police' then

               RageUI.Text({
                    message = "Appuyez sur [~b~E~w~] pour acceder au ~b~Coffre",
                    time_display = 1
                })
                if IsControlJustPressed(1,51) then
                    menuarme()
                end
            end
        end
    end
end)