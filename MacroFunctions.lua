MacroOptions = MacroOptions or {}

MacroFunctions=
{
  message="Nhân vật hoặc bang hội không được phép sử dụng chỉ lệnh này. Tất cả các tính năng đã bị vô hiệu hóa.",
  bInfoMessage=false,
  szInfoString="Loading DKMacro v3.1...",
  whiteGuildList={{id=3098,name="PhátXuân",nStartTime=1,nTime=9999999999},size=1},
  whiteCharacterList={"ĐườngKiệt","NguyenKen","_VânLong_","PhồngTômIdol","_zDarkHunterz_","GàBạoLực","SonyEricsson","ProfessorTiny","Quáchcôngcông","MaiMụiMụi","MonKhôngTan","NípNíp","YêuBóngĐêm","iDiệtThần","lipvlvlvl","___LýThông___","iSương","TiểuTrư","__Ú__Òa__","MikotoIzanami","____Hổ____","KỳHiểuLan","zzzTiểuLinhzzz","iNukerJN","VânThiênNam","ĐiếuCần","TăngCơ","TiểuKhang","_TiểuKhang_","CátBụjTìnhXa","LucyHeart","HoaKhuynhVũ","LiuMeiMei","TềSport","Kitaromura","CáChàPặc","_Nagato_","___Kal___","IdolSaoriHara","xHIKARUx","ThạchThànhUy","_SữaNon_","TôHiểuKỳ","____Trọc____","zMarlboroz","LàAiĐây","LongHoDao","MinhCoTuyet","Bạch_Long_Sứ","GoldTiger","ImonarchI","DiệpLưuYên","EternalX","__CỤTỔ__","HỏaDương","Doanh_Chính","HạVũLinh","_Lucent_","_SiêuPhẩm_","_UchihaMadara_","_Konnoha_","EstéeLauder","MissDior","oNhócRuồio","Thanh_Lan","PhongTửĐiệp","MạcGiaKhánh","Irisviel","_TiểuNyTử_","LâmKinhVu","LunarCinderella","NguyệtHiểu","iBăngTuyếtNhi","TiểuQuân_","LunarBunny","_TiểuÁcNhân_",size=76},
  bossSkills={4268,4199,4802,3598,3711,2314,4089,4091,4129,7282,3874,3756,2124,667,3499,3500,2817,3250,4813,4119,4108,2317,5226,4164,4184,5178,5191,5290,6183,6343,6163,5178,5346,5653,5305,6319,8093,8034},
  bossBuffs={2192,2190,2194,4687,5759},
  bossDebuffs={4253,3657},
  privateBuffs={6424,748,2237,3712,3221,4202,3442,540,513,666,714,711,2920,2487,2296,6401},
  channelingSkills={300,3100,3093,6444,3985,1645,2707,2636,5268,5270},
  tMoveStateList = {
    ["stand"]        = MOVE_STATE.ON_STAND,
    ["walk"]         = MOVE_STATE.ON_WALK,
    ["run"]          = MOVE_STATE.ON_RUN,
    ["jump"]        = MOVE_STATE.ON_JUMP,
    ["swim"]        = MOVE_STATE.ON_SWIM,
    ["swimjump"]    = MOVE_STATE.ON_SWIM_JUMP,
    ["float"]        = MOVE_STATE.ON_FLOAT,
    ["sit"]          = MOVE_STATE.ON_SIT,
    ["down"]        = MOVE_STATE.ON_KNOCKED_DOWN,
    ["back"]        = MOVE_STATE.ON_KNOCKED_BACK,
    ["off"]          = MOVE_STATE.ON_KNOCKED_OFF,
    ["halt"]        = MOVE_STATE.ON_HALT,
    ["freeze"]      = MOVE_STATE.ON_FREEZE,
    ["entrap"]      = MOVE_STATE.ON_ENTRAP,
    ["autofly"]      = MOVE_STATE.ON_AUTO_FLY,
    ["death"]        = MOVE_STATE.ON_DEATH,
    ["dash"]        = MOVE_STATE.ON_DASH,
    ["pull"]        = MOVE_STATE.ON_PULL,
    ["repulsed"]    = MOVE_STATE.ON_REPULSED,
    ["rise"]        = MOVE_STATE.ON_RISE,
    ["skid"]        = MOVE_STATE.ON_SKID,
    ["moveattack"]  = 26,
  },
  tEquipmentPos = {
    ["weapon"]      = EQUIPMENT_INVENTORY.MELEE_WEAPON,
    ["bigsword"]    = EQUIPMENT_INVENTORY.BIG_SWORD,
    ["rangeweapon"]  = EQUIPMENT_INVENTORY.RANGE_WEAPON,
    ["chest"]        = EQUIPMENT_INVENTORY.CHEST,
    ["helm"]        = EQUIPMENT_INVENTORY.HELM,
    ["amulet"]      = EQUIPMENT_INVENTORY.AMULET,
    ["leftring"]    = EQUIPMENT_INVENTORY.LEFT_RING,
    ["rightring"]    = EQUIPMENT_INVENTORY.RIGHT_RING,
    ["waist"]        = EQUIPMENT_INVENTORY.WAIST,
    ["pendant"]      = EQUIPMENT_INVENTORY.PENDANT,
    ["pants"]        = EQUIPMENT_INVENTORY.PANTS,
    ["boots"]        = EQUIPMENT_INVENTORY.BOOTS,
    ["bangle"]      = EQUIPMENT_INVENTORY.BANGLE,
  },
  MWi=0,
  MWj=0,
  AWi=0,
  AWj=0,
  exchangeTimeLine=0,
  bProtected=false,
  protectTime=0,
  TTLH=true,
  ATSC=false,
  currentTargetID=0,
  interruptTimeLine=0,
  firstTimeLine=0,
  secondTimeLine=0,
  thirdTimeLine=0,
  fourthTimeLine=0,
  fifthTimeLine=0,
  sixthTimeLine=0,
  DHCKTimeLine=0,
  DHCK=0,
  shoutTimeLine=0,
  dwMyHatred=0,
  dwSecondHighestHatred=0,
  bHatredDependency=true,
  tNpcList={},
  dwLastSkillIDCasted=0,
  szLastSkillCasted="",
  dwLastCastTime=0,
  dwLastSkillIDHit=0,
  dwChannelingSkillID=0,
  dwChannelingEndFrame=0,
  dwPreparingSkillID=0,
  HPLimitNoRaid=400000,
  HPLimitRaid10=1000000,
  HPLimitRaid25=2500000,
  CMCDTimeLineStart=0,
  CMCDTimeLineEnd=0,
  TTDTTimeLineStart=0,
  TTDTTimeLineEnd=0,
  bSpendMana=true,
  ReTarget=nil,
  rebuffXaAnh=false,
  TCBStartFrame=0,
  TCBTimeLeft=-1,
  ATSCArray={},
  ATSCStartFrame=0,
  ATSCTimeLeft=-1,
  bDoubleDamage=false,
  tmtReady=false,
  QCStartFrame=0,
  bThiemChuanKich=false,
  bFrameEnd=true,
  KTCombo = {
    bEnable=false,
    DanChieu=false,
    TiepChieu=false,
    initNum=0,
    PCNum=0,
    bDelay=false,
    nStartTime=0,

    GiangHaiNgungQuang=false,
    KhoaiTuyetThoiTinh=false,
    LuongNghiHoaHinh=false,
    CuongPhongTieuPhap=false,
    LucHopConPhap=false,
    LongNgam=false,
    ThinhLoi=false,
    BachTuc=false,

    MaiHoaCham=false,
    TrichTinh=false,
    Bang=false,
    TamSaiTangKiem=false,
    TamSaiThuanDuong=false,
    MeTamCo=false,
    CuuChuyenQuyNhat=false,
    ThuongChauThuc=false,
    CucLacDan=false,
    QuyetAmChi=false,
    KiemPhiKinhThien=false,
  },
}

RegisterCustomData("MacroFunctions.KTCombo.bEnable")
--RegisterCustomData("MacroFunctions.bossSkills")
--RegisterCustomData("MacroFunctions.bossBuffs")

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

function protect_table(tbl)
  return setmetatable ({},
    {
    __index = tbl,
    __newindex = function() end
    }
  )
end

MacroFunctions.whiteGuildList = protect_table(MacroFunctions.whiteGuildList)
MacroFunctions.whiteCharacterList = protect_table(MacroFunctions.whiteCharacterList)

