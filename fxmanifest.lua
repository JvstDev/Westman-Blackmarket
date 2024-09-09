fx_version "cerulean"

lua54 "yes"

game "gta5"

shared_script {
  "configuration/locales.lua",
  "configuration/config.lua"
} 

server_script "server/main.lua"

client_script "client/main.lua"

files {
  "html/index.html",
  "html/assets/*.js",
  "html/assets/*.css"
}

ui_page "html/index.html"
                  