Citizen.CreateThread(function()
  local playerPed = PlayerPedId();
  local playerLoadout = {};

  exports('GiveWeaponToPed', function(ped, weaponHash, ammoCount, isHidden, equipNow)
    table.insert(playerLoadout, weaponHash);
    GiveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow);
  end);

  while GetEntityModel(playerPed) ~= 1885233650 and GetEntityModel(playerPed) ~= -1667301416 do
    playerPed = PlayerPedId();
    Citizen.Wait(250);
  end

  for i = 1, #Weapons do
    local currentWeapon = GetEntityHash(Weapons[i]);
    if currentWeapon then
      if HasPedGotWeapon(playerPed, currentWeapon, false) then
        playerLoadout[currentWeapon] = true;
      end
    end
  end
  
  while true do
    playerPed = PlayerPedId();

    Citizen.Wait(100);
    
    for i = 1, #Weapons do
      local currentWeapon = GetEntityHash(Weapons[i]);
      if currentWeapon then
        if HasPedGotWeapon(playerPed, currentWeapon, false) and not playerLoadout[currentWeapon] then
          TriggerServerEvent('oxince-agw:ban', Weapons[i]);
          return;
        end
      end
    end
  end
end);