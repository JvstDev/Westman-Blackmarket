fx_version "cerulean"
lua54 "yes"
game "gta5"

shared_scripts {
  'config.lua',
  '@es_extended/imports.lua',
  '@es_extended/locale.lua',
  'locales/*.lua'
}

server_scripts {
  "server/main.lua"
}

client_scripts {
  "client/main.lua"
}

ui_page "html/index.html"

files {
  "html/index.html",
  "html/assets/*.js",
  "html/assets/*.css"
}
