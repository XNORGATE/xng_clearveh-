ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


RegisterCommand("clearveh", function()
	Citizen.Wait(Config.clearafternoti*1000)
	TriggerEvent('xng_clearvehcl')
  ESX.ShowNotification('車子已清除')
end)




Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/clearveh', "delete all non-ped vehicle in server." )
end)


RegisterNetEvent('xng_clearvehcl')
AddEventHandler('xng_clearvehcl', function()
	local cars = ESX.Game.GetVehicles()
	for i=1, #cars, 1 do
		local driveable = IsVehicleDriveable(cars[i], 0)
        local passengers = GetVehicleNumberOfPassengers(cars[i])
        local driverSeatFree = IsVehicleSeatFree(cars[i], -1)
        if passengers == 0 and driverSeatFree and driveable then
 		    DeleteEntity(cars[i])
 	    end
  	end
end)
