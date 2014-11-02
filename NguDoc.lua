MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.NguDocDK()
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
  local MP=p.nCurrentMana*100/p.nMaxMana
  local isMine=true
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
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.BachTuc then MacroFunctions.use({2212},3) end
    if MacroFunctions.KTCombo.MeTamCo then MacroFunctions.use({2215},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    local pet=p.GetPet()
    local petFrame=Station.Lookup("Normal/PetActionBar")
    --Check Khô Tàn/Đoạt Mệnh
    for i = 1,T.GetBuffCount() do
      local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = T.GetBuff(i-1)
      if dwID==2307 and dwSkillSrcID~=p.dwID then isMine=false end
    end
    --Cắt skill bằng Đoạt Mệnh Cổ, hoặc Khô Tàn Cổ
    if not MacroFunctions.CheckBuff(T,2307,1,3,0) and isMine then
      MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,2214)
    elseif MacroFunctions.CheckBuff(T,2307,1,3,0) and not isMine then
      MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,2216)
    end
    --Buff Phượng Hoàng Cổ
    if MacroOptions.autoPhuongHoangCo and not MacroFunctions.CheckBuff(p,2313,1,0,0) then MacroFunctions.use({2220},2) end
    --Buff Huyền Thủy Cổ
    if MacroOptions.autoHuyenThuyCo and HP<30 and not MacroFunctions.CheckBuff(p,6240,1,0,0) then MacroFunctions.use({3702},2) end
    --Bật Cổ Trùng Cuồng Bạo
    if MacroOptions.autoCoTrungCuongBao and HP<30 and pet then MacroFunctions.use({2227},3,500) end
    --Buff thần binh
    if MacroFunctions.CheckBuff(p,3028,1,1.5,0) and pet and petFrame and  not MacroFunctions.CheckBuff(p,2543,1,0,0) and not MacroFunctions.CheckBuff(p,103) then MacroFunctions.use({2226},3,500) end
    if MacroFunctions.CheckBuff(p,3028,1,0,0) then MacroFunctions.use({2211},2) end
    --Gọi cóc lấy 20% tấn công cơ bản và -100% uy hiếp trong 10s
    if p.GetSkillLevel(6879)==1 and not MacroFunctions.CheckBuff(p,2828,1,0,0) then MacroFunctions.use({2222},2) end
    --Gọi rắn lấy 20% tấn công cơ bản và -100% uy hiếp trong 10s
    if not MacroFunctions.CheckBuff(p,2828,1,0,0) then MacroFunctions.use({2223},2) end
    --Hiến tế rắn ngay khi có thể
    if pet and petFrame and not MacroFunctions.CheckBuff(p,2543,1,0,0) and ((MacroFunctions.GetSkillCD(2223)>=15 and p.GetSkillLevel(6879)==1) or (MacroOptions.saveManaMode and p.GetSkillLevel(6880)==1) or p.GetSkillLevel(6879)==0 or MacroOptions.autoHienTe) and ((MP<85 and p.GetSkillLevel(6880)==1) or not MacroOptions.saveManaMode) and not MacroFunctions.CheckBuff(p,103) then MacroFunctions.use({2226},3,500) end
    --Cho pet tấn công
    local petTarget=nil if pet then petTarget=GetTargetHandle(pet.GetTarget()) end
    if pet and petFrame and IsEnemy(p.dwID,T.dwID) and (MacroFunctions.currentTargetID~=dwTargetID or petTarget==nil) then MacroFunctions.use({2442},5,500) end
    --Đánh skill Ảo Kích của rắn
    if pet and petFrame and IsEnemy(p.dwID,T.dwID) and (GetCharacterDistance(pet.dwID,T.dwID)/64)<8 then MacroFunctions.use({2477},5,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(p,2543,1,10,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(p,2543,1,10,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(p,2543,1,10,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Buff Đoạt Mệnh Cổ (hoặc Khô Tàn Cổ nếu đã có Đoạt Mệnh Cổ >=15s của người khác)
    if MacroOptions.autoDoatMenhCo==true then
      if not MacroFunctions.CheckBuff(T,2307,1,3,0) then MacroFunctions.use({2214},3,500) end
    elseif MacroOptions.autoMeTamCo==true then
      if not MacroFunctions.CheckBuff(T,2308,1,3,0) then MacroFunctions.use({2215},3,500) end
    elseif MacroOptions.autoKhoTanCo==true then
      if not MacroFunctions.CheckBuff(T,2309,1,3,0) then MacroFunctions.use({2216},3,500) end
    else
      if not MacroFunctions.CheckBuff(T,2307,1,3,0) and isMine then
        MacroFunctions.use({2214},3,500)
      elseif MacroFunctions.CheckBuff(T,2307,1,3,0) and not isMine and not MacroFunctions.CheckBuff(T,2309,1,3,0) then MacroFunctions.use({2216},3,500) end
    end
    --Tự buff Đoạt Mệnh Cổ
    if p.GetSkillLevel(6694)==1 and MacroOptions.autoSelfBuff and MacroFunctions.CheckBuff(T,2307,1,60,0) and not MacroFunctions.CheckBuff(p,6246,1,0,0) and MacroFunctions.IsSkillCD(2214) then
      MacroFunctions.SaveTarget()
      SetTarget(TARGET.PLAYER,p.dwID)
    end
    --Rebuff Xà Ảnh
    if MacroOptions.rebuffXaAnh and p.GetSkillLevel(6649)==1 and MacroFunctions.CheckBuff(T,2307,1,3,0) and MacroFunctions.CheckBuff(T,2487,1,2,0) and not MacroFunctions.CheckBuff(T,2296,1,0,0) then MacroFunctions.rebuffXaAnh=true MacroFunctions.fourthTimeLine=GetTime() end
    if MacroOptions.rebuffXaAnh and p.GetSkillLevel(6649)==1 and MacroFunctions.rebuffXaAnh then MacroFunctions.use({2211},4,16000) end
    --Bách Túc, Thiềm Khiếu đơn mục tiêu
    MacroFunctions.use({2212,6626},2)
    --Đánh Thiên Ti khi di chuyển
    if MacroOptions.autoThienTi then
      MacroFunctions.use({2213},2)
    else
      if MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({2213},2) end
    end
    --Đánh Xà Ảnh, Thiềm Khiếu đa mục tiêu
    if RawTargetHP>=HPLimit then
      if not MacroFunctions.CheckBuff(T,2296,1,0,0) or MacroFunctions.CheckMoveState(p,"walk|run|jump") then MacroFunctions.use({2211},2) end
      MacroFunctions.use({2210},2)
    end
    --Đánh Hạt Tâm khi đứng yên
    if MacroFunctions.CheckMoveState(p,"stand|float|entrap") or p.GetSkillLevel(6620)==1 then MacroFunctions.use({2209,6621},2) end
  elseif bEnable==false then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
    if p.IsInParty() then p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text=MacroFunctions.message}}) end
  elseif MacroFunctions.StopAction()>1 then
    if MacroFunctions.StopAction()==2 then
      p.StopCurrentAction()
      if pet and petFrame and MacroFunctions.currentTargetID~=0 then
        MacroFunctions.use({2446},5,500)
      end
    elseif MacroFunctions.StopAction()==3 then
      p.StopCurrentAction()
      OnAddOnUseSkill(9007,1)
    end
  end
end