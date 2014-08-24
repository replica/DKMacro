MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.ThatTuBTQ()
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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.GiangHaiNgungQuang then MacroFunctions.use({553},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and GetTime()-MacroFunctions.protectTime>=latency then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Kiểm tra buff Cấp Khúc
    if (GetTime()-MacroFunctions.DHCKTimeLine)>=500 and p.GetSkillLevel(5852)==1 then
      if not MacroFunctions.CheckBuff(T,2920,1,0,0) then MacroFunctions.DHCK=0 end
      if MacroFunctions.CheckBuff(T,2920,1,0,0) and not MacroFunctions.CheckBuff(T,2920,2,0,0) then MacroFunctions.DHCK=1 end
      if MacroFunctions.CheckBuff(T,2920,2,0,0) and not MacroFunctions.CheckBuff(T,2920,3,0,0) then MacroFunctions.DHCK=2 end
      if MacroFunctions.CheckBuff(T,2920,3,0,0) then MacroFunctions.DHCK=3 end
      MacroFunctions.DHCKTimeLine=GetTime()
    end
    --Cắt skill bằng Kiếm Phá Hư Không hoặc Kiếm Tâm Thông Minh
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,547) end
    --Xóa buff của boss bằng Kiếm Chuyển Lưu Vân
    if MacroOptions.autoClearBuff then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,563) end
    --Sử dụng Thiên Địa Đê Ngang, Thước Đạp Chi khi HP<30%
    if MacroOptions.autoThienDiaDeNgang and HP<30 then MacroFunctions.use({557},2) end
    if MacroOptions.autoThienDiaDeNgang and HP<30 then MacroFunctions.use({550},3,500) end
    --Duy trì buff Tụ Khí bằng skill Bà La Môn
    if MacroOptions.autoBaLaMon and not MacroFunctions.CheckBuff(p,673,1,0,0) and not MacroFunctions.CheckBuff(p,2837,1,0,0) then MacroFunctions.use({545},2) end
    --Sử dụng Long Trì Nhạc khi cần thiết
    if MacroOptions.autoLongTriNhac and not MacroFunctions.CheckBuff(p,1987,1,0,0) and MP<85 then MacroFunctions.use({548},3,500) end
    --Sử dụng Mãn Đường Thế khi kiém vũ <=2
    if MacroOptions.autoManDuongThe and K<=2 then MacroFunctions.use({573},3,500) end
    --Sử dụng Phồn Âm Cấp Tiết
    if MacroOptions.autoPhonAmCapTiet and ((p.GetSkillLevel(5868)==0 and p.GetSkillLevel(5852)==1) or (MacroFunctions.DHCK==2 and (p.GetSkillLevel(5868)==0 or MacroFunctions.GetSkillCD(2716)<3)) or MacroFunctions.DHCK==3) then MacroFunctions.use({568},3,500) end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and ((p.GetSkillLevel(5868)==0 and p.GetSkillLevel(5852)==1) or (MacroFunctions.DHCK==2 and (p.GetSkillLevel(5868)==0 or MacroFunctions.GetSkillCD(2716)<3)) or MacroFunctions.DHCK==3) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and ((p.GetSkillLevel(5868)==0 and p.GetSkillLevel(5852)==1) or (MacroFunctions.DHCK==2 and (p.GetSkillLevel(5868)==0 or MacroFunctions.GetSkillCD(2716)<3)) or MacroFunctions.DHCK==3) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and ((p.GetSkillLevel(5868)==0 and p.GetSkillLevel(5852)==1) or (MacroFunctions.DHCK==2 and (p.GetSkillLevel(5868)==0 or MacroFunctions.GetSkillCD(2716)<3)) or MacroFunctions.DHCK==3) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Sử dụng và duy trì Kiếm Thần Vô Ngã khi khoảng cách <10m
    if MacroOptions.autoKiemThanVoNga and K>0 and distance<10 and MP>15 and not MacroFunctions.CheckBuff(p,693,1,0,0) and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({559},2) end
    --Đánh Kiếm Phá Hư Không khi có ít nhất 7 tầng kiếm vũ
    if MacroOptions.autoKiemPhaHuKhong then
      if p.GetSkillLevel(5868)==1 or p.GetSkillLevel(5852)==1 then
        if K>=7 then MacroFunctions.use({2716},2) end
      else
        if K>=7 and MacroFunctions.DHCK==2 then MacroFunctions.use({2716},2) end
      end
    end
    --Đánh Kiếm Khí Trường Giang
    if p.GetSkillLevel(5869)==1 then
      if K>=4 and MacroFunctions.DHCK==3 then MacroFunctions.use({561},2) end
    end
    --Đánh Giang Hải Ngưng Quang khi có thể (tồn tại 3 tầng Cấp Khúc)
    if p.GetSkillLevel(5869)==0 and p.GetSkillLevel(5852)==0 and MacroFunctions.DHCK==3 then MacroFunctions.use({553},2) end
    --Sử dụng Đại Huyền Cấp Khúc
    if MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({2707},2) end
    --Kiểm tra buff Cấp Khúc và tái lập số lần đánh DHCK
    if (GetTime()-MacroFunctions.DHCKTimeLine)>=500 and MacroFunctions.DHCK~=0 and p.GetSkillLevel(5852)==0 then
      if not MacroFunctions.CheckBuff(T,2920,1,0,0) and MacroFunctions.IsNotOT() then MacroFunctions.DHCK=0 end
      if not MacroFunctions.CheckBuff(T,2920,1,0,0) and not MacroFunctions.IsNotOT() then MacroFunctions.DHCK=1 end
      if MacroFunctions.CheckBuff(T,2920,1,0,0) and not MacroFunctions.CheckBuff(T,2920,2,0,0) and MacroFunctions.IsNotOT() then MacroFunctions.DHCK=1 end
      if MacroFunctions.CheckBuff(T,2920,1,0,0) and not MacroFunctions.CheckBuff(T,2920,2,0,0) and not MacroFunctions.IsNotOT() then MacroFunctions.DHCK=2 end
      if MacroFunctions.CheckBuff(T,2920,2,0,0) and not MacroFunctions.CheckBuff(T,2920,3,0,0) and MacroFunctions.IsNotOT() then MacroFunctions.DHCK=2 end
      if MacroFunctions.CheckBuff(T,2920,2,0,0) and not MacroFunctions.CheckBuff(T,2920,3,0,0) and not MacroFunctions.IsNotOT() then MacroFunctions.DHCK=3 end
      if MacroFunctions.CheckBuff(T,2920,3,0,0) and MacroFunctions.IsNotOT() then MacroFunctions.DHCK=3 end
      if MacroFunctions.CheckBuff(T,2920,3,0,0) and not MacroFunctions.IsNotOT() then MacroFunctions.DHCK=3 end
      MacroFunctions.DHCKTimeLine=GetTime()
    end
  elseif bEnable==false then
    p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text=MacroFunctions.message}})
    if p.IsInParty() then p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text=MacroFunctions.message}}) end
  elseif MacroFunctions.StopAction()>1 then
    if MacroFunctions.StopAction()==2 then
      p.StopCurrentAction()
      if MacroFunctions.CheckBuff(p,693,1,0,0) then
        for z,x in pairs(p.GetBuffList() or {}) do
          if x.dwID==693 and x.bCanCancel then
            p.CancelBuff(x.nIndex)
          end
        end
      end
    elseif MacroFunctions.StopAction()==3 then
      p.StopCurrentAction()
      OnAddOnUseSkill(9007,1)
    end
  end
end