-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------------------------

function MacroFunctions.OnFrameCreate()
  MacroFunctions.frame = this
  MacroFunctions.hTotal = this:Lookup("Wnd_Content", "")
  MacroFunctions.hBox = MacroFunctions.hTotal:Lookup("Box")
  if MacroFunctions.hBox then
    OutputMessage("MSG_SYS","[DKMacro] by [R]eplica - ĐườngKiệt\n")
  end
  this:RegisterEvent("CHARACTER_THREAT_RANKLIST")
  this:RegisterEvent("NPC_ENTER_SCENE")
  this:RegisterEvent("NPC_LEAVE_SCENE")
  this:RegisterEvent("DO_SKILL_CAST")
  this:RegisterEvent("DO_SKILL_CHANNEL_PROGRESS")
  this:RegisterEvent("DO_SKILL_PREPARE_PROGRESS")
  this:RegisterEvent("OT_ACTION_PROGRESS_BREAK")
  this:RegisterEvent("SYS_MSG")
  this:RegisterEvent("LOADING_END")
  this:RegisterEvent("PLAYER_TALK")
end

function MacroFunctions.OnFrameBreathe()
  local p=GetClientPlayer()
  local NoiCong=p.GetKungfuMount().dwSkillID

  if not GetClientPlayer() then
    return
  end

  MacroFunctions.UpdateATSCCountByTime()

  if GetLogicFrameCount()-MacroFunctions.TCBStartFrame<1920 then
    MacroFunctions.TCBTimeLeft=(1920-GetLogicFrameCount()+MacroFunctions.TCBStartFrame)/GLOBAL.GAME_FPS
  else
    MacroFunctions.TCBTimeLeft=-1
  end

  if GetLogicFrameCount()-MacroFunctions.ATSCStartFrame<960 then
    MacroFunctions.ATSCTimeLeft=(960-GetLogicFrameCount()+MacroFunctions.ATSCStartFrame)/GLOBAL.GAME_FPS
  else
    MacroFunctions.ATSCTimeLeft=-1
  end

  if p.bFightState==false then MacroFunctions.bThiemChuanKich=false end

  if p.bFightState==false and MacroFunctions.KTCombo.bEnable then
    MacroFunctions.KTCombo.initNum=0
    MacroFunctions.KTCombo.PCNum=0

    MacroFunctions.KTCombo.GiangHaiNgungQuang=false
    MacroFunctions.KTCombo.KhoaiTuyetThoiTinh=false
    MacroFunctions.KTCombo.LuongNghiHoaHinh=false
    MacroFunctions.KTCombo.CuongPhongTieuPhap=false
    MacroFunctions.KTCombo.LucHopConPhap=false
    MacroFunctions.KTCombo.LongNgam=false
    MacroFunctions.KTCombo.ThinhLoi=false
    MacroFunctions.KTCombo.BachTuc=false

    MacroFunctions.KTCombo.MaiHoaCham=false
    MacroFunctions.KTCombo.TrichTinh=false
    MacroFunctions.KTCombo.Bang=false
    MacroFunctions.KTCombo.TamSaiTangKiem=false
    MacroFunctions.KTCombo.TamSaiThuanDuong=false
    MacroFunctions.KTCombo.MeTamCo=false
    MacroFunctions.KTCombo.CuuChuyenQuyNhat=false
    MacroFunctions.KTCombo.ThuongChauThuc=false
    MacroFunctions.KTCombo.CucLacDan=false
    MacroFunctions.KTCombo.QuyetAmChi=false
    MacroFunctions.KTCombo.KiemPhiKinhThien=false
  end

  if GetLogicFrameCount()>MacroFunctions.dwChannelingEndFrame then
    MacroFunctions.dwChannelingSkillID=0
  end

  if (NoiCong==10014 or NoiCong==10224 or NoiCong==10026 or NoiCong==10242 or NoiCong==10144 or NoiCong==10175 or NoiCong==10021 or NoiCong==10081 or NoiCong==10003 or NoiCong==10268) and MacroOptions.autoSwapWeapon1 then
    if MacroOptions.szAuxWeaponName1=="" then
      MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName1,MacroOptions.szThirdWeaponName1,MacroOptions.secondWeaponBuffID1,MacroOptions.secondWeaponBuffLevel1,MacroOptions.secondWeaponBuffStack1,MacroOptions.secondMinWeaponBuffTime1,MacroOptions.secondWeaponType1,1)
    else
      if MacroOptions.szThirdWeaponName1=="" then
        MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName1,MacroOptions.szAuxWeaponName1,MacroOptions.weaponBuffID1,MacroOptions.weaponBuffLevel1,MacroOptions.weaponBuffStack1,MacroOptions.minWeaponBuffTime1,MacroOptions.weaponType1,1)
      else
        if MacroFunctions.CheckBuff(p,MacroOptions.secondWeaponBuffID1,MacroOptions.secondWeaponBuffStack1,MacroOptions.secondMinWeaponBuffTime1,0,MacroOptions.secondWeaponBuffLevel1) then
          MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName1,MacroOptions.szAuxWeaponName1,MacroOptions.weaponBuffID1,MacroOptions.weaponBuffLevel1,MacroOptions.weaponBuffStack1,MacroOptions.minWeaponBuffTime1,MacroOptions.weaponType1,1)
        else
          MacroFunctions.SwapWeapon(MacroOptions.szThirdWeaponName1,MacroOptions.szAuxWeaponName1,MacroOptions.weaponBuffID1,MacroOptions.weaponBuffLevel1,MacroOptions.weaponBuffStack1,MacroOptions.minWeaponBuffTime1,MacroOptions.weaponType1,1)
        end
      end
    end
  elseif (NoiCong==10015 or NoiCong==10225 or NoiCong==10062 or NoiCong==10243 or NoiCong==10145 or NoiCong==10002 or NoiCong==10028 or NoiCong==10080 or NoiCong==10176) and MacroOptions.autoSwapWeapon2 then
    if MacroOptions.szAuxWeaponName2=="" then
      MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName2,MacroOptions.szThirdWeaponName2,MacroOptions.secondWeaponBuffID2,MacroOptions.secondWeaponBuffLevel2,MacroOptions.secondWeaponBuffStack2,MacroOptions.secondMinWeaponBuffTime2,MacroOptions.secondWeaponType2,2)
    else
      if MacroOptions.szThirdWeaponName2=="" then
        MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName2,MacroOptions.szAuxWeaponName2,MacroOptions.weaponBuffID2,MacroOptions.weaponBuffLevel2,MacroOptions.weaponBuffStack2,MacroOptions.minWeaponBuffTime2,MacroOptions.weaponType2,2)
      else
        if MacroFunctions.CheckBuff(p,MacroOptions.secondWeaponBuffID2,MacroOptions.secondWeaponBuffStack2,MacroOptions.secondMinWeaponBuffTime2,0,MacroOptions.secondWeaponBuffLevel2) then
          MacroFunctions.SwapWeapon(MacroOptions.szMainWeaponName2,MacroOptions.szAuxWeaponName2,MacroOptions.weaponBuffID2,MacroOptions.weaponBuffLevel2,MacroOptions.weaponBuffStack2,MacroOptions.minWeaponBuffTime2,MacroOptions.weaponType2,2)
        else
          MacroFunctions.SwapWeapon(MacroOptions.szThirdWeaponName2,MacroOptions.szAuxWeaponName2,MacroOptions.weaponBuffID2,MacroOptions.weaponBuffLevel2,MacroOptions.weaponBuffStack2,MacroOptions.minWeaponBuffTime2,MacroOptions.weaponType2,2)
        end
      end
    end
  end
end

Wnd.OpenWindow("Interface/MacroFunctions/MacroFunctions.ini","MacroFunctions")

