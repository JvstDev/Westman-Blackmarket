ESX = exports[Config.Engine]:getSharedObject()

if Config.UseItem then
ESX.RegisterUsableItem(""..Config.Item.."", function(source)
  local src = source
  local xPlayer = ESX.GetPlayerFromId(src)

   TriggerClientEvent("westman_blackmarket:Open", source)
end)
end

RegisterServerEvent("westman_blackmarket:Buy", function(item_name, item_hash, item_price, item_quantity)
local src = source 
local xPlayer = ESX.GetPlayerFromId(src)
local get_player_black_money = xPlayer.getAccount("black_money").money
local total_amount = item_price * item_quantity

if get_player_black_money >= total_amount then 
  xPlayer.removeAccountMoney('black_money', total_amount)
  xPlayer.addInventoryItem(item_hash, item_quantity)
  xPlayer.showNotification(" "..Locales.you_bought.." "..item_quantity.."x "..item_hash.." ")
else
  xPlayer.showNotification(" "..Locales.not_enough_money.." "..get_player_black_money.." ")
end

  if Config.UseDiscordLogs then 
    local webhook_url = "YOUR_DISCORD_WEBHOOK"
    
    local user = GetPlayerName(src)
    local steamhex = GetPlayerIdentifier(src)
    local information = {
      {
        ["title"] = "Westman Blackmarket",
        ["description"] = "A player has made a purschase \nSteam name: **"..user.."** \n Steam hex: **"..steamhex.."** \nItem: **"..item_name.."** \nPrice: **"..total_amount.."**"
      }
    }
    
    if user then 
      PerformHttpRequest(webhook_url, function(err, text, headers) end, "POST", json.encode({embeds = information}), { ['Content-Type'] = 'application/json' })
       end
    end
end)
