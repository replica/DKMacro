MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.MinhGiaoPATQ(arg)
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
  local NhatLinh=p.nCurrentSunEnergy
  local NguyetHon=p.nCurrentMoonEnergy
  local FS=p.nSunPowerValue
  local FM=p.nMoonPowerValue
  local distance=MacroFunctions.GetDistance(T)
  local SunCombo={3963,3962}
  local MoonCombo={3960,3959}
  local TinhThe={3967}
  local latency=500
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
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    if MacroFunctions.KTCombo.CucLacDan then MacroFunctions.use({3971},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Check Nhật Nguyệt Đồng Huy, Nhật Linh Nguyệt Hồn
    local NNDH=false
    local NLNH=true
    for z,x in pairs(p.GetBuffList() or {}) do
      if x.dwID==4937 and x.nLevel==2 and x.nStackNum==2 and (FS==1 or FM==1) then
        NNDH=true
      end
      if (x.dwID==4937 and x.nLevel>0) or FS==1 or FM==1 then
        NLNH=false
      end
    end

    --Cắt skill bằng Hàn Nguyệt Diệu
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,3961) end
    --Xóa buff của boss bằng Tịnh Thế Phá Ma Kích
    if MacroOptions.autoClearBuff and MacroFunctions.CheckSkillRecipe(3967,1020) and (FS==1 or FM==1) then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,3967) end
    --Sử dụng Tham Ma Thể khi HP<30%
    if MacroOptions.autoThamMaThePATQ and HP<30 then MacroFunctions.use({3973},2,500) end
    --Sử dụng Lưu Quang Tù Ảnh
    if MacroOptions.autoLuuQuangTuAnh and distance>8 and not IsKeyDown("Space") then MacroFunctions.use({3977},3,500) end
    --Sử dụng Ảo Quang Bộ
    if MacroOptions.autoAoQuangBoPATQ and distance>8 and (not MacroFunctions.IsSkillCD(3977) or not MacroOptions.autoLuuQuangTuAnh) and not IsKeyDown("Space") then MacroFunctions.use({3970},2,500) end
    --Sử dụng Ám Trần Di Tán khi rời chiến đấu
    if not p.bFightState and MacroOptions.autoAmTranDiTan~=0 and MacroFunctions.GetSkillCD(3979)<=1 then MacroFunctions.use({3974},3,1500) end
    --Sử dụng Ám Trần Di Tán khi cừu hận >70%
    if MacroOptions.autoAmTranDiTan==1 and p.IsInParty() and MacroFunctions.GetMyHatred(T)>70 and MacroFunctions.GetSkillCD(3979)<=1 then MacroFunctions.use({3974},3,1500) end
    --Bật Ám Trần Di Tán -> Khu Dạ Đoạn Sầu
    if p.GetSkillLevel(3978)==0 then
      if MacroOptions.autoAmTranDiTan==2 and not MacroFunctions.CheckBuff(p,4052,1,0,0) and NLNH and (NhatLinh<=4000 and NguyetHon<=4000 and FS==0 and FM==0) and not MacroFunctions.CheckBuff(p,4754,1,0,0,2) and MacroFunctions.GetSkillCD(3979)<=1 then MacroFunctions.use({3974},3,1500) end
    else
      if MacroOptions.autoAmTranDiTan==2 and not MacroFunctions.CheckBuff(p,4052,1,0,0) and (NhatLinh<=4000 and NguyetHon<=4000 and FS==0 and FM==0) and MacroFunctions.GetSkillCD(3979)<=1 then MacroFunctions.use({3974},3,1500) end
    end
    --Thi Triển Khu Dạ Đoạn Sầu khi trong trạng thái tàng hình
    if MacroFunctions.CheckBuff(p,4052,1,0,0) and FS==0 and FM==0 then MacroFunctions.use({3979},2,500) end
    --Chỉ đánh trong trạng thái chiến đấu
    if p.bFightState or not MacroFunctions.IsSkillCD(3974) or MacroOptions.autoAmTranDiTan==0 or FS==1 or FM==1 then
      --Tự dùng Sinh Diệt Dư Đoạt
      if MacroOptions.autoSinhDietDuDoat and FS==0 and FM==0 and NLNH and MacroFunctions.GetSkillCD(3974)>15 then MacroFunctions.use({3978},3,1500) end
      --Sử dụng vật phẩm
      if MacroOptions.autoUseWeapon and (NNDH or MacroFunctions.CheckBuff(p,4056,1,9,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
      if MacroOptions.autoUseAmulet and (NNDH or MacroFunctions.CheckBuff(p,4056,1,9,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
      if MacroOptions.autoUsePendant and (NNDH or MacroFunctions.CheckBuff(p,4056,1,9,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
      --Tự dùng Quang Minh Tướng
      if MacroOptions.autoQuangMinhTuongPATQ and not MacroFunctions.CheckBuff(p,4937,1,0,0) and (FS==1 or FM==1) and   not MacroFunctions.CheckBuff(p,4498,1,0,0) then MacroFunctions.use({3969},3,500) end
      --Bật Cực Lạc Dẫn nếu có nâng và có bí kíp
      if MacroOptions.autoCucLacDanPATQ and MacroFunctions.CheckSkillRecipe(3971,1028) and (FS==0 and FM==0) and NLNH and not MacroFunctions.CheckBuff(p,4498,1,0,0) then MacroFunctions.use({3971},3,500) end
      --Duy trì tầng NLNH
      if not arg then
        if NhatLinh>NguyetHon and not MacroFunctions.CheckBuff(p,4937,1,1.5,1) then MacroFunctions.use({3962},2,500) end
        if NhatLinh<NguyetHon and not MacroFunctions.CheckBuff(p,4937,1,1.5,1) then MacroFunctions.use({3959},2,500) end
        if NhatLinh==NguyetHon and not MacroFunctions.CheckBuff(p,4937,1,1.5,1) then MacroFunctions.use({3959},2,500) end
      elseif arg==1 then
        if not MacroFunctions.CheckBuff(p,4937,1,1.5,1) then MacroFunctions.use({3962},2,500) end
      elseif arg==2 then
        if not MacroFunctions.CheckBuff(p,4937,1,1.5,1) then MacroFunctions.use({3959},2,500) end
      end
      --Đánh Tịnh Thế ngay khi mãn nhật hoặc mãn nguyệt và không trong trạng thái tàng hình
      if not arg then
        if (FS==1 or FM==1) and not MacroFunctions.CheckBuff(p,4937,4,0,0) and not MacroFunctions.CheckBuff(p,4052,1,0,0,1) then MacroFunctions.use(TinhThe,2,500) end
      else
        if (FS==1 or FM==1) and not MacroFunctions.CheckBuff(p,4937,5,0,0) and not MacroFunctions.CheckBuff(p,4052,1,0,0,1) then MacroFunctions.use(TinhThe,2,500) end
      end
      if distance>5 and not MacroFunctions.IsSkillCD(3977) and MacroFunctions.GetSkillCD(3970)>1.5 then MacroFunctions.use({3960},2,500) end
      --Đánh combo
      if not arg then
        --Đánh thêm XNL, UNL nếu chưa đủ NNDH
        if FS==1 and MacroFunctions.CheckBuff(p,4937,4,0,0) then MacroFunctions.use({3962},2,500) end
        if FM==1 and MacroFunctions.CheckBuff(p,4937,4,0,0) then MacroFunctions.use({3959},2,500) end
        --Đánh thêm XNL, UNL (sau KDDS)
        if NhatLinh<7000 and NguyetHon>7600 and not MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use({3959},2,500) end
        if NguyetHon<7000 and NhatLinh>7550 and not MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use({3962},2,500) end
        --Combo chính
        if NhatLinh==NguyetHon and not MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use(SunCombo,2,500) end
        if NhatLinh==NguyetHon and MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use(MoonCombo,2,500) end
        if NhatLinh>NguyetHon then
          if NhatLinh<7550 then MacroFunctions.use({3963},2,500) end
          MacroFunctions.use({3962},2,500)
        end
        if NguyetHon>NhatLinh then
          if NguyetHon<7600 then MacroFunctions.use({3960},2,500) end
          MacroFunctions.use({3959},2,500)
        end
      elseif arg==1 then
        --Đánh thêm XNL nếu chưa đủ NNDH
        if (FS==1 or FM==1) and MacroFunctions.CheckBuff(p,4937,4,0,0) then MacroFunctions.use({3962},2,500) end
        --Đánh thêm UNL (sau KDDS)
        if NhatLinh<7000 and NguyetHon>7600 and not MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use({3959},2,500) end
        --Đánh thêm Ngân Nguyệt Trảm
        if MacroOptions.autoNNLN and (not MacroFunctions.CheckBuff(p,4937,1,0,0,1) or (MacroFunctions.CheckBuff(p,4937,3,0,0,1) and not MacroFunctions.CheckBuff(p,4937,4,0,0,1)) or MacroFunctions.CheckBuff(p,4937,2,0,0,2)) and not MacroFunctions.CheckBuff(p,4056,1,0,0) and not MacroFunctions.CheckBuff(T,4202,1,0,0) then MacroFunctions.use({3960},2,500) end
        --Đánh thêm UNL khi có SDDD
        if MacroFunctions.CheckBuff(p,4056,1,0,0) and NguyetHon>5500 then MacroFunctions.use({3959},2,500) end
        --Combo chính
        if not MacroFunctions.CheckBuff(p,4056,1,0,0) then
          if not MacroFunctions.CheckBuff(p,4937,1,0,0,1) or (MacroFunctions.CheckBuff(p,4937,3,0,0,1) and not MacroFunctions.CheckBuff(p,4937,4,0,0,1)) or MacroFunctions.CheckBuff(p,4937,2,0,0,2) then MacroFunctions.use({3963},2,500) end
        else
          MacroFunctions.use({3963},2,500)
        end
        MacroFunctions.use({3962},2,500)
      elseif arg==2 then
        --Đánh thêm UNL nếu chưa đủ NNDH
        if (FS==1 or FM==1) and MacroFunctions.CheckBuff(p,4937,4,0,0) then MacroFunctions.use({3959},2,500) end
        --Đánh thêm XNL (sau KDDS)
        if NguyetHon<7000 and NhatLinh>7550 and not MacroFunctions.CheckBuff(p,4937,1,0,0) then MacroFunctions.use({3962},2,500) end
        --Đánh thêm Liệt Nhật Trảm
        if MacroOptions.autoNNLN and (not MacroFunctions.CheckBuff(p,4937,1,0,0,1) or (MacroFunctions.CheckBuff(p,4937,3,0,0,1) and not MacroFunctions.CheckBuff(p,4937,4,0,0,1)) or MacroFunctions.CheckBuff(p,4937,2,0,0,2)) and not MacroFunctions.CheckBuff(p,4056,1,0,0) and not MacroFunctions.CheckBuff(T,4418,1,0,0) then MacroFunctions.use({3963},2,500) end
        --Đánh thêm XNL khi có SDDD
        if MacroFunctions.CheckBuff(p,4056,1,0,0) and NhatLinh>5500 then MacroFunctions.use({3962},2,500) end
        --Combo chính
        if not MacroFunctions.CheckBuff(p,4056,1,0,0) then
          if not MacroFunctions.CheckBuff(p,4937,1,0,0,1) or (MacroFunctions.CheckBuff(p,4937,3,0,0,1) and not MacroFunctions.CheckBuff(p,4937,4,0,0,1)) or MacroFunctions.CheckBuff(p,4937,2,0,0,2) then MacroFunctions.use({3960},2,500) end
        else
          MacroFunctions.use({3960},2,500)
        end
        MacroFunctions.use({3959},2,500)
      end
    end
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

function MacroFunctions.MinhGiaoMTLLT(arg)
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
  local NhatLinh=p.nCurrentSunEnergy
  local NguyetHon=p.nCurrentMoonEnergy
  local FS=p.nSunPowerValue
  local FM=p.nMoonPowerValue
  local distance=MacroFunctions.GetDistance(T)
  local SunCombo={3963,3962}
  local MoonCombo={3960,3959}
  local TinhThe={3967}
  local latency=500
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
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    if MacroFunctions.KTCombo.CucLacDan then MacroFunctions.use({3971},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Cắt skill bằng Hàn Nguyệt Diệu
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,3961) end
    --Xóa buff của boss bằng Tịnh Thế Phá Ma Kích
    if MacroOptions.autoClearBuff and MacroFunctions.CheckSkillRecipe(3967,1020) and (FS==1 or FM==1) then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,3967) end
    --Sử dụng Tính Mệnh Hải khi HP<50%
    if MacroOptions.autoTinhMenhHai and HP<50 then MacroFunctions.use({3983},2,500) end
    --Sử dụng Thánh Minh Hựu khi Mãn Nhật và HP<50%
    if MacroOptions.autoThanhMinhHuuMTLLT and HP<50 and FS==1 then MacroFunctions.use({3965},2,500) end
    --Sử dụng Tham Ma Thể khi HP<30%
    if MacroOptions.autoThamMaTheMTLLT and HP<30 then MacroFunctions.use({3973},2,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and HP<30 then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Sử dụng Ảo Quang Bộ
    if MacroOptions.autoAoQuangBoMTLLT and distance>8 and not IsKeyDown("Space") then MacroFunctions.use({3970},2,500) end
    --Chế độ đánh skill MTLLT
    if not MacroOptions.autoNhatNguyetTinhThe then
      --Dùng Từ Bi Nguyện khi có thể
      if MacroOptions.autoTuBiNguyen and (MacroFunctions.GetMyHatred(T)<100 or MacroOptions.alwaysTuBiNguyen) and MacroFunctions.bHatredDependency==true then MacroFunctions.use({3982},3,500) end
      --Bật Cực Lạc Dẫn khi cừu hận top 2 > 70%
      if MacroOptions.autoCucLacDanMTLLT and p.IsInParty() and (MacroFunctions.GetSecondHighestHatred(T)>70 or MacroFunctions.GetMyHatred(T)<100) and distance<=10 then MacroFunctions.use({3971},3,500) end
      --Sử dụng Giới Hỏa Trảm, Quy Tịch Đạo tăng sát thương và uy hiếp
      MacroFunctions.use({3980,3981},2,500)
    end
    --Tự dùng Quang Minh Tướng
    if MacroOptions.autoQuangMinhTuongMTLLT and (FS==1 or FM==1) and not MacroFunctions.CheckBuff(p,4498,1,0,0) then MacroFunctions.use({3969},3,500) end
    --Đánh Tịnh Thế hoặc Sinh Tử Kiếp ngay khi mãn nhật hoặc mãn nguyệt
    if p.GetSkillLevel(6760)==0 and (FS==1 or FM==1) then MacroFunctions.use(TinhThe,2,500) end
    if p.GetSkillLevel(6760)==1 and (FS==1 or FM==1) then MacroFunctions.use({3966},2,500) end
    --Đánh combo
    if arg==1 then
      MacroFunctions.use(SunCombo,2,500)
    elseif arg==2 then
      MacroFunctions.use(MoonCombo,2,500)
    end
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