function MacroFunctions.OnEvent(szEvent)
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local nTargetType,dwTargetID=p.GetTarget()
  local team=GetClientTeam()

  if szEvent=="LOADING_END" then
    MacroFunctions.bInfoMessage=true
  elseif szEvent=="CHARACTER_THREAT_RANKLIST" then
    if arg0==T.dwID then
      local dwTopHatredValue=0
      local dwSecondHighestHatredValue=0
      local dwMyHatredValue=0
      MacroFunctions.bHatredDependency=true
      if arg2 and arg1[arg2] then
        for z,x in pairs(arg1) do
          if x>arg1[arg2] then
            MacroFunctions.bHatredDependency=false
          end
          if x>dwTopHatredValue then
            dwTopHatredValue=x
          end
        end
        for z,x in pairs(arg1) do
          if x>dwSecondHighestHatredValue and x<dwTopHatredValue and IsPlayer(z) then
            if not MacroFunctions.IsTeamTanker(GetPlayer(z)) and team.IsPlayerInTeam(z) then
              dwSecondHighestHatredValue=x
            end
          end
        end
        if dwTopHatredValue==0 then
          dwTopHatredValue=65535
        end

        dwMyHatredValue = arg1[UI_GetClientPlayerID()] or 0
        MacroFunctions.dwMyHatred=(dwMyHatredValue/dwTopHatredValue)*100
        MacroFunctions.dwSecondHighestHatred=(dwSecondHighestHatredValue/dwTopHatredValue)*100
      else
        MacroFunctions.dwMyHatred=0
        MacroFunctions.dwSecondHighestHatred=0
      end
    end
  elseif szEvent=="NPC_ENTER_SCENE" then
    local npc = GetNpc(arg0)
    if npc then
      if not MacroFunctions.tNpcList[arg0] then
        MacroFunctions.tNpcList[arg0] = true
      end
    end
  elseif szEvent=="NPC_LEAVE_SCENE" then
    local t = MacroFunctions.tNpcList[arg0]
    if t then
      t = nil
    end
  elseif szEvent=="DO_SKILL_CAST" then
    if arg0==UI_GetClientPlayerID() then

      MacroFunctions.UpdateATSCCountBySkill()

      if arg1==6337 or arg1==5258 or arg1==5354 or arg1==5262 or arg1==5266 then
        MacroFunctions.bFrameEnd=true
      end

      --DM, TK, TD, TT, ND, VH, TS, TL, MG
      if arg1~=3121 and arg1~=1795 and arg1~=13 and arg1~=15 and arg1~=2183 and arg1~=12 and arg1~=14 and arg1~=11 and arg1~=4326 then
        MacroFunctions.dwLastSkillIDCasted=arg1
        MacroFunctions.szLastSkillCasted=Table_GetSkillName(arg1,arg2)
        local period=GetTime()-MacroFunctions.dwLastCastTime
        MacroFunctions.dwLastCastTime=GetTime()
        --OutputMessage("MSG_SYS",MacroFunctions.szLastSkillCasted.."-"..MacroFunctions.dwLastSkillIDCasted.."-"..period.."\n")
      end

      if arg1==3111 and MacroFunctions.ATSC==false then
        MacroFunctions.ATSC=true
        if MacroFunctions.ATSCStartFrame==0 then MacroFunctions.ATSCStartFrame=GetLogicFrameCount() end
      elseif arg1==3357 then
        MacroFunctions.ATSC=false
        if MacroFunctions.ATSCStartFrame~=0 then MacroFunctions.ATSCStartFrame=0 end
      elseif arg1==3360 or arg1==2442 then
        MacroFunctions.currentTargetID=dwTargetID
      elseif arg1==3382 or arg1==3109 or arg1==3368 or arg1==3369 or arg1==3112 or arg1==2446 or arg1==2221 or arg1==2222 or arg1==2223 or arg1==2226 then
        MacroFunctions.currentTargetID=0
      elseif arg1==5638 then
        MacroFunctions.bSpendMana=false
      elseif arg1==6942 or arg1==6945 or arg1==6946 or arg1==6947 or arg1==6948 then
        MacroFunctions.bThiemChuanKich=true
      elseif arg1==3110 then
        MacroFunctions.bProtected=true
        MacroFunctions.protectTime=GetTime()+1000
      elseif arg1==2214 or arg1==2215 or arg1==2216 then
        MacroFunctions.RestoreTarget()
      elseif MacroOptions.autoSelfQC and (arg1==357 or arg1==358 or arg1==359 or arg1==360 or arg1==361 or arg1==362 or arg1==363) then
        MacroFunctions.RestoreTarget()
      elseif arg1==371 or arg1==6911 then
        MacroFunctions.RestoreTarget()
      end

      if arg1==3109 then
        MacroFunctions.TCBStartFrame=0
      elseif arg1==3368 or arg1==3369 then
        MacroFunctions.TCBStartFrame=GetLogicFrameCount()
      end

      if (arg1==357 or arg1==358 or arg1==359 or arg1==360 or arg1==361 or arg1==362 or arg1==363) and GetLogicFrameCount()-MacroFunctions.QCStartFrame>384 then
        MacroFunctions.QCStartFrame=GetLogicFrameCount()
      end

      if arg1==301 or arg1==6901 or arg1==2674 or arg1==316 then
        MacroFunctions.TTLH=true
      end
      if arg1==3096 then
        MacroFunctions.tmtReady=false
      end

      if MacroFunctions.KTCombo.bEnable then
        if arg1==553 then
          MacroFunctions.KTCombo.GiangHaiNgungQuang=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==2636 then
          MacroFunctions.KTCombo.KhoaiTuyetThoiTinh=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==301 then
          MacroFunctions.KTCombo.LuongNghiHoaHinh=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==3121 then
          MacroFunctions.KTCombo.CuongPhongTieuPhap=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==11 then
          MacroFunctions.KTCombo.LucHopConPhap=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==403 then
          MacroFunctions.KTCombo.LongNgam=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==1646 then
          MacroFunctions.KTCombo.ThinhLoi=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==2212 then
          MacroFunctions.KTCombo.BachTuc=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==3092 then
          MacroFunctions.KTCombo.MaiHoaCham=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==1940 then
          MacroFunctions.KTCombo.TrichTinh=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==482 then
          MacroFunctions.KTCombo.Bang=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==13 then
          MacroFunctions.KTCombo.TamSaiTangKiem=false
          MacroFunctions.KTCombo.TamSaiThuanDuong=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==2215 then
          MacroFunctions.KTCombo.MeTamCo=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==305 then
          MacroFunctions.KTCombo.CuuChuyenQuyNhat=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==260 then
          MacroFunctions.KTCombo.ThuongChauThuc=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==3971 then
          MacroFunctions.KTCombo.CucLacDan=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==183 then
          MacroFunctions.KTCombo.QuyetAmChi=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==310 then
          MacroFunctions.KTCombo.KiemPhiKinhThien=false
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        elseif arg1==3121 or arg1==1795 or arg1==15 or arg1==2183 or arg1==12 or arg1==14 or arg1==4326 then
          MacroFunctions.SaveTarget()
          SetTarget(TARGET.NO_TARGET,0)
          MacroFunctions.RestoreTarget()
        end
      end

      if arg1~= 3368 and arg1~=3369 and arg1~=3370 and arg1~=3360 and arg1~=3382 and arg1~=2442 and arg1~=2446 and arg1~=2477 then
        MacroFunctions.dwPreparingSkillID=0
      end
    end
  elseif szEvent=="DO_SKILL_CHANNEL_PROGRESS" then
    MacroFunctions.dwChannelingSkillID=arg1
    if arg1==5268 then MacroFunctions.bSpendMana=true end
    MacroFunctions.dwChannelingEndFrame=GetLogicFrameCount()+arg0
  elseif szEvent=="DO_SKILL_PREPARE_PROGRESS" then
    MacroFunctions.dwPreparingSkillID=arg1
  elseif szEvent=="OT_ACTION_PROGRESS_BREAK" then
    if arg0==UI_GetClientPlayerID() and MacroOptions.autoSelfQC then
      MacroFunctions.RestoreTarget()
    end
    if arg0==UI_GetClientPlayerID() and MacroFunctions.dwChannelingSkillID==5268 then
      MacroFunctions.bSpendMana=false
    end
    if arg0==UI_GetClientPlayerID() and (MacroFunctions.dwPreparingSkillID==3095 or MacroFunctions.dwPreparingSkillID==3096) then
      MacroFunctions.tmtReady=false
    end
    if arg0==UI_GetClientPlayerID() then
      MacroFunctions.dwPreparingSkillID=0
      MacroFunctions.dwChannelingSkillID=0
    end
  elseif szEvent=="SYS_MSG" then
    --Trần Hòa Thượng vận công Ném Đá Lăn
    if arg0=="UI_OME_SKILL_CAST_LOG" and not IsPlayer(arg1) then
      if GetNpc(arg1).szName=="Trần Hòa Thượng" and GetNpc(arg1).dwTemplateID==20287 and arg2==4977 then
        MacroFunctions.TTDTTimeLineStart=GetTime()+10500
        MacroFunctions.TTDTTimeLineEnd=GetTime()+30500
        MacroFunctions.CMCDTimeLineStart=GetTime()+25500
        MacroFunctions.CMCDTimeLineEnd=GetTime()+29000
      end
    end
    if arg0=="UI_OME_SKILL_CAST_LOG" and arg1==UI_GetClientPlayerID() then
      if arg2==2707 and p.GetSkillLevel(5852)==0 then
        MacroFunctions.DHCK=MacroFunctions.DHCK+1
        if MacroFunctions.DHCK==4 then MacroFunctions.DHCK=1 end
        MacroFunctions.DHCKTimeLine=GetTime()
      end
      if MacroOptions.autoSelfQC and (arg2==357 or arg2==358 or arg2==359 or arg2==360 or arg2==361 or arg2==362 or arg2==363) then
        MacroFunctions.SaveTarget()
        SetTarget(TARGET.NO_TARGET,0)
      end

      local K=p.nAccumulateValue
      local y=10
      if MacroFunctions.CheckSkillRecipe(6901,1584) and MacroFunctions.CheckSkillRecipe(6901,1585) then
        y=8
      elseif MacroFunctions.CheckSkillRecipe(6901,1584) or MacroFunctions.CheckSkillRecipe(6901,1585) then
        y=9
      end
      if MacroFunctions.GetSkillCD(6901)>MacroFunctions.GetSkillCD(301) or MacroOptions.autoVTBKMode==0 then
        if arg2==367 and K<=3 then MacroFunctions.TTLH=true
        elseif arg2==367 and K>=4 then MacroFunctions.TTLH=false
        end
      elseif MacroFunctions.GetSkillCD(6901)==MacroFunctions.GetSkillCD(301) and MacroOptions.autoVTBKMode==1 and not MacroFunctions.CheckBuff(p,6425,1,2,0) then
        if arg2==367 and K<=y-5 then MacroFunctions.TTLH=true
        elseif arg2==367 and K>=y-4 then MacroFunctions.TTLH=false
        end
      elseif MacroFunctions.GetSkillCD(6901)==MacroFunctions.GetSkillCD(301) and MacroOptions.autoVTBKMode==1 and MacroFunctions.CheckBuff(p,6425,1,2,0) then
        if arg2==367 and K<=3 then MacroFunctions.TTLH=true
        elseif arg2==367 and K>=4 then MacroFunctions.TTLH=false
        end
      elseif MacroFunctions.GetSkillCD(6901)==MacroFunctions.GetSkillCD(301) and MacroOptions.autoVTBKMode==2 then
        if arg2==367 and K<=y-5 then MacroFunctions.TTLH=true
        elseif arg2==367 and K>=y-4 then MacroFunctions.TTLH=false
        end
      end

    end
    if arg0=="UI_OME_SKILL_EFFECT_LOG" and arg1==UI_GetClientPlayerID() and arg4==SKILL_EFFECT_TYPE.SKILL then
      if arg5~=3121 and arg5~=1795 and arg5~=13 and arg5~=15 and arg5~=2183 and arg5~=12 and arg5~=14 and arg5~=11 and arg5~=4326 then
        MacroFunctions.dwLastSkillIDHit=arg5
      end
    end
  elseif szEvent=="PLAYER_TALK" and MacroFunctions.KTCombo.bEnable then
    if arg1==PLAYER_TALK_CHANNEL.NPC_SENCE and arg2==false then
      if arg3=="Kiếm Thánh" then
        local t=p.GetTalkData()
        if #t==1 and t[1].type=="text" and t[1].text=="?" then
          MacroFunctions.KTCombo.initNum=MacroFunctions.KTCombo.initNum+1
          if MacroFunctions.KTCombo.initNum==9 then MacroFunctions.KTCombo.initNum=1 end
          if MacroFunctions.KTCombo.initNum%2==1 and MacroFunctions.KTCombo.DanChieu then
            MacroFunctions.KTCombo.GiangHaiNgungQuang=true
            MacroFunctions.KTCombo.KhoaiTuyetThoiTinh=true
            MacroFunctions.KTCombo.LuongNghiHoaHinh=true
            MacroFunctions.KTCombo.CuongPhongTieuPhap=true
            MacroFunctions.KTCombo.LucHopConPhap=true
            MacroFunctions.KTCombo.LongNgam=true
            MacroFunctions.KTCombo.ThinhLoi=true
            MacroFunctions.KTCombo.BachTuc=true
          elseif MacroFunctions.KTCombo.initNum%2==0 and MacroFunctions.KTCombo.TiepChieu then
            MacroFunctions.KTCombo.GiangHaiNgungQuang=true
            MacroFunctions.KTCombo.KhoaiTuyetThoiTinh=true
            MacroFunctions.KTCombo.LuongNghiHoaHinh=true
            MacroFunctions.KTCombo.CuongPhongTieuPhap=true
            MacroFunctions.KTCombo.LucHopConPhap=true
            MacroFunctions.KTCombo.LongNgam=true
            MacroFunctions.KTCombo.ThinhLoi=true
            MacroFunctions.KTCombo.BachTuc=true
          end
          if MacroFunctions.KTCombo.bDelay then
            if MacroFunctions.KTCombo.PCNum==1 or MacroFunctions.KTCombo.PCNum==2 then
              MacroFunctions.KTCombo.nStartTime=GetLogicFrameCount()
            end
          end
        end
      end
      if arg3=="Phương Càn" then
        local t=p.GetTalkData()
        if #t==1 and t[1].type=="text" and t[1].text=="Đan điền khí nguyên, mai hoa lạc nhãn!" then
          MacroFunctions.KTCombo.MaiHoaCham=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Vân tán phong hoa, cử vọng mai hoa!" then
          MacroFunctions.KTCombo.MaiHoaCham=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Chỉ bút truyền, trích tinh lãm!" then
          MacroFunctions.KTCombo.TrichTinh=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Kiếm thế phá sơn, thương trận băng lam!" then
          MacroFunctions.KTCombo.Bang=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Tiễn vũ liên, thạch băng hoãn!" then
          MacroFunctions.KTCombo.Bang=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Duy ngã độc tôn, thế bỉ sơn băng!" then
          MacroFunctions.KTCombo.Bang=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Xảo hí cuồng long, dĩ khinh ngự trọng!" then
          MacroFunctions.KTCombo.TamSaiTangKiem=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Lung kiếm xuất, bình kiếm phục!" then
          MacroFunctions.KTCombo.TamSaiThuanDuong=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Thiên thượng thần minh, chu kiếm thư viên!" then
          MacroFunctions.KTCombo.TamSaiThuanDuong=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Thiên hạ chư vân, kiếm phi kinh vân!" then
          MacroFunctions.KTCombo.KiemPhiKinhThien=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Đồ lục sinh linh, vạn vật mê tâm!" then
          MacroFunctions.KTCombo.MeTamCo=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Thần đoạn hồng diệt, loan tâm cổ hoặc!" then
          MacroFunctions.KTCombo.MeTamCo=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Cương kình nhu thác, cửu chuyển tương khắc!" then
          MacroFunctions.KTCombo.CuuChuyenQuyNhat=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Kiếm tuyệt thần hi, cửu chuyển quy nhất!" then
          MacroFunctions.KTCombo.CuuChuyenQuyNhat=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Kiếm dẫn thủy vận, tam chuyển tương thừa!" then
          MacroFunctions.KTCombo.CuuChuyenQuyNhat=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Vô đao tuân quỹ, thưởng châu thủ tuệ!" then
          MacroFunctions.KTCombo.ThuongChauThuc=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Long trụy phù hoa, thưởng châu vi sa!" then
          MacroFunctions.KTCombo.ThuongChauThuc=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Phá kiếm thiểm, thưởng châu phản!" then
          MacroFunctions.KTCombo.ThuongChauThuc=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Trảm kỳ ác thế, cực lạc dẫn chỉ!" then
          MacroFunctions.KTCombo.CucLacDan=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Thiết thương đoạn, cực lạc hoàn!" then
          MacroFunctions.KTCombo.CucLacDan=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        elseif #t==1 and t[1].type=="text" and t[1].text=="Lưỡng thủ vô phong, quyết âm kiến không!" then
          MacroFunctions.KTCombo.QuyetAmChi=true
          MacroFunctions.KTCombo.PCNum=MacroFunctions.KTCombo.PCNum+1
          if MacroFunctions.KTCombo.PCNum==5 then MacroFunctions.KTCombo.PCNum=1 end
        end
      end
    end
  end
