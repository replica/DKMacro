MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.DuongMonKVQ()
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
  local energy=p.nCurrentEnergy
  --Ngưỡng thần cơ cho các skill và combo
  local x=10
  local y=2
  local bHuyenDieu=false
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
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.CuongPhongTieuPhap then MacroFunctions.use({3121},3) end
    if MacroFunctions.KTCombo.MaiHoaCham then MacroFunctions.use({3092},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Set bChannelingLatencyCompensation
    if p.GetSkillLevel(6455)==1 then MacroOptions.bChannelingLatencyCompensation=false end
    --Set tmtReady
    if MacroFunctions.CheckBuff(p,3399,2,0,0) and not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID==3095 then MacroFunctions.tmtReady=true end
    if not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID==3096 then MacroFunctions.tmtReady=false p.StopCurrentAction() end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Kiểm tra buff Khí Phách
    if MacroFunctions.CheckBuff(p,3254,5,0,0) and MacroFunctions.dwChannelingSkillID==3093 and p.GetSkillLevel(6891)==0 then y=0 else y=2 end
    --Set buff Huyền Diệu
    if MacroFunctions.CheckBuff(p,3278,1,0,0) and MacroFunctions.IsNotSP() then bHuyenDieu=true end
    --Cắt skill bằng Mai Hoa Châm
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,3092) end
    --Xóa buff của boss bằng Ngự Nguyên Tiễn
    if MacroOptions.autoClearBuff then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,3099) end
    --Sử dụng Phù Quang Lược Ảnh khi cừu hận >70%
    if MacroOptions.autoPhuQuangLuocAnhKVQ and p.IsInParty() and MacroFunctions.GetMyHatred(T)>70 then MacroFunctions.use({3112},3,500) end
    --Bật Kinh Hồng Du Long khi HP<30%
    if MacroOptions.autoKinhHongDuLongKVQ and HP<30 then MacroFunctions.use({3114},y) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(T,2237,1,0,0) and (MacroFunctions.CheckBuff(T,3712,1,0,0) or MacroFunctions.GetSkillCD(3098)>1.5 or p.GetSkillLevel(6891)==1) and MacroFunctions.GetSkillCD(3096)<=3 and (MacroFunctions.CheckBuff(p,3399,2,0,0) or MacroFunctions.CheckBuff(p,3276,1,0,0) or MacroFunctions.CheckBuff(p,3487,1,3,0)) and not MacroFunctions.CheckBuff(p,3214,1,0,0) and not MacroFunctions.CheckBuff(p,3468,1,0,0) and MacroFunctions.IsSkillCD(3095) and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(T,2237,1,0,0) and (MacroFunctions.CheckBuff(T,3712,1,0,0) or MacroFunctions.GetSkillCD(3098)>1.5 or p.GetSkillLevel(6891)==1) and MacroFunctions.GetSkillCD(3096)<=3 and (MacroFunctions.CheckBuff(p,3399,2,0,0) or MacroFunctions.CheckBuff(p,3276,1,0,0) or MacroFunctions.CheckBuff(p,3487,1,3,0)) and not MacroFunctions.CheckBuff(p,3214,1,0,0) and not MacroFunctions.CheckBuff(p,3468,1,0,0) and MacroFunctions.IsSkillCD(3095) and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(T,2237,1,0,0) and (MacroFunctions.CheckBuff(T,3712,1,0,0) or MacroFunctions.GetSkillCD(3098)>1.5 or p.GetSkillLevel(6891)==1) and MacroFunctions.GetSkillCD(3096)<=3 and (MacroFunctions.CheckBuff(p,3399,2,0,0) or MacroFunctions.CheckBuff(p,3276,1,0,0) or MacroFunctions.CheckBuff(p,3487,1,3,0)) and not MacroFunctions.CheckBuff(p,3214,1,0,0) and not MacroFunctions.CheckBuff(p,3468,1,0,0) and MacroFunctions.IsSkillCD(3095) and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Bật Tập Trung
    if MacroOptions.autoTapTrungKVQ and MacroFunctions.CheckBuff(T,2237,1,0,0) and (MacroFunctions.CheckBuff(T,3712,1,0,0) or MacroFunctions.GetSkillCD(3098)>1.5 or p.GetSkillLevel(6891)==1) and MacroFunctions.GetSkillCD(3096)<=3 and (MacroFunctions.CheckBuff(p,3399,2,0,0) or MacroFunctions.CheckBuff(p,3276,1,0,0) or MacroFunctions.CheckBuff(p,3487,1,3,0)) and not MacroFunctions.CheckBuff(p,3214,1,0,0) and not MacroFunctions.CheckBuff(p,3468,1,0,0) and MacroFunctions.IsSkillCD(3095) then MacroFunctions.use({3094},3,500) end
    --Bật Kinh Hồng Du Long nếu có bí kíp hồi 20 thần cơ
    if MacroOptions.autoKinhHongDuLongKVQ and MacroFunctions.CheckSkillRecipe(3114,904) and energy<30 and not MacroFunctions.CheckBuff(p,3468,1,0,0) and MacroFunctions.GetSkillCD(3100)>1.5 and MacroFunctions.GetSkillCD(3101)>1.5 then MacroFunctions.use({3114},y) end
    --Thay đổi ngưỡng thần cơ khi xuất hiện buff Huyền Diệu
    if bHuyenDieu then x=4 else x=10 end
    --Bắn Truy Mệnh Tiễn không vận công khi xuất hiện buff Truy Mệnh Vô Thanh
    if energy>=(x*2) and (MacroFunctions.CheckBuff(p,3276,1,0,0) or MacroFunctions.tmtReady) and (MacroFunctions.CheckBuff(p,3468,1,0,0) or not MacroFunctions.IsSkillCD(3094)) and (not bHuyenDieu or TargetHP>=70) then MacroFunctions.use({3096},y) end
    --Bắn Đoạt Phách Tiễn khi còn buff thần binh
    if MacroFunctions.CheckBuff(p,3487,1,4.5,0) and not MacroFunctions.CheckBuff(p,3399,1,0,0) and energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3095},y) end
    if MacroFunctions.CheckBuff(p,3487,1,3,0) and MacroFunctions.CheckBuff(p,3399,1,0,0) and energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3095},y) end
    if MacroFunctions.CheckBuff(p,3487,1,1.5,0) and MacroFunctions.CheckBuff(p,3399,2,0,0) and energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3095},y) end
    --Duy trì buff Khí Phách
    if energy>=(x*3) and MacroFunctions.CheckSkillRecipe(3093,842) and not MacroFunctions.CheckBuff(p,3254,5,5,0) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3093},2) end
    --Duy trì Hóa Huyết Tiêu và Xuyên Tâm Nỏ khi gần hết
    if p.GetSkillLevel(5703)==1 and energy>=(x*3) and (not MacroFunctions.CheckBuff(T,2237,1,6,1) or not MacroFunctions.CheckBuff(T,3712,1,6,1)) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3095},y) end
    --Bắn Xuyên Tâm Nỏ nếu chưa tồn tại
    if RawTargetHP>=HPLimit and energy>=(x*3) and not MacroFunctions.CheckBuff(T,3712,1,0,0) and p.GetSkillLevel(5703)==1 then MacroFunctions.use({3098},y) end
    --Đánh Hóa Huyết Tiêu lên target nếu chưa tồn tại
    if RawTargetHP>=HPLimit and energy>=(x*2) and not MacroFunctions.CheckBuff(T,2237,1,0,0) then MacroFunctions.use({3087},y) end
    --Khi đủ thần cơ dùng Trục Tinh Tiễn, Liên Hoàn Nỏ, Ngự Nguyên Tiễn, Khổng Tước Linh, Đoạt Phách Tiễn, Liệt Thạch Nỏ
    if p.GetSkillLevel(6891)==1 then
      if not bHuyenDieu and (energy<=80 or (not MacroFunctions.CheckBuff(T,7196,1,0,0) and not MacroFunctions.CheckBuff(T,7197,1,0,0)) or MacroFunctions.CheckBuff(p,3468,1,0,0)) then MacroFunctions.use({3101},y) end
    else
      if not bHuyenDieu and ((MacroFunctions.CheckBuff(T,2237,1,0,0) and (MacroFunctions.CheckBuff(T,3712,1,0,0) or MacroFunctions.GetSkillCD(3098)>1.5) and p.GetSkillLevel(6776)==1) or energy<=60) then MacroFunctions.use({3101},y) end
    end
    if energy<x*3 and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3100},2) end
    if MacroOptions.autoNguNguyenTien then
      if energy>=x and not bHuyenDieu and not MacroFunctions.CheckBuff(T,5886,1,1,0) and (not MacroFunctions.CheckBuff(T,5634,1,0,0) or MacroFunctions.CheckBuff(T,5634,25,0,0)) then MacroFunctions.use({3099},y) end
    else
      if energy>=x and not bHuyenDieu and MacroFunctions.CheckBuff(T,5634,25,0,0) then MacroFunctions.use({3099},y) end
    end
    if energy>=(x*1.5) and (energy<=55 or MacroFunctions.CheckMoveState(p,"walk|run|jump")) and not bHuyenDieu then MacroFunctions.use({3088},y) end
    if energy>=(x*6) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") and p.GetSkillLevel(6891)==1 then MacroFunctions.use({3093,6444},2) end
    if energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") and (p.GetSkillLevel(6891)==0 or not bHuyenDieu) then MacroFunctions.use({3095},y) end
    if energy>=50 and MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({6450},y) end
    if energy>=80 and MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({3097},y) end
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

