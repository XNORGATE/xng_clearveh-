ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterCommand("clearveh", function()

TriggerServerEvent('xng_clearveh')

Citizen.Wait(Config.clearafternoti*1000)
	local cars = ESX.Game.GetVehicles()
	
	for i=1, #cars, 1 do
    local passengers = GetVehicleNumberOfPassengers(cars[i])
    local driverSeatFree = IsVehicleSeatFree(cars[i], -1)
      if passengers == 0 and driverSeatFree
      then
 		     DeleteEntity(cars[i])
 	    end
   end
ESX.ShowNotification('車子已清除')
end)

Citizen.CreateThread(function()
while Config.autoclear do
  Citizen.Wait(Config.autoclearhour*36000000)
	local cars = ESX.Game.GetVehicles()
TriggerServerEvent('xng_clearveh')
    Citizen.Wait(Config.clearafternoti*1000)
	for i=1, #cars, 1 do
    local passengers = GetVehicleNumberOfPassengers(cars[i])
    local driverSeatFree = IsVehicleSeatFree(cars[i], -1)
      if passengers == 0 and driverSeatFree
      then
 		     DeleteEntity(cars[i])
 	    end
  	  end
  	end
	end)


Citizen.CreateThread(function()
	TriggerEvent('chat:addSuggestion', '/clearveh', "delete all non-ped vehicle in server." )
end)