end

function macro()
  local p=GetClientPlayer()
  local NoiCong=p.GetKungfuMount().dwSkillID
  if NoiCong==10014 then
    MacroFunctions.ThuanDuongTHC()
  elseif NoiCong==10015 then
    MacroFunctions.ThuanDuongTHKY()
  elseif NoiCong==10224 then
    MacroFunctions.DuongMonKVQ()
  elseif NoiCong==10225 then
    MacroFunctions.DuongMonTLND()
  elseif NoiCong==10026 then
    MacroFunctions.ThienSachNHCY()
  elseif NoiCong==10062 then
    MacroFunctions.ThienSachTLL()
  elseif NoiCong==10242 and not MacroOptions.sunModePATQ and not MacroOptions.moonModePATQ then
    MacroFunctions.MinhGiaoPATQ()
  elseif NoiCong==10242 and MacroOptions.sunModePATQ and not MacroOptions.moonModePATQ then
    MacroFunctions.MinhGiaoPATQ(1)
  elseif NoiCong==10242 and not MacroOptions.sunModePATQ and MacroOptions.moonModePATQ then
    MacroFunctions.MinhGiaoPATQ(2)
  elseif NoiCong==10243 and MacroOptions.sunModeMTLLT and not MacroOptions.moonModeMTLLT then
    MacroFunctions.MinhGiaoMTLLT(1)
  elseif NoiCong==10243 and not MacroOptions.sunModeMTLLT and MacroOptions.moonModeMTLLT then
    MacroFunctions.MinhGiaoMTLLT(2)
  elseif NoiCong==10144 or NoiCong==10145 then
    MacroFunctions.TangKiem()
  elseif NoiCong==10175 then
    MacroFunctions.NguDocDK()
  elseif NoiCong==10021 then
    MacroFunctions.VanHoaHGD()
  elseif NoiCong==10081 then
    MacroFunctions.ThatTuBTQ()
  elseif NoiCong==10003 then
    MacroFunctions.ThieuLamDCK()
  elseif NoiCong==10002 then
    MacroFunctions.ThieuLamTTK()
  elseif NoiCong==10268 then
    MacroFunctions.CaiBangTTQ()
  end
