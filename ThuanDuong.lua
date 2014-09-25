MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.ThuanDuongTHC()
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
  local latency=1000
  local distance=MacroFunctions.GetDistance(T)
  local bEnable=true

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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.LuongNghiHoaHinh then MacroFunctions.use({301},0) end
    if MacroFunctions.KTCombo.TamSaiThuanDuong then MacroFunctions.use({13},0) end
    if MacroFunctions.KTCombo.CuuChuyenQuyNhat then MacroFunctions.use({305},0) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    local bOnPrepareState,preparingSkillID,preparingSkillLevel,currentPrepareRatio=p.GetSkillPrepareState()
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Bát Quái Động Huyền
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,370) end
    --Cắm Trấn Sơn Hà khi HP<30%
    local x=371
    if p.GetSkillLevel(5844)==1 then x=6911 end
    if MacroOptions.autoTranSonHa and HP<30 and MacroFunctions.IsSkillCD(x) then
      MacroFunctions.SaveTarget()
      SetTarget(TARGET.NO_TARGET,0)
      local nTargetType,dwTargetID=p.GetTarget()
      if nTargetType==TARGET.NO_TARGET and dwTargetID==0 and MacroFunctions.IsSkillCD(x) then
        MacroFunctions.use({x},4,500)
      end
    end
    --Sử dụng Bão Nguyên Thủ Khuyết khi nội lực thấp hơn mức thiết lập và có đủ 5 ô khí
    if MacroOptions.autoBaoNguyenThuKhuyetTHC and MP<MacroOptions.MPLimitTHC and K==10 and not MacroFunctions.CheckBuff(p,1916,1,0,0) and not MacroFunctions.CheckBuff(p,613,1,0,0) then MacroFunctions.use({316},0) end
    --Sử dụng Bằng Hư Ngự Phong khi có thể
    if MacroOptions.autoBangHuNguPhongTHC and p.IsInParty() then MacroFunctions.use({355},4,500) end
    --Tự bật Từ Khí Đông Lai
    if MacroOptions.autoTuKhiDongLaiTHC and K>=9 and (MacroFunctions.CheckBuff(p,375,1,0,0) or p.GetSkillLevel(359)==0) and MacroFunctions.GetSkillCD(6901)>1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHC) then MacroFunctions.use({2681},4,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and ((K==10 and (MacroFunctions.CheckBuff(p,375,1,0,0) or p.GetSkillLevel(359)==0) and MacroFunctions.GetSkillCD(6901)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHC)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and ((K==10 and (MacroFunctions.CheckBuff(p,375,1,0,0) or p.GetSkillLevel(359)==0) and MacroFunctions.GetSkillCD(6901)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHC)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and ((K==10 and (MacroFunctions.CheckBuff(p,375,1,0,0) or p.GetSkillLevel(359)==0) and MacroFunctions.GetSkillCD(6901)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHC)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Tự bật Thao Quang Dưỡng Hối
    if MacroOptions.autoTuKhiDongLaiTHC then
      if MacroOptions.autoThaoQuangDuongHoiTHC and K<=5 and MacroFunctions.CheckBuff(p,2757,1,8,0) then MacroFunctions.use({313},4,0) end
    else
      if MacroOptions.autoThaoQuangDuongHoiTHC and K<=5 and (MacroFunctions.CheckBuff(p,375,1,0,0) or MacroFunctions.CheckBuff(p,2757,1,8,0)) then MacroFunctions.use({313},4,0) end
    end
    --Buff thần binh
    if MacroFunctions.CheckBuff(p,1916,1,0,0) then MacroFunctions.use({301},0) end
    --Đánh Cửu Chuyển Quy Nhất, Tam Tài Hóa Sinh khi khoảng cách <8m
    if MacroOptions.autoCuuChuyenQuyNhat and distance<8 then MacroFunctions.use({305,303},4,0) end
    --Dùng Ngũ Phương Hành Tận khi có 5 ô khí
    if MacroOptions.autoNguPhuongHanhTan and K==10 then MacroFunctions.use({2674},0) end
    --Duy trì Tọa Vọng Vô Ngã
    if MacroOptions.autoToaVongVoNgaTHC and not MacroFunctions.CheckBuff(p,134,1,0,0) then MacroFunctions.use({312},0) end
    --Duy trì Phá Thương Khung
    if MacroOptions.autoPhaThuongKhung and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,375,1,0,0) then MacroFunctions.use({359},0) end
    --Duy trì buff Hóa Tam Thanh
    if MacroOptions.autoHoaTamThanhTHC and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,373,1,0,0) then MacroFunctions.use({357},0) end
    --Duy trì buff Sinh Thái Cực
    if MacroOptions.autoSinhThaiCucTHC and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,374,1,0,0) then MacroFunctions.use({358},0) end
    --Duy trì buff Xung Âm Dương
    if MacroOptions.autoXungAmDuong and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,376,1,0,0) then MacroFunctions.use({360},0) end
    --Kiểm tra bí kíp Vạn Thế Bất Kiệt
    local y=10
    if MacroFunctions.CheckSkillRecipe(6901,1584) and MacroFunctions.CheckSkillRecipe(6901,1585) then
      y=8
    elseif MacroFunctions.CheckSkillRecipe(6901,1584) or MacroFunctions.CheckSkillRecipe(6901,1585) then
      y=9
    end
    --Đánh Vạn Thế Bất Kiệt
    if MacroOptions.autoStopTTLH and K==10 and not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID==367 and currentPrepareRatio<0.3 then p.StopCurrentAction() end
    if MacroOptions.autoVTBKMode==1 then
      if K>=y and ((not MacroFunctions.CheckBuff(T,6424,1,2,0) and p.GetSkillLevel(6908)==1) or MacroFunctions.CheckBuff(p,6425,1,0,0)) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({6901},0) end
    elseif MacroOptions.autoVTBKMode==2 then
      if K>=y and (p.GetSkillLevel(6908)==1 or MacroFunctions.CheckBuff(p,6425,1,0,0)) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({6901},0) end
    end
    --Lưỡng Nghi Hóa Hình
    if MacroOptions.autoVTBKMode==1 then
      if K>=8 and not (((not MacroFunctions.CheckBuff(T,6424,1,2,0) and p.GetSkillLevel(6908)==1) or MacroFunctions.CheckBuff(p,6425,1,0,0)) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") and MacroFunctions.GetSkillCD(6901)==MacroFunctions.GetSkillCD(301)) then MacroFunctions.use({301},0) end
    elseif MacroOptions.autoVTBKMode==2 then
      if K>=8 and not ((p.GetSkillLevel(6908)==1 or MacroFunctions.CheckBuff(p,6425,1,0,0)) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") and MacroFunctions.GetSkillCD(6901)==MacroFunctions.GetSkillCD(301)) then MacroFunctions.use({301},0) end
    else
      if K>=8 then MacroFunctions.use({301},0) end
    end
    --Thái Cực Vô Cực tăng dmg
    if K<=5 and p.GetSkillLevel(5837)==1 and p.GetSkillLevel(5843)==1 and p.GetSkillLevel(6908)==1 and MacroFunctions.CheckBuff(T,6424,1,0,0) then MacroFunctions.use({306},0) end
    --Nếu ít hơn 3.5 ô khí thì đánh Tứ Tượng, Thái Cực Vô Cực
    if MacroFunctions.CheckBuff(p,613,1,0,0) then
      if K<=6 and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,999,1,0,0)) then MacroFunctions.use({367},0) end
    else
      if MacroFunctions.TTLH and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,999,1,0,0)) then MacroFunctions.use({367},0) end
    end
    if K<=5843 and MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({306},0) end
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

