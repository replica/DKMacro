MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.VanHoaHGD()
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
  local latency=1000
  local bMinBuffTime=false
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
    if GetLogicFrameCount()-MacroFunctions.KTCombo.nStartTime>32 and MacroFunctions.KTCombo.KhoaiTuyetThoiTinh then MacroFunctions.use({2636},3) end
    if MacroFunctions.KTCombo.QuyetAmChi then MacroFunctions.use({183},3) end
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Buff Phù Dao Trực Thượng
    if MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Kiểm tra không có buff DOT nào đang tồn tại dưới 2.5s
    if MacroFunctions.CheckBuff(T,666,1,0,0) or MacroFunctions.CheckBuff(T,711,1,0,0) or MacroFunctions.CheckBuff(T,714,1,0,0) then
      bMinBuffTime=true
    end
    if MacroFunctions.CheckBuff(T,666,1,0,0) and not MacroFunctions.CheckBuff(T,666,1,2.5,0) then
      bMinBuffTime=false
    end
    if MacroFunctions.CheckBuff(T,711,1,0,0) and not MacroFunctions.CheckBuff(T,711,1,2.5,0) then
      bMinBuffTime=false
    end
    if MacroFunctions.CheckBuff(T,714,1,0,0) and not MacroFunctions.CheckBuff(T,714,1,2.5,0) then
      bMinBuffTime=false
    end

    --Cắt skill bằng Quyết Âm Chỉ
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,183) end
    --Xóa buff của boss bằng Thiếu Minh Chỉ
    if MacroOptions.autoClearBuff then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,184) end
    --Sử dụng Xuân Nê Hộ Hoa và Hoa Ngữ Tô Tâm để phục hồi HP khi HP<30%
    if MacroOptions.autoXuanNeHoHoa and HP<30 then MacroFunctions.use({132,134},2) end
    --Sử dụng Bích Thủy Thao Thiên khi MP<40%
    if MacroOptions.autoBichThuyThaoThien and MP<40 then MacroFunctions.use({131},2) end
    --Duy trì Thanh Tâm Tịnh Khí
    if MacroOptions.autoThanhTamTinhKhi and not MacroFunctions.CheckBuff(p,112,1,0,0) then MacroFunctions.use({130},2) end
    --Sử dụng Thủy Nguyệt Vô Gian
    if p.GetSkillLevel(5796)==1 then
      if MacroOptions.autoThuyNguyetVoGian and MacroFunctions.GetSkillCD(186)<=1.5 and (not MacroFunctions.CheckBuff(T,666,1,3,1) or not MacroFunctions.CheckBuff(T,714,1,3,1) or not MacroFunctions.CheckBuff(T,711,1,3,1) or not MacroFunctions.CheckBuff(T,886,1,3,1)) and not MacroFunctions.CheckBuff(p,113,1,0,0) then MacroFunctions.use({136},4,500) end
    else
      if MacroOptions.autoThuyNguyetVoGian and p.IsInParty() then MacroFunctions.use({136},4,500) end
    end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and (MacroFunctions.CheckBuff(p,6263,1,7,0) or MacroFunctions.CheckBuff(p,6251,5,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and (MacroFunctions.CheckBuff(p,6263,1,7,0) or MacroFunctions.CheckBuff(p,6251,5,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and (MacroFunctions.CheckBuff(p,6263,1,7,0) or MacroFunctions.CheckBuff(p,6251,5,10,0)) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Tích 5 tầng buff Thanh Quán, Tử Du
    if p.GetSkillLevel(5767)==1 then
      if (not MacroFunctions.CheckBuff(p,6255,5,0,0) or not MacroFunctions.CheckBuff(p,1239,2,0,0)) and MacroFunctions.CheckBuff(T,666,1,6,0) and MacroFunctions.CheckBuff(T,714,1,6,0) and MacroFunctions.CheckBuff(T,711,1,6,0) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0)) then MacroFunctions.use({179},2) end
    else
      if not MacroFunctions.CheckBuff(p,1239,2,0,0) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0)) then MacroFunctions.use({179},2) end
    end
    if RawTargetHP<HPLimit and not MacroFunctions.CheckBuff(p,1239,1,0,0) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0)) then MacroFunctions.use({179},2) end
      --Duy trì buff Thanh Quán, Tử Du
    if p.GetSkillLevel(5767)==1 and not MacroFunctions.CheckBuff(p,6255,1,4.5,1) and bMinBuffTime and MacroFunctions.dwLastSkillIDHit~=179 and MacroFunctions.dwPreparingSkillID~=179 and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0)) then MacroFunctions.use({179},2) end
    --Duy trì Mộng Ca
    if p.GetSkillLevel(5764)==1 and not MacroFunctions.CheckBuff(p,6251,1,4,1) then MacroFunctions.use({2636},2) end
    --Lan Thôi, Chung Linh, Thương Dương
    if not MacroFunctions.CheckBuff(p,6255,1,6,1) and not MacroFunctions.CheckBuff(T,714,1,0,0) and not MacroFunctions.CheckBuff(T,711,1,0,0) and not MacroFunctions.CheckBuff(T,666,1,0,0) then MacroFunctions.use({180},2) end
    if RawTargetHP>=HPLimit then
      if not MacroFunctions.CheckBuff(T,714,1,0,0) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0)) then MacroFunctions.use({189},3,2500) end
      if p.GetSkillLevel(5773)==0 and not MacroFunctions.CheckBuff(T,711,1,0,0) and (MacroFunctions.CheckMoveState(p,"stand|float|entrap") or MacroFunctions.CheckBuff(p,412,1,0,0) or MacroFunctions.CheckBuff(p,6371,1,0,0)) then MacroFunctions.use({190},2) end
      if not MacroFunctions.CheckBuff(T,666,1,0,0) then MacroFunctions.use({180},2) end
    end
    --Renew bằng Phù Dung Tịnh Đế
    if p.GetSkillLevel(5761)==1 and (not MacroFunctions.CheckBuff(T,666,1,3,1) or not MacroFunctions.CheckBuff(T,714,1,3,1) or not MacroFunctions.CheckBuff(T,711,1,3,1) or not MacroFunctions.CheckBuff(T,886,1,3,1)) then MacroFunctions.use({186},0) end
      --Đánh Khoái Tuyết Thời Tinh
    if not MacroFunctions.CheckBuff(p,6255,5,0,0) and not MacroFunctions.CheckBuff(p,1239,2,0,0) then
      if MacroFunctions.dwLastSkillIDHit~=180 and MacroFunctions.dwPreparingSkillID~=180 and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({2636},2) end
    else
      if MacroFunctions.CheckMoveState(p,"stand|float|entrap") then MacroFunctions.use({2636},2) end
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