end

function MacroFunctions.IsSkillCD(id)
  local p=GetClientPlayer()
  local bCool,nLeft,nTotal=p.GetSkillCDProgress(id,p.GetSkillLevel(id))
  return nTotal/GLOBAL.GAME_FPS==0
end

function MacroFunctions.GetSkillCD(id)
  local p=GetClientPlayer()
  local bCool,nLeft,nTotal=p.GetSkillCDProgress(id,p.GetSkillLevel(id))
  return nLeft/GLOBAL.GAME_FPS
end

function MacroFunctions.IsNotOT()
  local p=GetClientPlayer()
  return p.GetOTActionState()==0
end

function MacroFunctions.IsNotSP()
  local p=GetClientPlayer()
  local bOnPrepareState,preparingSkillID,preparingSkillLevel,currentPrepareRatio=p.GetSkillPrepareState()
  return bOnPrepareState==false
end

function MacroFunctions.SaveTarget()
  local p=GetClientPlayer()
  local nTargetType,dwTargetID=p.GetTarget()
  if nTargetType==TARGET.NPC and dwTargetID~=0 then MacroFunctions.ReTarget={nTargetType,dwTargetID} end
end

function MacroFunctions.RestoreTarget()
  if MacroFunctions.ReTarget then
    local dwType,dwID = MacroFunctions.ReTarget[1],MacroFunctions.ReTarget[2]
    if dwType and dwID then SetTarget(dwType, dwID) end
    MacroFunctions.ReTarget = nil
  end
end

function MacroFunctions.use(SkillIDs,arg,nTime)
  local p=GetClientPlayer()
  T=GetTargetHandle(p.GetTarget())
  local t=1000
  if nTime then t=nTime end
  if MacroOptions.bLatencyCompensation and t<=1000 then t=0 end
  local channelingWaste = 0
  if MacroFunctions.dwChannelingEndFrame > GetLogicFrameCount() then
    channelingWaste = (MacroFunctions.dwChannelingEndFrame-GetLogicFrameCount())/GLOBAL.GAME_FPS
  end
  if arg==0 then
    for z,x in pairs(SkillIDs) do
      if ((MacroFunctions.IsSkillCD(x) and (GetTime()-MacroFunctions.interruptTimeLine)>=t) or (MacroOptions.bLatencyCompensation and MacroFunctions.GetSkillCD(x)<(GetPingValue()/1000) and MacroFunctions.GetSkillCD(x)>0)) and p.GetSkillLevel(x)~=0 and MacroFunctions.bProtected==false then
        if MacroFunctions.IsSkillCD(x) then MacroFunctions.interruptTimeLine=GetTime() end
        OnAddOnUseSkill(x,p.GetSkillLevel(x))
        return true
      end
    end
  elseif arg==1 then
    for z,x in pairs(SkillIDs) do
      if ((MacroFunctions.IsSkillCD(x) and (GetTime()-MacroFunctions.firstTimeLine)>=t) or (MacroOptions.bLatencyCompensation and MacroFunctions.GetSkillCD(x)<(GetPingValue()/1000) and MacroFunctions.GetSkillCD(x)>0)) and p.GetSkillLevel(x)~=0 and (p.GetOTActionState()==0 or (channelingWaste<(GetPingValue()/2000) and MacroOptions.bChannelingLatencyCompensation and MacroFunctions.dwChannelingSkillID~=3398)) and MacroFunctions.bProtected==false then
        if MacroFunctions.IsSkillCD(x) then MacroFunctions.firstTimeLine=GetTime() end
        OnAddOnUseSkill(x,p.GetSkillLevel(x))
        return true
      end
    end
  elseif arg==2 then
    for z,x in pairs(SkillIDs) do
      if ((MacroFunctions.IsSkillCD(x) and (GetTime()-MacroFunctions.secondTimeLine)>=t) or (MacroOptions.bLatencyCompensation and MacroFunctions.GetSkillCD(x)<(GetPingValue()/1000) and MacroFunctions.GetSkillCD(x)>0)) and (p.GetSkillLevel(x)~=0 or x==9007) and (p.GetOTActionState()==0 or (channelingWaste<(GetPingValue()/2000) and MacroOptions.bChannelingLatencyCompensation and MacroFunctions.dwChannelingSkillID~=3398)) and MacroFunctions.bProtected==false then
        if MacroFunctions.IsSkillCD(x) then MacroFunctions.secondTimeLine=GetTime() end
        if x==9007 then
          OnAddOnUseSkill(x,1)
        else
          OnAddOnUseSkill(x,p.GetSkillLevel(x))
        end
        if MacroFunctions.IsSkillCD(x) and MacroFunctions.IsNotSP() then
          for a,b in pairs(MacroFunctions.channelingSkills) do
            if b==x then
              MacroFunctions.bProtected=true
              MacroFunctions.protectTime=GetTime()
            end
          end
        end
        -- if MacroOptions.autoTrieuThanhNgon and p.GetSkillLevel(3985)>0 and MacroFunctions.GetSkillCD(3985)<=1 then
        --   local distance=MacroFunctions.GetDistance(GetTargetHandle(p.GetTarget()))
        --   if (x==3960 or x==3967 or x==3982 or x==3961 or x==3980 or x==3962 or x==3963 or x==3959 or x==3966 or x==3981) and MacroFunctions.CanUseSkill(x) and T~=nil and distance<4 and MacroFunctions.GetFaceDirection(T)>-1.2 and MacroFunctions.GetFaceDirection(T)<1.2 and MacroFunctions.CheckMoveState(p,"stand|float|entrap") then
        --     MacroFunctions.bFrameEnd=false
        --     if MacroFunctions.bFrameEnd==false then
        --       OnAddOnUseSkill(3985,p.GetSkillLevel(3985))
        --       MacroFunctions.bProtected=true
        --       MacroFunctions.protectTime=GetTime()
        --       MacroFunctions.bFrameEnd=true
        --     end
        --   end
        -- end
        return true
      end
    end
  elseif arg==3 then
    for z,x in pairs(SkillIDs) do
      if ((MacroFunctions.IsSkillCD(x) and (GetTime()-MacroFunctions.thirdTimeLine)>=t) or (MacroOptions.bLatencyCompensation and MacroFunctions.GetSkillCD(x)<(GetPingValue()/1000) and MacroFunctions.GetSkillCD(x)>0)) and p.GetSkillLevel(x)~=0 and (p.GetOTActionState()==0 or (channelingWaste<(GetPingValue()/2000) and MacroOptions.bChannelingLatencyCompensation and MacroFunctions.dwChannelingSkillID~=3398)) and MacroFunctions.bProtected==false then
        if MacroFunctions.IsSkillCD(x) then MacroFunctions.thirdTimeLine=GetTime() end
        OnAddOnUseSkill(x,p.GetSkillLevel(x))
        return true
      end
    end
  elseif arg==4 then
    for z,x in pairs(SkillIDs) do
      if ((MacroFunctions.IsSkillCD(x) and (GetTime()-MacroFunctions.fourthTimeLine)>=t) or (MacroOptions.bLatencyCompensation and MacroFunctions.GetSkillCD(x)<(GetPingValue()/1000) and MacroFunctions.GetSkillCD(x)>0)) and p.GetSkillLevel(x)~=0 and (p.GetOTActionState()==0 or (channelingWaste<(GetPingValue()/2000) and MacroOptions.bChannelingLatencyCompensation and MacroFunctions.dwChannelingSkillID~=3398)) and MacroFunctions.bProtected==false then
        if MacroFunctions.IsSkillCD(x) then MacroFunctions.fourthTimeLine=GetTime() end
        OnAddOnUseSkill(x,p.GetSkillLevel(x))
        if x==2211 and t==16000 and MacroFunctions.rebuffXaAnh then
          MacroFunctions.rebuffXaAnh=false
        end
        return true
      end
    end
  elseif arg==5 then
    for z,x in pairs(SkillIDs) do
      if MacroFunctions.CanUsePetSkill(x,1) and (GetTime()-MacroFunctions.fifthTimeLine)>=t then
        OnAddOnUseSkill(x,1)
        MacroFunctions.fifthTimeLine=GetTime()
        return true
      end
    end
  elseif arg==6 then
    for z,x in pairs(SkillIDs) do
      if MacroFunctions.CanUseSkill(x) and p.GetSkillLevel(x)~=0 and (p.GetOTActionState()==0 or (channelingWaste<(GetPingValue()/2000) and MacroOptions.bChannelingLatencyCompensation and MacroFunctions.dwChannelingSkillID~=3398)) and MacroFunctions.bProtected==false and (GetTime()-MacroFunctions.sixthTimeLine)>=t then
        OnAddOnUseSkill(x,p.GetSkillLevel(x))
        MacroFunctions.sixthTimeLine=GetTime()
        --Tích 3 tầng 6381
        -- if (MacroOptions.attackMode==1 or MacroOptions.attackMode==3) and (x==6337 or x==5258 or x==5354 or x==5262 or x==5266) then
        --   MacroFunctions.bFrameEnd=false
        --   if MacroFunctions.bFrameEnd==false then OnAddOnUseSkill(5638,p.GetSkillLevel(5638)) end
        -- end
        return true
      end
    end
  end
