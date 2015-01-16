MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.ThieuLamDCK()
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
  local K=p.nAccumulateValue
  if K>3 then K=3 end
  local distance=MacroFunctions.GetDistance(T)
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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.LucHopConPhap then MacroFunctions.use({11},3) end
    if MacroFunctions.KTCombo.ThuongChauThuc then MacroFunctions.use({260},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Thưởng Châu Thức, Bộ Phong Thức
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,240) end
    if MacroOptions.autoSkillInterrupt and p.GetSkillLevel(5911)==1 then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,238) end
    --Dùng Vô Tướng Quyết (giảm 50% sát thương phải chịu) khi HP<30%
    if MacroOptions.autoVoTuongQuyetDCK and HP<30 then MacroFunctions.use({261},2) end
    --Dùng Diệc Khô Diệc Vinh khi MP<40%
    if MacroOptions.autoDiecKhoDiecVinh and MP<40 and K==1 then MacroFunctions.use({251},3,500) end
    --Duy trì buff Bát Nhã Quyết
    if MacroOptions.autoBatNhaQuyetDCK and not MacroFunctions.CheckBuff(p,382,1,0,0) then MacroFunctions.use({200},2) end
    --Dùng Phật Tâm Quyết khi có thể
    if MacroOptions.autoPhatTamQuyetDCK and p.IsInParty() then MacroFunctions.use({255},3,500) end
    --Duy trì 5 tầng Thủ Khuyết Thức
    if p.IsInParty() and MacroFunctions.IsFormationLeader() and not MacroFunctions.CheckBuff(p,920,1,3,1) then MacroFunctions.use({2572},2) end
    --Duy trì buff Chúng Sân
    if p.GetSkillLevel(6596)==1 and not MacroFunctions.CheckBuff(p,6417,1,3,1) then MacroFunctions.use({2572},2) end
    --Duy trì 5 tầng Phổ Độ Tứ Phương
    if K<3 and MacroFunctions.CheckSkillRecipe(232,271) and not MacroFunctions.CheckBuff(T,890,1,2,1) then MacroFunctions.use({232},2) end
    --Buff thần binh
    if MacroFunctions.CheckBuff(p,1919,1,0,0) and K>=1 then MacroFunctions.use({233},2) end
    --Duy trì Kim Cương Nộ Mục
    if MacroOptions.autoKimCuongNoMuc and K==3 then MacroFunctions.use({247},3,500) end
    --Sử dụng Cầm Long Quyết khi có thể
    if MacroOptions.autoKimCuongNoMuc then
      if MacroOptions.autoCamLongQuyetDCK and K<=1 and MacroFunctions.GetSkillCD(233)<1 and MacroFunctions.CheckBuff(p,3889,1,0,0) and (MacroFunctions.CheckBuff(p,6394,1,10,0) or not MacroOptions.CLQWaitingTime) then MacroFunctions.use({260},4,500) end
    else
      if MacroOptions.autoCamLongQuyetDCK and K<=1 and MacroFunctions.GetSkillCD(233)<1 and (MacroFunctions.CheckBuff(p,6394,1,10,0) or not MacroOptions.CLQWaitingTime) then MacroFunctions.use({260},4,500) end
    end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(p,3889,1,0,0) and MacroFunctions.CheckBuff(p,2686,1,15,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(p,3889,1,0,0) and MacroFunctions.CheckBuff(p,2686,1,15,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(p,3889,1,0,0) and MacroFunctions.CheckBuff(p,2686,1,15,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Khoảng cách >8m dùng Tróc Ảnh Thức, Bộ Phong Thức
    if distance>8 and distance<20 then MacroFunctions.use({242},2) end
    if distance>8 then MacroFunctions.use({238},2) end
    --Thay đổi combo khi HP target <30%
    if TargetHP>=30 then
      --Đánh Vi Đà Hiến Chử khi đủ 3 điểm thiền định
      if K==3 then MacroFunctions.use({233},2) end
    else
      --Đánh Nã Vân Thức khi đủ 3 điểm thiền định
      if K==3 then MacroFunctions.use({243},2) end
    end
    --Combo gồm Hoành Tảo Lục Hợp, Thủ Khuyết Thức, Phổ Độ Tứ Phương
    if distance<=5 then MacroFunctions.use({235},2) end
    if distance<=8 then MacroFunctions.use({2572},2) end
    if distance<=4 then MacroFunctions.use({232},2) end
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

function MacroFunctions.ThieuLamTTK()
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
  local K=p.nAccumulateValue
  if K>3 then K=3 end
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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.LucHopConPhap then MacroFunctions.use({11},3) end
    if MacroFunctions.KTCombo.ThuongChauThuc then MacroFunctions.use({260},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Thưởng Châu Thức
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,240) end
    --Duy trì buff Bát Nhã Quyết
    if MacroOptions.autoBatNhaQuyetTTK and not MacroFunctions.CheckBuff(p,382,1,0,0) then MacroFunctions.use({200},2) end
    --Sử dụng Cầm Long Quyết khi có thể
    if MacroOptions.autoCamLongQuyetTTK and K<=1 then MacroFunctions.use({260},4,500) end
    --Dùng Vô Tướng Quyết (giảm 50% sát thương phải chịu) khi HP<50%
    if MacroOptions.autoVoTuongQuyetTTK and HP<50 then MacroFunctions.use({261},2) end
    --Dùng Tụ Nạp Càn Khôn khi HP<50%
    if MacroOptions.autoTuNapCanKhon and K==3 and HP<50 then MacroFunctions.use({248},2) end
    --Dùng Phật Tâm Quyết khi có thể
    if MacroOptions.autoPhatTamQuyetTTK then MacroFunctions.use({255},3,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Duy trì 5 tầng Lập Địa Thành Phật
    if K==3 and not MacroFunctions.CheckBuff(T,566,5,0,0) then MacroFunctions.use({246},2) end
    if K==3 and not MacroFunctions.CheckBuff(T,566,1,6,1) then MacroFunctions.use({246},2) end
    --Duy trì 5 tầng Phổ Độ Tứ Phương
    if MacroFunctions.CheckSkillRecipe(232,271) and not MacroFunctions.CheckBuff(T,890,1,3,1) then MacroFunctions.use({232},2) end
    --Dùng Quỷ Khứ Lai Côn, Ma Ha Vô Lượng khi mất boss
    if p.GetSkillLevel(2589)==1 then
      if MacroOptions.autoQuyKhuLaiCon and (MacroFunctions.GetSecondHighestHatred(T)>90 or MacroFunctions.GetMyHatred(T)<100) and MacroFunctions.bHatredDependency==true then MacroFunctions.use({2589},3,500) end
    elseif p.GetSkillLevel(5919)==1 then
      MacroFunctions.use({236},2)
    end
    --Thi triển Đại Sư Tử Hống khi cừu hận top 2 > 70% và đang cầm trận
    if MacroOptions.autoDaiSuTuHong and MacroFunctions.IsFormationLeader() and K>=2 and (MacroFunctions.GetSecondHighestHatred(T)>70 or MacroFunctions.GetMyHatred(T)<100) then MacroFunctions.use({252},2) end
    if p.GetSkillLevel(5925)==1 and K>=2 then MacroFunctions.use({252},2) end
    --Đánh Linh Sơn Thi Vũ khi đủ 3 điểm thiền định
    if K==3 then MacroFunctions.use({250},2) end
    --Phổ Độ Tứ Phương tăng 30% uy hiếp chiêu sau
    if p.GetSkillLevel(5929)==1 and not MacroFunctions.CheckBuff(p,2706,1,0,0) then MacroFunctions.use({232},2) end
    --Vi Đà Hiến Chử
    if p.GetSkillLevel(5922)==1 then
      if K==3 then MacroFunctions.use({233},2) end
    elseif p.GetSkillLevel(5924)==1 then
      if K==3 then MacroFunctions.use({233},1,30000) end
    end
    --Vạn Phật Triều Tông, Hoành Tảo Lục Hợp, Phổ Độ Tứ Phương
    if p.GetSkillLevel(2589)==1 then
      if not MacroFunctions.CheckBuff(T,2707,1,0,0) then MacroFunctions.use({234},2) end
    elseif p.GetSkillLevel(5919)==1 then
      if not MacroFunctions.CheckBuff(T,1488,1,0,0) then MacroFunctions.use({234},2) end
    else
      MacroFunctions.use({234},2)
    end
    if p.GetSkillLevel(5910)==1 then MacroFunctions.use({235},2) end
    MacroFunctions.use({232},2)
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