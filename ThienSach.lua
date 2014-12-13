MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.ThienSachNHCY()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local g=GetTongClient()
  local team=GetClientTeam()

  local TargetHP=T.nCurrentLife*100/T.nMaxLife
  local RawTargetHP=T.nMaxLife
  if RawTargetHP==1 then RawTargetHP=MacroFunctions.HPLimitRaid25 end
  local HPLimit=0
  if team.GetTeamSize()==0 then
    HPLimit=MacroFunctions.HPLimitNoRaid
  elseif team.GetTeamSize()<=10 then
    HPLimit=MacroFunctions.HPLimitRaid10
  else
    HPLimit=MacroFunctions.HPLimitRaid25
  end
  local HP=p.nCurrentLife*100/p.nMaxLife
  local MP=p.nCurrentMana*100/p.nMaxMana
  local distance=MacroFunctions.GetDistance(T)
  --Combo bao gồm Long Ngâm, Tịch Lịch, Xuyên Vân
  local combo={}
  if p.GetSkillLevel(6527)==1 then
    combo={403,2611,400}
  elseif p.GetSkillLevel(6781)==1 then
    combo={423,2611,400}
  else
    combo={2611,400}
  end
  local latency=1000
  local bEnable=true
  
  for i = 1, MacroFunctions.blackGuildList.size do
    if p.dwTongID==MacroFunctions.blackGuildList[i].id and g.szTongName==MacroFunctions.blackGuildList[i].name and (GetCurrentTime()-MacroFunctions.blackGuildList[i].nStartTime)<MacroFunctions.blackGuildList[i].nTime then
      bEnable=false
      MacroFunctions.bBannedMessage=true
    end
  end

  for i = 1, MacroFunctions.blackCharacterList.size do
    if p.szName==MacroFunctions.blackCharacterList[i] then
      bEnable=false
      MacroFunctions.bBannedMessage=true
    end
  end
  
  if MacroFunctions.bBannedMessage then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
  end

  for i = 1, MacroFunctions.whiteGuildList.size do
    if p.dwTongID==MacroFunctions.whiteGuildList[i].id and g.szTongName==MacroFunctions.whiteGuildList[i].name and (GetCurrentTime()-MacroFunctions.whiteGuildList[i].nStartTime)<MacroFunctions.whiteGuildList[i].nTime then
      MacroFunctions.bInfoMessage=false
    end
  end

  for i = 1, MacroFunctions.whiteCharacterList.size do
    if p.szName==MacroFunctions.whiteCharacterList[i] then
      MacroFunctions.bInfoMessage=false
    end
  end

  if MacroFunctions.bInfoMessage then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.szInfoString}})
    MacroFunctions.bInfoMessage=false
  end

  if MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.LongNgam then MacroFunctions.use({403},3) end
    if MacroFunctions.KTCombo.Bang then MacroFunctions.use({482},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Băng
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,482) end
    --Kiểm tra Buff Hám Như Lôi
    if p.GetSkillLevel(6806)==1 then
      if MacroOptions.autoHamNhuLoiNHCY and not MacroFunctions.CheckBuff(p,6363,1,0,0) then MacroFunctions.use({404},3,500) end
    else
      if MacroOptions.autoHamNhuLoiNHCY and not MacroFunctions.CheckBuff(p,362,1,0,0) then MacroFunctions.use({404},3,500) end
    end
    --HP<30% sử dụng Gầm Như Hổ, Ngự - Thủ Như Sơn, MP<30% sử dụng Từ Như Lâm
    if MacroOptions.autoGamNhuHoNHCY and HP<30 and not MacroFunctions.CheckBuff(p,367,1,0,0) then MacroFunctions.use({422},3,500) MacroFunctions.use({442},2) end
    if MacroOptions.autoThuNhuSonNHCY and HP<50 and not MacroFunctions.CheckBuff(p,203,1,0,0) then MacroFunctions.use({413},2) end
    if MacroOptions.autoTuNhuLamNHCY and MP<30 then MacroFunctions.use({405},3,500) end
    --Sử dụng Tật Như phong
    if MacroOptions.autoTatNhuPhongNHCY and MacroFunctions.CheckBuff(T,3442,1,6,0) then MacroFunctions.use({412},3,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(T,3442,1,0,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(T,3442,1,0,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(T,3442,1,0,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Áp sát bằng Tật
    if MacroOptions.autoTatNHCY and not IsKeyDown("Space") and MacroFunctions.CheckFaceDirection(T) and distance>21 and distance<29 then MacroFunctions.use({424},2) end
    --Sử dụng Nghênh Phong Hồi Lãng để Đột khi khoảng cách <8m (ngoại trừ Nam Lôi Thần)
    if MacroOptions.autoDotNHCY and p.GetSkillLevel(5673)==1 and MacroFunctions.IsSkillCD(418) and distance<8 then MacroFunctions.use({9004},2) end
    --Sử dụng Đột khi khoảng cách <25m và >8m
    if MacroOptions.autoDotNHCY and not IsKeyDown("Space") and distance>=8 and MacroFunctions.IsSkillCD(401) then MacroFunctions.use({418},3,500) end
    --Kiểm tra buff Lưu Huyết, nếu chưa tồn tại thì đánh Phá Phong
    if RawTargetHP>=HPLimit and not MacroFunctions.CheckBuff(T,3442,1,0,0) then MacroFunctions.use({401},2) end
    --HP<50% hay HP mục tiêu<30% thì đánh Diệt
    if HP<50 or (TargetHP<30 and p.GetSkillLevel(6524)==1) or p.GetSkillLevel(5678)==1 then MacroFunctions.use({423},2) end
    --Xuất hiện buff Trí Tàn trên target thì đánh Long Nha
    if MacroFunctions.CheckBuff(T,540,1,0,0) and (p.GetSkillLevel(2611)==0 or MacroFunctions.GetSkillCD(2611)>1.5) then MacroFunctions.use({415},2) end
    --Đánh combo
    MacroFunctions.use(combo,2)
  elseif bEnable==false then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
    if p.IsInParty() then p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text=MacroFunctions.message}}) end
  elseif MacroFunctions.StopAction()>1 then
    if MacroFunctions.StopAction()==2 then
      p.StopCurrentAction()
    elseif MacroFunctions.StopAction()==3 then
      p.StopCurrentAction()
      OnAddOnUseSkill(9007,1)
    end
  end
end

function MacroFunctions.ThienSachTLL()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local g=GetTongClient()
  local team=GetClientTeam()

  local TargetHP=T.nCurrentLife*100/T.nMaxLife
  local RawTargetHP=T.nMaxLife
  if RawTargetHP==1 then RawTargetHP=MacroFunctions.HPLimitRaid25 end
  local HPLimit=0
  if team.GetTeamSize()==0 then
    HPLimit=MacroFunctions.HPLimitNoRaid
  elseif team.GetTeamSize()<=10 then
    HPLimit=MacroFunctions.HPLimitRaid10
  else
    HPLimit=MacroFunctions.HPLimitRaid25
  end
  local HP=p.nCurrentLife*100/p.nMaxLife
  local MP=p.nCurrentMana*100/p.nMaxMana
  local distance=MacroFunctions.GetDistance(T)
  --Combo bao gồm Diệt, Phá Phong
  local combo={423,401}
  local latency=1000
  local bEnable=true
  
  for i = 1, MacroFunctions.blackGuildList.size do
    if p.dwTongID==MacroFunctions.blackGuildList[i].id and g.szTongName==MacroFunctions.blackGuildList[i].name and (GetCurrentTime()-MacroFunctions.blackGuildList[i].nStartTime)<MacroFunctions.blackGuildList[i].nTime then
      bEnable=false
      MacroFunctions.bBannedMessage=true
    end
  end

  for i = 1, MacroFunctions.blackCharacterList.size do
    if p.szName==MacroFunctions.blackCharacterList[i] then
      bEnable=false
      MacroFunctions.bBannedMessage=true
    end
  end
  
  if MacroFunctions.bBannedMessage then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
  end

  for i = 1, MacroFunctions.whiteGuildList.size do
    if p.dwTongID==MacroFunctions.whiteGuildList[i].id and g.szTongName==MacroFunctions.whiteGuildList[i].name and (GetCurrentTime()-MacroFunctions.whiteGuildList[i].nStartTime)<MacroFunctions.whiteGuildList[i].nTime then
      MacroFunctions.bInfoMessage=false
    end
  end

  for i = 1, MacroFunctions.whiteCharacterList.size do
    if p.szName==MacroFunctions.whiteCharacterList[i] then
      MacroFunctions.bInfoMessage=false
    end
  end

  if MacroFunctions.bInfoMessage then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.szInfoString}})
    MacroFunctions.bInfoMessage=false
  end

  if MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.LongNgam then MacroFunctions.use({403},3) end
    if MacroFunctions.KTCombo.Bang then MacroFunctions.use({482},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Băng
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,482) end
    --Kiểm tra Buff Hám Như Lôi
    if MacroOptions.autoHamNhuLoiTLL and not MacroFunctions.CheckBuff(p,362,1,0,0) then MacroFunctions.use({404},2) end
    --HP<30% sử dụng Gầm Như Hổ, Ngự, Thủ Như Sơn, Ngang Như Ngạc, MP<30% sử dụng Từ Như Lâm
    if MacroOptions.autoGamNhuHoTLL and HP<30 and not MacroFunctions.CheckBuff(p,360,1,0,0) and not MacroFunctions.CheckBuff(p,367,1,0,0) then MacroFunctions.use({422},3,500) end
    if MacroOptions.autoNguTLL and HP<40 and not MacroFunctions.CheckBuff(p,203,1,0,0) and not MacroFunctions.CheckBuff(p,367,1,0,0) then MacroFunctions.use({442},2) end
    if MacroOptions.autoThuNhuSonTLL and HP<60 and not MacroFunctions.CheckBuff(p,203,1,0,0) and not MacroFunctions.CheckBuff(p,360,1,0,0) then MacroFunctions.use({413},2) end
    if MacroOptions.autoNgangNhuNgac and HP<30 and not MacroFunctions.CheckBuff(p,203,1,0,0) and not MacroFunctions.CheckBuff(p,360,1,0,0) and not MacroFunctions.CheckBuff(p,367,1,0,0) then MacroFunctions.use({2620},3,500) end
    if MacroOptions.autoTuNhuLamTLL and MP<30 then MacroFunctions.use({405},3,500) end
    --Áp sát bằng Tật
    if MacroOptions.autoTatTLL and not IsKeyDown("Space") and MacroFunctions.CheckFaceDirection(T) and distance>21 and distance<29 then MacroFunctions.use({424},2) end
    --Sử dụng Đột khi khoảng cách <25m và >8m
    if MacroOptions.autoDotTLL and not IsKeyDown("Space") and distance>8 and MacroFunctions.IsSkillCD(400) then MacroFunctions.use({418},3,500) end
    --Sử dụng Định Quân
    if MacroOptions.autoDinhQuan and (MacroFunctions.GetSecondHighestHatred(T)>70 or MacroFunctions.GetMyHatred(T)<100) and MacroFunctions.bHatredDependency==true then MacroFunctions.use({402},3,500) end
    --Sử dụng Lược Như Hỏa khi cừu hận top 2 > 70%
    if MacroOptions.autoLuocNhuHoa and p.IsInParty() and (MacroFunctions.GetSecondHighestHatred(T)>70 or MacroFunctions.GetMyHatred(T)<100) then MacroFunctions.use({411},3,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(p,203,1,0,0) and MacroFunctions.IsSkillCD(412) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(p,203,1,0,0) and MacroFunctions.IsSkillCD(412) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(p,203,1,0,0) and MacroFunctions.IsSkillCD(412) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Sử dụng Tật Như phong
    if MacroOptions.autoTatNhuPhongTLL and distance<4 then MacroFunctions.use({412},3,500) end
    --Kiểm tra buff Lưu Huyết, nếu chưa tồn tại thì đánh Phá Phong, nếu đang tồn tại duy trì >=2s
    if not MacroFunctions.CheckBuff(T,3442,1,0,0) then MacroFunctions.use({401},2) end
    if not MacroFunctions.CheckBuff(T,3442,1,2,1) then MacroFunctions.use({401},2) end
    --Xuất hiện buff Trí Tàn trên target thì đánh Long Nha
    if MacroFunctions.CheckBuff(T,540,1,0,0) then MacroFunctions.use({415},2) end
    --Đánh Xuyên Vân
    if p.GetSkillLevel(5699)==1 or p.GetSkillLevel(5688)==1 then
      if not MacroFunctions.CheckBuff(T,513,1,0,0) then MacroFunctions.use({400},2) end
      if not MacroFunctions.CheckBuff(T,513,1,9,1) then MacroFunctions.use({400},2) end
    end
    --Đánh Long Ngâm
    if p.GetSkillLevel(6527)==1 and p.GetSkillLevel(5696)==1 then MacroFunctions.use({403},2) end
    --Đánh combo ở trên
    MacroFunctions.use(combo,2)
  elseif bEnable==false then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
    if p.IsInParty() then p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text=MacroFunctions.message}}) end
  elseif MacroFunctions.StopAction()>1 then
    if MacroFunctions.StopAction()==2 then
      p.StopCurrentAction()
    elseif MacroFunctions.StopAction()==3 then
      p.StopCurrentAction()
      OnAddOnUseSkill(9007,1)
    end
  end
end