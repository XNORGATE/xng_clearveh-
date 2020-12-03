ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

Citizen.CreateThread(function()
    while Config.autoclear do
        Citizen.Wait(Config.min *60000)
        TriggerClientEvent('chatMessage', -1, "[城市通知]", {238, 78, 118}, "無人車輛"..Config.clearafternoti.."秒後即將被拖吊") 
        Citizen.Wait(Config.clearafternoti*1000)
        TriggerClientEvent('xng_clearvehcl',-1)
    end    
end)