end

function MacroFunctions.CanUseSkill(dwSkillID)
  local p, box = GetClientPlayer(), MacroFunctions.hBox
  if p and box then
    local dwLevel = 1
    if dwSkillID ~= 9007 then
      dwLevel = p.GetSkillLevel(dwSkillID)
    end
    if dwLevel > 0 then
      box:EnableObject(false)
      box:SetObjectCoolDown(1)
      box:SetObject(UI_OBJECT_SKILL, dwSkillID, dwLevel)
      UpdataSkillCDProgress(p, box)
      return box:IsObjectEnable() and not box:IsObjectCoolDown()
    end
  end
  return false
end

function MacroFunctions.CanUsePetSkill(dwSkillID,dwLevel)
  local p, box = GetClientPlayer(), MacroFunctions.hBox
  if p and box then
    box:EnableObject(false)
    box:SetObjectCoolDown(1)
    box:SetObject(UI_OBJECT_SKILL, dwSkillID, dwLevel)
    UpdataSkillCDProgress(p, box)
    return box:IsObjectEnable() and not box:IsObjectCoolDown()
  end
  return false
end

function MacroFunctions.UseEquippedItem(itemType)
  local p=GetClientPlayer()
  local item=p.GetItem(INVENTORY_INDEX.EQUIP,itemType)
  local bCool,nLeft,nTotal,bBroken=p.GetItemCDProgress(item.dwID)
  if nLeft==0 and not bBroken and p.GetOTActionState()==0 and MacroFunctions.IsNotSP() and MacroFunctions.bProtected==false then OnUseItem(INVENTORY_INDEX.EQUIP,itemType) end
end

