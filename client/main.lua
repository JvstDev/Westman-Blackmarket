
local keybind = false
local currentLocation = ""

local function nuiState(state)
    SetNuiFocus(state, state)
    SetNuiFocusKeepInput(not state)
    SendNUIMessage({ action = state and "open" or "close" })
end

local function openNui(location)
    local current = Config.Locations[location]
    assert(current, ("Undefined location %s"):format(location))
    SendNUIMessage({
        action = "send_login_info",
        info = {
            current.username, 
            current.password
        }
    })
    SendNUIMessage({
        action = 'get_items_info',
        info = current.shop
    })
    nuiState(true)
end

if not Config?.Item.Enabled then
    ESX.RegisterInput("blackmarket", TranslateCap("keybind"), "keyboard", "E", function()
        if keybind then
            openNui(currentLocation)
        end
    end)
    CreateThread(function()
        while true do 
            local sleep = 100
            for k, v in pairs(Config.Locations) do 
                local player = GetEntityCoords(PlayerPedId())
                local distance = #(player - v.coords)

                if distance <= 3.0 then
                    sleep = 0
                    ESX.Game.Utils.DrawText3D(v.coords, TranslateCap("open_blackmarket"), 0.6)
                    keybind = (distance <= 1.0)
                    currentLocation = k
                end
            end
            Wait(sleep)
        end
    end)
end 

RegisterNUICallback("buy", function(data, cb)
    TriggerServerEvent("westman_blackmarket:Buy", data)
    cb({})
end)

RegisterNUICallback("close", function()
    nuiState(false)
end)

RegisterNUICallback("error", function()
    ESX.ShowNotification(TranslateCap("login_failed"), "error")
end)

RegisterNetEvent("westman_blackmarket:Open")
AddEventHandler("westman_blackmarket:Open", function(location)
    openNui(location)
end)

exports('OpenBlackmarket', openNui)
