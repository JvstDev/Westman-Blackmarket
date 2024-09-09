ESX = exports[Config.Engine]:getSharedObject()

nui_open = false

if not Config.UseItem then
CreateThread(function()
  while true do 
    local location = Config.Location
    local sleep = 2500
    local ped = PlayerPedId()
    local player_coords = GetEntityCoords(ped)
    local distance = #(player_coords - location)
    if distance <= 3.0 then
    
      sleep = 1
        DrawText3D(location.x, location.y, location.z, ""..Locales.open_blackmarket.. "")
    if IsControlJustReleased(0, 38) then 
        OpenNUI()
        SendNUIMessage({
          action = "send_login_info",
          info = {Config.Username, Config.Password}
        })
         
        SendNUIMessage({
          action = 'get_items_info',
          info = Config.Items
      })
        nui_open = true
    end
    end
  Wait(sleep)
end
end)
end 

RegisterNUICallback("buy", function(data, cb)
local item_name = data.item_name
local item_hash = data.item_hash
local item_price = data.item_price
local item_quantity = data.item_quantity

TriggerServerEvent("westman_blackmarket:Buy", item_name, item_hash, item_price, item_quantity)
end)

RegisterNUICallback("close", function()
  if nui_open then 
    OpenNUI()
  end
end)

RegisterNUICallback("error", function()
ESX.ShowNotification(Locales.login_failed)
end)

RegisterNetEvent("westman_blackmarket:Open")
AddEventHandler("westman_blackmarket:Open", function()
  OpenNUI()
  SendNUIMessage({
    action = "send_login_info",
    info = {Config.Username, Config.Password}
  })
   
  SendNUIMessage({
    action = 'get_items_info',
    info = Config.Items
})
end)

OpenNUI = function()
  if not nui_open then 
    nui_open = true 
    SetNuiFocus(true, true)
    SendNUIMessage({
      action = "open"
    })
  else 
    nui_open = false 
    SetNuiFocus(false, false)
    SendNUIMessage({
      action = 'close'
    })
  end
end

exports('OpenBlackmarket', OpenNUI)

  DrawText3D = function(x, y, z, text)
    local onScreen, screenX, screenY = World3dToScreen2d(x, y, z)
  
    if onScreen then 
        local factor = (string.len(text)) / 380
        SetTextScale(0.36, 0.36)
        SetTextFont(4)
        SetTextColour(255, 255, 255, 215)
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(x, y, z, 0) 
        EndTextCommandDisplayText(0.0, -0.10)
        DrawRect(0.0, -0.10+0.0125, 0.020+ factor, 0.03, 0, 0, 0, 80)
        ClearDrawOrigin()
    end
  end