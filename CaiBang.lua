MacroOptions = MacroOptions or {}

MacroFunctions = MacroFunctions or {}

function MacroFunctions.CaiBangTTQ()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local g=GetTongClient()
  local team=GetClientTeam()

  local TargetHP=T.nCurrentLife*100/T.nMaxLife
  local RawTargetHP=T.nMaxLife
  if RawTargetHP==1 then RawTargetHP=MacroFunctions.HPLimitRaid25 end
  local HPLimit=0
  if team.GetTeamSize()==0 then
    HPLimit=MacroFunctions.HPLimitRaid10
  elseif team.GetTeamSize()<=10 then
    HPLimit=MacroFunctions.HPLimitRaid10
  else
    HPLimit=MacroFunctions.HPLimitRaid25
  end
  local HP=p.nCurrentLife*100/p.nMaxLife
  local MP=p.nCurrentMana*100/p.nMaxMana
  local GLPG={5370,5369,5368,5367}
  local BCTT={5354,5258}
  local ACLL={5362,5361}
  local TTLL={5365,5263}
  local distance=MacroFunctions.GetDistance(T)
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
  end

  if bEnable==true and MacroFunctions.StopAction()<=1 and MacroFunctions.CheckMoveState(p,"stand|float|entrap|walk|run|jump") and not MacroFunctions.KTCombo.bEnable then
    --Buff Phù Dao Trực Thượng
    if  MacroFunctions.StopAction()==1 then MacroFunctions.use({9002},2) end
    --Gỡ bỏ trạng thái bảo vệ channeling skill
    if MacroFunctions.bProtected==true and (GetTime()-MacroFunctions.protectTime>=latency) then
      MacroFunctions.bProtected=false
    end
    --Set attackMode
    if MacroOptions.attackMode==3 then MacroOptions.attackMode=1 end
    --Xóa buff hút mana của TKPN
    if MacroFunctions.CheckBuff(p,6821,1,0,0) and MacroFunctions.bSpendMana==true then
      for i = 1,p.GetBuffCount() do
        local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = p.GetBuff(i-1)
        if dwID==6821 and bCanCancel then
          p.CancelBuff(nIndex)
        end
      end
    end
    --Cắt skill bằng Bổng Đả Cẩu Đầu
    if MacroOptions.autoSkillInterrupt then MacroFunctions.SkillInterrupt(T,MacroFunctions.bossSkills,5259) end
    --Xóa buff bằng Thục Khuyển Phệ Nhật
    if MacroOptions.autoClearBuff and MacroFunctions.CheckSkillRecipe(5257,1369) then MacroFunctions.ClearBuff(T,MacroFunctions.bossBuffs,5257) end
    --Sử dụng Tiếu Túy Cuồng khi HP<30%
    if MacroOptions.autoTieuTuyCuong and HP<30 then MacroFunctions.use({5270},2,100) end
    --Áp sát bằng Yên Vũ Hành
    if MacroOptions.autoYenVuHanh and not IsKeyDown("Space") and MacroFunctions.CheckFaceDirection(T) and distance>16 and distance<24 then MacroFunctions.use({5269},6,100) end
    --Áp sát bằng Bổng Đả Cẩu Đầu
    if MacroOptions.autoBongDaCauDau2 and not IsKeyDown("Space") and distance>8 and (not MacroFunctions.IsSkillCD(5262) or MP>91) then MacroFunctions.use({5259},6,100) end
    --Đánh KLHH khi còn 11 tầng 6381
    if MacroFunctions.CheckBuff(p,6381,11,0,0) and MP>30 then MacroFunctions.use({5638,8490},6,100) end
    --Duy trì Kháng Long Hữu Hối
    if MacroFunctions.CheckBuff(p,5984,1,0,0) and MP>30 and not MacroFunctions.CheckBuff(T,6401,1,5,1) then
      MacroFunctions.use({5638},6,100)
    elseif MacroFunctions.CheckBuff(p,5984,1,3,0) and MP<30 and not MacroFunctions.CheckBuff(T,6401,1,5,1) then
      MacroFunctions.use(BCTT,6,100)
    elseif not MacroFunctions.CheckBuff(p,5984,1,0,0) and MP>57 and not MacroFunctions.CheckBuff(T,6401,1,5,1) then
      MacroFunctions.use({5262},6,100)
    elseif not MacroFunctions.CheckBuff(p,5984,1,0,0) and MP<57 and not MacroFunctions.CheckBuff(T,6401,1,5,1) then
      MacroFunctions.use(BCTT,6,100)
    end
    --Duy trì buff Phục Hổ
    if p.IsInParty() and MacroFunctions.IsFormationLeader() and not MacroFunctions.CheckBuff(p,6345,1,3,1) then MacroFunctions.use({5266},6,100) end
    --Dùng Thiêm Chuẩn Kích
    if MacroOptions.autoThiemChuanKich and RawTargetHP>=HPLimit and not MacroFunctions.bThiemChuanKich and p.bFightState then MacroFunctions.use({6942,6945,6946,6947,6948},6) end
    --Dùng Tửu Trung Tiên
    if p.GetSkillLevel(6840)==0 then
      if MacroOptions.autoTuuTrungTien and MacroFunctions.bSpendMana==true and RawTargetHP>=HPLimit then MacroFunctions.use({5268},2,100) end
    else
      if MacroOptions.autoTuuTrungTien and MacroFunctions.bSpendMana==false and RawTargetHP>=HPLimit then MacroFunctions.use({5268},2,100) end
    end
    --Chuyển mode tích lũy nội lực và tiêu hao nội lực
    if MP<10 and MacroFunctions.bSpendMana==true then MacroFunctions.bSpendMana=false end
    if MacroFunctions.CheckBuff(T,6401,8,0,0) or RawTargetHP<HPLimit or MacroOptions.attackMode==2 or p.GetSkillLevel(6824)==1 then
      if MP>91 and MacroFunctions.bSpendMana==false then MacroFunctions.bSpendMana=true end
    else
      if MP>71 and MacroFunctions.bSpendMana==false then MacroFunctions.bSpendMana=true end
    end
    --Sử dụng vật phẩm
    if MacroOptions.autoUseWeapon and MacroFunctions.CheckBuff(p,5994,1,20,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.MELEE_WEAPON) end
    if MacroOptions.autoUseAmulet and MacroFunctions.CheckBuff(p,5994,1,20,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.AMULET) end
    if MacroOptions.autoUsePendant and MacroFunctions.CheckBuff(p,5994,1,20,0) then MacroFunctions.UseEquippedItem(EQUIPMENT_INVENTORY.PENDANT) end
    --Đánh Thục Khuyển Phệ Nhật hồi mana
    if MacroFunctions.bSpendMana==false and p.GetSkillLevel(6815)==1 and distance<=8 and MP<60 and not MacroFunctions.CheckBuff(p,5994,1,20,0) and MacroFunctions.GetSkillCD(5268)>=6 then MacroFunctions.use({5257},6,100) end
    --Đánh Ác Cẩu Lan Lộ, Tà Đả Cẩu Bối, Bổng Đả Cẩu Đầu, Bát Cẩu Triều Thiên
    if MacroFunctions.bSpendMana==false and p.GetSkillLevel(5362)==1 and distance<=6 then MacroFunctions.use(ACLL,6,100) end
    if MacroFunctions.bSpendMana==false and MacroOptions.autoBongDaCauDau1 and not IsKeyDown("Space") then MacroFunctions.use({5259},6,100) end
    if MacroFunctions.bSpendMana==false and p.GetSkillLevel(6337)==1 then MacroFunctions.use({5258,6337},6,100) end
    if MacroFunctions.bSpendMana==false then MacroFunctions.use(BCTT,6,100) end
    --Đánh combo Giao Long Phiên Giang -> Long Đằng Ngũ Nhạc
    if MacroFunctions.bSpendMana==true and distance<=4 and MacroFunctions.GetSkillCD(5262)<5 and MP>70 then MacroFunctions.use({5370},6,100) end
    if MacroFunctions.bSpendMana==true and distance<=4 and MacroFunctions.GetSkillCD(5262)<5 and MP>70 then MacroFunctions.use({5369},6,100) end
    if MacroFunctions.bSpendMana==true and distance<=4 and MacroFunctions.GetSkillCD(5262)<5 and MP>70 then MacroFunctions.use({5368},6,100) end
    if MacroFunctions.bSpendMana==true and distance<=5 and MacroFunctions.GetSkillCD(5262)<5 and MP>91 and (MacroFunctions.CheckBuff(T,6401,8,0,0) or RawTargetHP<HPLimit or MacroOptions.attackMode==2 or p.GetSkillLevel(6824)==1) then MacroFunctions.use({5367},6,100) end
    --Đánh Long Dược Vu Uyên
    if (not MacroFunctions.IsSkillCD(5269) or distance<16 or not MacroOptions.autoYenVuHanh) and not IsKeyDown("Space") then
      if MacroFunctions.bSpendMana==true and MP>71 and (MacroFunctions.dwLastSkillIDCasted~=5369 or distance>5) then
        MacroFunctions.use({5262},6,100)
      elseif MacroFunctions.bSpendMana==true and MP<71 and MacroFunctions.GetSkillCD(5262)<1.5 then
        MacroFunctions.use(BCTT,6,100)
      end
    end
    --Đánh Long Chiến Vu Dã
    if MacroFunctions.bSpendMana==true and MP>44 and not MacroFunctions.IsSkillCD(5262) and MacroFunctions.CheckBuff(p,5984,1,2.5,0) then MacroFunctions.use({5266},6,100) end
    --Đánh Kháng Long Hữu Hối
    if MacroFunctions.IsFormationLeader() then
      if MacroFunctions.bSpendMana==true and MP>30 and not MacroFunctions.IsSkillCD(5262) and MacroFunctions.GetSkillCD(5266)>5 and MacroFunctions.CheckBuff(p,5984,1,0,0) then MacroFunctions.use({5638,8490},6,100) end
    else
      if MacroFunctions.bSpendMana==true and MP>30 and not MacroFunctions.IsSkillCD(5262) and (MacroFunctions.GetSkillCD(5266)>5 or MacroFunctions.Checkbuff(p,6385,1,10,0) or MP<44) and MacroFunctions.CheckBuff(p,5984,1,0,0) then MacroFunctions.use({5638,8490},6,100) end
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