function MacroFunctions.DuongMonTLND()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local nTargetType,dwTargetID=p.GetTarget()
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
  local energy=p.nCurrentEnergy
  local latency=1000
  local distance=MacroFunctions.GetDistance(T)
  --Ngưỡng thần cơ cần thiết cho các skill và combo
  local x=10
  local bHuyenDieu=false
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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.CuongPhongTieuPhap then MacroFunctions.use({3121},3) end
    if MacroFunctions.KTCombo.MaiHoaCham then MacroFunctions.use({3092},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Set buff Huyền Diệu
    if MacroFunctions.CheckBuff(p,3278,1,0,0) and MacroFunctions.IsNotSP() then bHuyenDieu=true end
    --Set bDoubleDamage
    if MacroFunctions.CheckBuff(p,3401,1,0,0) then MacroFunctions.bDoubleDamage=true end
    --Cắt skill bằng Mai Hoa Châm
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,3092) end
    --Sử dụng Phù Quang Lược Ảnh khi cừu hận >70%
    if MacroOptions.autoPhuQuangLuocAnhTLND and p.IsInParty() and MacroFunctions.GetMyHatred(T)>70 then MacroFunctions.use({3112},3,500) end
    --Bật Kinh Hồng Du Long khi HP<30%
    if MacroOptions.autoKinhHongDuLongTLND and HP<30 and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) then MacroFunctions.use({3114},2) end
    --Tự bật Quỉ Phủ Thần Công
    if MacroOptions.autoQuiPhuThanCong and RawTargetHP>=HPLimit and energy>=(x*2) and MacroFunctions.GetATSCNum()>=2 and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,4,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and MacroFunctions.GetSkillCD(3108)>=4 and (MacroFunctions.GetSkillCD(3093)<=8 or MacroFunctions.GetSkillCD(6444)<=8) and MacroFunctions.GetTCBDistance()<=4 then MacroFunctions.use({3110},2) end
    --Sử dụng vật phẩm
    if MacroOptions.autoTCB==1 then
      if MacroOptions.autoTapTrungQPTC==1 then
        if MacroFunctions.GetSkillCD(3110)>10 and MacroFunctions.GetSkillCD(3110)<115 then
          if (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and (MacroFunctions.GetSkillCD(3093)<=8 or MacroFunctions.GetSkillCD(6444)<=8) and MacroFunctions.GetATSCNum()>=2 then
            if MacroOptions.autoUseWeapon and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
            if MacroOptions.autoUseAmulet and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
            if MacroOptions.autoUsePendant and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
          end
        else
          if MacroFunctions.GetSkillCD(3110)>115 and MacroFunctions.GetSkillCD(3110)<117 then
            if MacroOptions.autoUseWeapon and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
            if MacroOptions.autoUseAmulet and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
            if MacroOptions.autoUsePendant and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
          end
        end
      elseif MacroOptions.autoTapTrungQPTC==2 then
        if MacroFunctions.GetSkillCD(3110)>115 and MacroFunctions.GetSkillCD(3110)<117 then
          if MacroOptions.autoUseWeapon and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
          if MacroOptions.autoUseAmulet and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
          if MacroOptions.autoUsePendant and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
        end
      end
    else
      if (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,4,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and MacroFunctions.GetATSCNum()>=2 then
        if MacroOptions.autoUseWeapon and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
        if MacroOptions.autoUseAmulet and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
        if MacroOptions.autoUsePendant and MacroFunctions.IsSkillCD(3094) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
      end
    end
    --Bật Tập Trung
    if MacroOptions.autoTCB==1 then
      if MacroOptions.autoTapTrungQPTC==1 then
        if MacroFunctions.GetSkillCD(3110)>10 and MacroFunctions.GetSkillCD(3110)<115 then
          if MacroOptions.autoTapTrungTLND and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and (MacroFunctions.GetSkillCD(3093)<=8 or MacroFunctions.GetSkillCD(6444)<=8) and MacroFunctions.GetATSCNum()>=2 then MacroFunctions.use({3094},3,500) end
        else
          if MacroOptions.autoTapTrungTLND and MacroFunctions.GetSkillCD(3110)>115 and MacroFunctions.GetSkillCD(3110)<117 then MacroFunctions.use({3094},3,500) end
        end
      elseif MacroOptions.autoTapTrungQPTC==2 then
        if MacroOptions.autoTapTrungTLND and MacroFunctions.GetSkillCD(3110)>115 and MacroFunctions.GetSkillCD(3110)<117 then MacroFunctions.use({3094},3,500) end
      end
    else
      if MacroOptions.autoTapTrungTLND and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,4,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and MacroFunctions.GetATSCNum()>=2 then MacroFunctions.use({3094},3,500) end
    end
    --Bật Kinh Hồng Du Long nếu có bí kíp hồi 20 thần cơ
    if p.GetSkillLevel(6888)==1 then
      if MacroOptions.autoKinhHongDuLongTLND and MacroFunctions.CheckSkillRecipe(3114,904) and energy<=30 and not MacroFunctions.CheckBuff(p,3468,1,0,0) and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and not (MacroFunctions.CheckBuff(p,3401,1,0,0) and MacroFunctions.CheckBuff(p,6105,1,0,0) and MacroFunctions.GetATSCNum()==3) then MacroFunctions.use({3114},2) end
    else
      if MacroOptions.autoKinhHongDuLongTLND and MacroFunctions.CheckSkillRecipe(3114,904) and energy<60 and not MacroFunctions.CheckBuff(p,3468,1,0,0) and (MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) or not (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826))) and (MacroFunctions.TCBTimeLeft>81 or MacroFunctions.TCBTimeLeft<=6) then MacroFunctions.use({3114},2) end
    end
    --Xuất hiện buff Huyền Diệu thì thay đổi ngưỡng thần cơ cần thiết
    if bHuyenDieu then x=4 else x=10 end
    --Tự đặt Thiên Cơ Biến
    if MacroFunctions.GetTCBStatus()>-1 and not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID==3109 and (MacroFunctions.TCBStartFrame==0 or MacroFunctions.TCBTimeLeft>6) then p.StopCurrentAction() end
    if RawTargetHP>=HPLimit and ((MacroOptions.autoTCB==1 and distance<25) or (MacroOptions.autoTCB==2 and distance<9.5)) and energy>=24 and (MacroFunctions.GetTCBStatus()==-1 or (MacroFunctions.TCBTimeLeft<=6 and MacroFunctions.TCBTimeLeft>=0)) and MacroFunctions.GetSkillCD(3109)==MacroFunctions.GetSkillCD(3087) and MacroFunctions.CheckBuff(p,3278,1,0,0) and not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID~=3109 then p.StopCurrentAction() end
    if RawTargetHP>=HPLimit and ((MacroOptions.autoTCB==1 and distance<25) or (MacroOptions.autoTCB==2 and distance<9.5)) and (energy>=60 or (energy>=24 and MacroFunctions.CheckBuff(p,3278,1,0,0))) and (MacroFunctions.GetTCBStatus()==-1 or (MacroFunctions.TCBTimeLeft<=6 and MacroFunctions.TCBTimeLeft>=0)) and MacroFunctions.GetSkillCD(3109)==MacroFunctions.GetSkillCD(3087) and MacroFunctions.dwPreparingSkillID~=3109 and MacroFunctions.dwLastSkillIDCasted~=3109 then MacroFunctions.use({3109},2) end
    if MacroOptions.autoTCB==1 and MacroFunctions.GetTCBStatus()==0 then MacroFunctions.use({3368},5,500) end
    if MacroOptions.autoTCB==2 and MacroFunctions.GetTCBStatus()==0 then MacroFunctions.use({3370},5,500) end
    --Tự tấn công target bằng thiên cơ biến
    if MacroOptions.autoTCBAttack and IsEnemy(p.dwID,T.dwID) and MacroFunctions.currentTargetID~=dwTargetID and MacroFunctions.GetTCBStatus()>0 and MacroFunctions.GetTCBTargetDistance()<25 then
      MacroFunctions.use({3360},5,0)
    end
    --Ngừng đánh đặt lại TCB
    if not (RawTargetHP>=HPLimit and ((MacroOptions.autoTCB==1 and distance<25) or (MacroOptions.autoTCB==2 and distance<9.5)) and (MacroFunctions.GetTCBStatus()==-1 or (MacroFunctions.TCBTimeLeft<=6 and MacroFunctions.TCBTimeLeft>=0)) and MacroFunctions.GetSkillCD(3109)==MacroFunctions.GetSkillCD(3087) and MacroFunctions.dwPreparingSkillID~=3109 and MacroFunctions.dwLastSkillIDCasted~=3109) then
      --Kiểm tra bí kíp Phệ Tâm, nếu có thì duy trì buff Phệ Tâm
      if RawTargetHP>=HPLimit and (MacroFunctions.CheckSkillRecipe(3087,825) or MacroFunctions.CheckSkillRecipe(3087,826)) and energy>=(x*2) and (not bHuyenDieu or MacroFunctions.GetSkillCD(3093)==MacroFunctions.GetSkillCD(3087) or not MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,1.5,0)) and not MacroFunctions.CheckBuff(T,3253,MacroOptions.stackNumPheTam,3,0) then MacroFunctions.use({3087},2) end
      --Đặt Ám Tàng Sát Cơ
      if MacroFunctions.CheckMoveState(T,"stand|float") and MacroOptions.toggleAttackMode~=2 and MacroFunctions.GetATSCNum()<=2 and (((energy>=MacroOptions.toggleATSCMode or (MacroFunctions.GetSkillCD(3110)<=8 and energy>=25 and MacroOptions.autoTCB>0) or (MacroFunctions.GetSkillCD(3094)<=8 and energy>=25 and MacroOptions.autoTapTrungQPTC==1) or MacroFunctions.CheckBuff(p,3468,1,0,0)) and (not bHuyenDieu or MacroFunctions.CheckBuff(p,3468,1,0,0) or (energy>=100 and p.GetSkillLevel(6891)==0))) or (MacroFunctions.GetSkillCD(3110)>115 and MacroFunctions.GetSkillCD(3110)<117)) then MacroFunctions.use({3111},1,500) end
      --Nổ Ám Tàng Sát Cơ khi có Tập Trung hoặc QPTC
      if IsEnemy(p.dwID,T.dwID) and MacroFunctions.GetATSCNum()==3 and (MacroFunctions.CheckBuff(p,3468,1,0,0) or MacroFunctions.CheckBuff(p,3316,1,0,0)) then MacroFunctions.use({3357},2) end
      --Nếu đối tượng di chuyển thì cho nổ ám tàng
      if MacroOptions.autoDoCungChuyKien and (MacroFunctions.CheckMoveState(T,"walk|run|jump") or MacroOptions.toggleAttackMode==2) and MacroFunctions.ATSC==true and IsEnemy(p.dwID,T.dwID) then MacroFunctions.use({3357},2) end
      --Nếu thần cơ >=20 đánh thêm Hóa Huyết Tiêu khi mất hiệu ứng rút máu do tác dụng của Thực Cơ Đạn
      if RawTargetHP>=HPLimit and energy>=(x*2) and (not bHuyenDieu or MacroFunctions.CheckBuff(p,3468,1,0,0)) and not MacroFunctions.CheckBuff(T,3221,1,0,0) and not (MacroFunctions.CheckBuff(p,3401,1,0,0) and MacroFunctions.CheckBuff(p,6105,1,0,0) and MacroFunctions.GetATSCNum()==3) and not MacroFunctions.CheckBuff(p,6360,1,0,0,6) then MacroFunctions.use({3087},2) end
      --Bắt Hóa Huyết Tiêu khi còn 1.5s Quỷ Phủ Thần Công
      if energy>=(x*2) and not MacroFunctions.CheckBuff(p,3316,1,1.5,1) and not MacroFunctions.CheckBuff(T,3221,1,15,0) then MacroFunctions.use({3087},2) end
      --Nếu thần cơ >=z thì đặt Thiên Tuyệt Địa Diệt (trừ Trần Hòa Thượng)
      if MacroOptions.autoDoCungChuyKien and MacroFunctions.CheckMoveState(T,"stand|float") and MacroOptions.toggleAttackMode~=2 and (MacroFunctions.CheckBuff(p,3316,1,6,0) or not MacroFunctions.CheckBuff(p,3316,1,0,0)) and (MacroFunctions.CheckBuff(p,3468,1,6,0) or not MacroFunctions.CheckBuff(p,3468,1,0,0)) and (not bHuyenDieu or p.GetSkillLevel(6891)==0) and not (MacroFunctions.CheckBuff(p,3401,1,0,0) and MacroFunctions.CheckBuff(p,6105,1,0,0)) then
        if GetNpc(T.dwID).szName=="Trần Hòa Thượng" and GetNpc(T.dwID).dwTemplateID==20287 then
          if MacroFunctions.TTDTTimeLineStart==0 or MacroFunctions.TTDTTimeLineEnd==0 or GetTime()<MacroFunctions.TTDTTimeLineStart or GetTime()>MacroFunctions.TTDTTimeLineEnd then
            if (p.GetSkillLevel(6492)==1 and energy>=(x*3)) or energy>=(x*5) then MacroFunctions.use({3108},2) end
          end
        elseif GetNpc(T.dwID).szName~="Lý Đàm" or GetNpc(T.dwID).dwTemplateID~=21595 then
          if (p.GetSkillLevel(6492)==1 and energy>=(x*3)) or energy>=(x*5) then MacroFunctions.use({3108},2) end
        end
      end
      --Nổ Đồ Cùng Chủy Kiến khi đủ 3 Ám Tàng Sát Cơ
      if MacroOptions.autoDoCungChuyKien and ((IsEnemy(p.dwID,T.dwID) and (MacroFunctions.GetATSCNum()==3 or (energy<(x*3) and MacroFunctions.ATSC==true)) and not ((RawTargetHP>=HPLimit and MacroFunctions.GetTCBDistance()<=4 and MacroFunctions.GetSkillCD(3110)<=8) or (MacroFunctions.GetSkillCD(3094)<=8 and (MacroOptions.autoTCB~=1 or (MacroOptions.autoTapTrungQPTC==1 and MacroFunctions.GetSkillCD(3110)>15))))) or (MacroFunctions.ATSCTimeLeft<3 and MacroFunctions.ATSCTimeLeft>0)) and ((MacroFunctions.bDoubleDamage and MacroFunctions.CheckBuff(p,3401,1,0,0) and MacroFunctions.CheckBuff(p,6105,1,0,0)) or (not MacroFunctions.bDoubleDamage and MacroFunctions.CheckBuff(p,6105,1,0,0)) or MacroOptions.toggleATSCMode>=85) then MacroFunctions.use({3357},2) end
      --Bạo Vũ Lê Hoa Châm, Thiên Nữ Tản Hoa cho mode AOE
      if p.GetSkillLevel(6891)==0 then
        if MacroOptions.toggleAttackMode==3 and energy>=(x*3) then MacroFunctions.use({6444},2) end
      else
        if MacroOptions.toggleAttackMode==3 and energy>=(x*6) then MacroFunctions.use({6444},2) end
      end
      if MacroOptions.toggleAttackMode==3 and energy>=(x*3.5) then MacroFunctions.use({3106},2) end
      --Nếu đủ thần cơ: Bạo Vũ Lê Hoa Châm, Khổng Tước Linh, Thực Cơ Đạn, Thiên Nữ Tản Hoa
      if p.GetSkillLevel(6443)==0 then
        if p.GetSkillLevel(6891)==0 then
          if MacroOptions.toggleAttackMode<3 and energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") and not MacroFunctions.CheckBuff(p,3468,1,0,0) then MacroFunctions.use({3093},2) end
        else
          if MacroOptions.toggleAttackMode<3 and energy>=(x*6) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({3093},2) end
        end
      else
        if p.GetSkillLevel(6891)==0 then
          if MacroOptions.toggleAttackMode<3 and energy>=(x*3) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({6444},2) end
        else
          if MacroOptions.toggleAttackMode<3 and energy>=(x*6) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({6444},2) end
        end
      end
      if MacroOptions.toggleAttackMode<3 and energy>=(x*1.5) and (energy<60 or MacroFunctions.CheckMoveState(p,"walk|run|jump")) and not bHuyenDieu then MacroFunctions.use({3088},2) end
      --Ngắt Thực Cơ Đạn dành Huyền Diệu cho BVLHC
      if p.GetSkillLevel(6891)==1 and MacroFunctions.GetSkillCD(3093)<1.5 and MacroFunctions.CheckBuff(p,3278,1,0,0) and not MacroFunctions.IsNotSP() and MacroFunctions.dwPreparingSkillID==3105 then p.StopCurrentAction() end
      if MacroOptions.toggleAttackMode<3 and energy>=(x*3) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,3281,1,0,0)) then MacroFunctions.use({3105},2) end
      if MacroOptions.toggleAttackMode<3 and energy>=70 and MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({3106},2) end
    end
  elseif bEnable==false then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
    if p.IsInParty() then p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text=MacroFunctions.message}}) end
  elseif MacroFunctions.StopAction()>1 then
    if MacroFunctions.StopAction()==2 then
      p.StopCurrentAction()
      if MacroFunctions.currentTargetID~=0 and (MacroFunctions.GetTCBStatus()==1 or MacroFunctions.GetTCBStatus()==2) then
        MacroFunctions.use({3382},5,500)
      end
    elseif MacroFunctions.StopAction()==3 then
      p.StopCurrentAction()
      OnAddOnUseSkill(9007,1)
    end
  end
end