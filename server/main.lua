RegisterServerEvent('oxince-agw:ban')
AddEventHandler('oxince-agw:ban', function(reason)
    DropPlayer(source, 'Detected: ' .. tostring(reason) .. '')
end)