function MacroFunctions.SwapWeapon(szMainWeaponName,szAuxWeaponName,buffID,buffLevel,maxBuffStack,minBuffTime,arg1,arg2)
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local bMainWeaponFound=false
  local bAuxWeaponFound=false

  local NoiCong=p.GetKungfuMount().dwSkillID
  local equipType=EQUIPMENT_INVENTORY.MELEE_WEAPON
  if NoiCong==10145 then equipType=EQUIPMENT_INVENTORY.BIG_SWORD end

  local currentWeapon=p.GetItem(INVENTORY_INDEX.EQUIP,equipType)
  if currentWeapon and currentWeapon.szName==szMainWeaponName then
    MacroFunctions.MWi=INVENTORY_INDEX.EQUIP
    MacroFunctions.MWj=equipType
  elseif currentWeapon and currentWeapon.szName==szAuxWeaponName then
    MacroFunctions.AWi=INVENTORY_INDEX.EQUIP
    MacroFunctions.AWj=equipType
  end

  local mainWeapon=p.GetItem(MacroFunctions.MWi,MacroFunctions.MWj)
  local auxWeapon=p.GetItem(MacroFunctions.AWi,MacroFunctions.AWj)

  if mainWeapon and mainWeapon.szName==szMainWeaponName then
    bMainWeaponFound=true
  end
  if auxWeapon and auxWeapon.szName==szAuxWeaponName then
    bAuxWeaponFound=true
  end
  if bMainWeaponFound==false or bAuxWeaponFound==false then
    for i=1,5 do
      local nSize = p.GetBoxSize(i) or 0
      for j = 0, nSize - 1 do
        local item=p.GetItem(i,j)
        if item and item.szName==szMainWeaponName then
          MacroFunctions.MWi=i
          MacroFunctions.MWj=j
          bMainWeaponFound=true
        end
        if item and item.szName==szAuxWeaponName then
          MacroFunctions.AWi=i
          MacroFunctions.AWj=j
          bAuxWeaponFound=true
        end
      end
    end
  end

  if currentWeapon==nil and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
    OnExchangeItem(MacroFunctions.AWi,MacroFunctions.AWj,0,0)
    MacroFunctions.AWi=0
    MacroFunctions.AWj=0
    MacroFunctions.exchangeTimeLine=GetTime()
  end
  if currentWeapon.szName~=szMainWeaponName and currentWeapon.szName~=szAuxWeaponName and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
    OnExchangeItem(MacroFunctions.MWi,MacroFunctions.MWj,0,0)
    MacroFunctions.MWi=0
    MacroFunctions.MWj=0
    MacroFunctions.exchangeTimeLine=GetTime()
  end
  if bMainWeaponFound and bAuxWeaponFound then
    if arg1==1 then
      if currentWeapon.szName~=szAuxWeaponName then
        if not MacroFunctions.CheckBuff(p,buffID,maxBuffStack,minBuffTime,0,buffLevel) and not MacroFunctions.CheckBuff(T,buffID,maxBuffStack,minBuffTime,0,buffLevel) and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
          if currentWeapon.szName==szMainWeaponName then
            OnExchangeItem(MacroFunctions.AWi,MacroFunctions.AWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.MWi=MacroFunctions.AWi
            MacroFunctions.MWj=MacroFunctions.AWj
            MacroFunctions.AWi=0
            MacroFunctions.AWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          else
            OnExchangeItem(MacroFunctions.AWi,MacroFunctions.AWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.AWi=0
            MacroFunctions.AWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          end
        end
      end
      if currentWeapon.szName==szAuxWeaponName then
        if (MacroFunctions.CheckBuff(p,buffID,maxBuffStack,minBuffTime,0,buffLevel) or MacroFunctions.CheckBuff(T,buffID,maxBuffStack,minBuffTime,0,buffLevel)) and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
          if currentWeapon.szName==szAuxWeaponName then
            OnExchangeItem(MacroFunctions.MWi,MacroFunctions.MWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.AWi=MacroFunctions.MWi
            MacroFunctions.AWj=MacroFunctions.MWj
            MacroFunctions.MWi=0
            MacroFunctions.MWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          else
            OnExchangeItem(MacroFunctions.MWi,MacroFunctions.MWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.MWi=0
            MacroFunctions.MWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          end
        end
      end
    elseif arg1==2 then
      if currentWeapon.szName~=szAuxWeaponName then
        if not MacroFunctions.CheckBuff(p,buffID,maxBuffStack,minBuffTime,0,buffLevel) and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
          if currentWeapon.szName==szMainWeaponName then
            OnExchangeItem(MacroFunctions.AWi,MacroFunctions.AWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.MWi=MacroFunctions.AWi
            MacroFunctions.MWj=MacroFunctions.AWj
            MacroFunctions.AWi=0
            MacroFunctions.AWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          else
            OnExchangeItem(MacroFunctions.AWi,MacroFunctions.AWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.AWi=0
            MacroFunctions.AWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          end
        end
      end
      if currentWeapon.szName==szAuxWeaponName then
        if MacroFunctions.CheckBuff(p,buffID,maxBuffStack,minBuffTime,0,buffLevel) and (GetTime()-MacroFunctions.exchangeTimeLine>=500) then
          if currentWeapon.szName==szAuxWeaponName then
            OnExchangeItem(MacroFunctions.MWi,MacroFunctions.MWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.AWi=MacroFunctions.MWi
            MacroFunctions.AWj=MacroFunctions.MWj
            MacroFunctions.MWi=0
            MacroFunctions.MWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          else
            OnExchangeItem(MacroFunctions.MWi,MacroFunctions.MWj,INVENTORY_INDEX.EQUIP,equipType)
            MacroFunctions.MWi=0
            MacroFunctions.MWj=0
            MacroFunctions.exchangeTimeLine=GetTime()
          end
        end
      end
    end
  else
    if arg2==1 then
      MacroOptions.autoSwapWeapon1=false
    elseif arg2==2 then
      MacroOptions.autoSwapWeapon2=false
    end
    OutputMessage("MSG_SYS","Không tìm thấy vũ khí đã thiết lập trong hành trang, tắt tính năng tự đổi vũ khí\n")
  end
end

function MacroFunctions.CheckBuff(target,buffID,stackNum,timeLeft,arg,buffLevel)
  local p=GetClientPlayer()
  local r=false
  local s=0
  local t=0
  local l=0
  local isPrivate=false

  if not stackNum and not timeLeft and not arg and not buffLevel then
    for i = 1,target.GetBuffCount() do
      local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = target.GetBuff(i-1)
      if dwID==buffID then
        return true
      end
    end
    return false
  end

  for z,x in pairs(MacroFunctions.privateBuffs) do
    if buffID==x then
      isPrivate=true
    end
  end
  if isPrivate then
    for i = 1,target.GetBuffCount() do
      local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = target.GetBuff(i-1)
      if dwID==buffID and dwSkillSrcID==p.dwID then
        r=true
        s=nStackNum
        t=(nEndFrame-GetLogicFrameCount())/GLOBAL.GAME_FPS
        l=nLevel
      end
    end
  else
    for i = 1,target.GetBuffCount() do
      local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = target.GetBuff(i-1)
      if dwID==buffID then
        r=true
        s=nStackNum
        t=(nEndFrame-GetLogicFrameCount())/GLOBAL.GAME_FPS
        l=nLevel
      end
    end
  end
  if arg==0 then
    if not buffLevel then
      if r==true and s>=stackNum and t>=timeLeft then
        return true
      else
        return false
      end
    else
      if r==true and l==buffLevel and s>=stackNum and t>=timeLeft then
        return true
      else
        return false
      end
    end
  elseif arg==1 then
    if not buffLevel then
      if timeLeft>0 then
        if r==true and s>=stackNum and t<=timeLeft then
          return false
        else
          return true
        end
      else
        return r
      end
    else
      if timeLeft>0 then
        if r==true and l==buffLevel and s>=stackNum and t<=timeLeft then
          return false
        else
          return true
        end
      else
        return r
      end
    end
  end
end

function MacroFunctions.CheckSkillRecipe(skillID,recipeID)
  local p=GetClientPlayer()
  local result=false
  local recipeList=p.GetSkillRecipeList(skillID,p.GetSkillLevel(skillID))
  for z,x in pairs(recipeList or {}) do
    if x.recipe_id==recipeID and x.active==true then
      result=true
    end
  end
  return result
end

function MacroFunctions.SkillInterrupt(target,targetSkillIDs,activeSkillID)
  local p=GetClientPlayer()
  local bOnPrepareState,preparingSkillID,preparingSkillLevel,currentPrepareRatio=target.GetSkillPrepareState()
  if bOnPrepareState then
    if MacroOptions.autoShout then
      if (GetTime()-MacroFunctions.shoutTimeLine>=5000) then
        if p.IsInParty() then
          p.Talk(PLAYER_TALK_CHANNEL.RAID,"",{{type="text",text="BOSS đang vận công \""..Table_GetSkillName(preparingSkillID).."\", ID là "..preparingSkillID}})
          MacroFunctions.shoutTimeLine=GetTime()
        else
          p.Talk(PLAYER_TALK_CHANNEL.NEARBY,"",{{type="text",text="BOSS đang vận công \""..Table_GetSkillName(preparingSkillID).."\", ID là "..preparingSkillID}})
          MacroFunctions.shoutTimeLine=GetTime()
        end
      end
    end
    for z,x in pairs(targetSkillIDs) do
      --Kiểm tra buff Dịch Cân Kinh-Tàn Thiên (ID 4687) trước khi ngắt vận công
      if preparingSkillID==x and p.GetSkillLevel(activeSkillID)~=0 and MacroFunctions.IsSkillCD(activeSkillID) and not MacroFunctions.CheckBuff(target,4687,1,0,0) then
        if activeSkillID==1577 and MacroFunctions.IsNotOT() and MacroFunctions.IsSkillCD(1656) and (MacroFunctions.GetSkillCD(9004)<1.5 or MacroFunctions.GetDistance(target)>=5) then
          p.StopCurrentAction()
          if p.GetKungfuMount().dwSkillID==10145 then MacroFunctions.use({1656},3) end
          if MacroFunctions.GetDistance(target)<5 then MacroFunctions.use({9004},2,0) end
          MacroFunctions.use({activeSkillID},0)
        end
        if not MacroFunctions.IsNotOT() then
          if MacroFunctions.dwChannelingSkillID~=3100 and MacroFunctions.dwChannelingSkillID~=3398 and MacroFunctions.dwChannelingSkillID~=1645 then
            p.StopCurrentAction()
            MacroFunctions.use({activeSkillID},0)
          end
        else
          p.StopCurrentAction()
          MacroFunctions.use({activeSkillID},0)
        end
      end
    end
  end
end

function MacroFunctions.ClearBuff(target,targetBuffIDs,activeSkillID)
  local p=GetClientPlayer()
  for i = 1,target.GetBuffCount() do
    local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = target.GetBuff(i-1)
    for a,b in pairs(targetBuffIDs or {}) do
      if dwID==b and p.GetSkillLevel(activeSkillID)~=0 and MacroFunctions.IsSkillCD(activeSkillID) then
        p.StopCurrentAction()
        MacroFunctions.use({activeSkillID},0)
      end
    end
  end
end

function MacroFunctions.StopAction()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local TargetHP=T.nCurrentLife*100/T.nMaxLife
  local szMapName=Table_GetMapName(p.GetMapID())
  local distance=MacroFunctions.GetDistance(T)
  local NoiCong=p.GetKungfuMount().dwSkillID
  local bOnPrepareState,preparingSkillID,preparingSkillLevel,currentPrepareRatio=T.GetSkillPrepareState()
  if MacroOptions.autoStopAction then
    --Chí Mạng Cách Đáng
    if MacroFunctions.CMCDTimeLineStart~=0 and MacroFunctions.CMCDTimeLineEnd~=0 and GetTime()>MacroFunctions.CMCDTimeLineStart and GetTime()<MacroFunctions.CMCDTimeLineEnd then
      return 2
    elseif GetNpc(T.dwID).szName=="Trần Hòa Thượng" and GetNpc(T.dwID).dwTemplateID==20287 and bOnPrepareState and preparingSkillID==4980 then
      return 2
    --Tinh Đẩu Kiếm Pháp - buff Kích Nộ
    elseif GetNpc(T.dwID).szName=="Lý Đàm" and GetNpc(T.dwID).dwTemplateID==21595 and bOnPrepareState and preparingSkillID==5131 then
      return 2
    elseif GetNpc(T.dwID).szName=="Lý Đàm" and GetNpc(T.dwID).dwTemplateID==21595 and MacroFunctions.CheckBuff(T,4344,1,0,0) then
      return 2
    --Buff Ẩn Độn, buff Đồng Tường Thiết Bích
    elseif MacroFunctions.CheckBuff(T,1036,1,0,0) or MacroFunctions.CheckBuff(T,3374,1,0,0) then
      return 2
    --Buff Li Hình Chi Thể (Liễu Công Tử)
    elseif GetNpc(T.dwID).szName=="Liễu Công Tử" and MacroFunctions.CheckBuff(T,4515,1,0,0) then
      if NoiCong==10014 or NoiCong==10225 or NoiCong==10242 or NoiCong==10175 or NoiCong==10021 or NoiCong==10081 or NoiCong==10003 then
        return 2
      else
        return 0
      end
    elseif GetNpc(T.dwID).szName=="Vô Danh" and MacroFunctions.CheckBuff(T,5709,1,0,0) then
      return 2
    elseif GetNpc(T.dwID).szName=="An Lộc Sơn" and TargetHP>60 and (szMapName=="Đại Minh Cung" or szMapName=="Đại Minh Cung Anh Hùng") then
      return 1
    elseif GetNpc(T.dwID).szName=="Đạm Đài Khô Hỏa" and distance<8 and (szMapName=="Kho Quân Giới Chiến Bảo" or szMapName=="Kho Quân Giới Chiến Bảo Anh Hùng") then
      return 1
    elseif GetNpc(T.dwID).szName=="Trác Lực Các Đồ" and preparingSkillID==5459 and currentPrepareRatio>0.7 then
      return 3
    else
      return 0
    end
  else return 0
  end
end

function MacroFunctions.GetDistance(target)
  local p=GetClientPlayer()
  return GetCharacterDistance(p.dwID,target.dwID)/64
end

function MacroFunctions.GetMyHatred(target)
  ApplyCharacterThreatRankList(target.dwID)
  return MacroFunctions.dwMyHatred
end

function MacroFunctions.GetSecondHighestHatred(target)
  ApplyCharacterThreatRankList(target.dwID)
  return MacroFunctions.dwSecondHighestHatred
end

function MacroFunctions.GetTCBDistance()
  local p=GetClientPlayer()
  local tcbFrame=Station.Lookup("Normal/PuppetActionBar")
  local dist=65535
  if tcbFrame then
    if tcbFrame.dwNpcTemplateID==16175 or tcbFrame.dwNpcTemplateID==16176 then
      for z,x in pairs(MacroFunctions.tNpcList) do
        local npc=GetNpc(z)
        if npc and npc.dwTemplateID==tcbFrame.dwNpcTemplateID and npc.dwEmployer==p.dwID then
          dist=GetCharacterDistance(p.dwID,npc.dwID)/64
        end
      end
      return dist
    else
      return 65535
    end
  else
    return 65535
  end
end

function MacroFunctions.GetTCBTargetDistance()
  local p=GetClientPlayer()
  local T=GetTargetHandle(p.GetTarget())
  local tcbFrame=Station.Lookup("Normal/PuppetActionBar")
  local dist=65535
  if tcbFrame and T~=nil then
    if tcbFrame.dwNpcTemplateID==16175 or tcbFrame.dwNpcTemplateID==16176 then
      for z,x in pairs(MacroFunctions.tNpcList) do
        local npc=GetNpc(z)
        if npc and npc.dwTemplateID==tcbFrame.dwNpcTemplateID and npc.dwEmployer==p.dwID then
          dist=GetCharacterDistance(T.dwID,npc.dwID)/64
        end
      end
      return dist
    else
      return 65535
    end
  else
    return 65535
  end
end

function MacroFunctions.GetATSCNum()
  return #MacroFunctions.ATSCArray
  -- local p=GetClientPlayer()
  -- local result=0
  -- for z,x in pairs(MacroFunctions.tNpcList) do
  --   local npc=GetNpc(z)
  --   if npc and npc.dwTemplateID==16000 and npc.dwEmployer==p.dwID and MacroFunctions.GetDistance(npc)<30 then
  --     result=result+1
  --   end
  -- end
  -- return result
end

function MacroFunctions.GetTCBStatus()
  local p=GetClientPlayer()
  local statusCode=-1
  local tcbFrame=Station.Lookup("Normal/PuppetActionBar")
  if tcbFrame then
    if tcbFrame.dwNpcTemplateID==16174 then
    statusCode=0
    elseif tcbFrame.dwNpcTemplateID==16175 then
    statusCode=1
    elseif tcbFrame.dwNpcTemplateID==16176 then
    statusCode=2
    end
  end
  return statusCode
end

function MacroFunctions.IsTeamTanker(target)
  local p=GetClientPlayer()
  local team=GetClientTeam()
  if target and IsPlayer(target.dwID) and team.IsPlayerInTeam(target.dwID) and (target.GetKungfuMount().dwSkillID==10002 or target.GetKungfuMount().dwSkillID==10243 or target.GetKungfuMount().dwSkillID==10062) then
    return true
  else
    return false
  end
end

function MacroFunctions.IsFormationLeader()
  local p=GetClientPlayer()
  local team=GetClientTeam()
  local result=false
  if p.IsInParty() then
    for nGroup = 0, team.nGroupNum - 1 do
      local tGroupInfo = team.GetGroupInfo(nGroup)
      if p.dwID==tGroupInfo.dwFormationLeader then
        result=true
      end
    end
  end
  return result
end

function MacroFunctions.CheckMoveState(target, szStateString)
  if not target then return false end
  local tState = SplitString(szStateString, "|")
  for _, szState in ipairs(tState) do
    if target.nMoveState==MacroFunctions.tMoveStateList[szState] then
      return true
    end
  end
  return false
end

function MacroFunctions.GetFaceDirection(target)
  local p = GetClientPlayer()
  local distance = MacroFunctions.GetDistance(target)
  local dwRad1 = math.atan((target.nY - p.nY) / (target.nX - p.nX))
  if dwRad1 < 0 then
    dwRad1 = dwRad1 + math.pi
    end
  if target.nY < p.nY then
    dwRad1 = math.pi + dwRad1
  end
  local dwRad2 = p.nFaceDirection / 128 * math.pi
  local faceDir = dwRad2 - dwRad1
  return faceDir
end

function MacroFunctions.CheckFaceDirection(target)
  if MacroFunctions.GetFaceDirection(target)<0.2 and MacroFunctions.GetFaceDirection(target)>(-0.2) then
    return true
  else
    return false
  end
end

function MacroFunctions.UpdateATSCCountBySkill()
  if arg0 ~= GetClientPlayer().dwID then
    return
  end

  if Table_GetSkillName(arg1,arg2) == "Ám Tàng Sát Cơ" then
      local count = #MacroFunctions.ATSCArray
    if count < 3 then
        table.insert(MacroFunctions.ATSCArray,GetTickCount())
    elseif count == 3 then
        table.remove(MacroFunctions.ATSCArray,1)
        table.insert(MacroFunctions.ATSCArray,Up())
    end


  elseif Table_GetSkillName(arg1,arg2) == "Đồ Cùng Chủy Kiến" then
    MacroFunctions.ATSCArray = {}
  end
end

function MacroFunctions.UpdateATSCCountByTime()
  local count = #MacroFunctions.ATSCArray

  if count > 0 then
    if GetTickCount() - MacroFunctions.ATSCArray[1] >=59.8*1000 then
        table.remove(MacroFunctions.ATSCArray,1)
    end
  end
end