function MacroFunctions.ThuanDuongTHKY()
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
  local latency=1000
  local bEnable=true

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
    if MacroFunctions.KTCombo.TamSaiThuanDuong then MacroFunctions.use({13},0) end
    if MacroFunctions.KTCombo.KiemPhiKinhThien then MacroFunctions.use({310},0) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    if MacroOptions.autoSkillInterrupt then
      --Cắt skill bằng Thiên Địa Vô Cực nếu có thể
      if MacroFunctions.IsSkillCD(309) then
        MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,309)
      --Cắt skill bằng Kiếm Phi Kinh Thiên nếu Thiên Địa Vô Cực chưa cooldown
      else
        MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,310)
      end
    end
    --Xóa buff của boss bằng Thôn Nhật Nguyệt
    if MacroOptions.autoClearBuff then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,363) end
    --Duy trì Điệp Nhẫn >=3 giây
    if p.GetSkillLevel(5820)==1 then
      if not MacroFunctions.CheckBuff(T,748,1,2,1) then MacroFunctions.use({309},0) end
    else
      if not MacroFunctions.CheckBuff(T,748,1,3,1) then MacroFunctions.use({365},0) end
    end
    --Bật Chuyển Càn Khôn khi HP<30%
    if MacroOptions.autoChuyenCanKhon and HP<30 then MacroFunctions.use({372},4,500) end
    --Sử dụng Bão Nguyên Thủ Khuyết khi nội lực mức thiết lập và có đủ 5 ô khí
    if MacroOptions.autoBaoNguyenThuKhuyetTHKY and MP<MacroOptions.MPLimitTHKY and K==10 then MacroFunctions.use({316},0) end
    --Nổ khí trường khi còn 3 giây
    if GetLogicFrameCount()-MacroFunctions.QCStartFrame>336 and GetLogicFrameCount()-MacroFunctions.QCStartFrame<384 and p.GetSkillLevel(5812)==1 and K<=7 then MacroFunctions.use({588},0) end
    --Sử dụng Bằng Hư Ngự Phong khi có thể
    if MacroOptions.autoBangHuNguPhongTHKY and p.IsInParty() then MacroFunctions.use({355},4,500) end
    --Tự bật Từ Khí Đông Lai
    if MacroOptions.autoTuKhiDongLaiTHKY and K==10 and (MacroFunctions.CheckBuff(p,378,1,0,0) or p.GetSkillLevel(362)==0) and MacroFunctions.GetSkillCD(2699)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHKY) then MacroFunctions.use({2681},4,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and ((K==10 and (MacroFunctions.CheckBuff(p,378,1,0,0) or p.GetSkillLevel(362)==0) and MacroFunctions.GetSkillCD(2699)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHKY)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and ((K==10 and (MacroFunctions.CheckBuff(p,378,1,0,0) or p.GetSkillLevel(362)==0) and MacroFunctions.GetSkillCD(2699)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHKY)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and ((K==10 and (MacroFunctions.CheckBuff(p,378,1,0,0) or p.GetSkillLevel(362)==0) and MacroFunctions.GetSkillCD(2699)<1.5 and (MacroFunctions.IsSkillCD(313) or not MacroOptions.autoThaoQuangDuongHoiTHKY)) or MacroFunctions.CheckBuff(p,2757,1,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Tự bật Thao Quang Dưỡng Hối
    if MacroOptions.autoTuKhiDongLaiTHKY then
      if MacroOptions.autoThaoQuangDuongHoiTHKY and K<=5 and MacroFunctions.CheckBuff(p,2757,1,8,0) then MacroFunctions.use({313},4,0) end
    else
      if MacroOptions.autoThaoQuangDuongHoiTHKY and K<=5 and (MacroFunctions.CheckBuff(p,378,1,0,0) or MacroFunctions.CheckBuff(p,2757,1,8,0)) then MacroFunctions.use({313},4,0) end
    end
    --Duy trì Tọa Vọng Vô Ngã
    if MacroOptions.autoToaVongVoNgaTHKY and not MacroFunctions.CheckBuff(p,134,1,0,0) then MacroFunctions.use({312},0) end
    --Duy trì buff Toái Tinh Thần
    if MacroOptions.autoToaiTinhThan and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,378,1,0,0) then MacroFunctions.use({362},0) end
    --Duy trì buff Hóa Tam Thanh
    if MacroOptions.autoHoaTamThanhTHKY and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,373,1,0,0) then MacroFunctions.use({357},0) end
    --Duy trì buff Sinh Thái Cực
    if MacroOptions.autoSinhThaiCucTHKY and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,374,1,0,0) then MacroFunctions.use({358},0) end
    --Duy trì buff Lăng Thái Hư
    if MacroOptions.autoLangThaiHu and (K<=8 or not p.bFightState) and not MacroFunctions.CheckBuff(p,361,1,0,0) then MacroFunctions.use({361},0) end
    --Cắm Thôn Nhật Nguyệt liên tục
    if MacroOptions.autoThonNhatNguyet and (K<=8 or not p.bFightState) then MacroFunctions.use({363},0) end
    --Cắm Thôn Nhật Nguyệt khi có hiệu ứng bất lợi trên người
    for z,x in pairs(MacroFunctions.bossDebuffs) do
      if MacroFunctions.CheckBuff(p,x,1,0,0) then
        MacroFunctions.use({363},0)
      end
    end
    --Duy trì buff Vạn Kiếm Quy Tông
    if K<=7 and not MacroFunctions.CheckBuff(T,2291,1,2,0) then MacroFunctions.use({311},0) end
    --Đánh Bát Hoang Quy Nguyên
    if p.GetSkillLevel(5822)==1 then
      if p.GetSkillLevel(6758)==1 then
        if K==10 and (MacroFunctions.CheckBuff(T,748,1,9,0) or TargetHP>=40) then MacroFunctions.use({2699},0) end
      else
        if K==10 then MacroFunctions.use({2699},0) end
      end
    else
      if p.GetSkillLevel(6758)==1 then
        if K<=7 and (MacroFunctions.CheckBuff(T,748,1,9,0) or TargetHP>=40) then MacroFunctions.use({2699},0) end
      else
        if K<=7 then MacroFunctions.use({2699},0) end
      end
    end
    --Nếu đủ 5 ô khí đánh Vô Ngã Vô Kiếm
    if (p.GetSkillLevel(6460)==0 and K>=8) or K>=9 then MacroFunctions.use({365},0) end
    --Nếu ít hơn 3.5 ô khí đánh Thiên Địa Vô Cực và Tam Hoàn Sáo Nguyệt
    if K<=7 then MacroFunctions.use({309,364},0) end
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