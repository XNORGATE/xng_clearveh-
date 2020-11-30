ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('xng_clearveh')
AddEventHandler('xng_clearveh', function()
 TriggerClientEvent('chatMessage', -1, "[城市通知]", {238, 78, 118}, "無人車輛"..Config.clearafternoti.."秒後即將被拖吊") 
end)
