
if not Config?.Item.Enabled then
    ESX.RegisterUsableItem(Config.Item.Name, function(source)
        local xPlayer = ESX.GetPlayerFromId(source)

        if xPlayer then
            xPlayer.TriggerEvent("westman_blackmarket:Open")
        end
    end)
end

RegisterServerEvent("westman_blackmarket:Buy", function(data)
    local source = source 
    local xPlayer = ESX.GetPlayerFromId(source)
    assert(xPlayer, ("Class not loaded (id: %s)"):format(source))

    local account = Config.UseBlackMoney and "black_money" or "money"
    local money = xPlayer.getAccount(account).money
    local price = (data.item_price * data.item_quantity)

    if money < price then
        return  xPlayer.showNotification(TranslateCap("not_enough_money", money))
    end

    xPlayer.removeAccountMoney(account, price)
    xPlayer.addInventoryItem(data.item_hash, data.item_quantity)
    xPlayer.showNotification(TranslateCap("you_bought", data.item_quantity, data.item_hash))

    if Config.DiscordLogs then
        local message = "A player has made a purschase \nName: **%s** \nIdentifier: **%s** \nItem: **%s** \nPrice: **%s**"
        ESX.DiscordLog("UserActions", "Westman Blackmarket", "pink", message:format(xPlayer.name, xPlayer.identifier, data.item_hash, price))
    end
end)
