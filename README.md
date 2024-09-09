

**Framework**
ESX

**Configuration**
`Config = {
 
  -- Your basename
  Engine = "es_extended", 

  -- Want to use a item to open the blackmarket?
  UseItem = true,

  -- Want to use discord logs?
  UseDiscordLogs = false,

  -- The item's name to open the blackmarket
  Item = "blackmarket_computer",

  -- Login information
  Username = "444",
  Password = "777",

  -- Where you access the blackmarket if not using an item
  Location = vec3(413.5942, -966.6268, 29.4719),

  -- The items in the blackmarket
  Items = {

    weapons = {
      {
        name = "Glock 17",
        img = "https://upload.wikimedia.org/wikipedia/commons/e/e7/Glock_17-removebg-preview.png",
        price = 6250,
        hash = "weapon_pistol",
        quantity = 1
      },
      {
        name = "Desert Eagle",
        img = "https://images.guns.com/dev/761226023074_1.png?imwidth=600",
        price = 12000,
        hash = "weapon_heavypistol",
        quantity = 1
      },
      {
        name = "Makarov",
        img = "https://upload.wikimedia.org/wikipedia/commons/f/f9/%D0%9F%D0%B8%D1%81%D1%82%D0%BE%D0%BB%D0%B5%D1%82_%D0%9C%D0%B0%D0%BA%D0%B0%D1%80%D0%BE%D0%B2%D0%B0.png",
        price = 6100,
        hash = "weapon_combatpistol",
        quantity = 1
      },
      {
        name = "Uzi",
        img = "https://iwi.us/wp-content/uploads/2024/01/Uzi-Pro-1024x683.png",
        price = 9000,
        hash = "weapon_microsmg",
        quantity = 1
      },
      {
        name = "Grenade",
        img = "https://pngimg.com/d/grenade_PNG1326.png",
        price = 5000,
        hash = "weapon_grenade",
        quantity = 1
      },
      {
        name = "Kalashnikov",
        img = "https://upload.wikimedia.org/wikipedia/commons/6/65/AK-47_type_II_noBG.png",
        price = 14900,
        quantity = 1,
        hash = "weapon_assaultrifle"
      },
      {
        name = "Colt 1911",
        img = "https://www.tacticalstore.se/images/zoom/180532_left.png",
        price = 6500,
        hash = "weapon_assaultrifle",
        quantity = 1
      }
    },

    drugs = {
    {
      name = "x20 Cocaine",
      img = "https://64.media.tumblr.com/95468a56cd74ea1bfc5d86d6b7b1766d/tumblr_mla6y56ypj1s8qug1o1_500.png",
      price = 1000,  -- price * quantity = real price; ex - 1000 * 20 = 20 000
      hash = "cocaine",
      quantity = 20
    },
    {
      name = "x10 Cocaine",
      img = "https://64.media.tumblr.com/95468a56cd74ea1bfc5d86d6b7b1766d/tumblr_mla6y56ypj1s8qug1o1_500.png",
      price = 1200,
      hash = "cocaine",
      quantity = 10
    },
    {
      name = "x1 Cocaine",
      img = "https://64.media.tumblr.com/95468a56cd74ea1bfc5d86d6b7b1766d/tumblr_mla6y56ypj1s8qug1o1_500.png",
      price = 2500,
      hash = "cocaine",
      quantity = 1
    },
    {
      name = "x100 Cocaine",
      img = "https://64.media.tumblr.com/95468a56cd74ea1bfc5d86d6b7b1766d/tumblr_mla6y56ypj1s8qug1o1_500.png",
      price = 1000,
      hash = "cocaine",
      quantity = 100
    },
    {
      name = "x20 Cocaine",
      img = "https://64.media.tumblr.com/95468a56cd74ea1bfc5d86d6b7b1766d/tumblr_mla6y56ypj1s8qug1o1_500.png",
      price = 1000,
      hash = "cocaine",
      quantity = 20
      }
    }
  } 
}
`
