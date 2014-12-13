MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.TangKiem()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local secondTarget=GetTargetHandle(T.GetTarget())
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
  local ragePercent=p.nCurrentRage*100/p.nMaxRage
  local isVT=p.dwSchoolID==6
  local isSC=p.dwSchoolID==7
  local latency=1000
  local distance=MacroFunctions.GetDistance(T)
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
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.ThinhLoi then MacroFunctions.use({1646},3) end
    if MacroFunctions.KTCombo.TrichTinh then MacroFunctions.use({1940},3) end
    if MacroFunctions.KTCombo.TamSaiTangKiem then MacroFunctions.use({13},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Trích Tinh hoặc Ngọc Hồng Quán Nhật
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,1940) end
    if MacroOptions.autoSkillInterrupt and p.GetSkillLevel(1940)==0 then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,1577) end
    --Xóa buff bằng Hà Lưu Bảo Thạch
    if MacroOptions.autoClearBuff and isSC then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,1610) end
    --Bật Tuyền Ngưng Nguyệt và Vân Tê Tùng khi HP<30%
    if MacroOptions.autoTuyenNgungNguyet and HP<30 then MacroFunctions.use({1666,1668},2) end
    --Kiểm tra buff Mai Ẩn Hương và duy trì >=3 giây
    if RawTargetHP>=HPLimit and not MacroFunctions.CheckBuff(T,1738,1,3,0) then MacroFunctions.use({1667},2) end
    --Sử dụng Thám Mai khi có thể
    if MacroOptions.autoThamMai and MacroFunctions.IsTeamTanker(secondTarget) and MacroFunctions.GetDistance(secondTarget)<15 and MacroFunctions.CanUseSkill(1655) and p.IsInParty() and MacroFunctions.bProtected==false then MacroFunctions.use({1655},5,500) end
    --Luôn đánh Đoạn Triều khi có thể
    if p.GetSkillLevel(5959)==1 then
      if MacroFunctions.CanUseSkill(1651) and MacroFunctions.CheckBuff(p,1722,1,0,0) and not MacroFunctions.CheckBuff(p,2701,1,0,0) and (isVT or MacroFunctions.GetSkillCD(1593)>1.5) and MacroFunctions.bProtected==false then MacroFunctions.use({1651},4,500) end
    else
      if MacroFunctions.CanUseSkill(1651) and MacroFunctions.CheckBuff(p,1722,1,0,0) and (isVT or MacroFunctions.GetSkillCD(1593)>1.5) and MacroFunctions.bProtected==false then MacroFunctions.use({1651},4,500) end
    end
    --Sử dụng Hoàng Long Thổ Thúy (nếu đã sử dụng Bình Hồ Đoạn Nguyệt)
    if MacroOptions.autoBinhHoHoangLong and isVT and MacroFunctions.GetSkillCD(1578)>1.5 then MacroFunctions.use({1581},3,200) end
    --Sử dụng Tuyết Đoạn Kiều để hồi kiếm khí
    if MacroOptions.autoTuyetDoanKieu and (not MacroOptions.OMLTDK or not MacroFunctions.IsSkillCD(1663)) and isSC and ragePercent<20 and p.nMaxRage==100 and MacroFunctions.bProtected==false then MacroFunctions.use({1664},3,1500) end
    --Sử dụng Oanh Minh Liễu để hồi kiếm khí
    if MacroOptions.autoOanhMinhLieu and isSC and ragePercent<20 and (p.GetSkillLevel(5959)==0 or MacroFunctions.CheckBuff(p,2701,1,2,0) or distance>4) and MacroFunctions.bProtected==false then MacroFunctions.use({1663},3,1500) end
    --Chuyển sang Sơn Cư khi kiếm khí >=95
    if MacroOptions.autoBinhHoHoangLong then
      if isVT and MacroFunctions.IsSkillCD(1656) and MacroFunctions.GetSkillCD(1646)==MacroFunctions.GetSkillCD(1600) and ((not MacroFunctions.IsSkillCD(1578) and not MacroFunctions.IsSkillCD(1581)) or (MacroFunctions.IsSkillCD(1578) and MacroFunctions.IsSkillCD(1581))) and ragePercent>=95 then MacroFunctions.use({1656},3,1500) end
    else
      if isVT and MacroFunctions.IsSkillCD(1656) and ragePercent>=95 then MacroFunctions.use({1656},3,1500) end
    end
    --Sử dụng Ngọc Hồng Quán Nhật khi khoảng cách >5m
    if isVT and distance>5 and not IsKeyDown("Space") then MacroFunctions.use({1577},3) end
    --Sử dụng Mộng Tuyền Hổ Bào
    if MacroOptions.autoMongTuyenHoBao and isVT and distance<15 then MacroFunctions.use({1589},2) end
    --Sử dụng Bình Hồ Đoạn Nguyệt
    if MacroOptions.autoBinhHoHoangLong and isVT and MacroFunctions.IsSkillCD(1581) then MacroFunctions.use({1578},2) end
    --Đánh Thính Lôi, Cửu Khê Di Yên
    if isVT then MacroFunctions.use({1646,1579},2) end
    --Chuyển sang Vấn Thủy khi kiếm khí <20
    if isSC and ragePercent<20 and (p.GetSkillLevel(5959)==0 or MacroFunctions.CheckBuff(p,2701,1,2,0)) then MacroFunctions.use({1656},3,1500) end
    --Sử dụng Vân Tê Tùng hồi kiếm khí
    if MacroOptions.autoVanTeTung and isSC and MacroFunctions.CheckSkillRecipe(1668,630) and (ragePercent<90 and p.nMaxRage==100) then MacroFunctions.use({1668},2) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and isSC then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.BIG_SWORD) end
    if MacroOptions.autoUseAmulet and isSC then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and isSC then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Dùng Phong Lai Ngô Sơn
    if p.GetSkillLevel(6543)==1 then
      if MacroOptions.autoPhongLaiNgoSon and isSC and ((ragePercent<90 and p.nMaxRage==100) or (ragePercent<95 and p.nMaxRage==200)) then MacroFunctions.use({1645},2) end
    else
      if MacroOptions.autoPhongLaiNgoSon and isSC and (ragePercent>=75 and p.nMaxRage==200) and MacroFunctions.CheckBuff(p,1728,1,17,0) then MacroFunctions.use({1645},2) end
    end
    --Tận dụng kiếm khí còn thừa khi sử dụng Oanh Minh Liễu
    if (ragePercent>=60 and p.nMaxRage==200) and not MacroFunctions.CheckBuff(p,1728,1,8,1) then
      if isSC and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,2704,1,0,0)) then MacroFunctions.use({1593},2) end
      if isSC then MacroFunctions.use({1600},2) end
    end
    --Combo Thính Lôi, Vân Phi, Tịch Chiếu
    if isSC and p.GetSkillLevel(5959)==1 and distance<=4 then MacroFunctions.use({1646},2) end
    if isSC and ((ragePercent>=20 and p.nMaxRage==100) or (ragePercent>=10 and p.nMaxRage==200)) and distance<=8 and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,2704,1,0,0)) then MacroFunctions.use({1593},2) end
    if isSC and ((ragePercent>=20 and p.nMaxRage==100) or (ragePercent>=10 and p.nMaxRage==200)) and distance<=8 and (p.GetSkillLevel(5959)==0 or distance>4 or (MacroFunctions.dwLastSkillIDCasted~=1593 and MacroFunctions.dwPreparingSkillID~=1593)) then MacroFunctions.use({1600},2) end
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