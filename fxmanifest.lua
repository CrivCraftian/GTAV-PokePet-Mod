fx_version 'cerulean'
game 'gta5'

author 'Criv'
description 'My first mod'
version '1.0.0'

client_script 
{ 
    'client/PetEventsClient.lua',
    'client/PetSystem.lua',
    'client/input.lua',
    'client/main.lua'
}

server_script {
    'server/PetEvents.lua',
    'server/main.lua'
}

shared_script
{
    'shared/petEvents.lua',
    'shared/pets.lua'
}