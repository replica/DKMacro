BossFaceAlert =  {
	szVersion = "pb:HCTS by [PhátXuân]",
	Debug = false,
	tScrutinyInfo = {},
	tCache = {
		Line = {},
		Circle = {},
		Border = {},
		DrawingBoard = {},
	},
	tCustomFuncList = {},
	
	tScrutinyList = {},
	tScrutinyList2 = {},
	szLastTargetName = {},
	nTargetNameLableShowTime = {},
	
	Setting = {
	-- 头顶那个方块
		dwTopFontSchemeID = 21, -- 头顶字体ID
		fTopScale = 1.5, -- 头顶文字的缩放
		sTopStr = "★",
		tTopDelta = {0,0,0,0,-25},
	-- TEXT
		dwFontSchemeID = 16, -- 文字字体ID
		fScale = 1, -- 文字的缩放
		fTopDelta = 50, --场景坐标高度的调整值，
	-- col
		tTarSelf = {255, 255, 255}, -- Target 白色 自己
		tTarOther = {255, 255, 0}, -- Target 黄的好像 别人
		sTarSelf = {255,0,128}, -- 监视目标自己 给粉色的
		sTarOther = {255,250,50}, --监视目标 不是自己 给黄色的
		cOther = {255, 255, 0}, -- 其他东西
	}
}
-- for k, _ in pairs(BossFaceAlert.Setting) do
	-- RegisterCustomData("BossFaceAlert.Setting." .. k)
-- end
BossfaceAlertUpdateAlertName = {}


AppendCommand("RGdebug", function()
	BossFaceAlert.bDevelopper = not BossFaceAlert.bDevelopper
	BossFaceAlert.Debug = BossFaceAlert.bDevelopper
	if BossFaceAlert.bDevelopper then
		BossFaceAlert:Message("enable debug mode")
	else
		BossFaceAlert:Message("disable debug mode")
	end
end)

-------------------------------------------------------------------------------------------
-- 下面是追加的自定义显示规则模块
-------------------------------------------------------------------------------------------


-------------------------------------------------------------------------------------------
--npc目标获得buff或者debuff的时候生成一个特定的倒计时条
-------------------------------------------------------------------------------------------
BossFaceAlert.bStartNPCBuffTimerEnable = false;   --RegisterCustomData("BossFaceAlert.bStartNPCBuffTimerEnable")

BossFaceAlert.tStartNPCBuffTimerInfoList = {
-- 单位都是秒
	[1] = {
		["szStartNPCBuffTimerNPCName"] = "999998", -- NPC名字或者模板ID
		["szStartNPCBuffTimerBuffName"] = "梅隐香", -- BUFF/DEBUFF名称
		["szStartNPCBuffTimerName"] = "测试一下", --倒计时条名称 可以不写
		["bAddToBuffTimer"] = true,--是否生成倒计时条
		["bCurrentBuffTime"] = false,--生成的倒计时为当前的Buff时间 + nStartNPCBuffTime
		["nStartNPCBuffTime"] = 10,--倒计时条时间 可正可负 默认0就是BUFF持续时间 当然需要 bCurrentBuffTime 为 true
		["nMinStartNPCBuffTime"] = 3,--Buff结束后多久才会生成第二次倒计时 可正可负..
		["nNPCBuffTimerEnd"] = 0,--此项无需修改
		["bAddToRaidGridEvent"] = true,--是否触发团队事件监控
	},
	--[[
	[2] = {
		["szStartNPCBuffTimerNPCName"] = "19957", -- NPC名字或者模板ID
		["szStartNPCBuffTimerBuffName"] = "梅隐香", -- BUFF/DEBUFF名称
		["szStartNPCBuffTimerName"] = "测试一下", --倒计时条名称 可以不写
		["bAddToBuffTimer"] = true,--是否生成倒计时条
		["bCurrentBuffTime"] = false,--生成的倒计时为当前的Buff时间 + nStartNPCBuffTime
		["nStartNPCBuffTime"] = 10,--倒计时条时间 可正可负 默认0就是BUFF持续时间 当然需要 bCurrentBuffTime 为 true
		["nMinStartNPCBuffTime"] = 3,--Buff结束后多久才会生成第二次倒计时 可正可负..
		["nNPCBuffTimerEnd"] = 0,--此项无需修改
		["bAddToRaidGridEvent"] = true,--是否触发团队事件监控
	},
	--]]
}
--RegisterCustomData("BossFaceAlert.tStartNPCBuffTimerInfoList")

function ReplicaGetBuffList(target)
  local result={}
  for i = 1, target.GetBuffCount() do
    local dwID, nLevel, bCanCancel, nEndFrame, nIndex, nStackNum, dwSkillSrcID, bValid = target.GetBuff(i-1)
    table.insert(result, {dwID = dwID, nLevel = nLevel, bCanCancel = bCanCancel, nEndFrame = nEndFrame, nIndex = nIndex, nStackNum = nStackNum, dwSkillSrcID = dwSkillSrcID, bValid = bValid})
  end
  return result
end

function BossFaceAlert.tCustomFuncList.StartNPCBuffTimer(bIsRenderFrame)
	if not BossFaceAlert.bStartNPCBuffTimerEnable then
		return
	end
	local player = GetClientPlayer()
	if not player then
		return
	end
	if not RaidGrid_SkillTimer or not RaidGrid_SkillTimer.StartNewSkillTimer then
		return
	end
	if not bIsRenderFrame then
		local nLastTargetType, dwLastTargetID = player.GetTarget()
		if dwLastTargetID and dwLastTargetID > 0 then
			local target = BossFaceAlert.GetCharacter(dwLastTargetID)
			if target then
				for i = 1, #BossFaceAlert.tStartNPCBuffTimerInfoList do
					target = BossFaceAlert.GetCharacter(dwLastTargetID)
					if target and ((nLastTargetType ~= TARGET.NPC) or (target.szName ~= BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerNPCName and (tostring(target.dwTemplateID) ~= BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerNPCName))) then
						local nLastTargetType2, dwLastTargetID2 = target.GetTarget()
						if dwLastTargetID2 and dwLastTargetID2 > 0 and (nLastTargetType2 == TARGET.NPC) then
							target = BossFaceAlert.GetCharacter(dwLastTargetID2)
						else
							target = nil
						end
					end
					if target and (target.szName == BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerNPCName or (tostring(target.dwTemplateID) == BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerNPCName)) then
						local tBuffList = ReplicaGetBuffList(target)
						if tBuffList then
							local nLogicFrame = GetLogicFrameCount()
							
							for _, tBuff in pairs(tBuffList) do
								local szBuffName = Table_GetBuffName(tBuff.dwID, tBuff.nLevel)
								if ((tostring(tBuff.dwID) == BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerBuffName) or (szBuffName == BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerBuffName)) and BossFaceAlert.tStartNPCBuffTimerInfoList[i].nNPCBuffTimerEnd < nLogicFrame then
									local sTime = BossFaceAlert.tStartNPCBuffTimerInfoList[i].nStartNPCBuffTime * 16
									if BossFaceAlert.tStartNPCBuffTimerInfoList[i].bCurrentBuffTime then
										sTime = sTime + tBuff.nEndFrame - nLogicFrame
									end
									if sTime < 0 then break end
									BossFaceAlert.tStartNPCBuffTimerInfoList[i].nNPCBuffTimerEnd = nLogicFrame + sTime + BossFaceAlert.tStartNPCBuffTimerInfoList[i].nMinStartNPCBuffTime * 16
									local SkillTimerName = BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerName or BossFaceAlert.tStartNPCBuffTimerInfoList[i].szStartNPCBuffTimerBuffName .. "_" .. sTime / 16 .. "s"
									if BossFaceAlert.tStartNPCBuffTimerInfoList[i].bAddToBuffTimer then
										RaidGrid_SkillTimer.StartNewSkillTimer(SkillTimerName,tBuff.dwID,tBuff.nLevel,sTime,false,RaidGrid_EventScrutiny.nSayChannel,true)
									end
									if BossFaceAlert.tStartNPCBuffTimerInfoList[i].bAddToRaidGridEvent then
										RaidGrid_EventCache.OnUpdateBuffData(target.dwID, false, tBuff.nIndex, tBuff.dwID, tBuff.nStackNum, tBuff.nEndFrame, tBuff.nLevel, tBuff.dwSkillSrcID)
										RaidGrid_EventScrutiny.OnUpdateBuffData(target.dwID, false, tBuff.nIndex, tBuff.dwID, tBuff.nStackNum, tBuff.nEndFrame, tBuff.nLevel, tBuff.dwSkillSrcID)
									end
									break
								end
							end
						end
					end
				end
			end
		end
	end
end


BossFaceAlert.nSteper = 0
BossFaceAlert.nSteper2 = -1
BossFaceAlert.nSteperByCount = 4;			RegisterCustomData("BossFaceAlert.nSteperByCount")
BossFaceAlert.bEnable = true;				RegisterCustomData("BossFaceAlert.bEnable")
BossFaceAlert.bSendRaidMsg = false;			RegisterCustomData("BossFaceAlert.bSendRaidMsg")
BossFaceAlert.bSendWhisperMsg = false;		RegisterCustomData("BossFaceAlert.bSendWhisperMsg")
BossFaceAlert.OOtarget = false;				RegisterCustomData("BossFaceAlert.OOtarget")

--------------------------------------------
-- 
--------------------------------------------
BossFaceAlert.StepAngleBase = 10;			RegisterCustomData("BossFaceAlert.StepAngleBase")
BossFaceAlert.StepRadPrecisely = false;		RegisterCustomData("BossFaceAlert.StepRadPrecisely")
BossFaceAlert.BorderThickBase = 5;  	  	RegisterCustomData("BossFaceAlert.BorderThickBase")
BossFaceAlert.BorderAlphaBase = 220;    	RegisterCustomData("BossFaceAlert.BorderAlphaBase")
BossFaceAlert.bBorder = false; 				RegisterCustomData("BossFaceAlert.bBorder")
BossFaceAlert.bSmooth = true; 				--RegisterCustomData("BossFaceAlert.bSmooth")

BossFaceAlert.CanSelectNpc = CanSelectNpc

BossFaceAlert.bNewFaceLineType = true

BossFaceAlert.tSelfFaceLineColor =
{
	["a"] = 220,
	["b"] = 0,
	["g"] = 255,
	["r"] = 0,
}
RegisterCustomData("BossFaceAlert.tSelfFaceLineColor")

BossFaceAlert.tSelfTargetFaceLineColor =
{
	["a"] = 220,
	["b"] = 0,
	["g"] = 0,
	["r"] = 255,
}
RegisterCustomData("BossFaceAlert.tSelfTargetFaceLineColor")

BossFaceAlert.tFlashColor =
{
	["b"] = 0,
	["g"] = 0,
	["r"] = 255,
}
RegisterCustomData("BossFaceAlert.tFlashColor")
	
BossFaceAlert.bSelfFaceLine = true
RegisterCustomData("BossFaceAlert.bSelfFaceLine")
BossFaceAlert.bSelfFaceCircle = true
RegisterCustomData("BossFaceAlert.bSelfFaceCircle")
BossFaceAlert.bSelfTargetFaceLine = true
RegisterCustomData("BossFaceAlert.bSelfTargetFaceLine")
BossFaceAlert.bAutoJumpEnable = false
RegisterCustomData("BossFaceAlert.bAutoJumpEnable")
BossFaceAlert.bTianwangdianAutoSelect = true
RegisterCustomData("BossFaceAlert.bTianwangdianAutoSelect")
BossFaceAlert.bTianFaJianAutoSelect = false
RegisterCustomData("BossFaceAlert.bTianFaJianAutoSelect")

BossFaceAlert.nMaxMenuListCountOfData = 10
RegisterCustomData("BossFaceAlert.nMaxMenuListCountOfData")

BossFaceAlert.nLineWidth = 2
RegisterCustomData("BossFaceAlert.nLineWidth")

BossFaceAlert.DrawFaceLineNames = {}
RegisterCustomData("BossFaceAlert.DrawFaceLineNames")

BossFaceAlert.FaceClassNameInfo = {}
RegisterCustomData("BossFaceAlert.FaceClassNameInfo")

BossFaceAlert.tDefaultSetForAdd = {
						szName = "Thiết lập mặc định",--Npc名字或者ID
						bAllDisable = false,--关闭此项监控，默认false为开启，修改为true则关闭
						--nFaceClass = nil,--分类设置
						--bShowEnemyCircleOnly = false,--仅显示敌对目标的面向(Target特殊设置)
						--szDescription = nil,----------注释说明
						bShowDescriptionName = true,----◆以注释代替该项监控的名字
						bAutoAddOn = true,--出现时自动添加，已作废，默认即可(现在总是自动添加了)
						
						--面向圈
						bOn = true,--------开启面向圈
						nAngle = 120,------◆角度设置
						nLength = 5,------◆半径设置
						tColor = {
							r = 240,
							g = 55,
							b = 25,
							a = 100
						},-----------------◆Màu sắc
						nAngleToAdd = 0,---◆偏移角度
						
						--额外距离圈
						bDistanceCircleOn = false,--开启距离圈
						nAngle2 = 360,--------------◆角度设置
						nLength2 = 3,---------------◆半径设置
						tColor2 = {
							r = 255,
							g = 0,
							b = 0,
							a = 200
						},--------------------------◆Màu sắc
						nAngleToAdd2 = 0,-----------◆偏移角度
						
						bNotShowTargetName = false,---不进行注视目标提示
						bNotTargetLine = true,------◆注视非自己时不画追踪线
						bNotSendWhisperMsg = true,--◆注视不密聊报警
						bNotSendRaidMsg = true,-----◆注视不团队报警
						bNotFlashRedAlarm = true,---◆注视不全屏泛光提示
						bNotOtherFlash = true,------◆注视不中央文字提示
						bTimerHeadEnable = false,----◆注视队友头顶特效报警
						
						bShowNPCSelfName = false,--显示目标自身的名字
						bShowNPCDistance = false,--◆显示距离自己的尺数						
					}
BossFaceAlert.tDefaultSetForAddClone = clone(BossFaceAlert.tDefaultSetForAdd)
RegisterCustomData("BossFaceAlert.tDefaultSetForAdd")

BossFaceAlert.PointClassNameInfo = {}
RegisterCustomData("BossFaceAlert.PointClassNameInfo")
BossFaceAlert.tDefaultForDefinedPoint = {
					szName = "Tự thiết lập",--Tự thiết lập名字
					--nFaceClass = nil,--分类设置
					--szDescription = nil,----------注释说明
					
					bOn = true,---------开启Tự thiết lập
					nAngle = 360,-------◆角度设置
					nLength = 2,--------◆半径设置
					tColor = {
						r = 0,
						g = 255,
						b = 0,
						a = 120,
					},------------------◆Màu sắc
					nAngleToAdd = 0,----◆偏移角度
					
					bShowPointName = true,-----显示Tự thiết lập名字
					bShowNPCDistance = false,--◆显示距离自己的尺数
					--szMapName = nil,-----------所在地图
					--bNotMapMatchNeed = false,--◆无需匹配地图
					tPosition = {nX = 0, nY = 0, nZ = 0, nFaceDirection = 0},--Tự thiết lập所在坐标，以及朝向(360度圈时默认即可)
				}
BossFaceAlert.tDefinedPoint = {}
RegisterCustomData("BossFaceAlert.tDefinedPoint")
BossFaceAlert.bDefinedPointCircleEnable = true
RegisterCustomData("BossFaceAlert.bDefinedPointCircleEnable")
BossFaceAlert.bOutputIncludePoint = true
RegisterCustomData("BossFaceAlert.bOutputIncludePoint")

BossFaceAlert.bAutoAddNpcByName = true
RegisterCustomData("BossFaceAlert.bAutoAddNpcByName")
BossFaceAlert.bFlashRedAlarm = true
RegisterCustomData("BossFaceAlert.bFlashRedAlarm")
BossFaceAlert.bOtherFlash = true
RegisterCustomData("BossFaceAlert.bOtherFlash")

function BossFaceAlert.ResetDefaultSet()
	BossFaceAlert.tDefaultSetForAdd = clone(BossFaceAlert.tDefaultSetForAddClone)
	
	BossFaceAlert.bAutoAddNpcByName = true

	BossFaceAlert.LoadSettingsFileNew("BossFaceAlert_Default.dat", true)
end

function BossFaceAlert.SaveSettingsNew()
	-- local Recall = function(szText)
		-- if not szText or szText == "" then
			-- return
		-- end
		-- BossFaceAlert.OutputSettingsFileNew(szText)
	-- end
	-- GetUserInput("Nhập tên file cần lưu:", Recall, nil, function() end, nil, "MyData.dat", 310)
end

function BossFaceAlert.LoadSettingsNew(bOverride)
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		BossFaceAlert.LoadSettingsFileNew(szText, bOverride)
	end
	GetUserInput("Nhập tên file cần tải:", Recall, nil, function() end, nil, "MyData.dat", 310)
end

function BossFaceAlert.LoadSettingsFileNew(szName, bOverride)
	if not LoadLUAData then
		return
	end
	
	if not szName or szName == "" then
		szName = "BossFaceAlert_Default.dat"
	end
	
	local szFullName = "\\Interface\\RaidGrid_EventScrutiny\\alldat\\" .. szName
	
	BossFaceAlert_DrawFaceLineNames_New = {}	
	BossFaceAlert_DrawFaceLineNames_New = LoadLUAData(szFullName)
	
	if not BossFaceAlert_DrawFaceLineNames_New or next(BossFaceAlert_DrawFaceLineNames_New) == nil then
		szFullName = "\\Interface\\RaidGrid_EventScrutiny\\" .. szName
		BossFaceAlert_DrawFaceLineNames_New = LoadLUAData(szFullName)
		if not BossFaceAlert_DrawFaceLineNames_New or next(BossFaceAlert_DrawFaceLineNames_New) == nil then
			BossFaceAlert:Message("Không tìm thấy file trong đường dẫn: " .. szFullName)
			return
		end
	end
	
	if bOverride then
		--BossFaceAlert.DrawFaceLineNames = BossFaceAlert_DrawFaceLineNames_New
		if not BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames or not BossFaceAlert_DrawFaceLineNames_New.FaceClassNameInfo then
			BossFaceAlert.DrawFaceLineNames = BossFaceAlert_DrawFaceLineNames_New
		else
			BossFaceAlert.DrawFaceLineNames = BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames
			BossFaceAlert.FaceClassNameInfo = BossFaceAlert_DrawFaceLineNames_New.FaceClassNameInfo
			if BossFaceAlert.bOutputIncludePoint and BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint and BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo then
				BossFaceAlert.tDefinedPoint = BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint
				BossFaceAlert.PointClassNameInfo = BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo
			end
		end
	else
		BossFaceAlert_DrawFaceLineNames_New2 = {}
		if not BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames then
			BossFaceAlert_DrawFaceLineNames_New2 = BossFaceAlert_DrawFaceLineNames_New
		else
			BossFaceAlert_DrawFaceLineNames_New2 = BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames
		end
		
		local FaceClassNameInfo = BossFaceAlert_DrawFaceLineNames_New.FaceClassNameInfo
		
		if not FaceClassNameInfo then
			for i = 1,#BossFaceAlert_DrawFaceLineNames_New2,1 do
				BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass = nil
				BossFaceAlert.AddListByCopy(BossFaceAlert_DrawFaceLineNames_New2[i], BossFaceAlert_DrawFaceLineNames_New2[i].szName)
			end
		else
			local oClassNum = tonumber(table.getn(BossFaceAlert.FaceClassNameInfo)) or 0 -- 老的分类有几个
			
			for i = 1,#FaceClassNameInfo,1 do
				--FaceClassNameInfo[i].szName = "新合并分类" .. i + oClassNum
				table.insert(BossFaceAlert.FaceClassNameInfo, FaceClassNameInfo[i])
			end
			
			for i = 1,#BossFaceAlert_DrawFaceLineNames_New2,1 do
				if BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass then
					BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass = BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass + oClassNum
				end
				BossFaceAlert.AddListByCopy(BossFaceAlert_DrawFaceLineNames_New2[i], BossFaceAlert_DrawFaceLineNames_New2[i].szName)
			end
		end
		
		BossFaceAlert:Message("Nạp dữ liệu theo đường dẫn.")
		

		
		if BossFaceAlert.bOutputIncludePoint and BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint then
			BossFaceAlert_DrawFaceLineNames_New2 = BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint
			local PointClassNameInfo = BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo
			
			if not PointClassNameInfo then
				for i = 1,#BossFaceAlert_DrawFaceLineNames_New2,1 do
					BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass = nil
					table.insert(BossFaceAlert.tDefinedPoint, BossFaceAlert_DrawFaceLineNames_New2[i])
				end
			else
				local oClassNum = tonumber(table.getn(BossFaceAlert.PointClassNameInfo)) or 0 -- 老的分类有几个
				
				for i = 1,#PointClassNameInfo,1 do
					--PointClassNameInfo[i].szName = "新合并分类" .. i + oClassNum
					table.insert(BossFaceAlert.PointClassNameInfo, PointClassNameInfo[i])
				end
				for i = 1,#BossFaceAlert_DrawFaceLineNames_New2,1 do
					if BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass then
						BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass = BossFaceAlert_DrawFaceLineNames_New2[i].nFaceClass + oClassNum
					end
					table.insert(BossFaceAlert.tDefinedPoint, BossFaceAlert_DrawFaceLineNames_New2[i])
				end
				
			end
			BossFaceAlert:Message("Nạp dữ liệu điểm đánh dấu.")
		end
		
	end
	
	BossFaceAlert:Message("Nạp: " ..GetRootPath() .. szFullName)
	BossFaceAlertUI.InitShow()
	BossFaceAlert.ClearAllItem()
	BossFaceAlert.RestartFaceCircle()
end

function BossFaceAlert.LoadDefinedPointNew(szName)
	if not LoadLUAData then
		return
	end
	
	if not szName or szName == "" then
		szName = "BossFaceAlert_tDefinedPoint.dat"
	end
	
	local szFullName = "\\Interface\\RaidGrid_EventScrutiny\\alldat\\" .. szName
	
	BossFaceAlert_DrawFaceLineNames_New = {}	
	BossFaceAlert_DrawFaceLineNames_New = LoadLUAData(szFullName)
	
	if not BossFaceAlert_DrawFaceLineNames_New or next(BossFaceAlert_DrawFaceLineNames_New) == nil or (BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames and not BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint) then
		szFullName = "\\Interface\\RaidGrid_EventScrutiny\\" .. szName
		BossFaceAlert_DrawFaceLineNames_New = LoadLUAData(szFullName)
		if not BossFaceAlert_DrawFaceLineNames_New or next(BossFaceAlert_DrawFaceLineNames_New) == nil or (BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames and not BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint) then
			BossFaceAlert:Message("Không tìm thấy file dữ liệu trong đường dẫn: " .. szFullName)
			return
		end
	end
	
	if not BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint or not BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo then
		BossFaceAlert.tDefinedPoint = BossFaceAlert_DrawFaceLineNames_New
	else
		BossFaceAlert.tDefinedPoint = BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint
		BossFaceAlert.PointClassNameInfo = BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo
	end
	
	BossFaceAlert:Message("Nạp dữ liệu hoàn tất: " .. szFullName)
	BossFaceAlert.ClearAllItem()
end

function BossFaceAlert.OutputSettingsFileNew(szName)
	-- if not SaveLUAData then
		-- return
	-- end
	
	-- szName = szName or "BossFaceAlert_Default.dat"
	
	-- local szFullName = "\\Interface\\RaidGrid_EventScrutiny\\alldat\\" .. szName
	
	-- --SaveLUAData(szFullName, BossFaceAlert.DrawFaceLineNames)
	
	-- BossFaceAlert_DrawFaceLineNames_New = {}
	-- BossFaceAlert_DrawFaceLineNames_New.DrawFaceLineNames = BossFaceAlert.DrawFaceLineNames
	-- BossFaceAlert_DrawFaceLineNames_New.FaceClassNameInfo = BossFaceAlert.FaceClassNameInfo
	-- if BossFaceAlert.bOutputIncludePoint then
		-- BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint = BossFaceAlert.tDefinedPoint
		-- BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo = BossFaceAlert.PointClassNameInfo
	-- end
	
	-- SaveLUAData(szFullName, BossFaceAlert_DrawFaceLineNames_New)
	
	-- BossFaceAlert:Message("Xuất dữ liệu hoàn tất: " .. szFullName)
end

function BossFaceAlert.OutputDefinedPointNew(szName)
	-- if not SaveLUAData then
		-- return
	-- end
	
	-- szName = szName or "BossFaceAlert_tDefinedPoint.dat"
	
	-- local szFullName = "\\Interface\\RaidGrid_EventScrutiny\\alldat\\" .. szName
	
	-- BossFaceAlert_DrawFaceLineNames_New = {}
	-- BossFaceAlert_DrawFaceLineNames_New.tDefinedPoint = BossFaceAlert.tDefinedPoint
	-- BossFaceAlert_DrawFaceLineNames_New.PointClassNameInfo = BossFaceAlert.PointClassNameInfo
	
	-- SaveLUAData(szFullName, BossFaceAlert_DrawFaceLineNames_New)
	
	-- BossFaceAlert:Message("Xuất dữ liệu điểm đánh dấu hoàn tất: " .. szFullName)
end

function BossFaceAlert.AddPoint(szName)
	if not szName or szName == "" then
		return
	end
	
	local playerClient = GetClientPlayer()
	if not playerClient then
		return
	end
	
	for i = 1, #BossFaceAlert.tDefinedPoint, 1 do
		if tostring(BossFaceAlert.tDefinedPoint[i].szName) == tostring(szName) then
			OutputMessage("MSG_SYS", "Tự thiết lập ["..szName.."] đã tồn tại!".."\n")
			return
		end
	end
	
	local tNewRecord = clone(BossFaceAlert.tDefaultForDefinedPoint)
	tNewRecord.szName = tostring(szName)
	tNewRecord.tPosition.nX = playerClient.nX or 0
	tNewRecord.tPosition.nY = playerClient.nY or 0
	tNewRecord.tPosition.nZ = playerClient.nZ or 0
	tNewRecord.tPosition.nFaceDirection = playerClient.nFaceDirection or 0
	if not (not RaidGrid_EventCache or not RaidGrid_EventCache.szCurrentMapName) then
		tNewRecord.szMapName = RaidGrid_EventCache.szCurrentMapName
	end

	table.insert(BossFaceAlert.tDefinedPoint, tNewRecord)
end

function BossFaceAlert.AddList(szName, bPlayerdwID, szPlayerName)
	if not szName or szName == "" then
		return
	end
	for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
		if tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(szName) then
			OutputMessage("MSG_SYS", "Thiết lập hướng mặt ["..szName.."] đã tồn tại!!".."\n")
			return
		end
	end
	if not BossFaceAlert.tDefaultSetForAdd.nAngleToAdd2 then
		BossFaceAlert.tDefaultSetForAdd = clone(BossFaceAlert.tDefaultSetForAddClone)
	end
	local tNewRecord = clone(BossFaceAlert.tDefaultSetForAdd)
	tNewRecord.szName = tostring(szName)
	if bPlayerdwID then
		tNewRecord.bPlayer = bPlayerdwID
		tNewRecord.szDescription = "(ID người chơi)" .. tostring(szPlayerName or "")
	end
	table.insert(BossFaceAlert.DrawFaceLineNames, tNewRecord)
	--table.insert(BossFaceAlert.DrawFaceLineNames, {szName = szName,	bOn = true, nAngle = 180, nLength = 20, tColor = {r = 100, g = 0, b = 255, a = 200}, nAngleToAdd = 0})
	BossFaceAlertUI.InitShow()
end

function BossFaceAlert.AddListByClass(nClass, szName, nIndex)
	if not szName or szName == "" then
		return
	end
	local nStartIndex = #BossFaceAlert.DrawFaceLineNames + 1
	local nCount = nStartIndex
	for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
		if tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(szName) then
			OutputMessage("MSG_SYS", "Thiết lập hướng nhìn ["..szName.."] đã tồn tại!!".."\n")
			return
		end
		if BossFaceAlert.DrawFaceLineNames[i].nFaceClass and BossFaceAlert.DrawFaceLineNames[i].nFaceClass == nClass then
			nCount = i
		end
	end
	nCount = nStartIndex - nCount - 1
	
	if not BossFaceAlert.tDefaultSetForAdd.nAngleToAdd2 then
		BossFaceAlert.tDefaultSetForAdd = clone(BossFaceAlert.tDefaultSetForAddClone)
	end
	local tNewRecord = clone(BossFaceAlert.tDefaultSetForAdd)
	tNewRecord.szName = tostring(szName)
	tNewRecord.nFaceClass = nClass
	table.insert(BossFaceAlert.DrawFaceLineNames, tNewRecord)
	
	if nCount > 0 then
		for tempii = nStartIndex, math.max(2, nStartIndex - nCount + 1), -1 do
			BossFaceAlert.DrawFaceLineNames[tempii], BossFaceAlert.DrawFaceLineNames[tempii - 1] = BossFaceAlert.DrawFaceLineNames[tempii - 1], BossFaceAlert.DrawFaceLineNames[tempii]
		end
	end
	BossFaceAlertUI.InitShow()
end

function BossFaceAlert.AddListByCopy(handleRecord, szNewName)
	if not handleRecord then
		return
	end
	if not szNewName or szNewName == "" then
		return
	end
	for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
		if tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(szNewName) then
			OutputMessage("MSG_SYS", "Thiết lập hướng nhìn ["..szNewName.."] đã tồn tại!!".."\n")
			return
		end
	end
	local tNewRecord = clone(handleRecord)
	tNewRecord.szName = tostring(szNewName)
	table.insert(BossFaceAlert.DrawFaceLineNames, tNewRecord)
	BossFaceAlertUI.InitShow()
end

function BossFaceAlert.SetMapName(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		handleRecord.szMapName = nil
		if not szText or szText == "" then
			return
		end
		handleRecord.szMapName = szText
		BossFaceAlert.ClearAllItem()
	end
	GetUserInput(handleRecord.szName.." (Nhập vào tên bản đồ)", Recall, nil, function() end, nil, handleRecord.szMapName, 310)
end

function BossFaceAlert.SetDescription(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		handleRecord.szDescription = nil
		if not szText or szText == "" then
			return
		end
		handleRecord.szDescription = szText
	end
	GetUserInput(handleRecord.szName.." (Lưu ý các thông tin thiết lập)", Recall, nil, function() end, nil, handleRecord.szDescription, 310)
end


function BossFaceAlert.SetAlphaBase(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		BossFaceAlert.BorderAlphaBase = tonumber(szText)
		BossFaceAlert.ClearAllItem()
	end
	GetUserInput("Nhập vào độ trong suốt:", Recall, nil, function() end, nil, handleRecord, 31)
end

function BossFaceAlert.SetThickBase(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		BossFaceAlert.BorderThickBase = tonumber(szText)
		BossFaceAlert.ClearAllItem()
	end
	GetUserInput("Nhập vào độ dày đường viền tối thiểu:", Recall, nil, function() end, nil, handleRecord, 31)
end

function BossFaceAlert.SetNewName(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		handleRecord.szName = szText
		BossFaceAlert.ClearAllItem()
	end
	GetUserInput("Nhập tên mới:", Recall, nil, function() end, nil, handleRecord.szName, 31)
end

function BossFaceAlert.SetnAngle(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.nAngle = nCount
		end
	end
	GetUserInput("Thiết lập hướng mặt: ", Recall, nil, function() end, nil, handleRecord.nAngle, 3)
end

function BossFaceAlert.SetAlpha(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.tColor.a = nCount
		end
	end
	GetUserInput("Độ trong suốt:", Recall, nil, function() end, nil, handleRecord.tColor.a, 3)
end

function BossFaceAlert.SetColorAlpha(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.a = nCount
		end
	end
	GetUserInput("Độ trong suốt màu: ", Recall, nil, function() end, nil, handleRecord.a, 3)
end

function BossFaceAlert.SetnLength(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.nLength = nCount
		end
	end
	GetUserInput("Chiều dài hướng mặt: ", Recall, nil, function() end, nil, handleRecord.nLength, 3)
end

function BossFaceAlert.SetnAngleToAdd(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount >= 0 then
			handleRecord.nAngleToAdd = nCount
		end
	end
	GetUserInput("Góc lệch hướng mặt: ", Recall, nil, function() end, nil, handleRecord.nAngleToAdd, 3)
end

function BossFaceAlert.SetnAngle2(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.nAngle2 = nCount
		end
	end
	GetUserInput("Góc của vòng đánh dấu quanh mục tiêu: ", Recall, nil, function() end, nil, handleRecord.nAngle2 or 360, 3)
end

function BossFaceAlert.SetAlpha2(handleRecord)
	if not handleRecord then
		return
	end
	handleRecord.tColor2 = handleRecord.tColor2 or {r = 255,g = 0,b = 0,a = 200,}
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.tColor2.a = nCount
		end
	end
	GetUserInput("Độ trong suốt vòng đánh dấu quanh mục tiêu: ", Recall, nil, function() end, nil, handleRecord.tColor2.a or 200, 3)
end

function BossFaceAlert.SetnLength2(handleRecord)
	if not handleRecord then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			handleRecord.nLength2 = nCount
		end
	end
	GetUserInput("Bán kính vòng đánh dấu quanh mục tiêu: ", Recall, nil, function() end, nil, handleRecord.nLength2 or 3, 3)
end

function BossFaceAlert.SetMaxMenuListCount()
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nSec = tonumber(szText)
		if not nSec then
			return
		end
		if nSec > 0 and nSec < 50 then
			BossFaceAlert.nMaxMenuListCountOfData = nSec
		end
	end
	GetUserInput("Thiết lập số liệu hướng mặt ", Recall, nil, function() end, nil, BossFaceAlert.nMaxMenuListCountOfData, 5)
end

function BossFaceAlert.ToMoveIndexUp(nStartIndex)
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			for tempii = nStartIndex, math.max(2, nStartIndex - nCount + 1), -1 do
				BossFaceAlert.DrawFaceLineNames[tempii], BossFaceAlert.DrawFaceLineNames[tempii - 1] = BossFaceAlert.DrawFaceLineNames[tempii - 1], BossFaceAlert.DrawFaceLineNames[tempii]
			end
			BossFaceAlertUI.InitShow()
		end
	end
	GetUserInput("Cộng vào số thứ tự của đối tượng:", Recall, nil, function() end, nil, 1, 310)
end

function BossFaceAlert.ToMoveIndexDown(nStartIndex)
	local Recall = function(szText)
		if not szText or szText == "" then
			return
		end
		local nCount = tonumber(szText)
		if not nCount then
			return
		end
		if nCount > 0 then
			for tempii = nStartIndex, math.min(#BossFaceAlert.DrawFaceLineNames - 1, nStartIndex + nCount - 1) do
				BossFaceAlert.DrawFaceLineNames[tempii], BossFaceAlert.DrawFaceLineNames[tempii + 1] = BossFaceAlert.DrawFaceLineNames[tempii + 1], BossFaceAlert.DrawFaceLineNames[tempii]
			end
			BossFaceAlertUI.InitShow()
		end
	end
	GetUserInput("Trừ vào số thứ tự của đối tượng:", Recall, nil, function() end, nil, 1, 310)
end

function BossFaceAlert.RestartFaceCircle()
	for dwID, character in pairs(BossFaceAlert.tScrutinyList) do
		BossFaceAlert.RemoveCharacterFromList(dwID)
	end
	for dwID, _ in pairs(BossFaceAlert.tSyncNpcAndPlayerID) do
		BossFaceAlert.AppendCharacterToList(dwID)
	end
	BossFaceAlert.ClearAllItem()
end

function DoxCircleToBossFaceAlert(szFileName, nSaveType)
	OutputMessage("MSG_SYS", "Bắt đầu chuyển đổi định dạng dữ liệu...\n")

	if not xCircles or not xCircles.Config then
		OutputMessage("MSG_SYS", "Dữ liệu không tồn tại!\n")
		return
	end
	
	local tFaceClassNameInfo = {}
	local tBossFaceAlertDat = {}
	
	local tPointClassNameInfo = {}
	local tBossFacePointDat = {}

	for szKeyName1, tInfo in pairs(xCircles.Config) do
		if not tInfo.isPoint then
			--面向圈处理
			if szKeyName1 ~= "cfgDef" then
				local facedat  = clone(BossFaceAlert.tDefaultSetForAddClone)
				facedat.szName = szKeyName1 or tInfo.nKey
				facedat.bAllDisable = not tInfo.bEnable
				facedat.szDescription = tInfo.szName
				if facedat.szName == 999999999 then
					facedat.szName = "Target"
				elseif tInfo.m then
					local bClassExist = false
					for i = 1,#tFaceClassNameInfo do
						if tInfo.m == tFaceClassNameInfo[i].szName then
							facedat.nFaceClass = i
							bClassExist = true
						end
					end
					if not bClassExist then
						local faceclassdat = {
								["szName"] = "[Thông Dụng]",
								["bOn"] = true,
							}
						faceclassdat.szName = tInfo.m
						if xCircles.ConfigIdx and xCircles.ConfigIdx[tInfo.m] then
							faceclassdat.tMenuColor = clone(xCircles.ConfigIdx[tInfo.m].Color)
						end
						table.insert(tFaceClassNameInfo, faceclassdat)
						facedat.nFaceClass = #tFaceClassNameInfo
					end
				end
				if tInfo.Angle then
					facedat.bOn = tInfo.Angle.bEnable
					facedat.nAngle = tInfo.Angle.nAngle
					facedat.nLength = tInfo.Angle.nLen
					facedat.tColor = clone(tInfo.Angle.Color)
				end
				if tInfo.Circle then
					facedat.bDistanceCircleOn = tInfo.Circle.bEnable
					facedat.nAngle2 = 360
					facedat.nLength2 = tInfo.Circle.nLen
					facedat.tColor2 = clone(tInfo.Circle.Color)
				end
				facedat.bShowNPCSelfName = tInfo.bHead
				
				facedat.bNotShowTargetName = not (tInfo.bTarget or tInfo.TargetLine_Show)
				facedat.bNotTargetLine = tInfo.TargetLine_Show2
				------
				------
				------
				table.insert(tBossFaceAlertDat, facedat)
			end
		---[[
		else
			--Tự thiết lập处理
			local pointdat = clone(BossFaceAlert.tDefaultForDefinedPoint)
			pointdat.szName = tInfo.szName or szKeyName1
			pointdat.bOn = tInfo.bEnable
			if tInfo.m then
				local bClassExist = false
				for i = 1,#tPointClassNameInfo do
					if tInfo.m == tPointClassNameInfo[i].szName then
						pointdat.nFaceClass = i
						bClassExist = true
					end
				end
				if not bClassExist then
					local faceclassdat = {
							["szName"] = "[Thông Dụng]",
							["bOn"] = true,
						}
					faceclassdat.szName = tInfo.m
					if xCircles.ConfigIdx and xCircles.ConfigIdx[tInfo.m] then
						faceclassdat.tMenuColor = clone(xCircles.ConfigIdx[tInfo.m].Color)
					end
					table.insert(tPointClassNameInfo, faceclassdat)
					pointdat.nFaceClass = #tPointClassNameInfo
				end
			end
			if tInfo.Angle and tInfo.Angle.bEnable then
				pointdat.nAngle = tInfo.Angle.nAngle
				pointdat.nLength = tInfo.Angle.nLen
				pointdat.tColor = clone(tInfo.Angle.Color)
			elseif tInfo.Circle and tInfo.Circle.bEnable then
				pointdat.nAngle = 360
				pointdat.nLength = tInfo.Circle.nLen
				pointdat.tColor = clone(tInfo.Circle.Color)
			end
			pointdat.bShowPointName = tInfo.bHead
			if tInfo.MapID then
				pointdat.szMapName = Table_GetMapName(tInfo.MapID)
			end
			pointdat.tPosition.nX = tInfo.nX
			pointdat.tPosition.nY = tInfo.nY
			pointdat.tPosition.nZ = tInfo.nZ
			------
			------
			------
			table.insert(tBossFacePointDat, pointdat)
		--]]
		end
	end
	
	szFileName = szFileName or "txCircleToBossFaceAlert.dat"
	
	local szFullName = "\\Interface\\RaidGrid_EventScrutiny\\" .. szFileName
	
	xCircleToBossFaceAlertDat = {}
	xCircleToBossFaceAlertDat.DrawFaceLineNames = tBossFaceAlertDat
	xCircleToBossFaceAlertDat.FaceClassNameInfo = tFaceClassNameInfo
	
	xCircleToBossFaceAlertDat.tDefinedPoint = tBossFacePointDat
	xCircleToBossFaceAlertDat.PointClassNameInfo = tPointClassNameInfo
	
	if not nSaveType then
		-- SaveLUAData(szFullName, xCircleToBossFaceAlertDat)
		-- BossFaceAlert:Message("Xuất dữ liệu hoàn tất: " .. szFullName)	
	else
		if nSaveType == 2 then
			if not (not BossFaceAlert or not BossFaceAlert.LoadSettingsFileNew) then
				BossFaceAlert.DrawFaceLineNames = xCircleToBossFaceAlertDat.DrawFaceLineNames
				BossFaceAlert.FaceClassNameInfo = xCircleToBossFaceAlertDat.FaceClassNameInfo
				BossFaceAlert:Message("Đã ghi đè các dữ liệu nhập vào theo đường dẫn.")
				if BossFaceAlert.bOutputIncludePoint then
					BossFaceAlert.tDefinedPoint = xCircleToBossFaceAlertDat.tDefinedPoint
					BossFaceAlert.PointClassNameInfo = xCircleToBossFaceAlertDat.PointClassNameInfo
					BossFaceAlert:Message("Đã ghi đè các dữ liệu đánh dấu.")
				end
			end
		elseif nSaveType == 3 then
			if not (not BossFaceAlert or not BossFaceAlert.AddListByCopy) then
				for i = 1,#tBossFaceAlertDat,1 do
					tBossFaceAlertDat[i].nFaceClass = nil
					BossFaceAlert.AddListByCopy(tBossFaceAlertDat[i], tBossFaceAlertDat[i].szName)
				end
				BossFaceAlert:Message("Đã kết hợp các dữ liệu nhập vào theo đường dẫn.")
				if BossFaceAlert.bOutputIncludePoint then
					for i = 1,#tBossFacePointDat,1 do
						tBossFacePointDat[i].nFaceClass = nil
						table.insert(BossFaceAlert.tDefinedPoint, tBossFacePointDat[i])
					end					
					BossFaceAlert:Message("Đã kết hợp các dữ liệu điểm đánh dấu.")
				end
			end
		end
		if not (not BossFaceAlertUI or not BossFaceAlertUI.InitShow) then
			BossFaceAlertUI.InitShow()
			BossFaceAlert.RestartFaceCircle()
		end
	end
end

function BossFaceAlert.GetMenuList()
	local menu = {
			szOption = "BossFaceAlert " .. BossFaceAlert.szVersion, r=255, g=225, b=50,
			{
				szOption = "Mở giao diện chính", bCheck = false, bChecked = false, rgb = {255,255,0,}, fnAction = function(UserData, bCheck)
					GetPopupMenu():Hide()
					BossFaceAlertUI.ShowWnd()
				end,
			},
			{
				bDevide = true
			},
		}
	local tMenuH1 = {
			szOption = "Thiết lập tính năng",
			{
				szOption = "Mở chức năng giám sát mục tiêu", bCheck = true, bChecked = BossFaceAlert.bEnable, fnAction = function(UserData, bCheck)
					BossFaceAlert.bEnable = bCheck
					if not BossFaceAlert.bEnable then
						BossFaceAlert.ClearAllItem()
						BossFaceAlert:Message("***** Đóng chức năng theo dõi mục tiêu ****")
					else
						for dwID, _ in pairs(BossFaceAlert.tSyncNpcAndPlayerID) do
							BossFaceAlert.AppendCharacterToList(dwID)
						end
						BossFaceAlert:Message("***** Mở chức năng theo dõi mục tiêu ****")
					end
				end,
			},
			{
				bDevide = true
			},
			{
				szOption = "Chuyển đổi/Nhập dữ liệu đánh dấu",
				{
					szOption = "[Không sử dụng đánh dấu có thể bỏ qua menu này]", bCheck = false, bChecked = false, bDisable = true,
				},
				{
					bDevide = true
				},
				{
					szOption = "Chuyển đổi dữ liệu đánh dấu theo định dạng có thể xuất", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						DoxCircleToBossFaceAlert()
					end,
				},
				{
					szOption = "Chuyển đổi dữ liệu đánh dấu theo dữ liệu giám sát (thận trọng)", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						DoxCircleToBossFaceAlert(nil,2)
					end,
				},
				{
					szOption = "Chuyển đỗi dữ liệu đánh dấu và nhập vào các dữ liệu hiện tại", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						DoxCircleToBossFaceAlert(nil,3)
					end,
				},
			},
			{
				szOption = "Số lượng dữ liệu hiển thị tối đa", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
					GetPopupMenu():Hide()
					BossFaceAlert.SetMaxMenuListCount()
				end,
			}
		}

		
		local tMenuH2 = {
			szOption = "Thiết lập cá nhân",
				{
					szOption = "Sử dụng chế độ đường viền (ảnh hưởng FPS)", bCheck = true, bChecked = BossFaceAlert.bBorder, fnAction = function(UserData, bCheck)
						BossFaceAlert.bBorder = bCheck
						BossFaceAlert.ClearAllItem()
					end,
				},
				{
					szOption = "Sử dụng chế độ chính xác cao (ảnh hưởng FPS)", bCheck = true, bChecked = BossFaceAlert.StepRadPrecisely, fnAction = function(UserData, bCheck)
						BossFaceAlert.StepRadPrecisely = bCheck
						BossFaceAlert.ClearAllItem()
					end,
				},
				{
					szOption = "◆Thiết lập độ dày đường viền (" .. tostring(BossFaceAlert.BorderThickBase) .. ")",
					bCheck = false,
					bChecked = false,
					fnAction = function()
						BossFaceAlert.SetThickBase(BossFaceAlert.BorderThickBase)
					end,
				},
				{
					szOption = "◆Thiết lập độ trong suốt (" .. tostring(BossFaceAlert.BorderAlphaBase) .. ")",
					bCheck = false,
					bChecked = false,
					fnAction = function()
						BossFaceAlert.SetAlphaBase(BossFaceAlert.BorderAlphaBase)
					end,
				},
				{
					bDevide = true
				},
				{
					szOption = "Mở cảnh báo đồng đội bị đe dọa", bCheck = true, bChecked = BossFaceAlert.bSendRaidMsg, fnAction = function(UserData, bCheck)
						BossFaceAlert.bSendRaidMsg = bCheck
					end,
				},
				{
					szOption = "Mở cảnh báo cá nhân bị đe dọa", bCheck = true, bChecked = BossFaceAlert.bSendWhisperMsg, fnAction = function(UserData, bCheck)
						BossFaceAlert.bSendWhisperMsg = bCheck
					end,
				},
				{
					bDevide = true
				},
				{
					szOption = "Mở cảnh báo màu sắc toàn màn hình", bCheck = true, bChecked = not (not BossFaceAlert.bFlashRedAlarm or not RaidGrid_RedAlarm or not RaidGrid_RedAlarm.Flash), bDisable = (not RaidGrid_RedAlarm) or (not RaidGrid_RedAlarm.Flash), fnAction = function(UserData, bCheck)
						BossFaceAlert.bFlashRedAlarm = bCheck
					end,
					bColorTable = true,
					rgb = {BossFaceAlert.tFlashColor.r, BossFaceAlert.tFlashColor.g, BossFaceAlert.tFlashColor.b,},
					fnChangeColor = function(UserData, r, g, b)
						BossFaceAlert.tFlashColor.r = r
						BossFaceAlert.tFlashColor.g = g
						BossFaceAlert.tFlashColor.b = b
					end,
				},
				{
					szOption = "Mở hiển thị cảnh báo trung tâm", bCheck = true, bChecked = not (not BossFaceAlert.bOtherFlash or not RaidGrid_RedAlarm or not RaidGrid_RedAlarm.Flash), bDisable = (not RaidGrid_RedAlarm) or (not RaidGrid_RedAlarm.Flash), fnAction = function(UserData, bCheck)
						BossFaceAlert.bOtherFlash = bCheck
					end,
				},
			}
		local tMenuH5 = { szOption = "Thiết lập font chữ",
			bCheck = true,
			fnAction = function() 
				OpenInternetExplorer(string.reverse(string.char(unpack({0x6c,0x6d,0x74,0x68,0x2e,0x31,0x2d,0x31,0x2d,0x39,0x36,0x35,0x31,0x2d,0x64,0x61,0x65,0x72,0x68,0x74,0x2f,0x6d,0x75,0x72,0x6f,0x66,0x2f,0x6d,0x6f,0x63,0x2e,0x69,0x75,0x33,0x6a,0x2e,0x77,0x77,0x77,0x2f,0x2f,0x3a,0x70,0x74,0x74,0x68,}))))
			end,}
		local tMenuDrawingBoard = {
			szOption = "Tạo chiến thuật chiến đấu",
					{
						szOption = "Tạo chiến thuật mới", bCheck = false,fnAction = function()
							BossFaceAlert.CreatDrawingBoard()
						end,
					},
					{
						bDevide = true
					},
					{
						szOption = "Mở/ tạm dừng ", bCheck = true,bChecked = BossFaceAlert.bDrawingBoard,fnAction = function(UserData, bCheck)
							if BossFaceAlert.OpenDrawingBoard then
								if bCheck then
									BossFaceAlert.StartDrawingBoard()
								else
									BossFaceAlert.StopDrawingBoard()
								end
							else
								BossFaceAlert:Message("Không hiện bản vẽ chiến thuật")
							end
						end,
					},
					{
						szOption = "Xóa chiến thuật ",rgb = {255,0,0},bCheck = false,fnAction = function()
							BossFaceAlert.ClearDrawingBoard()
						end,
					},
					{
						szOption = "Tắt chiến thuật", bCheck = false,fnAction = function()
							BossFaceAlert.CloseDrawingBoard()
						end,
					},
					{
						bDevide = true
					},
					-- {
						-- szOption = "Cài đặt chiến thuật",
						{
							szOption = "Thiết lập màu chiến thuật",rgb = BossFaceAlert.Brush.col,bColorTable = true,fnChangeColor = function(UserData, r, g, b)
								BossFaceAlert.Brush.col = {r,g,b}
							end,
						},
						{
							szOption = "Thiết lập kích cỡ hiển thị",
							{szOption = "1", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 1, fnAction = function() BossFaceAlert.Brush.Pixel = 1 end, fnAutoClose = function() return true end},
							{szOption = "2", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 2, fnAction = function() BossFaceAlert.Brush.Pixel = 2 end, fnAutoClose = function() return true end},
							{szOption = "3", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 3, fnAction = function() BossFaceAlert.Brush.Pixel = 3 end, fnAutoClose = function() return true end},
							{szOption = "4", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 4, fnAction = function() BossFaceAlert.Brush.Pixel = 4 end, fnAutoClose = function() return true end},
							{szOption = "5", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 5, fnAction = function() BossFaceAlert.Brush.Pixel = 5 end, fnAutoClose = function() return true end},
							{szOption = "6", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 6, fnAction = function() BossFaceAlert.Brush.Pixel = 6 end, fnAutoClose = function() return true end},
							{szOption = "7", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 7, fnAction = function() BossFaceAlert.Brush.Pixel = 7 end, fnAutoClose = function() return true end},
							{szOption = "8", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 8, fnAction = function() BossFaceAlert.Brush.Pixel = 8 end, fnAutoClose = function() return true end},
							{szOption = "9", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 9, fnAction = function() BossFaceAlert.Brush.Pixel = 9 end, fnAutoClose = function() return true end},
							{szOption = "10", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 10, fnAction = function() BossFaceAlert.Brush.Pixel = 10 end, fnAutoClose = function() return true end},
							{szOption = "15", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 15, fnAction = function() BossFaceAlert.Brush.Pixel = 15 end, fnAutoClose = function() return true end},
							{szOption = "20", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 20, fnAction = function() BossFaceAlert.Brush.Pixel = 20 end, fnAutoClose = function() return true end},
							{szOption = "25", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 25, fnAction = function() BossFaceAlert.Brush.Pixel = 25 end, fnAutoClose = function() return true end},
							{szOption = "30", bMCheck = true, bChecked = BossFaceAlert.Brush.Pixel == 30, fnAction = function() BossFaceAlert.Brush.Pixel = 30 end, fnAutoClose = function() return true end},
						},
						{
							szOption = "Thiết lập tùy chọn ",
							{szOption = "Hộp", bMCheck = true, bChecked = BossFaceAlert.Brush.Style == 90, fnAction = function() BossFaceAlert.Brush.Style = 90 end, fnAutoClose = function() return true end},
							{szOption = "Mũi tên", bMCheck = true, bChecked = BossFaceAlert.Brush.Style == 120, fnAction = function() BossFaceAlert.Brush.Style = 120 end, fnAutoClose = function() return true end},
							{szOption = "Đường thẳng (chiều dài giới hạn)", bMCheck = true, bChecked = BossFaceAlert.Brush.Style == 1, fnAction = function() BossFaceAlert.Brush.Style = 1 end, fnAutoClose = function() return true end},
							{szOption = "Vòng tròn (Kích cỡ giới hạn)", bMCheck = true, bChecked = BossFaceAlert.Brush.Style == 30, fnAction = function() BossFaceAlert.Brush.Style = 30 end, fnAutoClose = function() return true end},
							{szOption = "Chèn văn bản (giữ phím Ctrl)", bMCheck = true, bChecked = BossFaceAlert.Brush.Style == "Text", fnAction = function() BossFaceAlert.Brush.Style = "Text";BossFaceAlert.IsCtrlKeyDown = false; end, fnAutoClose = function() return true end},
						},
					-- },
					{
						bDevide = true
					},
				}
		table.insert(tMenuDrawingBoard,BossFaceAlert.GetDrawingBoard())
		table.insert(tMenuDrawingBoard,{bDevide = true})
		table.insert(tMenuDrawingBoard,{
						szOption = "Đồng bộ chiến thuật (1315)", bCheck = true , bChecked = BossFaceAlert.bSyncDrawingBoard,fnAction = function(UserData, bCheck)
							if not bCheck then
								BossFaceAlert.bDrawingBoard = false
								BossFaceAlert.OpenDrawingBoard = nil
								BossFaceAlert.handleShadowDrawingBoard:Clear()
								BossFaceAlert:Message("Đã tắt đồng bộ, bật lên để đồng bộ với leader")
							end
							BossFaceAlert.bSyncDrawingBoard = bCheck
						end,
					})
		local tMenuH3 = {
			szOption = "Module theo dõi",
					{
						szOption = "Module hiển thị hướng",
						{
							szOption = "Mở module hiển thị hướng", bCheck = true, bChecked = BossFaceDirection.bEnable, fnAction = function(UserData, bCheck)
								BossFaceDirection.bEnable = bCheck
								BossFaceDirection.OpenOrClose()
							end,
						},
						{
							szOption = "Hiển thị hướng và khoảng cách mục tiêu", bCheck = true, bChecked = BossFaceDirection.bSelfTargetDirection, fnAction = function(UserData, bCheck)
								BossFaceDirection.bSelfTargetDirection = bCheck
							end,
						},
						{
							szOption = "Hiển thị lập thể", bCheck = true, bChecked = BossFaceDirection.bStereoDistance, fnAction = function(UserData, bCheck)
								BossFaceDirection.bStereoDistance = bCheck
							end,
						},
					},

				{
					bDevide = true
				},
				{
					szOption = "Thiết lập chiều rộng đường nối mục tiêu",
					{szOption = "0", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 0, fnAction = function() BossFaceAlert.nLineWidth = 0 end, fnAutoClose = function() return true end},
					{szOption = "1", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 1, fnAction = function() BossFaceAlert.nLineWidth = 1 end, fnAutoClose = function() return true end},
					{szOption = "2", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 2, fnAction = function() BossFaceAlert.nLineWidth = 2 end, fnAutoClose = function() return true end},
					{szOption = "3", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 3, fnAction = function() BossFaceAlert.nLineWidth = 3 end, fnAutoClose = function() return true end},
					{szOption = "4", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 4, fnAction = function() BossFaceAlert.nLineWidth = 4 end, fnAutoClose = function() return true end},
					{szOption = "5", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 5, fnAction = function() BossFaceAlert.nLineWidth = 5 end, fnAutoClose = function() return true end},
					{szOption = "6", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 6, fnAction = function() BossFaceAlert.nLineWidth = 6 end, fnAutoClose = function() return true end},
					{szOption = "7", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 7, fnAction = function() BossFaceAlert.nLineWidth = 7 end, fnAutoClose = function() return true end},
					{szOption = "8", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 8, fnAction = function() BossFaceAlert.nLineWidth = 8 end, fnAutoClose = function() return true end},
					{szOption = "9", bMCheck = true, bChecked = BossFaceAlert.nLineWidth == 9, fnAction = function() BossFaceAlert.nLineWidth = 9 end, fnAutoClose = function() return true end},
				},
				{
					bDevide = true
				},
				{
					szOption = "Mở đường nối từ bản thân đến mục tiêu", bCheck = true, bChecked = BossFaceAlert.bSelfFaceLine, fnAction = function(UserData, bCheck)
						BossFaceAlert.bSelfFaceLine = bCheck
					end,
					bColorTable = true,
					rgb = {BossFaceAlert.tSelfFaceLineColor.r, BossFaceAlert.tSelfFaceLineColor.g, BossFaceAlert.tSelfFaceLineColor.b,},
					fnChangeColor = function(UserData, r, g, b)
						BossFaceAlert.tSelfFaceLineColor.r = r
						BossFaceAlert.tSelfFaceLineColor.g = g
						BossFaceAlert.tSelfFaceLineColor.b = b
					end,
				},
				{
					szOption = "Mở đường nối từ mục tiêu đến mục tiêu khác", bCheck = true, bChecked = BossFaceAlert.bSelfTargetFaceLine, fnAction = function(UserData, bCheck)
						BossFaceAlert.bSelfTargetFaceLine = bCheck
					end,
					bColorTable = true,
					rgb = {BossFaceAlert.tSelfTargetFaceLineColor.r, BossFaceAlert.tSelfTargetFaceLineColor.g, BossFaceAlert.tSelfTargetFaceLineColor.b,},
					fnChangeColor = function(UserData, r, g, b)
						BossFaceAlert.tSelfTargetFaceLineColor.r = r
						BossFaceAlert.tSelfTargetFaceLineColor.g = g
						BossFaceAlert.tSelfTargetFaceLineColor.b = b
					end,
				},
				{
					szOption = "Độ trong suốt đường nối (" .. tostring(BossFaceAlert.tSelfFaceLineColor.a) .. ")",
					bCheck = false,
					bChecked = false,
					fnAction = function()
						BossFaceAlert.SetColorAlpha(BossFaceAlert.tSelfFaceLineColor)
					end,
				},
				{
					bDevide = true
				},
				{
					szOption = "Hiển thị mũi tên trên đầu ", bCheck = true, bChecked = BossFaceAlert.OOtarget, fnAction = function(UserData, bCheck)
						BossFaceAlert.OOtarget = bCheck
					end,
				},
			}
		local tMenuH4 = {
			szOption = "Xuất và Nhập dữ liệu",
				{
					szOption = "Nhập dữ liệu giám sát (Ghi đè)", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						BossFaceAlert.LoadSettingsNew(true)
					end,
				},
				{
					szOption = "Nhập dữ liệu giám sát (Kết hợp)", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						BossFaceAlert.LoadSettingsNew()
					end,
				},
				{
					bDevide = true
				},
				-- {
					-- szOption = "Xuất dữ liệu giám sát hiện tại", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						-- GetPopupMenu():Hide()
						-- BossFaceAlert.SaveSettingsNew()
					-- end,
				-- },
				{
					szOption = "◆Tùy chỉnh dữ liệu đánh dấu", bCheck = true, bChecked = BossFaceAlert.bOutputIncludePoint, fnAction = function(UserData, bCheck)
						BossFaceAlert.bOutputIncludePoint = bCheck
					end,
				},
				
				{
					bDevide = true
				},
				-- {
					-- szOption = "Xuất dữ liệu điểm đánh dấu", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						-- GetPopupMenu():Hide()
						-- BossFaceAlert.OutputDefinedPointNew()
					-- end,
				-- },
				{
					szOption = "Nhập dữ liệu điểm đánh dấu (Ghi đè)", bCheck = false, bChecked = false, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						BossFaceAlert.LoadDefinedPointNew()
					end,
				},
			}

	table.insert(menu, tMenuH1)	
	table.insert(menu, tMenuH2)
	-- table.insert(menu, tMenuH5)
	-- table.insert(menu, tMenuDrawingBoard)
	table.insert(menu, tMenuH3)
	table.insert(menu, tMenuH4)
	BossFaceAlert.tDefaultSetForAdd.tColor2 = BossFaceAlert.tDefaultSetForAdd.tColor2 or {r = 255,g = 0,b = 0,a = 200,}
	local tMenuDefault = {
		szOption = BossFaceAlert.tDefaultSetForAdd.szName,
	}
	local tMenuDefaultWnd = {
				szOption = "Mở giao diện chính để chỉnh sửa", bCheck = false, bChecked = false, rgb = {255,255,0,}, fnAction = function(UserData, bCheck)
					GetPopupMenu():Hide()
					BossFaceAlertUI.handleIndex = 0
					BossFaceAlertUI.handleRecord = BossFaceAlert.tDefaultSetForAdd
					BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
					BossFaceAlertUI.ShowWnd()
				end,
			}
	local tMenuDefault0 = {
		szOption = "Mở hướng mặt",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bOn,
		fnAction = function()
			BossFaceAlert.tDefaultSetForAdd.bOn = not BossFaceAlert.tDefaultSetForAdd.bOn
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault1 = {
		szOption = "Màu sắc",
		bCheck = false,
		bChecked = false,
		bColorTable = true,
		rgb = {BossFaceAlert.tDefaultSetForAdd.tColor.r, BossFaceAlert.tDefaultSetForAdd.tColor.g, BossFaceAlert.tDefaultSetForAdd.tColor.b,},
		fnChangeColor = function(UserData, r, g, b)
			BossFaceAlert.tDefaultSetForAdd.tColor.r = r
			BossFaceAlert.tDefaultSetForAdd.tColor.g = g
			BossFaceAlert.tDefaultSetForAdd.tColor.b = b
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault12 = {
		szOption = "Độ trong suốt (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.tColor.a) .. ")",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetAlpha(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault2 = {
		szOption = "Góc (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.nAngle) .. " độ)",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetnAngle(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault3 = {
		szOption = "Bán kính (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.nLength) .. " thước)",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetnLength(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault4 = {
		szOption = "Góc lệch (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.nAngleToAdd) .. " độ)",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetnAngleToAdd(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault20 = {
		szOption = "Mở vòng đánh dấu quanh mục tiêu",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bDistanceCircleOn or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bDistanceCircleOn = bCheck
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault202 = {
		szOption = "Mở vòng đánh dấu",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bDistanceCircleOn or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bDistanceCircleOn = bCheck
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault21 = {
		szOption = "Màu sắc",
		bCheck = false,
		bChecked = false,
		bColorTable = true,
		rgb = {BossFaceAlert.tDefaultSetForAdd.tColor2.r or 255, BossFaceAlert.tDefaultSetForAdd.tColor2.g or 0, BossFaceAlert.tDefaultSetForAdd.tColor2.b or 0,},
		fnChangeColor = function(UserData, r, g, b)
			BossFaceAlert.tDefaultSetForAdd.tColor2.r = r
			BossFaceAlert.tDefaultSetForAdd.tColor2.g = g
			BossFaceAlert.tDefaultSetForAdd.tColor2.b = b
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault212 = {
		szOption = "Trong suốt (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.tColor2.a or 200) .. ")",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetAlpha2(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault22 = {
		szOption = "Góc (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.nAngle2 or 360) .. " độ)",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetnAngle2(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault23 = {
		szOption = "Bán kính (Hiện tại: " .. tostring(BossFaceAlert.tDefaultSetForAdd.nLength2 or 3) .. " thước)",
		bCheck = false,
		bChecked = false,
		fnAction = function()
			BossFaceAlert.SetnLength2(BossFaceAlert.tDefaultSetForAdd)
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault501 = {
		szOption = "Tắt tất cả hiển thị của mục tiêu bị đe dọa",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotShowTargetName or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotShowTargetName = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault502 = {
		szOption = "◆Không cảnh báo mật",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotSendWhisperMsg or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotSendWhisperMsg = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault503 = {
		szOption = "◆Không cảnh báo đoàn đội",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotSendRaidMsg or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotSendRaidMsg = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault504 = {
		szOption = "◆Không cảnh báo màu sắc toàn màn hình",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotFlashRedAlarm or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotFlashRedAlarm = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault505 = {
		szOption = "◆Không hiển thị cảnh báo trung tâm",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotOtherFlash or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotOtherFlash = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault506 = {
		szOption = "◆Không hiển thị đường nối nếu không phải là bản thân",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bNotTargetLine or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bNotTargetLine = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault507 = {
		szOption = "Hiển thị tên mục tiêu",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bShowNPCSelfName or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bShowNPCSelfName = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault508 = {
		szOption = "Hiển thị khoảng cách đến bản thân",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bShowNPCDistance or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bShowNPCDistance = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenuDefault509 = {
		szOption = "Cảnh báo đỉnh đầu đồng đội bị đe dọa",
		bCheck = true,
		bChecked = BossFaceAlert.tDefaultSetForAdd.bTimerHeadEnable or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlert.tDefaultSetForAdd.bTimerHeadEnable = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	table.insert(tMenuDefault, tMenuDefaultWnd)
	table.insert(tMenuDefault, {bDevide = true} )
	table.insert(tMenuDefault, tMenuDefault0)
	table.insert(tMenuDefault, {bDevide = true} )
	table.insert(tMenuDefault, tMenuDefault1)
	table.insert(tMenuDefault, tMenuDefault12)
	table.insert(tMenuDefault, {bDevide = true} )
	table.insert(tMenuDefault, tMenuDefault2)
	table.insert(tMenuDefault, tMenuDefault3)
	table.insert(tMenuDefault, tMenuDefault4)
	table.insert(tMenuDefault, {bDevide = true} )
		table.insert(tMenuDefault20, tMenuDefault202)
		table.insert(tMenuDefault20, {bDevide = true} )			
		table.insert(tMenuDefault20, tMenuDefault21)
		table.insert(tMenuDefault20, tMenuDefault212)
		table.insert(tMenuDefault20, {bDevide = true} )
		table.insert(tMenuDefault20, tMenuDefault22)
		table.insert(tMenuDefault20, tMenuDefault23)
	table.insert(tMenuDefault, tMenuDefault20)
	table.insert(tMenuDefault, {bDevide = true} )	
		table.insert(tMenuDefault, tMenuDefault507)
		table.insert(tMenuDefault, tMenuDefault508)
		table.insert(tMenuDefault, {bDevide = true} )
		table.insert(tMenuDefault, tMenuDefault501)
		table.insert(tMenuDefault, tMenuDefault506)
		table.insert(tMenuDefault, tMenuDefault502)
		table.insert(tMenuDefault, tMenuDefault503)
		table.insert(tMenuDefault, tMenuDefault504)
		table.insert(tMenuDefault, tMenuDefault505)
		table.insert(tMenuDefault, tMenuDefault509)
	table.insert(menu, tMenuDefault)
	table.insert(menu, {bDevide = true})
	
	local tDefinedPointMenu = {szOption = "Đánh dấu tự thiết lập",
				bCheck = true,
				bChecked = BossFaceAlert.bDefinedPointCircleEnable,
				rgb = {255,0,0,},
				fnAction = function(UserData, bCheck)
					BossFaceAlert.bDefinedPointCircleEnable = bCheck
					BossFaceAlert.ClearAllItem()
				end,
				fnAutoClose = function() return true end}
	
	local tPointClassMenu = {}
	for iClass = 1,#BossFaceAlert.PointClassNameInfo do
		local tMenuColor = BossFaceAlert.PointClassNameInfo[iClass].tMenuColor or {
					["r"] = 0,
					["g"] = 255,
					["b"] = 0,
				}
		tPointClassMenu[iClass] = 
		{
			szOption = BossFaceAlert.PointClassNameInfo[iClass].szName,
			bCheck = true,
			bChecked = BossFaceAlert.PointClassNameInfo[iClass].bOn,
			rgb = {tMenuColor.r, tMenuColor.g, tMenuColor.b,},
			fnAction = function(UserData, bCheck)
				BossFaceAlert.PointClassNameInfo[iClass].bOn = bCheck
				for i = 1, #BossFaceAlert.tDefinedPoint, 1 do
					if BossFaceAlert.tDefinedPoint[i].nFaceClass and BossFaceAlert.tDefinedPoint[i].nFaceClass == iClass then
						BossFaceAlert.tDefinedPoint[i].bOn = BossFaceAlert.PointClassNameInfo[iClass].bOn
						BossFaceAlert.ClearAllItem()
					end
				end
			end,
			[1] = {
				szOption = tostring(iClass) .. "-" .. BossFaceAlert.PointClassNameInfo[iClass].szName,
				bCheck = false,
				bChecked = false,
				bDisable = true
			},			
			[2] = {
				szOption = "☆Sửa  tên☆",
				bCheck = false,
				bChecked = false,
				rgb = {tMenuColor.r, tMenuColor.g, tMenuColor.b,},
				bColorTable = true,
				fnChangeColor = function(UserData, r, g, b)
					BossFaceAlert.PointClassNameInfo[iClass].tMenuColor = {}
					BossFaceAlert.PointClassNameInfo[iClass].tMenuColor.r = r
					BossFaceAlert.PointClassNameInfo[iClass].tMenuColor.g = g
					BossFaceAlert.PointClassNameInfo[iClass].tMenuColor.b = b
				end,
				fnAction = function()
					BossFaceAlert.SetNewName(BossFaceAlert.PointClassNameInfo[iClass])
				end,
			},
			[3]	= {
				szOption = "Xóa toàn bộ dữ liệu trong [Nhóm]",
				rgb = {255,0,0,},
				fnAction = function()
					GetPopupMenu():Hide()
					BossFaceAlert.ToDeleteClassAndDataSure(iClass,BossFaceAlert.PointClassNameInfo,BossFaceAlert.tDefinedPoint)
					BossFaceAlert.ClearAllItem()
				end
			},
			[4] = {
				szOption = "Di chuyển tất cả dữ liệu trong mục này",rgb = {255,128,70,}
			},
			[5] = {
				bDevide = true
			},
		}
		for iClass2 = 1,#BossFaceAlert.PointClassNameInfo do
			local tMenuOfSetClassSub = {
				szOption = BossFaceAlert.PointClassNameInfo[iClass2].szName,
				fnAction = function()
					GetPopupMenu():Hide()
					BossFaceAlert.SetAllClass(iClass,iClass2,BossFaceAlert.PointClassNameInfo,BossFaceAlert.tDefinedPoint)
				end
			}
			table.insert(tPointClassMenu[iClass][4],tMenuOfSetClassSub)
		end
		table.insert(tDefinedPointMenu, tPointClassMenu[iClass])
		table.insert(tDefinedPointMenu, {bDevide = true})
	end
	local nPointCountNum = #BossFaceAlert.tDefinedPoint
	for pi = 1, nPointCountNum, 1 do
		local tPointMenu = {
			szOption = BossFaceAlert.tDefinedPoint[pi].szName,
			bCheck = true,
			bChecked = BossFaceAlert.tDefinedPoint[pi].bOn,
			fnAction = function()
				BossFaceAlert.tDefinedPoint[pi].bOn = not BossFaceAlert.tDefinedPoint[pi].bOn
				BossFaceAlert.ClearAllItem()
			end,
			fnAutoClose = function() return true end}
		local tPointMenu01 = {
			szOption = "Sửa tên",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetNewName(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu1 = {
			szOption = "Màu sắc",
			bCheck = false,
			bChecked = false,
			bColorTable = true,
			rgb = {BossFaceAlert.tDefinedPoint[pi].tColor.r, BossFaceAlert.tDefinedPoint[pi].tColor.g, BossFaceAlert.tDefinedPoint[pi].tColor.b,},
			fnChangeColor = function(UserData, r, g, b)
				BossFaceAlert.tDefinedPoint[pi].tColor.r = r
				BossFaceAlert.tDefinedPoint[pi].tColor.g = g
				BossFaceAlert.tDefinedPoint[pi].tColor.b = b
			end,
			fnAutoClose = function() return true end}
		local tPointMenu12 = {
			szOption = "Độ trong suốt (Hiện tại: " .. tostring(BossFaceAlert.tDefinedPoint[pi].tColor.a) .. ")",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetAlpha(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu2 = {
			szOption = "Góc (Hiện tại: " .. tostring(BossFaceAlert.tDefinedPoint[pi].nAngle) .. " độ)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnAngle(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu3 = {
			szOption = "Bán kính (Hiện tại: " .. tostring(BossFaceAlert.tDefinedPoint[pi].nLength) .. " thước)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnLength(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu3_1 = {
			szOption = "Góc lệch (Hiện tại: " .. tostring(BossFaceAlert.tDefinedPoint[pi].nAngleToAdd) .. " độ)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnAngleToAdd(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu4 = {
			szOption = "Bản đồ (" .. tostring(BossFaceAlert.tDefinedPoint[pi].szMapName or "nhấn vào để nhập") .. ")",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetMapName(BossFaceAlert.tDefinedPoint[pi])
			end,
			fnAutoClose = function() return true end}
		local tPointMenu402 = {
			szOption = "◆Chỉ tạo đánh dấu trong bản đồ phù hợp",
			bCheck = true,
			bChecked = not BossFaceAlert.tDefinedPoint[pi].bNotMapMatchNeed,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.tDefinedPoint[pi].bNotMapMatchNeed = not bCheck
				BossFaceAlert.ClearAllItem()
			end,
			fnAutoClose = function() return true end}
		local tPointMenu507 = {
			szOption = "Tự thêm tên của đánh dấu",
			bCheck = true,
			bChecked = BossFaceAlert.tDefinedPoint[pi].bShowPointName or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.tDefinedPoint[pi].bShowPointName = bCheck
			end,
			fnAutoClose = function() return true end}
		local tPointMenu508 = {
			szOption = "◆Hiển thị khoảng cách",
			bCheck = true,
			bChecked = BossFaceAlert.tDefinedPoint[pi].bShowNPCDistance or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.tDefinedPoint[pi].bShowNPCDistance = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tPointMenu500 = {
			szOption = "Mô tả: "  .. (BossFaceAlert.tDefinedPoint[pi].szDescription or "(Nhấn vào đây để ghi chú)"),
			bCheck = false,
			bChecked = false,
			r = 210, g = 210, b = 210,
			fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				BossFaceAlert.SetDescription(BossFaceAlert.tDefinedPoint[pi])
			end,
		}
		local tMenuOfSetPointClass = BossFaceAlert.Options.SetClass(BossFaceAlert.PointClassNameInfo,BossFaceAlert.tDefinedPoint[pi])
		
		
		
		local tPointMenu6_0 = RaidGrid_EventScrutiny.SyncOptions(BossFaceAlert.tDefinedPoint[pi],"tDefinedPoint")
		local tPointMenu6 = {
			szOption = "Xóa dữ liệu mới nhập ",rgb = {255,0,0},
			fnAction = function()
				table.remove(BossFaceAlert.tDefinedPoint, pi)
				BossFaceAlert.ClearAllItem()
			end}
		table.insert(tPointMenu, tPointMenu01)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu1)
		table.insert(tPointMenu, tPointMenu12)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu2)
		table.insert(tPointMenu, tPointMenu3)
		table.insert(tPointMenu, tPointMenu3_1)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu507)
		table.insert(tPointMenu, tPointMenu508)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu4)
		table.insert(tPointMenu, tPointMenu402)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu500)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tMenuOfSetPointClass)
		-- table.insert(tPointMenu, {bDevide = true} )
		-- table.insert(tPointMenu, tPointMenu6_0)
		table.insert(tPointMenu, {bDevide = true} )
		table.insert(tPointMenu, tPointMenu6)
		if BossFaceAlert.tDefinedPoint[pi].nFaceClass and BossFaceAlert.tDefinedPoint[pi].nFaceClass <= #BossFaceAlert.PointClassNameInfo then
			table.insert(tPointClassMenu[BossFaceAlert.tDefinedPoint[pi].nFaceClass], tPointMenu)
		else
			table.insert(tDefinedPointMenu, tPointMenu)
		end
	end
	local tMenuAddPointClass = {
		szOption = "Thêm [Nhóm]",
		fnAction = function()
			GetUserInput("Tên [Nhóm]: ", function(szText)
				if not szText or szText == "" then
					return
				end
				table.insert(BossFaceAlert.PointClassNameInfo,{szName = szText, bOn = true,})
			end, nil, nil, nil, nil)
		end}
	table.insert(tDefinedPointMenu, {bDevide = true})
	table.insert(tDefinedPointMenu, tMenuAddPointClass)
	local tMenuAddPoint = {
		szOption = "Thêm đánh dấu ở vị trí hiện tại",
		fnAction = function()
			GetUserInput("Tên đánh dấu: ", function(szText) BossFaceAlert.AddPoint(szText) end, nil, nil,nil,GetCurrentTime())
		end}
	table.insert(tDefinedPointMenu, {bDevide = true})
	table.insert(tDefinedPointMenu, tMenuAddPoint)
	table.insert(menu, tDefinedPointMenu)
	table.insert(menu, {bDevide = true})
	
	local nDataCountNum = #BossFaceAlert.DrawFaceLineNames
	
	local tFaceClassMenu = {}
	for iClass = 1,#BossFaceAlert.FaceClassNameInfo do
		local tMenuColor = BossFaceAlert.FaceClassNameInfo[iClass].tMenuColor or {
					["r"] = 0,
					["g"] = 255,
					["b"] = 0,
				}
		tFaceClassMenu[iClass] = 
		{
			szOption = BossFaceAlert.FaceClassNameInfo[iClass].szName,
			bCheck = true,
			bChecked = BossFaceAlert.FaceClassNameInfo[iClass].bOn,
			rgb = {tMenuColor.r, tMenuColor.g, tMenuColor.b,},
			fnAction = function(UserData, bCheck)
				BossFaceAlert.FaceClassNameInfo[iClass].bOn = bCheck
				for i = 1, nDataCountNum, 1 do
					if BossFaceAlert.DrawFaceLineNames[i].nFaceClass and BossFaceAlert.DrawFaceLineNames[i].nFaceClass == iClass then
						BossFaceAlert.DrawFaceLineNames[i].bAllDisable = not BossFaceAlert.FaceClassNameInfo[iClass].bOn
					end
				end
				BossFaceAlert.ClearAllItem()
			end,
			[1] = {
				szOption = tostring(iClass) .. "-" .. BossFaceAlert.FaceClassNameInfo[iClass].szName,
				bCheck = false,
				bChecked = false,
				bDisable = true
			},			
			[2] = {
				szOption = "Sửa tên",
				bCheck = false,
				bChecked = false,
				rgb = {tMenuColor.r, tMenuColor.g, tMenuColor.b,},
				bColorTable = true,
				fnChangeColor = function(UserData, r, g, b)
					BossFaceAlert.FaceClassNameInfo[iClass].tMenuColor = {}
					BossFaceAlert.FaceClassNameInfo[iClass].tMenuColor.r = r
					BossFaceAlert.FaceClassNameInfo[iClass].tMenuColor.g = g
					BossFaceAlert.FaceClassNameInfo[iClass].tMenuColor.b = b
				end,
				fnAction = function()
					BossFaceAlert.SetNewName(BossFaceAlert.FaceClassNameInfo[iClass])
				end,
			},
			[3] = {bDevide = true},
		}
		if BossFaceAlert.FaceClassNameInfo[iClass].bOn then
			table.insert(menu, tFaceClassMenu[iClass])
			table.insert(menu, {bDevide = true})
		end
	end
	
	local nMoreDataCountNum = 0
	
	for i = 1, nDataCountNum, 1 do
		if not BossFaceAlert.DrawFaceLineNames[i].nFaceClass or BossFaceAlert.DrawFaceLineNames[i].nFaceClass > #BossFaceAlert.FaceClassNameInfo then
			nMoreDataCountNum = nMoreDataCountNum + 1
		end
	end
	
	local nMenuMoreNum = math.ceil(nMoreDataCountNum / BossFaceAlert.nMaxMenuListCountOfData) - 1
	local tMenuMore = {}

	if nMenuMoreNum == 1 then
		tMenuMore[1] = {szOption = "<<Nhiều hơn>>",}
	elseif nMenuMoreNum > 1 then
		for nMenuMoreNumi = 1,nMenuMoreNum,1 do
			tMenuMore[nMenuMoreNumi] = {szOption = "<<Nhiều hơn" .. tostring(nMenuMoreNumi) .. ">>",}
		end
	end
	
	local nMoreDataCount = 0

	for i = 1, nDataCountNum, 1 do
		BossFaceAlert.DrawFaceLineNames[i].tColor2 = BossFaceAlert.DrawFaceLineNames[i].tColor2 or {r = 255,g = 0,b = 0,a = 200,}
		local szShowName = BossFaceAlert.DrawFaceLineNames[i].szName
		if BossFaceAlert.DrawFaceLineNames[i].bShowDescriptionName then
			if BossFaceAlert.DrawFaceLineNames[i].szDescription and BossFaceAlert.DrawFaceLineNames[i].szDescription ~= "" then
				szShowName = BossFaceAlert.DrawFaceLineNames[i].szDescription
			end
		end
		local tMenu = {
			szOption = szShowName,
			bCheck = true,
			bChecked = not BossFaceAlert.DrawFaceLineNames[i].bAllDisable,
			fnAction = function()
				BossFaceAlert.DrawFaceLineNames[i].bAllDisable = not BossFaceAlert.DrawFaceLineNames[i].bAllDisable
				BossFaceAlert.ClearAllItem()
			end,
			fnAutoClose = function() return true end}
		local tMenuWnd = {
					szOption = "Mở giao diện chính để chỉnh sửa", bCheck = false, bChecked = false, rgb = {255,255,0,}, fnAction = function(UserData, bCheck)
						GetPopupMenu():Hide()
						BossFaceAlertUI.handleIndex = i
						BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[i]
						BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
						BossFaceAlertUI.ShowWnd()
					end,
				}
		local tMenu102 = {
			szOption = "Mở hướng mặt",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bOn or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bOn = bCheck
				BossFaceAlert.ClearAllItem()
			end,
			fnAutoClose = function() return true end}
		local tMenu0 = {
			szOption = "Tự động thêm Event",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bAutoAddOn or false,
			fnAction = function()
				BossFaceAlert.DrawFaceLineNames[i].bAutoAddOn = not BossFaceAlert.DrawFaceLineNames[i].bAutoAddOn
			end,
			fnAutoClose = function() return true end}
		local tMenu01 = {
			szOption = "Sửa tên",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetNewName(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu1 = {
			szOption = "Màu sắc",
			bCheck = false,
			bChecked = false,
			bColorTable = true,
			rgb = {BossFaceAlert.DrawFaceLineNames[i].tColor.r, BossFaceAlert.DrawFaceLineNames[i].tColor.g, BossFaceAlert.DrawFaceLineNames[i].tColor.b,},
			fnChangeColor = function(UserData, r, g, b)
				BossFaceAlert.DrawFaceLineNames[i].tColor.r = r
				BossFaceAlert.DrawFaceLineNames[i].tColor.g = g
				BossFaceAlert.DrawFaceLineNames[i].tColor.b = b
			end,
			fnAutoClose = function() return true end}
		local tMenu12 = {
			szOption = "Trong suốt (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].tColor.a) .. ")",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetAlpha(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu2 = {
			szOption = "Góc (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].nAngle) .. " độ)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnAngle(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu3 = {
			szOption = "Bán kính (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].nLength) .. " thước)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnLength(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu4 = {
			szOption = "Góc lệch (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].nAngleToAdd) .. " độ)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnAngleToAdd(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu507 = {
			szOption = "Hiển thị tên các mục tiêu riêng của bản thân",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bShowNPCSelfName or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bShowNPCSelfName = bCheck or nil
			end,
			fnAutoClose = function() return true end}
			
		local tMenu508 = {
			szOption = "◆Hiện thị khoảng cách",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bShowNPCDistance or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bShowNPCDistance = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu5007 = {
			szOption = "◆Hiện thông báo tên trên màn hình",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bShowDescriptionName or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bShowDescriptionName = bCheck or nil
			end,
			fnAutoClose = function() return true end}

			
			
		local tMenu401 = {
			szOption = "Chỉ hiển thị hướng mặt của kẻ địch",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bShowEnemyCircleOnly or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bShowEnemyCircleOnly = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu501 = {
			szOption = "Tắt tất cả hiển thị của mục tiêu bị đe dọa",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotShowTargetName or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotShowTargetName = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu502 = {
			szOption = "◆Không cảnh báo mật",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotSendWhisperMsg or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotSendWhisperMsg = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu503 = {
			szOption = "◆Không cảnh báo đoàn đội",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotSendRaidMsg or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotSendRaidMsg = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu504 = {
			szOption = "◆Không cảnh báo màu sắc toàn màn hình",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotFlashRedAlarm or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotFlashRedAlarm = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu505 = {
			szOption = "Không hiển thị cảnh báo trung tâm",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotOtherFlash or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotOtherFlash = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu506 = {
			szOption = "Không hiển thị đường nối nếu không phải là bản thân",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bNotTargetLine or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bNotTargetLine = bCheck or nil
			end,
			fnAutoClose = function() return true end}

		local tMenu509 = {
			szOption = "Cảnh báo đỉnh đầu đồng đội bị đe dọa",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bTimerHeadEnable or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bTimerHeadEnable = bCheck or nil
			end,
			fnAutoClose = function() return true end}
		local tMenu500 = {
			szOption = "Mô tả: "  .. (BossFaceAlert.DrawFaceLineNames[i].szDescription or "(Nhấn vào đây để thêm)"),
			bCheck = false,
			bChecked = false,
			r = 210, g = 210, b = 210,
			fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				BossFaceAlert.SetDescription(BossFaceAlert.DrawFaceLineNames[i])
			end,
		}

		local tMenuOfSetClass = BossFaceAlert.Options.SetClass(BossFaceAlert.FaceClassNameInfo,BossFaceAlert.DrawFaceLineNames[i])

		
		local tMenu5 = {
			szOption = "Sao chép mục này",
			fnAction = function()
				if IsCtrlKeyDown() then
					GetUserInput("Tên sau khi sao chép:", function(szText) BossFaceAlert.AddListByCopy(BossFaceAlert.DrawFaceLineNames[i], szText);BossFaceAlert.RestartFaceCircle() end, nil, nil, nil, nil)
				else
					local tRecordToClone = clone(BossFaceAlert.DrawFaceLineNames[i])
					BossFaceAlertUI.Btn_New(tRecordToClone)
					BossFaceAlertUI.ShowWnd()
				end
			end}
		local tMenu6_0 = RaidGrid_EventScrutiny.SyncOptions(BossFaceAlert.DrawFaceLineNames[i],"DrawFaceLineNames")
		local tMenu6 = {
			szOption = "Xóa mục hiện tại",rgb = {255,0,0},
			fnAction = function()
				table.remove(BossFaceAlert.DrawFaceLineNames, i)
				if BossFaceAlertUI.handleIndex == i then
					if #BossFaceAlert.DrawFaceLineNames >= i then
						BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
					elseif #BossFaceAlert.DrawFaceLineNames > 0 then
						BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames
						BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
					else
						BossFaceAlertUI.handleIndex = 0
						BossFaceAlertUI.handleRecord = BossFaceAlert.tDefaultSetForAdd
					end
					BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
				end
				BossFaceAlert.RestartFaceCircle()
				BossFaceAlert.ClearAllItem()
			end}
		local tMenu7 = {
			szOption = "Di chuyển mục này lên", bCheck = false, bChecked = false, bDisable = not BossFaceAlert.DrawFaceLineNames[i - 1], fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				if IsCtrlKeyDown() then
					BossFaceAlert.ToMoveIndexUp(i)
				else
					BossFaceAlert.DrawFaceLineNames[i], BossFaceAlert.DrawFaceLineNames[i - 1] = BossFaceAlert.DrawFaceLineNames[i - 1], BossFaceAlert.DrawFaceLineNames[i]
				end
			end,
		}
		local tMenu8 = {
			szOption = "Di chuyển mục này xuống", bCheck = false, bChecked = false, bDisable = not BossFaceAlert.DrawFaceLineNames[i + 1], fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				if IsCtrlKeyDown() then
					BossFaceAlert.ToMoveIndexDown(i)
				else
					BossFaceAlert.DrawFaceLineNames[i], BossFaceAlert.DrawFaceLineNames[i + 1] = BossFaceAlert.DrawFaceLineNames[i + 1], BossFaceAlert.DrawFaceLineNames[i]
				end
			end,
		}
		local tMenu20 = {
			szOption = "Mở vòng đánh dấu quanh mục tiêu",
			bCheck = true,
			bChecked = BossFaceAlert.DrawFaceLineNames[i].bDistanceCircleOn or false,
			fnAction = function(UserData, bCheck)
				BossFaceAlert.DrawFaceLineNames[i].bDistanceCircleOn = bCheck
				BossFaceAlert.ClearAllItem()
			end,
			fnAutoClose = function() return true end}
		local tMenu21 = {
			szOption = "Màu sắc",
			bCheck = false,
			bChecked = false,
			bColorTable = true,
			rgb = {BossFaceAlert.DrawFaceLineNames[i].tColor2.r or 255, BossFaceAlert.DrawFaceLineNames[i].tColor2.g or 0, BossFaceAlert.DrawFaceLineNames[i].tColor2.b or 0,},
			fnChangeColor = function(UserData, r, g, b)
				BossFaceAlert.DrawFaceLineNames[i].tColor2.r = r
				BossFaceAlert.DrawFaceLineNames[i].tColor2.g = g
				BossFaceAlert.DrawFaceLineNames[i].tColor2.b = b
			end,
			fnAutoClose = function() return true end}
		local tMenu212 = {
			szOption = "Trong suốt (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].tColor2.a or 200) .. ")",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetAlpha2(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu22 = {
			szOption = "Góc (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].nAngle2 or 360) .. " độ)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnAngle2(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		local tMenu23 = {
			szOption = "Bán kính (Hiện tại: " .. tostring(BossFaceAlert.DrawFaceLineNames[i].nLength2 or 3) .. " thước)",
			bCheck = false,
			bChecked = false,
			fnAction = function()
				BossFaceAlert.SetnLength2(BossFaceAlert.DrawFaceLineNames[i])
			end,
			fnAutoClose = function() return true end}
		table.insert(tMenu, tMenuWnd)
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, {szOption = "["  .. tostring(i) .. "-" .. BossFaceAlert.DrawFaceLineNames[i].szName .. "]", bCheck = false, bChecked = false, bDisable = true} )
		table.insert(tMenu, tMenu01)
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenu102)
		table.insert(tMenu102, {szOption = "1- Hướng mặt", bCheck = false, bChecked = false, bDisable = true} )

		table.insert(tMenu102, {bDevide = true} )
		table.insert(tMenu102, tMenu1)
		table.insert(tMenu102, tMenu12)
		table.insert(tMenu102, {bDevide = true} )
		table.insert(tMenu102, tMenu2)
		table.insert(tMenu102, tMenu3)
		table.insert(tMenu102, tMenu4)
			table.insert(tMenu20, {szOption = "2- Vòng đánh dấu:", bCheck = false, bChecked = false, bDisable = true} )
			table.insert(tMenu20, {bDevide = true} )			
			table.insert(tMenu20, tMenu21)
			table.insert(tMenu20, tMenu212)
			table.insert(tMenu20, {bDevide = true} )
			table.insert(tMenu20, tMenu22)
			table.insert(tMenu20, tMenu23)
		table.insert(tMenu, tMenu20)
		table.insert(tMenu, {bDevide = true} )
		if BossFaceAlert.DrawFaceLineNames[i].szName == "Target" or BossFaceAlert.DrawFaceLineNames[i].szName == "Mục tiêu hiện tại" then
			table.insert(tMenu, tMenu401)
			table.insert(tMenu, tMenu501)
			
			table.insert(tMenu, {bDevide = true} )
		elseif BossFaceAlert.DrawFaceLineNames[i].szName ~= "Self" and BossFaceAlert.DrawFaceLineNames[i].szName ~= "Bản thân" then
			table.insert(tMenu, tMenu507)
			table.insert(tMenu507, tMenu508)
			table.insert(tMenu507, tMenu5007)
			table.insert(tMenu, {bDevide = true} )
			table.insert(tMenu, tMenu501)
			table.insert(tMenu, tMenu506)
			--table.insert(tMenu, {bDevide = true} )
			table.insert(tMenu, tMenu502)
			table.insert(tMenu, tMenu503)
			--table.insert(tMenu, {bDevide = true} )
			table.insert(tMenu, tMenu504)
			table.insert(tMenu, tMenu505)
			table.insert(tMenu, tMenu509)
			
			table.insert(tMenu, {bDevide = true} )
		end
		table.insert(tMenu, tMenu500)
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenuOfSetClass)
		table.insert(tMenu, {bDevide = true} )
		-- table.insert(tMenu, tMenu6_0)
		table.insert(tMenu, tMenu5)
		table.insert(tMenu, tMenu6)
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenu7)
		table.insert(tMenu, tMenu8)
		
		if BossFaceAlert.DrawFaceLineNames[i].nFaceClass and BossFaceAlert.DrawFaceLineNames[i].nFaceClass <= #BossFaceAlert.FaceClassNameInfo then
			table.insert(tFaceClassMenu[BossFaceAlert.DrawFaceLineNames[i].nFaceClass], tMenu)
		else
			nMoreDataCount = nMoreDataCount + 1
			if  nMoreDataCount <= BossFaceAlert.nMaxMenuListCountOfData then
				table.insert(menu, tMenu)
			else
				local nMenuMoreNumTemp = math.ceil(nMoreDataCount / BossFaceAlert.nMaxMenuListCountOfData) - 1
				table.insert(tMenuMore[nMenuMoreNumTemp], tMenu)
			end
		end

	end
	if nMoreDataCountNum > BossFaceAlert.nMaxMenuListCountOfData then
		for nMenuMoreNumi = 1,nMenuMoreNum,1 do
			table.insert(menu, {bDevide = true})
			table.insert(menu, tMenuMore[nMenuMoreNumi])
		end
	end
	if nMoreDataCountNum > 0 then
		table.insert(menu, {bDevide = true})
	end
	local tMenuSetClass = {
		szOption = "Quản lý [Nhóm]",
	}
	for jClass = 1,#tFaceClassMenu do
		local tMenuDeleteClass = {
			szOption = "Xóa [Nhóm] cùng số liệu liên quan",
			rgb = {255,0,0,},
			fnAction = function()
				GetPopupMenu():Hide()
				BossFaceAlert.ToDeleteClassAndDataSure(jClass,BossFaceAlert.FaceClassNameInfo,BossFaceAlert.DrawFaceLineNames)
				BossFaceAlert.ClearAllItem()
			end}
		local tMenuMoveClassUp = {
			szOption = "Di chuyển [Nhóm] lên", bCheck = false, bChecked = false, bDisable = not BossFaceAlert.FaceClassNameInfo[jClass - 1], fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				for iUp = #BossFaceAlert.DrawFaceLineNames, 1, -1 do
					if BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass then
						if BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass == jClass then
							BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass = BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass - 1
						elseif BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass == jClass - 1 then
							BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass = BossFaceAlert.DrawFaceLineNames[iUp].nFaceClass + 1
						end
					end
				end
				BossFaceAlert.FaceClassNameInfo[jClass], BossFaceAlert.FaceClassNameInfo[jClass - 1] = BossFaceAlert.FaceClassNameInfo[jClass - 1], BossFaceAlert.FaceClassNameInfo[jClass]
			end,
		}
		local tMenuMoveClassDown = {
			szOption = "Di chuyển [Nhóm] xuống", bCheck = false, bChecked = false, bDisable = not BossFaceAlert.FaceClassNameInfo[jClass + 1], fnAction = function(UserData, bCheck)
				GetPopupMenu():Hide()
				for iDown = #BossFaceAlert.DrawFaceLineNames, 1, -1 do
					if BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass then
						if BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass == jClass then
							BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass = BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass + 1
						elseif BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass == jClass + 1 then
							BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass = BossFaceAlert.DrawFaceLineNames[iDown].nFaceClass - 1
						end
					end
				end
				BossFaceAlert.FaceClassNameInfo[jClass], BossFaceAlert.FaceClassNameInfo[jClass + 1] = BossFaceAlert.FaceClassNameInfo[jClass + 1], BossFaceAlert.FaceClassNameInfo[jClass]
			end,
		}
		local tMenuAddByClass = {
			szOption = "Thêm giám sát",
			fnAction = function()
				if IsCtrlKeyDown() then
					GetUserInput("Tên giám sát", function(szText) BossFaceAlert.AddListByClass(jClass, szText);BossFaceAlert.RestartFaceCircle() end, nil, nil, nil, nil)
				else
					BossFaceAlertUI.Btn_New(nil, nil, jClass)
					BossFaceAlertUI.ShowWnd()
				end
			end}
			
		local tMenuOfSetClass = {
			szOption = "Thay đổi tùy chọn [Nhóm]",rgb = {255,128,70,}
		}
		for jClass2 = 1,#BossFaceAlert.FaceClassNameInfo do
			local tMenuOfSetClassSub = {
				szOption = BossFaceAlert.FaceClassNameInfo[jClass2].szName,
				fnAction = function()
					GetPopupMenu():Hide()
					BossFaceAlert.SetAllClass(jClass,jClass2,BossFaceAlert.FaceClassNameInfo,BossFaceAlert.DrawFaceLineNames)
				end
			}
			table.insert(tMenuOfSetClass, tMenuOfSetClassSub)
		end
			
		table.insert(tFaceClassMenu[jClass], {bDevide = true})
		table.insert(tFaceClassMenu[jClass], tMenuOfSetClass)
		table.insert(tFaceClassMenu[jClass], tMenuDeleteClass)
		table.insert(tFaceClassMenu[jClass], {bDevide = true})
		table.insert(tFaceClassMenu[jClass], tMenuMoveClassUp)
		table.insert(tFaceClassMenu[jClass], tMenuMoveClassDown)
		table.insert(tFaceClassMenu[jClass], {bDevide = true})
		table.insert(tFaceClassMenu[jClass], tMenuAddByClass)
		table.insert(tMenuSetClass, tFaceClassMenu[jClass])
	end
	local tMenuAddClass = {
		szOption = "Thêm [Nhóm]",
		fnAction = function()
			GetUserInput("Tên [Nhóm]", function(szText)
				if not szText or szText == "" then
					return
				end
				table.insert(BossFaceAlert.FaceClassNameInfo,{szName = szText, bOn = true,})
			end, nil, nil, nil, nil)
		end}
	table.insert(tMenuSetClass, {bDevide = true})
	table.insert(tMenuSetClass, tMenuAddClass)	
	table.insert(menu, tMenuSetClass)
	table.insert(menu, {bDevide = true})
	local tMenuAdd = {
		szOption = "Thêm giám sát",
		fnAction = function()
			if IsCtrlKeyDown() then
				GetUserInput("Tên giám sát: ", function(szText) BossFaceAlert.AddList(szText);BossFaceAlert.RestartFaceCircle() end, nil, nil, nil, nil)
			else
				BossFaceAlertUI.Btn_New()
				BossFaceAlertUI.ShowWnd()
			end
		end}
	table.insert(menu, tMenuAdd)
	return menu
end

function BossFaceAlert.PopupMenu()
	local tOptions = BossFaceAlert.GetMenuList()
	local nX, nY = Cursor.GetPos(true)
	tOptions.x, tOptions.y = nX + 15, nY + 15
	PopupMenu(tOptions)
end
BossFaceAlert.Options = {}
function BossFaceAlert.Options.SetClass(tAllClass,tData)
	local tab = {szOption = "Thay đổi thiết lập [Nhóm]",rgb = {75,255,200}}
	for jClass = 1,#tAllClass do
		local tMenuOfSetPointClassSub = {
			szOption = tAllClass[jClass].szName,
			bMCheck = true,
			bChecked = tData.nFaceClass == jClass,
			fnAction = function()
				tData.nFaceClass = jClass
			end,
			fnAutoClose = function() return true end,
		}
		table.insert(tab,tMenuOfSetPointClassSub)
	end
	local tMenuOfSetPointClassSub2 = {
		szOption = "Không nằm trong [Nhóm] nào",
		bMCheck = true,
		bChecked = tData.nFaceClass == nil,
		fnAction = function()
			tData.nFaceClass = nil
		end,
		fnAutoClose = function() return true end,
	}
	table.insert(tab,tMenuOfSetPointClassSub2)
	return tab
end

function BossFaceAlert.GetRecordMenuList()
	local tMenu = {szOption = "Thiết lập mở rộng",}
	local tMenu2 = {
		szOption = "Chỉ hiện hướng mặt với các mục tiêu kẻ địch",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bShowEnemyCircleOnly or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bShowEnemyCircleOnly = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu3 = {
		szOption = "Dưới đây là thiết lập mục tiêu giám sát",
		bCheck = false,
		bChecked = false,
		bDisable = true,
	}
	local tMenu4 = {
		szOption = "Không cảnh báo mật",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bNotSendWhisperMsg or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bNotSendWhisperMsg = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu5 = {
		szOption = "Không cảnh báo đoàn đội",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bNotSendRaidMsg or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bNotSendRaidMsg = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu6 = {
		szOption = "Không cảnh báo màu sắc toàn màn hình và văn bản trung tâm",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bNotFlashRedAlarm or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bNotFlashRedAlarm = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu7 = {
		szOption = "Không hiển thị cảnh báo trung tâm",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bNotOtherFlash or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bNotOtherFlash = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu8 = {
		szOption = "Không hiển thị đường nối mục tiêu",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bNotTargetLine or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bNotTargetLine = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu9 = {
		szOption = "Hiện thị tên mục tiêu",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bShowNPCSelfName or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bShowNPCSelfName = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu10 = {
		szOption = "Hiện thị khoảng cách",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bShowNPCDistance or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bShowNPCDistance = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu11 = {
		szOption = "◆Hiển thị cảnh báo đỉnh đầu đồng đội bị đe dọa",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bTimerHeadEnable or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bTimerHeadEnable = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu12 = {
		szOption = "Hiện thị mô tả mục tiêu thay cho thông báo tên",
		bCheck = true,
		bChecked = BossFaceAlertUI.handleRecord.bShowDescriptionName or false,
		fnAction = function(UserData, bCheck)
			BossFaceAlertUI.handleRecord.bShowDescriptionName = bCheck or nil
		end,
		fnAutoClose = function() return true end}
	local tMenu121 = {szOption = "Lựa chọn các loại thiết lập",
		{szOption='Vòng tròn (Màu sắc phụ thuộc vào khoảng cách)',bCheck = true,bChecked = BossFaceAlertUI.handleRecord.bGradient,fnAction = function(UserData, bCheck) BossFaceAlertUI.handleRecord.bGradient = bCheck end},
		{bDevide = true},
		{szOption='Loại 1 (Giảm 1 nửa độ trong suốt)',bMCheck = true,bChecked = BossFaceAlertUI.handleRecord.nStyle == 0 or nil,fnAction = function() BossFaceAlertUI.handleRecord.nStyle = 0 end},
		{szOption='Loại 2 (Nhạt dần vào trong)',bMCheck = true,bChecked = BossFaceAlertUI.handleRecord.nStyle == 1,fnAction = function() BossFaceAlertUI.handleRecord.nStyle = 1 end},
		{szOption='Loại 3 (Trong đậm ngoài nhạt)',bMCheck = true,bChecked = BossFaceAlertUI.handleRecord.nStyle == 2,fnAction = function() BossFaceAlertUI.handleRecord.nStyle = 2 end},
		{szOption='Loại 4 (Trong nhạt ngoài đậm)',bMCheck = true,bChecked = BossFaceAlertUI.handleRecord.nStyle == 3,fnAction = function() BossFaceAlertUI.handleRecord.nStyle = 3 end},
	}
	local tMenuOfSetClass = BossFaceAlert.Options.SetClass(BossFaceAlert.FaceClassNameInfo,BossFaceAlertUI.handleRecord)
	local tPointMenu6_0 = RaidGrid_EventScrutiny.SyncOptions(BossFaceAlertUI.handleRecord,"DrawFaceLineNames")
	local tMenuDelete = {
		szOption = "Xóa mục hiện tại",rgb = {255,0,0},
		fnAction = function()
			if BossFaceAlertUI.handleIndex > 0 then
				table.remove(BossFaceAlert.DrawFaceLineNames, BossFaceAlertUI.handleIndex)
				if #BossFaceAlert.DrawFaceLineNames >= BossFaceAlertUI.handleIndex then
					BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
				elseif #BossFaceAlert.DrawFaceLineNames > 0 then
					BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames
					BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
				else
					BossFaceAlertUI.handleIndex = 0
					BossFaceAlertUI.handleRecord = BossFaceAlert.tDefaultSetForAdd
				end
				BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
			end
			BossFaceAlert.RestartFaceCircle()
			BossFaceAlert.ClearAllItem()
		end}
	if BossFaceAlertUI.handleIndex >= 0 then
		table.insert(tMenu, {szOption = "["  .. tostring(BossFaceAlertUI.handleIndex) .. "-" .. BossFaceAlertUI.handleRecord.szName .. "]", bCheck = false, bChecked = false, bDisable = true})
		table.insert(tMenu, {bDevide = true} )
	end
	if BossFaceAlertUI.handleRecord.szName == "Target" or BossFaceAlertUI.handleRecord.szName == "Mục tiêu hiện tại" then
		table.insert(tMenu, tMenu2)
		table.insert(tMenu, {bDevide = true} )
	elseif BossFaceAlertUI.handleRecord.szName ~= "Self" and BossFaceAlertUI.handleRecord.szName ~= "Bản thân" then
		table.insert(tMenu, tMenu9)
		table.insert(tMenu9, tMenu10)
		table.insert(tMenu9, tMenu12)
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenu3)
		table.insert(tMenu, tMenu8)
		table.insert(tMenu, tMenu4)
		table.insert(tMenu, tMenu5)
		table.insert(tMenu, tMenu6)
		table.insert(tMenu, tMenu7)
		table.insert(tMenu, tMenu11)
	end
	if BossFaceAlertUI.handleIndex ~= 0 then
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenuOfSetClass)
	end
	if BossFaceAlertUI.handleIndex > 0 then
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenu121)
		-- table.insert(tMenu, {bDevide = true} )
		-- table.insert(tMenu, tPointMenu6_0)
	end
	if BossFaceAlertUI.handleIndex > 0 then
		table.insert(tMenu, {bDevide = true} )
		table.insert(tMenu, tMenuDelete)
	end
	return tMenu
end

function BossFaceAlert.ToDeleteClassAndDataSure(jClass,Class,Data)
	local szText = ""
	szText = szText.."<Text>text="..EncodeComponentsString("Bạn có chắc muốn xóa các dữ liệu dưới đây?\n\n").." font=2 r=255 g=255 b=255</text>"
	szText = szText.."<Text>text="..EncodeComponentsString("Dữ liệu đã xóa không thể khôi phục, hãy sao lưu trước khi thực hiện!").." font=162 r=255 g=0 b=0</text>"
	local msg = 
	{
		szMessage = szText,
		bRichText = true,
		szName = "BossFaceAlert_ToDeleteClassAndData",
		{szOption = g_tStrings.STR_HOTKEY_SURE, fnAction =
			function()
				BossFaceAlert.ToDeleteClassAndData(jClass,Class,Data)
			end
		},
		{szOption = g_tStrings.STR_HOTKEY_CANCEL},
	}
	MessageBox(msg)
end

function BossFaceAlert.ToDeleteClassAndData(jClass,Class,Data)
	for i = #Data, 1, -1 do
		if Data[i].nFaceClass then
			if Data[i].nFaceClass == jClass then
				table.remove(Data, i)
			elseif Data[i].nFaceClass > jClass and Data[i].nFaceClass <= #Class then
				Data[i].nFaceClass = Data[i].nFaceClass - 1
			end
		end
	end
	table.remove(Class, jClass)
	BossFaceAlertUI.InitShow()
	BossFaceAlert.RestartFaceCircle()
end

function BossFaceAlert.SetAllClass(jClass,TojClass,Class,Data)
	for i = #Data, 1, -1 do
		if Data[i].nFaceClass then
			if Data[i].nFaceClass == jClass then
				Data[i].nFaceClass = TojClass
			end
		end
	end
end


---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
function BossFaceAlert.OnFrameCreate()
	local frame = Station.Lookup("Lowest/BossFaceAlert")
	frame:RegisterEvent("RENDER_FRAME_UPDATE")
	frame:RegisterEvent("NPC_ENTER_SCENE")
	frame:RegisterEvent("NPC_LEAVE_SCENE")
	frame:RegisterEvent("PLAYER_ENTER_SCENE")
	frame:RegisterEvent("PLAYER_LEAVE_SCENE")
	frame:RegisterEvent("LOADING_END")
end

function BossFaceAlert.OnFrameBreathe()
	BossFaceAlert.nSteper = BossFaceAlert.nSteper + 1
	if not BossFaceAlert.bEnable then
		return
	end

	local player = GetClientPlayer()
	if not player then
		return
	end

	for dwID, character in pairs(BossFaceAlert.tScrutinyList) do
		if dwID ~= player.dwID then
			BossFaceAlert.UpdateTargetNameLable(dwID)
		end
	end

	for _, funcCustomFunction in pairs(BossFaceAlert.tCustomFuncList) do
		--funcCustomFunction(false)
		if RaidGrid_EventScrutiny and RaidGrid_EventScrutiny.bFunctionPcallRunMode then
			local status, err = pcall(funcCustomFunction, false)
		else
			funcCustomFunction(false)
		end
	end

end

BossFaceAlert.tSyncEnemyChar = {}
BossFaceAlert.tSyncNpcAndPlayerID = {}

function BossFaceAlert.OnEvent(event)
	if event == "RENDER_FRAME_UPDATE" then
		if not BossFaceAlert.bEnable then
			return
		end
		local player = GetClientPlayer()
		if player then
			BossFaceAlert.UpdateAllScrutiny()
			BossFaceAlert.UpdateDefinedPointCircle()
			BossFaceAlert.UpdateSelfAndTargetCircle()
			for _, funcCustomFunction in pairs(BossFaceAlert.tCustomFuncList) do
				if RaidGrid_EventScrutiny and RaidGrid_EventScrutiny.bFunctionPcallRunMode then
					local status, err = pcall(funcCustomFunction, true)
				else
					funcCustomFunction(true)
				end
			end
			BossFaceAlert.UpdateAlertName()
			BossFaceAlert.DrawingBoard()
		end
	elseif event == "NPC_ENTER_SCENE" or event == "PLAYER_ENTER_SCENE" then
		if event == "NPC_ENTER_SCENE" then
			local target = GetNpc(arg0)
			if target then
				BossFaceAlert:DebugMessage("NPC_ENTER_SCENE:" .. target.szName .. " | " .. target.dwTemplateID )
				BossFaceAlert.tSyncEnemyChar[arg0] = target
			end
		end
		BossFaceAlert.tSyncNpcAndPlayerID[arg0] = true
		BossFaceAlert.AppendCharacterToList(arg0)
	elseif event == "NPC_LEAVE_SCENE" or event == "PLAYER_LEAVE_SCENE" then
		if event == "NPC_LEAVE_SCENE" then
			local target = GetNpc(arg0)
			if target then
				BossFaceAlert:DebugMessage("NPC_LEAVE_SCENE:" .. target.szName .. " | " .. target.dwTemplateID )
			end
			BossFaceAlert.tSyncEnemyChar[arg0] = nil
		end
		BossFaceAlert.tSyncNpcAndPlayerID[arg0] = nil
		BossFaceAlert.RemoveCharacterFromList(arg0)
		BossFaceAlert.RemoveAllItem(arg0)
	-- elseif event == "LOADING_END" then
		-- BossFaceAlert.LoadSettingsFileNew("HCTS.dat",true)
		-- BossFaceAlert.ClearAllItem()
	end
end

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
function BossFaceAlert.AppendCharacterToList(dwID, bForceAppend)
	if not dwID then
		return
	end
	local target = BossFaceAlert.GetCharacter(dwID)

	if BossFaceAlert.tScrutinyList[dwID] then
		if not target then
			BossFaceAlert.RemoveCharacterFromList(dwID)
		end
		return
	end
	if not target then
		return
	end

	local bPlayerdwID = false
	local dwTemplateID = target.dwTemplateID
	if IsPlayer(dwID) then
		dwTemplateID = dwID
		bPlayerdwID = true
	end
	dwTemplateID = tostring(dwTemplateID)

	if bForceAppend then
		if (dwID == GetClientPlayer().dwID) then
			BossFaceAlert.AddList("Self")
		elseif not target.szName or target.szName == "" or bPlayerdwID then
			BossFaceAlert.AddList(dwTemplateID, bPlayerdwID, target.szName)
		else
			BossFaceAlert.AddList(target.szName, bPlayerdwID)
		end
	end

	for ii = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
		if (BossFaceAlert.DrawFaceLineNames[ii].szName == target.szName or (tostring(BossFaceAlert.DrawFaceLineNames[ii].szName) == tostring(dwTemplateID))) then
			if (not BossFaceAlert.DrawFaceLineNames[ii].bPlayer == not bPlayerdwID) then
				BossFaceAlert.tScrutinyList2[dwID] = BossFaceAlert.DrawFaceLineNames[ii]
				--if BossFaceAlert.DrawFaceLineNames[ii].bAutoAddOn then
					bForceAppend = true
				--end
			end
		end
	end
	


	if not bForceAppend then
		return
	end
	
	if dwID == GetClientPlayer().dwID then
		return
	end

	BossFaceAlert.tScrutinyList[dwID] = target

end

function BossFaceAlert.RemoveCharacterFromList(dwID)
	if not dwID then
		return
	end
	if not BossFaceAlert.tScrutinyList[dwID] then
		return
	end
	BossFaceAlert.tScrutinyList[dwID] = nil
	BossFaceAlert.handleShadowLine:RemoveItem(dwID .. 1) -- 顺便把线删了
	BossFaceAlert.tScrutinyList2[dwID] = nil
end

function BossFaceAlert.UpdateTargetNameLable(dwID)
	local playerClient = GetClientPlayer()
	if not playerClient then
		return
	end	
	local target = BossFaceAlert.GetCharacter(dwID)
	if not target then
		BossFaceAlert.RemoveCharacterFromList(dwID)
		return
	end


	local szTargetTargetName = nil
	local nLastTargetType, dwLastTargetID = target.GetTarget()
	if dwLastTargetID and dwLastTargetID > 0 and nLastTargetType ~= TARGET.NPC then
		local targetTarget = BossFaceAlert.GetCharacter(dwLastTargetID)
		if targetTarget then
			szTargetTargetName = targetTarget.szName

			if BossFaceAlert.szLastTargetName[dwID] and BossFaceAlert.szLastTargetName[dwID] == szTargetTargetName then
				BossFaceAlert.nTargetNameLableShowTime[dwID] = BossFaceAlert.nTargetNameLableShowTime[dwID] or 0
				if BossFaceAlert.nSteper % 16 == 0 then
					BossFaceAlert.nTargetNameLableShowTime[dwID] = BossFaceAlert.nTargetNameLableShowTime[dwID] + 1
				end
				if BossFaceAlert.nTargetNameLableShowTime[dwID] > 999 then
					BossFaceAlert.nTargetNameLableShowTime[dwID] = 999
				end
			else
				BossFaceAlert.nTargetNameLableShowTime[dwID] = 0
				local szTargetName = target.szName
				if not szTargetName or szTargetName == "" then
					if BossFaceAlert.tScrutinyList2[dwID] then
						szTargetName = BossFaceAlert.tScrutinyList2[dwID].szName or ""
					end
				end
				if BossFaceAlert.tScrutinyList2[dwID] and BossFaceAlert.tScrutinyList2[dwID].bShowDescriptionName then
					if BossFaceAlert.tScrutinyList2[dwID].szDescription and BossFaceAlert.tScrutinyList2[dwID].szDescription ~= "" then
						szTargetName = BossFaceAlert.tScrutinyList2[dwID].szDescription
					end
				end
				if not BossFaceAlert.tScrutinyList2[dwID] or (not BossFaceAlert.tScrutinyList2[dwID].bNotShowTargetName and (not BossFaceAlert.tScrutinyList2[dwID].bAllDisable))  then
					if BossFaceAlert.bSendRaidMsg and (not BossFaceAlert.tScrutinyList2[dwID] or not BossFaceAlert.tScrutinyList2[dwID].bNotSendRaidMsg) then		---团队频道提示开关
						local tInfo = {{type = "text", text = "Cảnh báo: [" .. szTargetTargetName .. "] đang bị ["..szTargetName.."] đe dọa"},}
						playerClient.Talk(PLAYER_TALK_CHANNEL.RAID, "", tInfo)
					end
					if BossFaceAlert.bSendWhisperMsg and (not BossFaceAlert.tScrutinyList2[dwID] or not BossFaceAlert.tScrutinyList2[dwID].bNotSendWhisperMsg) then		---密语频道提示开关
						local tInfo = {{type = "text", text = "Cảnh báo: Bạn đang bị ["..szTargetName.."] đe dọa"},}
						playerClient.Talk(PLAYER_TALK_CHANNEL.WHISPER, szTargetTargetName, tInfo)
					end
					if not (not RaidGrid_RedAlarm or not RaidGrid_RedAlarm.Flash) then
						if playerClient.szName == szTargetTargetName then
							if BossFaceAlert.bFlashRedAlarm and (not BossFaceAlert.tScrutinyList2[dwID] or not BossFaceAlert.tScrutinyList2[dwID].bNotFlashRedAlarm) then
								RaidGrid_RedAlarm.Flash(2, "Bạn đang bị ["..szTargetName.."] đe dọa", true, true, BossFaceAlert.tFlashColor.r, BossFaceAlert.tFlashColor.g, BossFaceAlert.tFlashColor.b)
							end
						elseif BossFaceAlert.bOtherFlash and (not BossFaceAlert.tScrutinyList2[dwID] or not BossFaceAlert.tScrutinyList2[dwID].bNotOtherFlash) then
							RaidGrid_RedAlarm.Flash(2, "[" .. szTargetTargetName .. "] đang bị ["..szTargetName.."] đe dọa", false, true, 255, 0, 0)
						end
					end
					if not (not RaidGrid_ScreenHead or not RaidGrid_ScreenHead.addAlarmFrame) then
						if RaidGrid_EventScrutiny.bScreenHeadMonitor and BossFaceAlert.tScrutinyList2[dwID] and BossFaceAlert.tScrutinyList2[dwID].bTimerHeadEnable then
							local tTimerHeadRecord = {
								szName = "Bị đe dọa",
								dwID = -3004,
								szType = "timer",
								nPriorityLevel = 0,	
								--nEndFrame = 0,
								}
							tTimerHeadRecord.szName = "Bị ["..szTargetName.." đe dọa"
							RaidGrid_ScreenHead.addAlarmFrame(dwLastTargetID, tTimerHeadRecord)
						end
					end
				end
			end
			BossFaceAlert.szLastTargetName[dwID] = szTargetTargetName or nil			
		end
	end
end



-- 第一个绘制的目标ID或者坐标 第二个注视的ID 3 text 4 col 5 bCharacterTop 6 字号 7 缩放 8 fTopDelta
function BossFaceAlert.UpdateAlertName()
	local me = GetClientPlayer()
	if not me then
		return
	end
	local _, dwTargetID = me.GetTarget()
	local shadow = BossFaceAlert.handleShadowName
	shadow:ClearTriangleFanPoint()
	for _ ,v in pairs(BossfaceAlertUpdateAlertName) do
		if (dwTargetID ~= v[1] or v[2] == -1) or (not BossFaceAlert.tSetOfTargetFaceCircle or BossFaceAlert.tSetOfTargetFaceCircle.bNotShowTargetName or BossFaceAlert.tSetOfTargetFaceCircle.bAllDisable) then
			if not v[4] then
				if me.dwID == v[2] then
					v[4] = BossFaceAlert.Setting.sTarSelf
				else
					v[4] = BossFaceAlert.Setting.sTarOther 
				end
			end
			if type(v[1]) == "table" then
				shadow:AppendTriangleFan3DPoint(v[1].nX,v[1].nY,v[1].nZ+15*64,v[4][1],v[4][2],v[4][3],255,0,v[6] or BossFaceAlert.Setting.dwFontSchemeID,v[3],1,v[7] or BossFaceAlert.Setting.fScale)
			else
				if BossFaceAlert.szLastTargetName[v[1]] and BossFaceAlert.szLastTargetName[v[1]] == v[3] then
					v[3] = v[3] .. " " .. tostring(BossFaceAlert.nTargetNameLableShowTime[v[1]] or 0) .. "″"
				end
				shadow:AppendCharacterID(v[1],v[5] or false,v[4][1],v[4][2],v[4][3],255,v[8] or BossFaceAlert.Setting.fTopDelta,v[6] or BossFaceAlert.Setting.dwFontSchemeID,v[3],1,v[7] or BossFaceAlert.Setting.fScale)
			end
		end
	end
	BossfaceAlertUpdateAlertName = {}
end


function BossFaceAlert.UpdateAllScrutiny()
	local me = GetClientPlayer()

	for dwID, character in pairs(BossFaceAlert.tScrutinyList) do
		BossFaceAlert.UpdateTargetNameLable2(dwID)

		local nLastTargetType, dwTargetTargetID = character.GetTarget()
		local target = BossFaceAlert.GetCharacter(dwTargetTargetID)
		local tStartPos = character
		if target and nLastTargetType ~= TARGET.NPC and (not BossFaceAlert.tScrutinyList2[dwID] or (not BossFaceAlert.tScrutinyList2[dwID].bNotShowTargetName and (not BossFaceAlert.tScrutinyList2[dwID].bAllDisable))) then

			-- 更新目标名称
			if not BossFaceAlert.tScrutinyList2[dwID] or (not BossFaceAlert.tScrutinyList2[dwID].bNotShowTargetName and (not BossFaceAlert.tScrutinyList2[dwID].bAllDisable)) then
				table.insert(BossfaceAlertUpdateAlertName,{dwID,target.dwID,target.szName})
			end
			local tEndPos = target
			if target.dwID == me.dwID then -- 目标是自己就给一根粉红色的线
				if BossFaceAlert.OOtarget then
					table.insert(BossfaceAlertUpdateAlertName,{target.dwID,-1,BossFaceAlert.Setting.sTopStr,BossFaceAlert.Setting.sTarSelf,true,BossFaceAlert.Setting.dwTopFontSchemeID,BossFaceAlert.Setting.fTopScale,BossFaceAlert.Setting.tTopDelta})
				end
				BossFaceAlert.UpdateAlertLine(character.dwID,1,tEndPos.dwID,tStartPos,BossFaceAlert.Setting.sTarSelf)
			elseif (not BossFaceAlert.tScrutinyList2[dwID] or not BossFaceAlert.tScrutinyList2[dwID].bNotTargetLine) then
				if BossFaceAlert.OOtarget then
					table.insert(BossfaceAlertUpdateAlertName,{target.dwID,-1,BossFaceAlert.Setting.sTopStr,BossFaceAlert.Setting.sTarOther,true,BossFaceAlert.Setting.dwTopFontSchemeID,BossFaceAlert.Setting.fTopScale,BossFaceAlert.Setting.tTopDelta})
				end
				BossFaceAlert.UpdateAlertLine(character.dwID,1,tEndPos.dwID,tStartPos,BossFaceAlert.Setting.sTarOther)
			end
		end

		--目标是自己 或者 没目标 或者 不显示目标 或者 不显示非自己的目标 全部把线删了 新的API有问题 不会用

		if (target and target.dwID == dwID) or nLastTargetType == TARGET.NPC or not target or BossFaceAlert.tScrutinyList2[dwID].bNotShowTargetName or (BossFaceAlert.tScrutinyList2[dwID].bNotTargetLine and target.dwID ~= me.dwID) then
			if BossFaceAlert.handleShadowLine:Lookup(character.dwID.. 1) then
				BossFaceAlert.handleShadowLine:RemoveItem(character.dwID.. 1)
			end
		end

		if BossFaceAlert.tScrutinyList2[dwID] then
			if not BossFaceAlert.tScrutinyList2[dwID].bAllDisable then
				if BossFaceAlert.tScrutinyList2[dwID].bOn then -- 更新第一个圈
					BossFaceAlert.UpdateAlertCircle(character.dwID,1, character, BossFaceAlert.tScrutinyList2[dwID].nAngle, 64 * BossFaceAlert.tScrutinyList2[dwID].nLength, BossFaceAlert.tScrutinyList2[dwID].tColor, BossFaceAlert.tScrutinyList2[dwID].nAngleToAdd, BossFaceAlert.tScrutinyList2[dwID].bDistanceCircleOn, BossFaceAlert.tScrutinyList2[dwID].tColor2,BossFaceAlert.tScrutinyList2[dwID].nStyle or 0,BossFaceAlert.tScrutinyList2[dwID].bGradient)
				end
				if BossFaceAlert.tScrutinyList2[dwID].bDistanceCircleOn then -- 更新第二个圈
					BossFaceAlert.tScrutinyList2[dwID].tColor2 = BossFaceAlert.tScrutinyList2[dwID].tColor2 or {r = 255,g = 0,b = 0,a = 200,}
					BossFaceAlert.UpdateAlertCircle(character.dwID,2, character, BossFaceAlert.tScrutinyList2[dwID].nAngle2 or 360, 64 * (BossFaceAlert.tScrutinyList2[dwID].nLength2 or 3), BossFaceAlert.tScrutinyList2[dwID].tColor2, BossFaceAlert.tScrutinyList2[dwID].nAngleToAdd2 or 0,nil,nil,BossFaceAlert.tScrutinyList2[dwID].nStyle or 0,BossFaceAlert.tScrutinyList2[dwID].bGradient)
				end
			end
		end
		
	end

end

function BossFaceAlert.UpdateTargetNameLable2(dwID)
	local target = BossFaceAlert.GetCharacter(dwID)
	if not target then
		return
	end
	if BossFaceAlert.tScrutinyList2[dwID] and BossFaceAlert.tScrutinyList2[dwID].bShowNPCSelfName then
		local szTargetName = target.szName
		if not szTargetName or szTargetName == "" then
			szTargetName = BossFaceAlert.tScrutinyList2[dwID].szName or ""
		end
		if BossFaceAlert.tScrutinyList2[dwID].bShowDescriptionName then
			if BossFaceAlert.tScrutinyList2[dwID].szDescription and BossFaceAlert.tScrutinyList2[dwID].szDescription ~= "" then
				szTargetName = BossFaceAlert.tScrutinyList2[dwID].szDescription
			end
		end
		local nDistance = GetCharacterDistance(GetClientPlayer().dwID, dwID)
		if szTargetName ~= "" and nDistance and nDistance >= 0 and BossFaceAlert.tScrutinyList2[dwID].bShowNPCDistance then
			szTargetName = szTargetName .. "·" .. (string.format("%.1f", nDistance / 64)) .. "尺"
		end
		table.insert(BossfaceAlertUpdateAlertName,{dwID,-1,szTargetName,BossFaceAlert.Setting.cOther,true,nil,nil,135}) --这个是目标自身名称 备注下 Bạn们可能有些人要
	end
end




function BossFaceAlert.UpdateSelfAndTargetCircle()
	local character = GetClientPlayer()
	if not character then
		return
	end
	
	local _, dwTargetID = character.GetTarget()
	local target = BossFaceAlert.GetCharacter(dwTargetID)
	
	if target and target.dwID ~= character.dwID then --有目标并且目标不是自个儿
		local TargetTargetType, dwTargetTargetID = target.GetTarget()
		local targettarget = BossFaceAlert.GetCharacter(dwTargetTargetID)

		if BossFaceAlert.bSelfTargetFaceLine then -- 目标的目标
			if targettarget then
				if BossFaceAlert.OOtarget then
					table.insert(BossfaceAlertUpdateAlertName,{targettarget.dwID,-1,BossFaceAlert.Setting.sTopStr,{BossFaceAlert.tSelfTargetFaceLineColor.r,BossFaceAlert.tSelfTargetFaceLineColor.g,BossFaceAlert.tSelfTargetFaceLineColor.b},true,BossFaceAlert.Setting.dwTopFontSchemeID,BossFaceAlert.Setting.fTopScale,BossFaceAlert.Setting.tTopDelta})
				end
				BossFaceAlert.UpdateAlertLine("TTarget",2,targettarget.dwID,target, {BossFaceAlert.tSelfTargetFaceLineColor.r,BossFaceAlert.tSelfTargetFaceLineColor.g,BossFaceAlert.tSelfTargetFaceLineColor.b})
			else
				if BossFaceAlert.handleShadowLine:Lookup("TTarget2") then
					BossFaceAlert.handleShadowLine:RemoveItem("TTarget2")
				end
			end
		end
		
		if BossFaceAlert.bSelfFaceLine then -- 目标
			if BossFaceAlert.OOtarget then
				table.insert(BossfaceAlertUpdateAlertName,{target.dwID,-1,BossFaceAlert.Setting.sTopStr,{BossFaceAlert.tSelfFaceLineColor.r,BossFaceAlert.tSelfFaceLineColor.g,BossFaceAlert.tSelfFaceLineColor.b},true,BossFaceAlert.Setting.dwTopFontSchemeID,BossFaceAlert.Setting.fTopScale,BossFaceAlert.Setting.tTopDelta})
			end
			if not targettarget or targettarget and targettarget.dwID ~= character.dwID then
				BossFaceAlert.UpdateAlertLine("Target",2,target.dwID,character,{BossFaceAlert.tSelfFaceLineColor.r,BossFaceAlert.tSelfFaceLineColor.g,BossFaceAlert.tSelfFaceLineColor.b})
			else
				BossFaceAlert.handleShadowLine:RemoveItem("Target2")
			end
		end
		
		if targettarget and BossFaceAlert.tSetOfTargetFaceCircle and not BossFaceAlert.tSetOfTargetFaceCircle.bNotShowTargetName and not BossFaceAlert.tSetOfTargetFaceCircle.bAllDisable then
			if character.dwID == targettarget.dwID then
				table.insert(BossfaceAlertUpdateAlertName,{target.dwID,-1,">>"..targettarget.szName.."<<",BossFaceAlert.Setting.tTarSelf})
			else
				table.insert(BossfaceAlertUpdateAlertName,{target.dwID,-1,">>"..targettarget.szName.."<<",BossFaceAlert.Setting.tTarOther})
			end
		end
	else
		if BossFaceAlert.handleShadowLine:Lookup("Target2") or BossFaceAlert.handleShadowLine:Lookup("TTarget2") then
			BossFaceAlert.handleShadowLine:RemoveItem("Target2")
			BossFaceAlert.handleShadowLine:RemoveItem("TTarget2")
		end
	end

	local dwID = character.dwID
	BossFaceAlert.tSetOfTargetFaceCircle = nil
	BossFaceAlert.tScrutinyList2[dwID] = nil
	for ii = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
		if BossFaceAlert.DrawFaceLineNames[ii].szName == "Target" or BossFaceAlert.DrawFaceLineNames[ii].szName == "Mục tiêu hiện tại" then
			BossFaceAlert.tSetOfTargetFaceCircle = BossFaceAlert.DrawFaceLineNames[ii]
		elseif BossFaceAlert.DrawFaceLineNames[ii].szName == "Self" or BossFaceAlert.DrawFaceLineNames[ii].szName == "Bản thân" then
			BossFaceAlert.tScrutinyList2[dwID] = BossFaceAlert.DrawFaceLineNames[ii]
		end
	end
	
	if BossFaceAlert.bSelfFaceCircle then
		if BossFaceAlert.tScrutinyList2[dwID] then
			if not BossFaceAlert.tScrutinyList2[dwID].bAllDisable then
				if BossFaceAlert.tScrutinyList2[dwID].bOn then
					BossFaceAlert.UpdateAlertCircle(character.dwID,10,character, BossFaceAlert.tScrutinyList2[dwID].nAngle, 64 * BossFaceAlert.tScrutinyList2[dwID].nLength, BossFaceAlert.tScrutinyList2[dwID].tColor, BossFaceAlert.tScrutinyList2[dwID].nAngleToAdd, BossFaceAlert.tScrutinyList2[dwID].bDistanceCircleOn, BossFaceAlert.tScrutinyList2[dwID].tColor2)
				end
				if BossFaceAlert.tScrutinyList2[dwID].bDistanceCircleOn then
					BossFaceAlert.tScrutinyList2[dwID].tColor2 = BossFaceAlert.tScrutinyList2[dwID].tColor2 or {r = 255,g = 0,b = 0,a = 200,}
					BossFaceAlert.UpdateAlertCircle(character.dwID,20, character, BossFaceAlert.tScrutinyList2[dwID].nAngle2 or 360, 64 * (BossFaceAlert.tScrutinyList2[dwID].nLength2 or 3), BossFaceAlert.tScrutinyList2[dwID].tColor2, BossFaceAlert.tScrutinyList2[dwID].nAngleToAdd2 or 0)
				end
			end
		end
	end

	if BossFaceAlert.tSetOfTargetFaceCircle then
		if target and target.dwID ~= character.dwID and (not BossFaceAlert.tSetOfTargetFaceCircle.bAllDisable) then
			if not BossFaceAlert.tSetOfTargetFaceCircle.bShowEnemyCircleOnly or IsEnemy(character.dwID, target.dwID) then
				if BossFaceAlert.tSetOfTargetFaceCircle.bOn then
					BossFaceAlert.UpdateAlertCircle("Target",1,target, BossFaceAlert.tSetOfTargetFaceCircle.nAngle, 64 * BossFaceAlert.tSetOfTargetFaceCircle.nLength, BossFaceAlert.tSetOfTargetFaceCircle.tColor, BossFaceAlert.tSetOfTargetFaceCircle.nAngleToAdd, BossFaceAlert.tSetOfTargetFaceCircle.bDistanceCircleOn, BossFaceAlert.tSetOfTargetFaceCircle.tColor2,BossFaceAlert.tSetOfTargetFaceCircle.nStyle or 0,BossFaceAlert.tSetOfTargetFaceCircle.bGradient)
				end
				if BossFaceAlert.tSetOfTargetFaceCircle.bDistanceCircleOn then
					BossFaceAlert.tSetOfTargetFaceCircle.tColor2 = BossFaceAlert.tSetOfTargetFaceCircle.tColor2 or {r = 255,g = 0,b = 0,a = 200,}
					BossFaceAlert.UpdateAlertCircle("Target",2,target, BossFaceAlert.tSetOfTargetFaceCircle.nAngle2 or 360, 64 * (BossFaceAlert.tSetOfTargetFaceCircle.nLength2 or 3), BossFaceAlert.tSetOfTargetFaceCircle.tColor2, BossFaceAlert.tSetOfTargetFaceCircle.nAngleToAdd2 or 0,nil,nil,BossFaceAlert.tSetOfTargetFaceCircle.nStyle or 0,BossFaceAlert.tSetOfTargetFaceCircle.bGradient)
				end
			end
		else
			if BossFaceAlert.handleShadowCircle:Lookup("Target1") or BossFaceAlert.handleShadowCircle:Lookup("Target2") then
				BossFaceAlert.RemoveAllItem("Target")
			end
		end
	end

end

function BossFaceAlert.UpdateDefinedPointCircle()
	local me = GetClientPlayer()
	for ii = 1, #BossFaceAlert.tDefinedPoint, 1 do
		local szPointName = BossFaceAlert.tDefinedPoint[ii].szName
		
		local bCircleEnable = BossFaceAlert.tDefinedPoint[ii].bOn -- 获取开关
		if bCircleEnable then
			if (not BossFaceAlert.tDefinedPoint[ii].bNotMapMatchNeed) and BossFaceAlert.tDefinedPoint[ii].szMapName and RaidGrid_EventCache and RaidGrid_EventCache.szCurrentMapName then
				if (not RaidGrid_EventCache.szCurrentMapName:lower():match(BossFaceAlert.tDefinedPoint[ii].szMapName:lower())) and (not BossFaceAlert.tDefinedPoint[ii].szMapName:lower():match(RaidGrid_EventCache.szCurrentMapName:lower())) then
          bCircleEnable = false -- 地图匹配
				end
			end
		end
		if bCircleEnable then -- 匹配
			if (BossFaceAlert.tDefinedPoint[ii].tPosition.nX ~= 0 or BossFaceAlert.tDefinedPoint[ii].tPosition.nY ~= 0 or BossFaceAlert.tDefinedPoint[ii].tPosition.nZ ~= 0) then
				BossFaceAlert.UpdateAlertCircle(BossFaceAlert.tDefinedPoint[ii].szName,3, BossFaceAlert.tDefinedPoint[ii].tPosition, BossFaceAlert.tDefinedPoint[ii].nAngle or 360, 64 * (BossFaceAlert.tDefinedPoint[ii].nLength or 2), BossFaceAlert.tDefinedPoint[ii].tColor or {r = 0,g = 255,b = 0,a = 120}, BossFaceAlert.tDefinedPoint[ii].nAngleToAdd or 0)
			end
			if BossFaceAlert.bDefinedPointCircleEnable and BossFaceAlert.tDefinedPoint[ii].bShowPointName then
				if not BossFaceAlert.tDefinedPoint[ii] then return end

				local nDistance = 0

				local player = GetClientPlayer()
				local nDistX = BossFaceAlert.tDefinedPoint[ii].tPosition.nX - player.nX
				local nDistY = BossFaceAlert.tDefinedPoint[ii].tPosition.nY - player.nY
				local nDistZ = BossFaceAlert.tDefinedPoint[ii].tPosition.nZ - player.nZ

				nDistance = math.sqrt(nDistX^2 + nDistY^2)

				if tonumber(string.format("%.1f", nDistance / 64)) < 150 then
					if BossFaceAlert.tDefinedPoint[ii].bShowNPCDistance and nDistance >= 0 then
						szPointName = szPointName .. "·" .. (string.format("%.1f", nDistance / 64)) .. "thước"
					end
					local tDefinedPoint = {
						nX = BossFaceAlert.tDefinedPoint[ii].tPosition.nX,
						nY = BossFaceAlert.tDefinedPoint[ii].tPosition.nY,
						nZ = BossFaceAlert.tDefinedPoint[ii].tPosition.nZ,
					}
					table.insert(BossfaceAlertUpdateAlertName,{tDefinedPoint,"Dp"..ii,szPointName,BossFaceAlert.Setting.cOther})
				end
			end		
		end
	end
end


function BossFaceAlert.GetExtensionPos(character,nFanAngle,nLineLength)
	nFanAngle = nFanAngle or 0
	nLineLength = nLineLength or (64 * 5)

	-- 这里计算目标朝向的延长线目标点
	local tEndPos = {}
	local nFace = (character.nFaceDirection + 512 + ((nFanAngle / 360) * 256)) % 256

	local nFaceD = (nFace / 256) * 360
	local nFaceR = math.rad(nFaceD)
	local nSrcX, nSrcY = character.nX, character.nY
	local nHa = math.abs(math.sin(nFaceR) * nLineLength)
	local nWa = math.abs(math.cos(nFaceR) * nLineLength)
	local nDesX, nDesY = nil, nil
	if nFace < 64 then			-- 第一象限
		nDesX, nDesY = nSrcX + nWa, nSrcY + nHa
	elseif nFace < 128 then		-- 第二象限
		nDesX, nDesY = nSrcX - nWa, nSrcY + nHa
	elseif nFace < 192 then		-- 第三象限
		nDesX, nDesY = nSrcX - nWa, nSrcY - nHa
	else						-- 第四象限
		nDesX, nDesY = nSrcX + nWa, nSrcY - nHa
	end
	tEndPos.nX, tEndPos.nY, tEndPos.nZ = nDesX, nDesY, character.nZ
	return tEndPos
end

function BossFaceAlert.GetExtensionPosLine(nX,nY,nX1,nY1,bAdjustToOriginalPos)
	local tStartPos,tEndPos = {},{}
	if bAdjustToOriginalPos then
		tStartPos.nX, tStartPos.nY = BossFaceAlert.AdjustToOriginalPos(nX, nY)
		tEndPos.nX, tEndPos.nY = BossFaceAlert.AdjustToOriginalPos(nX1,nY1)	
	else
		tStartPos.nX, tStartPos.nY = nX,nY
		tEndPos.nX, tEndPos.nY = nX1,nY1
	end
	local nW = BossFaceAlert.nLineWidth or 2
	local nWt = nW
	local nDifX, nDifY = tEndPos.nX - tStartPos.nX, tEndPos.nY - tStartPos.nY
	local nAX, nAY, nBX, nBY = 0, 0, 0, 0
	local nCX, nCY, nDX, nDY = 0, 0, 0, 0
	if (nDifX >= 0 and nDifY >= 0) or (nDifX < 0 and nDifY < 0) then		-- 二四象限
		nAX, nAY = tStartPos.nX + nW, tStartPos.nY - nW
		nBX, nBY = tStartPos.nX - nW, tStartPos.nY + nW
		nCX, nCY = tEndPos.nX + nWt, tEndPos.nY - nWt
		nDX, nDY = tEndPos.nX - nWt, tEndPos.nY + nWt
	else																	-- 一三象限
		nAX, nAY = tStartPos.nX - nW, tStartPos.nY - nW
		nBX, nBY = tStartPos.nX + nW, tStartPos.nY + nW
		nCX, nCY = tEndPos.nX - nWt, tEndPos.nY - nWt
		nDX, nDY = tEndPos.nX + nWt, tEndPos.nY + nWt
	end
	return nAX,nAY,nBX,nBY,nCX,nCY,nDX,nDY
end

function BossFaceAlert.AdjustToOriginalPos(xScreen, yScreen)
	if Station then
		if Station.AdjustToOriginalPos then
			return Station.AdjustToOriginalPos(xScreen, yScreen)
		elseif Station.GetUIScale then
			local nUIScale = Station.GetUIScale()
			return xScreen/nUIScale, yScreen/nUIScale
		end
	end
	return xScreen, yScreen
end

function BossFaceAlert.SetTarget(dwTargetID)
	local player = GetClientPlayer()
	if not player then
		return
	end
	local nType = TARGET.NPC
	if not dwTargetID or (dwTargetID <= 0) then
		nType = TARGET.NO_TARGET
		dwTargetID = 0
	elseif IsPlayer(dwTargetID) then
		nType = TARGET.PLAYER
	end
	local as0, as1 = arg0, arg1
	SetTarget(nType, dwTargetID)
	arg0, arg1 = as0, as1
end

function BossFaceAlert.GetCharacter(dwID)
	if not dwID or dwID <= 0 then
		return
	elseif IsPlayer(dwID) then
		return GetPlayer(dwID)
	else
		return GetNpc(dwID)
	end
end


-- RemoveAllItem
function BossFaceAlert.ClearAllItem()
	BossFaceAlert.handleShadowLine:Clear()
	BossFaceAlert.handleShadowCircle:Clear()
	BossFaceAlert.handleShadowBorder:Clear()
end

function BossFaceAlert.RemoveAllItem(ID,index)
	if index then
		if BossFaceAlert.tCache.Line[ID] and BossFaceAlert.tCache.Line[ID][index] then
			BossFaceAlert.handleShadowLine:RemoveItem(ID..index)
			BossFaceAlert.tCache.Line[ID][index] = nil
			BossFaceAlert:DebugMessage(FormatString("Remove:Line[<D0>] <D1>",index,ID))
		end
		if BossFaceAlert.tCache.Circle[ID] and BossFaceAlert.tCache.Circle[ID][index] then
			BossFaceAlert.handleShadowCircle:RemoveItem(ID..index)
			BossFaceAlert.tCache.Circle[ID][index] = nil
			BossFaceAlert:DebugMessage(FormatString("Remove:Circle[<D0>] <D1>",index,ID))
		end
		if BossFaceAlert.tCache.Border[ID] and BossFaceAlert.tCache.Circle[ID][index] then
			BossFaceAlert.handleShadowBorder:RemoveItem(ID..index)
			BossFaceAlert.tCache.Border[ID][index] = nil
			BossFaceAlert:DebugMessage(FormatString("Remove:Border[<D0>] <D1>",index,ID))
		end
	else
		if BossFaceAlert.tCache.Line[ID] then
			for k,v in pairs(BossFaceAlert.tCache.Line[ID]) do
				BossFaceAlert.handleShadowLine:RemoveItem(ID..k)
				BossFaceAlert:DebugMessage(FormatString("Remove:Line[<D0>] <D1>",k,ID))
			end
		end
		if BossFaceAlert.tCache.Circle[ID] then
			for k,v in pairs(BossFaceAlert.tCache.Circle[ID]) do
				BossFaceAlert.handleShadowCircle:RemoveItem(ID..k)
				BossFaceAlert:DebugMessage(FormatString("Remove:Circle[<D0>] <D1>",k,ID))
			end
		end
		if BossFaceAlert.tCache.Border[ID] then
			for k,v in pairs(BossFaceAlert.tCache.Border[ID]) do
				BossFaceAlert.handleShadowBorder:RemoveItem(ID..k)
				BossFaceAlert:DebugMessage(FormatString("Remove:Border[<D0>] <D1>",k,ID))
			end
		end
		BossFaceAlert.tCache.Line[ID] = nil
		BossFaceAlert.tCache.Circle[ID] = nil
		BossFaceAlert.tCache.Border[ID] = nil
	end
end

-- 如果是用GEOMETRY_TYPE.LINE不需要刷新重绘

function BossFaceAlert.UpdateAlertLine(CachedwID,CacheClass,tEndPos,tStartPos,col)
	local dwID,nX,nY,nZ = 0,0,0,0
	if type(tEndPos) == "number" then
		dwID = tEndPos
	elseif type(tEndPos) == "table" then
		nX,nY,nZ = unpack(tEndPos)
	end
	local r,g,b = unpack(col)
	local shadow = BossFaceAlert.handleShadowLine:Lookup(CachedwID..CacheClass)
	local t = {dwID,nX,nY,nZ,tStartPos.dwID,r,g,b,BossFaceAlert.tSelfFaceLineColor.a,BossFaceAlert.nLineWidth}
	if not shadow then
		shadow = BossFaceAlert.handleShadowLine:AppendItemFromIni("Interface/RaidGrid_EventScrutiny/BossFaceAlert.ini", "Shadow_Info",CachedwID..CacheClass)
		return BossFaceAlert.UpdateAlertLineCall(CachedwID,CacheClass,t,shadow,tEndPos,tStartPos,col)
	else
		if BossFaceAlert.tCache.Line[CachedwID] and BossFaceAlert.tCache.Line[CachedwID][CacheClass] then
			for i = 1, #t do
				if t[i] ~= BossFaceAlert.tCache.Line[CachedwID][CacheClass][i] then
					BossFaceAlert.UpdateAlertLineCall(CachedwID,CacheClass,t,shadow,tEndPos,tStartPos,col)
					break
				end
			end
		else
			return BossFaceAlert.UpdateAlertLineCall(CachedwID,CacheClass,t,shadow,tEndPos,tStartPos,col)
		end
	end	
end

function BossFaceAlert.UpdateAlertLineCall(CachedwID,CacheClass,t,shadow,tEndPos,tStartPos,col)
	local r,g,b = unpack(col)
	if BossFaceAlert.tCache.Line[CachedwID] then
		BossFaceAlert.tCache.Line[CachedwID][CacheClass] = t
	else
		BossFaceAlert.tCache.Line[CachedwID] = {}
		BossFaceAlert.tCache.Line[CachedwID][CacheClass] = t
	end
	shadow:SetTriangleFan(GEOMETRY_TYPE.LINE,BossFaceAlert.nLineWidth)
	shadow:ClearTriangleFanPoint()
	if type(tEndPos) == "number" then
		shadow:AppendCharacterID(tStartPos.dwID,true,r,g,b,BossFaceAlert.tSelfFaceLineColor.a)
		shadow:AppendCharacterID(tEndPos,true,r,g,b,BossFaceAlert.tSelfFaceLineColor.a)
	elseif type(tEndPos) == "table" then
		nX,nY,nZ = unpack(tEndPos)
		shadow:AppendCharacterID(tStartPos.dwID,true,r,g,b,BossFaceAlert.tSelfFaceLineColor.a)
		shadow:AppendTriangleFan3DPoint(nX,nY,nZ,r,g,b,BossFaceAlert.tSelfFaceLineColor.a)
	end
	BossFaceAlert:DebugMessage(FormatString("Update:Line[<D0>] <D1> <D2>",type(tEndPos),tStartPos.dwID,dwID))
end

-- 缓存的ID 类别三种 圈1 圈2 Tự thiết lập3 所以名字冲突也无所谓
function BossFaceAlert.UpdateAlertCircle(CachedwID,CacheClass,target,nAngle,nLength,tColor,nAngleToAdd,bDistanceCircleOn,tColor2,nStyle,bGradient)
	local shadow = BossFaceAlert.handleShadowCircle:Lookup(CachedwID..CacheClass)
	local t = {target.nX,target.nY,target.nZ,target.nFaceDirection,nAngle,nLength,tColor.r,tColor.g,tColor.b,tColor.a,nAngleToAdd,nStyle,bGradient}
	if not shadow then
		shadow = BossFaceAlert.handleShadowCircle:AppendItemFromIni("Interface/RaidGrid_EventScrutiny/BossFaceAlert.ini", "Shadow_Info",CachedwID..CacheClass)
		return BossFaceAlert.UpdateAlertCircleCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd,bDistanceCircleOn,tColor2,nStyle,bGradient)
	else
		if BossFaceAlert.tCache.Circle[CachedwID] and BossFaceAlert.tCache.Circle[CachedwID][CacheClass] then
			for i = 1, #t do
				if t[i] ~= BossFaceAlert.tCache.Circle[CachedwID][CacheClass][i] then
					BossFaceAlert.UpdateAlertCircleCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd,bDistanceCircleOn,tColor2,nStyle,bGradient)
					break
				end
			end
		else
			return BossFaceAlert.UpdateAlertCircleCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd,bDistanceCircleOn,tColor2,nStyle,bGradient)
		end
	end	
end

function BossFaceAlert.UpdateAlertCircleCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd,bDistanceCircleOn,tColor2,nStyle,bGradient)
	if nLength <= 0 or nAngle <= 0 or nAngle > 360 or nLength > 64 * 500 then
		return
	end
	if BossFaceAlert.tCache.Circle[CachedwID] then
		BossFaceAlert.tCache.Circle[CachedwID][CacheClass] = t
	else
		BossFaceAlert.tCache.Circle[CachedwID] = {}
		BossFaceAlert.tCache.Circle[CachedwID][CacheClass] = t
	end
	if not tColor2 or not bGradient then
		tColor2 = tColor
	end
	local nAngleToAdd = nAngleToAdd or 0
	shadow:SetTriangleFan(GEOMETRY_TYPE.TRIANGLE)
	shadow:SetD3DPT(D3DPT.TRIANGLEFAN)   --默认是D3DPT.TRIANGLEFAN -- 6
	shadow:ClearTriangleFanPoint()
	-- 角度小于2 当线处理
	if nAngle < 2 then
		local tEndPos = BossFaceAlert.GetExtensionPos(target, nAngleToAdd, nLength)
		local nAX,nAY,nBX,nBY,nCX,nCY,nDX,nDY = BossFaceAlert.GetExtensionPosLine(target.nX, target.nY , tEndPos.nX, tEndPos.nY , false)
		shadow:AppendTriangleFan3DPoint(nAX, nAY, target.nZ, tColor.r, tColor.g, tColor.b, tColor.a or BossFaceAlert.tSelfFaceLineColor.a)
		shadow:AppendTriangleFan3DPoint(nBX, nBY, target.nZ, tColor.r, tColor.g, tColor.b, tColor.a or BossFaceAlert.tSelfFaceLineColor.a)
		shadow:AppendTriangleFan3DPoint(nCX, nCY, target.nZ, tColor.r, tColor.g, tColor.b, tColor.a or BossFaceAlert.tSelfFaceLineColor.a)
		shadow:AppendTriangleFan3DPoint(nDX, nDY, target.nZ, tColor.r, tColor.g, tColor.b, tColor.a or BossFaceAlert.tSelfFaceLineColor.a)
	elseif BossFaceAlert.bSmooth and not BossFaceAlert.bBorder then
		local colI = {tColor2.r, tColor2.g, tColor2.b}
		local colO = {tColor.r, tColor.g, tColor.b}
		if bGradient then
			colI = {tColor.r, tColor.g, tColor.b}
			colO = {tColor2.r, tColor2.g, tColor2.b}
		end
		local rI,gI,bI = unpack(colI)
		local rO,gO,bO = unpack(colO)
		local nAlphaI,nAlphaO = tColor2.a,tColor.a
		if nStyle == 0 or not nStyle then -- 默认情况
			nAlphaI = math.floor(nAlphaI / 2) --全部是中心透明度减半
		elseif nStyle == 1 then -- 距离圈中心透明，面向圈中心透明
			nAlphaI = 0
		elseif nStyle == 2 then
			nAlphaO = 0
		elseif nStyle == 3 then
			if CacheClass == 1 then
				nAlphaI = 0
			elseif CacheClass == 2 then
				nAlphaO = 0
			end
		end	
	
		local nFace = math.ceil(128 * nAngle / 360)
		local dwRad1 = math.pi * (target.nFaceDirection - nFace + (128 * nAngleToAdd / 180)) / 128
		if target.nFaceDirection > (256 - nFace) then
			dwRad1 = dwRad1 - math.pi - math.pi
		end
		local dwRad2 = dwRad1 + (nAngle / 180 * math.pi)
		if target.dwID then
			shadow:AppendCharacterID(target.dwID,false,rI,gI,bI,nAlphaI)
		else
			shadow:AppendTriangleFan3DPoint(target.nX,target.nY,target.nZ,rI,gI,bI,nAlphaI)
		end
		local sX, sZ = Scene_PlaneGameWorldPosToScene(target.nX, target.nY)
		local StepAngle = 16
		if nAngle == 360 then
			dwRad2 = dwRad2 + math.pi / 18
		end
		if nAngle <= 45 then StepAngle = 180 end
		repeat
			local sX_, sZ_ = Scene_PlaneGameWorldPosToScene(target.nX + math.cos(dwRad1) * nLength, target.nY + math.sin(dwRad1) * nLength)
			if target.dwID then
				shadow:AppendCharacterID(target.dwID,false,rO,gO,bO,nAlphaO,{ sX_ - sX, 0, sZ_ - sZ })
			else
				shadow:AppendTriangleFan3DPoint(target.nX,target.nY,target.nZ,rO,gO,bO,nAlphaO,{ sX_ - sX, 0, sZ_ - sZ })
			end
			dwRad1 = dwRad1 + math.pi / StepAngle
		until dwRad1 > dwRad2
	else
		shadow:AppendTriangleFan3DPoint(target.nX, target.nY, target.nZ, tColor2.r, tColor2.g, tColor2.b, math.floor((tColor2.a or 200)/2))
		local nHalfAngle = math.floor(nAngle / 2)
		local nStepAngle = BossFaceAlert.StepAngleBase
		if BossFaceAlert.StepAngleBase > 5 then
			if nAngle <= 20 then
				nStepAngle = nHalfAngle
			elseif nAngle <= 90 then
				if nAngle % 20 ~= 0 then
					nStepAngle = 5
				end
			end
		end
		local Alpha = tColor.a
		if BossFaceAlert.bBorder then
			Alpha = math.floor(Alpha / 2)
		end
		local nPointCount = math.floor(nHalfAngle / nStepAngle) * 2 + 1
		local nStartAngle = math.floor(nHalfAngle / nStepAngle) * nStepAngle * (-1) + nAngleToAdd
		local nHalfPoint = math.ceil((nPointCount - 1) / 2) + 1
		for i = 0, nPointCount - 1 do
			local tEndPos = BossFaceAlert.GetExtensionPos(target, nStartAngle + i * nStepAngle, nLength)
			if tEndPos.nX and tEndPos.nY and tEndPos.nZ then
				shadow:AppendTriangleFan3DPoint(tEndPos.nX, tEndPos.nY, tEndPos.nZ, tColor.r, tColor.g, tColor.b, Alpha)
			end
		end
	end
	BossFaceAlert:DebugMessage(FormatString("Update:Circle[<D0>] <D1>",CacheClass,CachedwID))
	if BossFaceAlert.bBorder then
		BossFaceAlert.UpdateAlertBorder(CachedwID,CacheClass,target,nAngle,nLength,tColor,nAngleToAdd)
	end
end



-- 缓存的ID 类别三种 圈1 圈2 Tự thiết lập3 所以名字冲突也无所谓
function BossFaceAlert.UpdateAlertBorder(CachedwID,CacheClass,target,nAngle,nLength,tColor,nAngleToAdd)
	if not CachedwID or not target or not nAngle or not nLength then
		return
	end
	local shadow = BossFaceAlert.handleShadowBorder:Lookup(CachedwID..CacheClass)
	local t = {target.nX..target.nY..target.nZ..target.nFaceDirection..nAngle..nLength..tColor.r..tColor.g..tColor.b..nAngleToAdd}
	if not shadow then
		shadow = BossFaceAlert.handleShadowBorder:AppendItemFromIni("Interface/RaidGrid_EventScrutiny/BossFaceAlert.ini", "Shadow_Info",CachedwID..CacheClass)
		return BossFaceAlert.UpdateAlertBorderCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd)
	else
		if BossFaceAlert.tCache.Border[CachedwID] and BossFaceAlert.tCache.Border[CachedwID][CacheClass] then
			for i = 1, #t do
				if t[i] ~= BossFaceAlert.tCache.Border[CachedwID][CacheClass][i] then
					BossFaceAlert.UpdateAlertBorderCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd)
					break
				end
			end
		else
			return BossFaceAlert.UpdateAlertBorderCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd)
		end
	end
end

function BossFaceAlert.UpdateAlertBorderCall(CachedwID,CacheClass,t,shadow,target,nAngle,nLength,tColor,nAngleToAdd)
	if BossFaceAlert.tCache.Border[CachedwID] then
		BossFaceAlert.tCache.Border[CachedwID][CacheClass] = t
	else
		BossFaceAlert.tCache.Border[CachedwID] = {}
		BossFaceAlert.tCache.Border[CachedwID][CacheClass] = t
	end
	
	nAngleToAdd = nAngleToAdd or 0
	shadow:SetTriangleFan(GEOMETRY_TYPE.TRIANGLE)
	shadow:SetD3DPT(D3DPT.TRIANGLESTRIP)
	shadow:ClearTriangleFanPoint()
	local nThick = BossFaceAlert.BorderThickBase
	local dwMaxRad = nAngle * math.pi / 180
	local nFace = 128 * nAngle / 360
	local nFace2 = 128 * nAngleToAdd / 180
	local dwStepRadBase = nLength / (4 * 64)
	if dwStepRadBase < 2 and not BossFaceAlert.StepRadPrecisely then
		dwStepRadBase = 2
	end
	local dwStepRad = dwMaxRad / (nLength / dwStepRadBase)
	local dwCurRad = 0 - dwStepRad
	repeat
		local tRad = {}
		tRad[1] = { nLength, dwCurRad }
		tRad[2] = { nLength - nThick, dwCurRad }
		for _, v in ipairs(tRad) do
			local nX = target.nX + math.ceil(math.cos((v[2] + math.pi * (target.nFaceDirection - nFace + nFace2) / 128)) * v[1])
			local nY = target.nY + math.ceil(math.sin((v[2] + math.pi * (target.nFaceDirection - nFace + nFace2) / 128)) * v[1])
			shadow:AppendTriangleFan3DPoint(nX,nY,target.nZ,tColor.r,tColor.g,tColor.b,BossFaceAlert.BorderAlphaBase)
		end
		dwCurRad = dwCurRad + dwStepRad
	until dwMaxRad <= dwCurRad
	BossFaceAlert:DebugMessage(FormatString("Update:Border[<D0>] <D1>",CacheClass,CachedwID))
end


--------------------------------------------------------------
-- 画画 请不要乱改权限部分 只让队长管理画是最好的 否则会造成混乱的
--------------------------------------------------------------
BossFaceAlert.bDrawingBoard = false
BossFaceAlert.OpenDrawingBoard = nil
BossFaceAlert.bSyncDrawingBoard = true
BossFaceAlert.IsCtrlKeyDown = false
BossFaceAlert.IsOpenUserInput = false
BossFaceAlert.Brush = {
	col = {255,255,255},
	Pixel = 10,
	Style = 90,
}

for k, _ in pairs(BossFaceAlert.Brush) do
	RegisterCustomData("BossFaceAlert.Brush." .. k)
end

function BossFaceAlert.IsLeader(msg)
	if not IsMultiThread() then
		if not msg then
			return BossFaceAlert:Message("Tính năng chưa mở.")
		end
	end
	if not BossFaceAlert.bSyncDrawingBoard then
		if not msg then
			return BossFaceAlert:Message("Bạn phải tắt đồng bộ dữ liệu, thực hiện các thao tác khác sau khi mở lại.")
		end
	end
	local me = GetClientPlayer()
	if me.IsInParty() then
		local team = GetClientTeam()
		local _GetName = team.GetClientTeamMemberName
		local szLeader = _GetName(team.GetAuthorityInfo(TEAM_AUTHORITY_TYPE.LEADER))
		if szLeader ~= me.szName then
			if not msg then
				BossFaceAlert:Message("Cần là đội trưởng, bạn không phải là đội trưởng")
			end
			return false
		end
	else
		if not msg then
			BossFaceAlert:Message("Không có nhóm.")
		end
		return false
	end
	return true
end

AppendCommand("Tắt đồng bộ chiến thuật", function()
	if not BossFaceAlert.IsLeader(true) then
		BossFaceAlert.bDrawingBoard = false
		BossFaceAlert.OpenDrawingBoard = nil
		BossFaceAlert.handleShadowDrawingBoard:Clear()
		BossFaceAlert:Message("Tắt đồng bộ chiến thuật, click lần nữa để vẽ chiến thuật, cần đồng bộ lại với đội trưởng khi hoàn thành")
	else
		BossFaceAlert:Message("Đang là đội trưởng, không đóng chức năng này")
	end
end)

AppendCommand("Vẽ chiến thuật", function()
	if not BossFaceAlert.IsLeader() then
		return
	end
	if not BossFaceAlert.OpenDrawingBoard then
		RE.DelayCall(50,function() BossFaceAlert.CreatDrawingBoard() end)
		BossFaceAlert:Message("Hiện không có chiến thuật nào, bắt đầu tạo chiến thuật mới.")
		return
	end
	if BossFaceAlert.IsCtrlKeyDown then
		BossFaceAlert.IsCtrlKeyDown = false
		BossFaceAlert:Message("Giữ phím Ctrl để vào thao tác vẽ.")
	else
		if BossFaceAlert.Brush.Style == "Text" then
			BossFaceAlert.Brush.Style = 90
		end
		BossFaceAlert.IsCtrlKeyDown = true
		BossFaceAlert:Message("Thoát thao tác vẽ, bỏ nút Ctrl.")
	end
end)
AppendCommand("Viết chiến thuật", function()
	if not BossFaceAlert.IsLeader() then
		return
	end
	if not BossFaceAlert.OpenDrawingBoard then
		RE.DelayCall(50,function() BossFaceAlert.CreatDrawingBoard() end)
		BossFaceAlert:Message("Hiện không có chiến thuật nào, bắt đầu tạo chiến thuật mới.")
		return
	end
	if BossFaceAlert.bDrawingBoard then
		BossFaceAlert.IsCtrlKeyDown = false
		RE.DelayCall(50,function() BossFaceAlert.DrawingBoardText() end)
	end
end)
AppendCommand("Xóa bản vẽ chiến thuật", function()
	BossFaceAlert.ClearDrawingBoard()
end)
AppendCommand("Bắt đầu vẽ chiến thuật", function()
	BossFaceAlert.StartDrawingBoard()
end)
AppendCommand("Tạm dừng vẽ chiến thuật", function()
	BossFaceAlert.StopDrawingBoard()
end)
AppendCommand("Đóng bản vẽ chiến thuật", function()
	BossFaceAlert.CloseDrawingBoard()
end)
AppendCommand("Nhập bản vẽ chiến thuật", function()
	BossFaceAlert.GetDrawingBoard(true)
end)
--路径绘制
function BossFaceAlert.DrawingBoard()
	if (BossFaceAlert.IsCtrlKeyDown or IsCtrlKeyDown()) and BossFaceAlert.bDrawingBoard and BossFaceAlert.OpenDrawingBoard and BossFaceAlert.IsLeader() then
		if BossFaceAlert.Brush.Style == "Text" then
			BossFaceAlert.DrawingBoardText()
		else
			local me = GetClientPlayer()
			local position = me.nX..me.nY..me.nZ
			BossFaceAlert.UpdateDrawingBoard(BossFaceAlert.OpenDrawingBoard,position,me,360,BossFaceAlert.Brush.Pixel,BossFaceAlert.Brush.col,BossFaceAlert.Brush.Style,true)
		end
	end
end

function BossFaceAlert.DrawingBoardText()
	if not BossFaceAlert.IsOpenUserInput then
		local Recall = function(szText)
			BossFaceAlert.IsOpenUserInput = false
			if not szText or szText == "" then return end
			if tonumber(szText) then return end
			local me = GetClientPlayer()
			local position = me.nX..me.nY..me.nZ
			BossFaceAlert.IsCtrlKeyDown = false
			BossFaceAlert.UpdateDrawingBoard(BossFaceAlert.OpenDrawingBoard,position,me,360,BossFaceAlert.Brush.Pixel,BossFaceAlert.Brush.col,tostring(szText),true)
		end
		local fActionCancel = function()
			BossFaceAlert.IsOpenUserInput = false
		end
		BossFaceAlert.IsOpenUserInput = true -- 防止帧数刷新多次声音
		GetUserInput("Vị trí hiện tại của chiến thuật bằng văn bản", Recall,fActionCancel,nil,nil,nil,50)
	end
end

-- 创建新画板
function BossFaceAlert.CreatDrawingBoard()
	if not BossFaceAlert.IsLeader() then
		return
	end
	local Recall = function(szText)
		if not szText or szText == "" then return end
		BossFaceAlert.CreatDrawingBoardCall(tostring(szText),true)
	end
	GetUserInput("Nhập tên bản vẽ chiến thuật", Recall,nil,nil,nil,nil,30)
end
--创建因为输入中文可能会变成** 所以等传回后在插入
function BossFaceAlert.CreatDrawingBoardCall(szText,bgTalk)
	if bgTalk then
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_CreatDrawingBoard",szText)
	else
		if BossFaceAlert.IsLeader(true) then
			BossFaceAlert.bDrawingBoard = true
		end
		if BossFaceAlert.tCache.DrawingBoard[szText] then
			BossFaceAlert.tCache.DrawingBoard[szText] = nil
		end
		BossFaceAlert.OpenDrawingBoard = szText
		BossFaceAlert.handleShadowDrawingBoard:Clear()
		BossFaceAlert.ColorMessage("Bản vẽ chiến thuật đã được tạo, nếu là đội trưởng hãy giữ phím Ctrl + Chuột trái để tạo bản vẽ nhanh.",{255,255,200})
		BossFaceAlert.ColorMessage("/Vẽ - Bản vẽ chiến thuật có thể mở nhanh chóng không cần phím Ctrl, click lần nữa để đóng lại",{75,255,200})
		BossFaceAlert.ColorMessage("/Bạn có thể viết trên đường)",{75,255,200})
		BossFaceAlert.ColorMessage("/Bạn có thể xóa các bản vẽ đang có",{75,255,200})
		BossFaceAlert.ColorMessage("/Bạn có thể tắt các bản vẽ hiện tại",{75,255,200})
		BossFaceAlert.ColorMessage("/Nhập bản vẽ( có thể tải về hoặc đồng bộ với đồng đội",{75,255,200})
		BossFaceAlert.ColorMessage("/Tạm dừng vẽ( bạn có thể giữ phím Ctrl để tiếp tục vẽ",{75,255,200})
		BossFaceAlert.ColorMessage("/Phục hồi bản vẽ( tiếp tục bản vẽ bị xóa)",{75,255,200})
		BossFaceAlert.ColorMessage("Chức năng này có thể ảnh hưởng đến FPS của một số máy tính cấu hình thấp, lời khuyên là đóng đồng bộ dữ liệu khi không cần thiết",{255,255,200})
	end
end

-- 恢复
function BossFaceAlert.StartDrawingBoard()
	if BossFaceAlert.IsLeader() then
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_StartDrawingBoard")
	end
end
-- 暂停
function BossFaceAlert.StopDrawingBoard()
	if BossFaceAlert.IsLeader() then
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_StopDrawingBoard")
	end
end
-- 清空画板
function BossFaceAlert.ClearDrawingBoard()
	if BossFaceAlert.IsLeader() then
		if not BossFaceAlert.OpenDrawingBoard then
			BossFaceAlert:Message("Hiện không có bản vẽ nào, bắt đầu tạo bản vẽ trước")
			return
		end
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_ClearDrawingBoard",BossFaceAlert.OpenDrawingBoard)
	end
end
-- Close
function BossFaceAlert.CloseDrawingBoard()
	if BossFaceAlert.IsLeader() then
		if not BossFaceAlert.OpenDrawingBoard then
			BossFaceAlert:Message("Hiện không có bản vẽ nào, bắt đầu tạo bản vẽ trước")
			return
		end
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_CloseDrawingBoard",BossFaceAlert.OpenDrawingBoard)
	end
end
-- GetDrawingBoard
function BossFaceAlert.GetDrawingBoard(PM)
	local t = {szOption = "Nạp bản vẽ (cần đồng bộ dữ liệu)"}
	table.insert(t,{szOption = "Sau đây sẽ hiển thị những bản vẽ vừa nạp", bDisable = true,})
	for k,v in pairs(BossFaceAlert.tCache.DrawingBoard) do
		local szOption = "Bản vẽ "..k
		local rgb = {255,255,255}
		if BossFaceAlert.OpenDrawingBoard  == k then
			szOption = szOption .. " Hiện đang mở "
			rgb = {255,0,0}
		end
		local _ = {
			szOption = szOption,rgb = rgb,fnAction = function()
				BossFaceAlert.SyncDrawingBoard(k)
				BossFaceAlert.LoadDrawingBoard(k)
			end,
		}
		table.insert(t,_)
	end
	table.insert(t,{bDevide = true})
	table.insert(t,{szOption = "Lưu tất cả bản vẽ hiện tại",fnAction = function()
		if not IsEmpty(BossFaceAlert.tCache.DrawingBoard) then
			-- SaveLUAData("\\Interface\\RaidGrid_EventScrutiny\\alldat\\DrawingBoard",BossFaceAlert.tCache.DrawingBoard)
			-- BossFaceAlert:Message("Lưu thành công tại thư mục Interface\RaidGrid_EventScrutiny\alldat")
		else
			BossFaceAlert:Message("Hiện không có bản vẽ nào")
		end
	end})
	table.insert(t,{szOption = "Nhập bản vẽ được lưu",fnAction = function()
		local tDrawingBoard = LoadLUAData("\\Interface\\RaidGrid_EventScrutiny\\alldat\\DrawingBoard")
		if tDrawingBoard then
			BossFaceAlert.tCache.DrawingBoard = tDrawingBoard
			BossFaceAlert:Message("Bạn có thể chọn một bản vẽ được lưu")
		else
			BossFaceAlert:Message("Không tìm thấy bản vẽ nào tại thư mục Interface\RaidGrid_EventScrutiny\alldat\，tập tin cần đổi tên thành DrawingBoard")
		end
	end})
	if PM then
		RE.DelayCall(50,function() PopupMenu(t) end)
	else
		return t
	end
end
-- 用来同步画板
function BossFaceAlert.SyncDrawingBoard(DrawingBoard)
	if BossFaceAlert.tCache.DrawingBoard[DrawingBoard] and BossFaceAlert.IsLeader() then
		local i = 1
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_SyncDrawingBoard",DrawingBoard)
		for k,v in pairs(BossFaceAlert.tCache.DrawingBoard[DrawingBoard]) do
			-- 防止宕机... 估计就算这样也会死一批
			RE.DelayCall(20*i,function()
				BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_UpdateDrawingBoard",v)
			end)
		i = i + 1
		end
	end
end

-- 加载某个画板
function BossFaceAlert.LoadDrawingBoard(DrawingBoard)
	if BossFaceAlert.tCache.DrawingBoard[DrawingBoard] and BossFaceAlert.IsLeader() then
		BossFaceAlert.handleShadowDrawingBoard:Clear()
		BossFaceAlert.OpenDrawingBoard = DrawingBoard
		BossFaceAlert:Message("Bắt đầu tải về các bản vẽ")
		local i = 1
		for k,v in pairs(BossFaceAlert.tCache.DrawingBoard[DrawingBoard]) do
			BossFaceAlert.LoadDrawingBoardCall(v,15*i)
			i = i + 1
		end
	end
end

function BossFaceAlert.LoadDrawingBoardCall(szCode,nDelayCall)
	RE.DelayCall(nDelayCall,function()
		local tStr = BossFaceAlert.Split(szCode,"|")
		local target = {
			nX = tonumber(tStr[2]),
			nY = tonumber(tStr[3]),
			nZ = tonumber(tStr[4]),
			nFaceDirection = tonumber(tStr[5])
		}
		local tColor = {tonumber(tStr[8]),tonumber(tStr[9]),tonumber(tStr[10])}
		local Style = tonumber(tStr[12]) or tStr[12]
		BossFaceAlert.UpdateDrawingBoard(tStr[1],tStr[2]..tStr[3]..tStr[4],target,tonumber(tStr[6]),tonumber(tStr[7]),tColor,Style,false)
	end)
end

-- 更新绘图路径
function BossFaceAlert.UpdateDrawingBoard(CachedwID,CacheClass,target,nAngle,nLength,tColor,Style,bgTalk)
	if not BossFaceAlert.OpenDrawingBoard or BossFaceAlert.OpenDrawingBoard ~= CachedwID then
		BossFaceAlert.OpenDrawingBoard = CachedwID
	end
	local r,g,b = unpack(tColor)
	local str = tostring(CachedwID.."|"..target.nX.."|"..target.nY.."|"..target.nZ.."|"..target.nFaceDirection.."|"..nAngle.."|"..nLength.."|"..r.."|"..g.."|"..b.."|255|"..Style)
	local shadow = BossFaceAlert.handleShadowDrawingBoard:Lookup(CacheClass)
	if not shadow then
		shadow = BossFaceAlert.handleShadowDrawingBoard:AppendItemFromIni("Interface/RaidGrid_EventScrutiny/BossFaceAlert.ini", "Shadow_Info",CacheClass)
	else
		if BossFaceAlert.tCache.DrawingBoard[CachedwID] and BossFaceAlert.tCache.DrawingBoard[CachedwID][CacheClass] == str then
			return
		end
	end
	
	if BossFaceAlert.tCache.DrawingBoard[CachedwID] then
		BossFaceAlert.tCache.DrawingBoard[CachedwID][CacheClass] = str
	else
		BossFaceAlert.tCache.DrawingBoard[CachedwID] = {}
		BossFaceAlert.tCache.DrawingBoard[CachedwID][CacheClass] = str
	end
	if type(Style) == "string" then
		shadow:SetTriangleFan(GEOMETRY_TYPE.TEXT)
		shadow:ClearTriangleFanPoint()
		shadow:AppendTriangleFan3DPoint(target.nX,target.nY,target.nZ,r,g,b,255,{0,0,0,0,-50},21,Style,1,1.5)
	elseif Style == 1 then
		shadow:SetTriangleFan(GEOMETRY_TYPE.TRIANGLE)
		shadow:ClearTriangleFanPoint()
		local tEndPos = BossFaceAlert.GetExtensionPos(target,0,nLength*32)
		local nAX,nAY,nBX,nBY,nCX,nCY,nDX,nDY = BossFaceAlert.GetExtensionPosLine(target.nX, target.nY , tEndPos.nX, tEndPos.nY , false)
		shadow:AppendTriangleFan3DPoint(nAX, nAY, target.nZ, r,g,b,255)
		shadow:AppendTriangleFan3DPoint(nBX, nBY, target.nZ, r,g,b,255)
		shadow:AppendTriangleFan3DPoint(nCX, nCY, target.nZ, r,g,b,255)
		shadow:AppendTriangleFan3DPoint(nDX, nDY, target.nZ, r,g,b,255)
	else
		shadow:SetTriangleFan(GEOMETRY_TYPE.TRIANGLE)
		shadow:ClearTriangleFanPoint()
		local nHalfAngle = math.floor(nAngle / 2)
		local nStepAngle = Style
		local nPointCount = math.floor(nHalfAngle / nStepAngle) * 2 + 1
		local nStartAngle = math.floor(nHalfAngle / nStepAngle) * nStepAngle * (-1)
		for i = 0, nPointCount - 1 do
			local tEndPos = BossFaceAlert.GetExtensionPos(target, nStartAngle + i * nStepAngle, nLength)
			if tEndPos.nX and tEndPos.nY and tEndPos.nZ then
				shadow:AppendTriangleFan3DPoint(tEndPos.nX, tEndPos.nY, tEndPos.nZ, r, g, b, 255)
			end
		end
	end
	if bgTalk then
		BossFaceAlert.BgTalk(PLAYER_TALK_CHANNEL.RAID,"BFA_UpdateDrawingBoard",str)
	end
end
BossFaceAlert.DrawingBoardAction = {
	BFA_CreatDrawingBoard = function(szText,szName)
		BossFaceAlert.CreatDrawingBoardCall(szText,false)
		BossFaceAlert:Message(szName.."Tạo bản vẽ mới"..szText)
	end,
	BFA_SyncDrawingBoard = function(szText,szName)
		BossFaceAlert.CreatDrawingBoardCall(szText,false)
		BossFaceAlert:Message(szName.."Đồng bộ dữ liệu các bản vẽ" ..szText)
	end,
	BFA_StartDrawingBoard = function(szText,szName)
		if BossFaceAlert.IsLeader(true) then
			BossFaceAlert.bDrawingBoard = true
		end
		BossFaceAlert:Message(szName.."Bắt đầu tạo bản vẽ mới")
	end,
	BFA_StopDrawingBoard = function(szText,szName)
		if BossFaceAlert.IsLeader(true) then
			BossFaceAlert.bDrawingBoard = false
		end
		BossFaceAlert:Message(szName.."Tạm dừng bản vẽ hiện tại")
	end,
	BFA_ClearDrawingBoard = function(szText,szName)
		BossFaceAlert.handleShadowDrawingBoard:Clear()
		BossFaceAlert.tCache.DrawingBoard[szText] = nil
		BossFaceAlert:Message(szName.."Xóa bản vẽ" )
	end,
	BFA_CloseDrawingBoard = function(szText,szName)
		BossFaceAlert.handleShadowDrawingBoard:Clear()
		BossFaceAlert.bDrawingBoard = false
		BossFaceAlert.OpenDrawingBoard = nil
		BossFaceAlert:Message(szName.."Đóng bản vẽ hiện tại")
	end,
}
-- 后台通信执行
RegisterEvent("ON_BG_CHANNEL_MSG",function()
	if not BossFaceAlert.bSyncDrawingBoard or not IsMultiThread() then
		return
	end
	local player = GetClientPlayer()
	local t = player.GetTalkData()
	if t and t[2] then
		if t[2].text == "BFA_UpdateDrawingBoard" and arg3 ~= player.szName then
			BossFaceAlert.LoadDrawingBoardCall(t[3].text,50)
		elseif BossFaceAlert.DrawingBoardAction[t[2].text] then
			local szText = false
			if t[3] then szText = t[3].text end
			BossFaceAlert.DrawingBoardAction[t[2].text](szText,arg3)
		end
	end
end)

-- 退租Event
RegisterEvent("PARTY_DELETE_MEMBER",function()
	if arg2 == GetClientPlayer().szName then
		BossFaceAlert.bDrawingBoard = false
		BossFaceAlert.OpenDrawingBoard = nil
		BossFaceAlert.handleShadowDrawingBoard:Clear()
	end
end)
--解散Event
RegisterEvent("PARTY_DISBAND",function()
	BossFaceAlert.bDrawingBoard = false
	BossFaceAlert.OpenDrawingBoard = nil
	BossFaceAlert.handleShadowDrawingBoard:Clear()
end)
--TEAM_AUTHORITY_CHANGED
RegisterEvent("TEAM_AUTHORITY_CHANGED",function()
	if BossFaceAlert.OpenDrawingBoard and arg0 == 1 then
		if arg3 ~= GetClientPlayer().dwID and BossFaceAlert.bDrawingBoard then
			BossFaceAlert.bDrawingBoard = false
			BossFaceAlert:Message("Đổi đội trưởng, bạn cần tạm dừng bản vẽ hiện tại.")
		elseif arg3 == GetClientPlayer().dwID then
			BossFaceAlert.bDrawingBoard = true
			BossFaceAlert:Message("Bạn là đội trưởng mới, cần bắt đầu bản vẽ mới")
		end
	end
end)
---------------------------------------------------------------------------------------------------------
function BossFaceAlert:Message(szMessage)
	OutputMessage("MSG_SYS", "[BossFaceAlert] " .. tostring(szMessage) .. "\n")
end
function BossFaceAlert:DebugMessage(szMessage)
	if BossFaceAlert.Debug then
		OutputMessage("MSG_SYS", "[Debug] " .. tostring(szMessage) .. "\n")
	end
end
function BossFaceAlert.ColorMessage(szMessage,col)
	local r,g,b = unpack(col)
	OutputMessage("MSG_SYS", "<text>text=\"".. tostring(szMessage) .."\n\" font=10 r="..r.." g="..g.." b="..b.." </text>", true)
end
function BossFaceAlert.SetSelectAllNpcMode(bEnable)
	if bEnable then
		CanSelectNpc = function(dwNpcID)
			return true
		end
	else
		CanSelectNpc = BossFaceAlert.CanSelectNpc
	end
end

function BossFaceAlert.Split(szFull, szSep)
	local nOff, tResult = 1, {}
	while true do
		local nEnd = StringFindW(szFull, szSep, nOff)
		if not nEnd then
			table.insert(tResult, string.sub(szFull, nOff, string.len(szFull)))
			break
		else
			table.insert(tResult, string.sub(szFull, nOff, nEnd - 1))
			nOff = nEnd + string.len(szSep)
		end
	end
	return tResult
end

function BossFaceAlert.BgTalk(nChannel, ...)
	local tSay = { { type = "text", text = "BG_CHANNEL_MSG" } }
	local tArg = { ... }
	for _, v in ipairs(tArg) do
		if v == nil then
			break
		end
		table.insert(tSay, { type = "text", text = tostring(v) })
	end
	GetClientPlayer().Talk(nChannel,"",tSay)
end

---------------------------------------------------------------------------------------------------------
---------------------------------------------------------------------------------------------------------
function BossFaceAlert.OpenPanel()
	local frame = Station.Lookup("Lowest/BossFaceAlert")
	if not frame then
		frame = Wnd.OpenWindow("Interface\\RaidGrid_EventScrutiny\\BossFaceAlert.ini", "BossFaceAlert")
	end
	frame:Show()
	BossFaceAlert.frameSelf = frame
	BossFaceAlert.handleShadowCircle = frame:Lookup("", "Handle_Shadow_Circle")
	BossFaceAlert.handleShadowLine = frame:Lookup("", "Handle_Shadow_Line")
	BossFaceAlert.handleShadowBorder = frame:Lookup("", "Handle_Shadow_Border")
	BossFaceAlert.handleShadowDrawingBoard = frame:Lookup("", "Handle_Shadow_DrawingBoard")
	BossFaceAlert.handleShadowName = frame:Lookup("", "Shadow_Name")
	BossFaceAlert.handleShadowName:SetTriangleFan(GEOMETRY_TYPE.TEXT)
end

BossFaceAlert.OpenPanel()




BossFaceAlertUI = {}
BossFaceAlertUI.frameSelf = nil
BossFaceAlertUI.handleMain = nil
BossFaceAlertUI.handleRecord = {}
BossFaceAlertUI.handleIndex = 0
------------------------------------------------------------------
--窗体界面相关
------------------------------------------------------------------
function BossFaceAlertUI.SetOrGetEditText(szName, szText)
	local frame = BossFaceAlertUI.frameSelf
	if szName then
		local edit = frame:Lookup(szName)
		if edit then
			if szText then
				edit:SetText(tostring(szText))
			else
				local szEditText = edit:GetText()
				return szEditText
			end
		end
	end
end

function BossFaceAlertUI.SetOrGetCheckBoxState(szName, bChecked)
	local frame = BossFaceAlertUI.frameSelf
	if szName then
		local checkbox = frame:Lookup(szName)
		if checkbox then
			if bChecked ~= nil then
				checkbox:Check(bChecked)
			else
				local IsChecked = checkbox:IsCheckBoxChecked()
				return IsChecked
			end
		end
	end
end

function  BossFaceAlertUI.SetOrGetColor(szName, r, g, b)
	local handle = BossFaceAlertUI.handleMain
	if szName then
		local Shadow = handle:Lookup(szName)
		if Shadow then
			if r and g and b then
				Shadow:SetColorRGB(r, g, b)
			else
				local Red, Green, Blue = Shadow:GetColorRGB()
				return Red, Green, Blue
			end
		end
	end
end

function BossFaceAlertUI.RefreshRecordShow(tRecord, nIndex)
	if not tRecord then
		tRecord = BossFaceAlertUI.handleRecord
	end
	if not nIndex then
		nIndex = BossFaceAlertUI.handleIndex
	end

	BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_FaceCircle", tRecord.bOn or false)
	BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleLength", tRecord.nLength)
	BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleAngle", tRecord.nAngle)
	BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleAlpha", tRecord.tColor.a)
	BossFaceAlertUI.SetOrGetColor("Shadow_FaceCircleColor", tRecord.tColor.r, tRecord.tColor.g, tRecord.tColor.b)
	
	BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_DistanceCircle", tRecord.bDistanceCircleOn or false)
	tRecord.nLength2 = tRecord.nLength2 or 3
	BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleLength", tRecord.nLength2)
	tRecord.nAngle2 = tRecord.nAngle2 or 360
	BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleAngle", tRecord.nAngle2)
	if not tRecord.tColor2 then
		tRecord.tColor2 = {r = 255,g = 0,b = 0,a = 200}
	end
	BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleAlpha", tRecord.tColor2.a)
	BossFaceAlertUI.SetOrGetColor("Shadow_DistanceCircleColor", tRecord.tColor2.r, tRecord.tColor2.g, tRecord.tColor2.b)
	
	BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_TargetTarget", not tRecord.bNotShowTargetName)
	BossFaceAlertUI.SetOrGetEditText("Edit_Description", tRecord.szDescription or "")
	
	BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_AllOnOffSwicth", not tRecord.bAllDisable)
	BossFaceAlertUI.SetOrGetEditText("Edit_RecordName", tRecord.szName or "")
end

function BossFaceAlertUI.SaveRecordSetting(tRecord, nIndex)
	if not tRecord then
		tRecord = BossFaceAlertUI.handleRecord
	end
	if not nIndex then
		nIndex = BossFaceAlertUI.handleIndex
	end
	tRecord.bOn = BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_FaceCircle") or false 
	tRecord.nLength = BossFaceAlertUI.ToLength(BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleLength")) or tRecord.nLength
	tRecord.nAngle = BossFaceAlertUI.ToAngle(BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleAngle")) or tRecord.nAngle
	tRecord.tColor.a = BossFaceAlertUI.ToAlpha(BossFaceAlertUI.SetOrGetEditText("Edit_FaceCircleAlpha")) or tRecord.tColor.a
	tRecord.tColor.r, tRecord.tColor.g, tRecord.tColor.b = BossFaceAlertUI.SetOrGetColor("Shadow_FaceCircleColor")
	
	tRecord.bDistanceCircleOn = BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_DistanceCircle") or false 
	tRecord.nLength2 = BossFaceAlertUI.ToLength(BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleLength")) or tRecord.nLength2
	tRecord.nAngle2 = BossFaceAlertUI.ToAngle(BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleAngle")) or tRecord.nAngle2
	if not tRecord.tColor2 then
		tRecord.tColor2 = {r = 255,g = 0,b = 0,a = 200}
	end
	tRecord.tColor2.a = BossFaceAlertUI.ToAlpha(BossFaceAlertUI.SetOrGetEditText("Edit_DistanceCircleAlpha")) or tRecord.tColor2.a
	tRecord.tColor2.r, tRecord.tColor2.g, tRecord.tColor2.b = BossFaceAlertUI.SetOrGetColor("Shadow_DistanceCircleColor")
	
	tRecord.bNotShowTargetName = not BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_TargetTarget")
	tRecord.szDescription = BossFaceAlertUI.SetOrGetEditText("Edit_Description") or nil
	if tRecord.szDescription == "" then
		tRecord.szDescription = nil
	end
	
	tRecord.bAllDisable = not BossFaceAlertUI.SetOrGetCheckBoxState("CheckBox_AllOnOffSwicth")	
	if nIndex == -1 then
		tRecord.szName = BossFaceAlertUI.SetOrGetEditText("Edit_RecordName") or tRecord.szName
		if tRecord.szName and tRecord.szName ~= "" then
			for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
				if tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(tRecord.szName) then
					BossFaceAlert:Message("Không thể thêm, thiết lập giám sát ["..tRecord.szName.."] đã tồn tại!")
					return
				end
			end
			BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames + 1
			table.insert(BossFaceAlert.DrawFaceLineNames, tRecord)
			BossFaceAlert:Message("Bộ giám sát ["..tRecord.szName.."]thêm thành công.")
			BossFaceAlert.RestartFaceCircle()
		else
			BossFaceAlert:Message("Thêm vào thất bại, tên không thể để trống!")
		end
	elseif nIndex > 0 then
		local szNewName = BossFaceAlertUI.SetOrGetEditText("Edit_RecordName")
		if szNewName and szNewName ~= "" then
			for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
				if (tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(szNewName)) and (nIndex ~= i) then
					BossFaceAlert:Message("Bộ giám sát ["..tRecord.szName.."] sửa đổi thành công, nhưng không thể đổi tên ["..szNewName.."]")
					return
				end
			end
			if tRecord.szName == szNewName then
				BossFaceAlert:Message("Bộ giám sát ["..tRecord.szName.."] sửa đổi thành công.")
			else
				BossFaceAlert:Message("Bộ giám sát ["..tRecord.szName.."] sửa đổi và đổi tên thành công ["..szNewName.."].")
				tRecord.szName = szNewName
				BossFaceAlert.RestartFaceCircle()
			end
		else
			BossFaceAlert:Message("Bộ giám sát ["..tRecord.szName.."] sửa đổi thành công.")
		end
	elseif nIndex == 0 then
		BossFaceAlert:Message("Thay đổi thành công thiết lập mặc định.")
	end
	BossFaceAlert.ClearAllItem()
	--BossFaceAlertUI.frameSelf:Hide()
end

function BossFaceAlertUI.ToNumber(szText)
	if szText then
		local nNum = tonumber(szText)
		if nNum then
			return nNum
		end
	end
end

function BossFaceAlertUI.ToAngle(szText)
	if szText then
		local nNum = tonumber(szText)
		if nNum and nNum <=360 and nNum > 0 then
			return nNum
		end
	end
end

function BossFaceAlertUI.ToAlpha(szText)
	if szText then
		local nNum = tonumber(szText)
		if nNum and nNum <=255 and nNum > 0 then
			return nNum
		end
	end
end

function BossFaceAlertUI.ToLength(szText)
	if szText then
		local nNum = tonumber(szText)
		if nNum and nNum > 0 then
			return nNum
		end
	end
end

function BossFaceAlertUI.Btn_New_Click()
	GetUserInput("Nhập tên mục tiêu", function(szText) 
		BossFaceAlert.AddList(szText)
		BossFaceAlert.RestartFaceCircle()
		BossFaceAlertUI.ShowWnd()
	end)
end


function BossFaceAlertUI.Btn_New(tRecord, szNewName, nClass)
	BossFaceAlertUI.handleRecord = tRecord or clone(BossFaceAlert.tDefaultSetForAdd)
	BossFaceAlertUI.handleRecord.szName = szNewName or tostring("")
	if nClass then
		BossFaceAlertUI.handleRecord.nFaceClass = nClass
	end
	BossFaceAlertUI.handleIndex = -1
	BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
end

function BossFaceAlertUI.Btn_New_ByClone()
	local tRecord = clone(BossFaceAlertUI.handleRecord)
	BossFaceAlertUI.handleRecord = tRecord
	--local nCount = #BossFaceAlert.DrawFaceLineNames + 1
	BossFaceAlertUI.handleRecord.szName = tostring("")
	BossFaceAlertUI.handleIndex = -1
	BossFaceAlertUI.SetOrGetEditText("Edit_RecordName", BossFaceAlertUI.handleRecord.szName or "")
end

function BossFaceAlertUI.Btn_NextPage()
	if not IsCtrlKeyDown() then
		if BossFaceAlertUI.handleIndex < #BossFaceAlert.DrawFaceLineNames and BossFaceAlertUI.handleIndex >= 0 then
			BossFaceAlertUI.handleIndex = BossFaceAlertUI.handleIndex + 1
			BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
			BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
		end
	elseif #BossFaceAlert.DrawFaceLineNames > 0 then
		BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames
		BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
		BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
	end
end

function BossFaceAlertUI.Btn_PrePage()
	if not IsCtrlKeyDown() then
		if BossFaceAlertUI.handleIndex > 1 then
			BossFaceAlertUI.handleIndex = BossFaceAlertUI.handleIndex - 1
			BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
			BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
		elseif BossFaceAlertUI.handleIndex == -1 then
			BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames
			BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
			BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
		end
	elseif #BossFaceAlert.DrawFaceLineNames > 0 then
		BossFaceAlertUI.handleIndex = 1
		BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
		BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
	end
end

function BossFaceAlertUI.Btn_Option()
	local tOptions = BossFaceAlert.GetRecordMenuList()
	local nX, nY = Cursor.GetPos(true)
	tOptions.x, tOptions.y = nX + 15, nY + 15
	PopupMenu(tOptions)
end

function BossFaceAlertUI.Btn_Setting()
	local tOptions = BossFaceAlert.GetMenuList()
	local nX, nY = Cursor.GetPos(true)
	tOptions.x, tOptions.y = nX + 15, nY + 15
	PopupMenu(tOptions)
end

function BossFaceAlertUI.OnLButtonClick()
	local name = this:GetName()
	if name == "Btn_Close" then
		--BossFaceAlertUI.SwitchWnd()
		BossFaceAlertUI.frameSelf:Hide()
	elseif name == "Btn_OK" then
		BossFaceAlertUI.SaveRecordSetting()
	elseif name == "Btn_NEW" then
		if not IsCtrlKeyDown() then
			BossFaceAlertUI.Btn_New_Click()
			--BossFaceAlertUI.Btn_New()
		else
			BossFaceAlertUI.Btn_New_ByClone()
		end
	elseif name == "Btn_NextPage" then
		BossFaceAlertUI.Btn_NextPage()
	elseif name == "Btn_PrePage" then
		BossFaceAlertUI.Btn_PrePage()
	elseif name == "Btn_Option" then
		BossFaceAlertUI.Btn_Option()
	elseif name == "Btn_Setting" then
		BossFaceAlertUI.Btn_Setting()
	elseif name == "Button_FaceCircleColor" then
		OpenColorTablePanel(function(r, g, b)
			BossFaceAlertUI.SetOrGetColor("Shadow_FaceCircleColor", r, g, b)
			BossFaceAlertUI.handleRecord.tColor.r, BossFaceAlertUI.handleRecord.tColor.g, BossFaceAlertUI.handleRecord.tColor.b = r, g, b
		end)
	elseif name == "Button_DistanceCircleColor" then
		OpenColorTablePanel(function(r, g, b)
			BossFaceAlertUI.SetOrGetColor("Shadow_DistanceCircleColor", r, g, b)
			if not BossFaceAlertUI.handleRecord.tColor2 then
				BossFaceAlertUI.handleRecord.tColor2 = {r = 255,g = 0,b = 0,a = 200}
			end
			BossFaceAlertUI.handleRecord.tColor2.r, BossFaceAlertUI.handleRecord.tColor2.g, BossFaceAlertUI.handleRecord.tColor2.b = r, g, b
		end)
	end
end

------------------------------------------------------------------
--这个方法用于初始化重置窗体
------------------------------------------------------------------
function BossFaceAlertUI.InitFrame()
	local handle = BossFaceAlertUI.handleMain
	handle:Lookup("Text_Title"):SetText("TụLong   Lạc  Dương")
	handle:Lookup("Text_FaceCircleLength"):SetText("")
	handle:Lookup("Text_FaceCircleAngle"):SetText("Góc")
	handle:Lookup("Text_FaceCircleAlpha"):SetText("Trong suốt")
	handle:Lookup("Text_DistanceCircleLength"):SetText("")
	handle:Lookup("Text_DistanceCircleAngle"):SetText("Góc")
	handle:Lookup("Text_DistanceCircleAlpha"):SetText("Trong suốt")
	handle:Lookup("Text_Description"):SetText("")
	local CheckBox_FaceCircle = BossFaceAlertUI.frameSelf:Lookup("CheckBox_FaceCircle")
	CheckBox_FaceCircle:Lookup("", ""):Lookup("Text_FaceCircle"):SetText("Hướng mặt")
	local CheckBox_DistanceCircle = BossFaceAlertUI.frameSelf:Lookup("CheckBox_DistanceCircle")
	CheckBox_DistanceCircle:Lookup("", ""):Lookup("Text_DistanceCircle"):SetText("Vòng")
	local CheckBox_TargetTarget = BossFaceAlertUI.frameSelf:Lookup("CheckBox_TargetTarget")
	CheckBox_TargetTarget:Lookup("", ""):Lookup("Text_TargetTarget"):SetText("Mô tả mục tiêu")
	local CheckBox_AllOnOffSwicth = BossFaceAlertUI.frameSelf:Lookup("CheckBox_AllOnOffSwicth")
	CheckBox_AllOnOffSwicth:Lookup("", ""):Lookup("Text_AllOnOffSwicth"):SetText("Hiện")
	local Btn_NEW = BossFaceAlertUI.frameSelf:Lookup("Btn_NEW")
	Btn_NEW:Lookup("", ""):Lookup("Text_NEW"):SetText("Tạo mới")
	local Btn_OK = BossFaceAlertUI.frameSelf:Lookup("Btn_OK")
	Btn_OK:Lookup("", ""):Lookup("Text_OK"):SetText("Lưu")
	BossFaceAlertUI.handleIndex = 0
	BossFaceAlertUI.handleRecord = BossFaceAlert.tDefaultSetForAdd
	BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
end

function BossFaceAlertUI.InitShow()
	if #BossFaceAlert.DrawFaceLineNames > 0 then
		BossFaceAlertUI.handleIndex = #BossFaceAlert.DrawFaceLineNames
		BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[BossFaceAlertUI.handleIndex]
		BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
	else
		BossFaceAlertUI.handleIndex = 0
		BossFaceAlertUI.handleRecord = BossFaceAlert.tDefaultSetForAdd
		BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
	end
end

function BossFaceAlertUI.OnCheckBoxCheck()
	local name = this:GetName()
	if name == "CheckBox_FaceCircle" then
		BossFaceAlertUI.handleRecord.bOn = true
	elseif name == "CheckBox_DistanceCircle" then
		BossFaceAlertUI.handleRecord.bDistanceCircleOn = true
	elseif name == "CheckBox_TargetTarget" then
		BossFaceAlertUI.handleRecord.bNotShowTargetName = false
	elseif name == "CheckBox_AllOnOffSwicth" then
		BossFaceAlertUI.handleRecord.bAllDisable = false
	end
	BossFaceAlert.ClearAllItem()
end

function BossFaceAlertUI.OnCheckBoxUncheck()
	local name = this:GetName()
	if name == "CheckBox_FaceCircle" then
		BossFaceAlertUI.handleRecord.bOn = false
	elseif name == "CheckBox_DistanceCircle" then
		BossFaceAlertUI.handleRecord.bDistanceCircleOn = false
	elseif name == "CheckBox_TargetTarget" then
		BossFaceAlertUI.handleRecord.bNotShowTargetName = true
	elseif name == "CheckBox_AllOnOffSwicth" then
		BossFaceAlertUI.handleRecord.bAllDisable = true
	end
	BossFaceAlert.ClearAllItem()
end

------------------------------------------------------------------
--这个方法用于开启关闭窗体
------------------------------------------------------------------
function BossFaceAlertUI.SwitchWnd()
    local frame = Station.Lookup("Normal/BossFaceAlertUI")
	if frame then
		if frame:IsVisible() then
			frame:Hide()
		else
			frame:Show()
		end
	else
        frame = Wnd.OpenWindow("Interface\\RaidGrid_EventScrutiny\\BossFaceAlertUI.ini", "BossFaceAlertUI")
		frame:SetPoint("CENTER", 0, 0, "CENTER", 0, -100)
		
		BossFaceAlertUI.frameSelf = frame
		BossFaceAlertUI.handleMain = BossFaceAlertUI.frameSelf:Lookup("", "")
		
		BossFaceAlertUI.InitFrame()
		
		frame:Show()
		frame:Hide()
	end
end

function BossFaceAlertUI.ShowWnd()
    local frame = Station.Lookup("Normal/BossFaceAlertUI")
	if frame then
		--BossFaceAlertUI.InitFrame()
		frame:Show()
	else
		BossFaceAlertUI.SwitchWnd()
		BossFaceAlertUI.frameSelf:Show()
	end
end

function IsBossFaceAlertUIOpened()
	local frame = Station.Lookup("Normal/BossFaceAlertUI")
	if frame and frame:IsVisible() then
		return true
	end
	return false
end

BossFaceAlertUI.SwitchWnd()
RegisterEvent("CUSTOM_DATA_LOADED", function() BossFaceAlertUI.InitShow() end)
------------------------------------------------------------------


BossFaceDirection = BossFaceDirection or {}
BossFaceDirection.bEnable = false
BossFaceDirection.Anchor = {s = "CENTER" , r = "CENTER" , x = 100 , y = -50}
BossFaceDirection.DefAnchor = {s = "CENTER" , r = "CENTER" , x = 100 , y = -50}
RegisterCustomData("BossFaceDirection.bEnable")
RegisterCustomData("BossFaceDirection.Anchor")

BossFaceDirection.bSelfTargetDirection = true
BossFaceDirection.bStereoDistance = false
RegisterCustomData("BossFaceDirection.bSelfTargetDirection")
RegisterCustomData("BossFaceDirection.bStereoDistance")

BossFaceDirection.PointX = nil
BossFaceDirection.PointY = nil
BossFaceDirection.PointZ = nil

function BossFaceDirection.OnFrameCreate()
	this:RegisterEvent("CUSTOM_DATA_LOADED")
	this:RegisterEvent("ON_ENTER_CUSTOM_UI_MODE")
	this:RegisterEvent("ON_LEAVE_CUSTOM_UI_MODE")
	this:RegisterEvent("CUSTOM_UI_MODE_SET_DEFAULT")
	this:RegisterEvent("UI_SCALED")
	UpdateCustomModeWindow(this,"BossFaceDirection")
	BossFaceDirection.UpdateAnchor(this)
end

function BossFaceDirection.OnEvent(szEvent)
	if szEvent == "ON_ENTER_CUSTOM_UI_MODE" or szEvent == "ON_LEAVE_CUSTOM_UI_MODE" then
		UpdateCustomModeWindow(this)
		BossFaceDirection.UpdateAnchor(this)
	elseif szEvent == "UI_SCALED" then
		UpdateCustomModeWindow(this)
		BossFaceDirection.UpdateAnchor(this)
	elseif szEvent == "CUSTOM_DATA_LOADED" then
		UpdateCustomModeWindow(this)
		BossFaceDirection.UpdateAnchor(this)
	elseif szEvent == "CUSTOM_UI_MODE_SET_DEFAULT" then
		BossFaceDirection.ResetAnchor(this)
	end
end

function BossFaceDirection.OnFrameDragEnd()
	this:CorrectPos()
	BossFaceDirection.Anchor = GetFrameAnchor(this)
end

function BossFaceDirection.ResetAnchor(frame)
	BossFaceDirection.Anchor.s=BossFaceDirection.DefAnchor.s
	BossFaceDirection.Anchor.r=BossFaceDirection.DefAnchor.r
	BossFaceDirection.Anchor.x=BossFaceDirection.DefAnchor.x
	BossFaceDirection.Anchor.y=BossFaceDirection.DefAnchor.y
	frame:SetPoint(BossFaceDirection.Anchor.s,0,0,BossFaceDirection.Anchor.r, BossFaceDirection.Anchor.x , BossFaceDirection.Anchor.y)
	frame:CorrectPos()
end

function BossFaceDirection.UpdateAnchor(frame)
	frame:SetPoint(BossFaceDirection.Anchor.s,0,0,BossFaceDirection.Anchor.r, BossFaceDirection.Anchor.x , BossFaceDirection.Anchor.y)
	frame:CorrectPos()
end

function BossFaceDirection.OnFrameBreathe()
	local player = GetClientPlayer()
	if not player then return end
	local handle = this:Lookup("", "Handle_Main") 
	local imgArrow = handle:Lookup("Image_Arrow")
	imgArrow:SetRotate(4.7124)
	local imgDirection = handle:Lookup("Image_Player")
	local txtDistance = handle:Lookup("Text_Distance")
	local dwTargetType, dwTargetID = player.GetTarget()
	local hTarget = nil
	local nDistX = nil
	local nDistY = nil
	local nDist = nil
	if BossFaceDirection.PointX ~= nil and BossFaceDirection.PointY ~= nil then
		hTarget = {}
		hTarget.nX = BossFaceDirection.PointX
		hTarget.nY = BossFaceDirection.PointY
		hTarget.nZ = BossFaceDirection.PointZ
		dwTargetID = 0
	elseif BossFaceDirection.bSelfTargetDirection then
		if dwTargetType == TARGET.NPC then
			hTarget = GetNpc(dwTargetID)
		elseif dwTargetType == TARGET.PLAYER then
			hTarget = GetPlayer(dwTargetID)
		end
	end
	if hTarget and dwTargetID ~= player.dwID and hTarget.nX ~= player.nX and hTarget.nY ~= player.nY then
		local Distance = 0 --GetCharacterDistance(dwTargetID,player.dwID)	--计算距离
		nDistX = hTarget.nX - player.nX
		nDistY = hTarget.nY - player.nY
		if not BossFaceDirection.bStereoDistance then
			nDist = math.sqrt(nDistX^2 + nDistY^2)
		else
			nDist = math.sqrt(nDistX^2 + nDistY^2 + (player.nZ - (hTarget.nZ or player.nZ))^2/64)
		end
		if nDist then
			Distance = nDist / 64
			local szText = string.format("%.1f",Distance)	
			txtDistance:SetText(szText.."thước")
		end
		local nRadian = 0												--自己与目标间的弧度
		if nDistY<0 then
			nRadian = math.acos(nDistX/nDist)
		else
			nRadian = 6.2832 - math.acos(nDistX/nDist)				--得到弧度值，上方的弧度大
		end
		local nFaceRadian = (255 - player.nFaceDirection) * 6.2832 / 255	--自己方向的弧度
		local nRadianOffset = nRadian - nFaceRadian					--弧度偏移量  负的向左转，正的向有右转
		local nArrowDirection = 4.7124 + nRadianOffset				--箭头方向
		if nArrowDirection > 6.2832 then
			nArrowDirection = nArrowDirection - 6.2832
		end
		imgDirection:Show()
		imgDirection:SetRotate(nArrowDirection)
		txtDistance:Show()
		imgArrow:Show()
	else
		imgDirection:Hide()
		txtDistance:Hide()
		imgArrow:Hide()
	end
end


function BossFaceDirection.OpenOrClose()
	local frame = Station.Lookup("Normal/BossFaceDirection")
	if not frame and BossFaceDirection.bEnable then
		Wnd.OpenWindow("Interface\\RaidGrid_EventScrutiny\\BossFaceDirection.ini", "BossFaceDirection")
	elseif frame and not BossFaceDirection.bEnable then
		Wnd.CloseWindow("BossFaceDirection")
	else
		return
	end
end

BossFaceDirection.OpenOrClose()
RegisterEvent("CUSTOM_DATA_LOADED",function() BossFaceDirection.OpenOrClose() end)


Hotkey.AddBinding("BossFaceAlert_Append", "Thêm vào danh sách theo dõi", "Định hướng, theo dõi mục tiêu",
	function()
		local playerClient = GetClientPlayer()
		local nTargetType, dwTargetID = playerClient.GetTarget()
		if dwTargetID and dwTargetID > 0 then
			BossFaceAlert.AppendCharacterToList(dwTargetID, true)
		end
	end,
	nil)

Hotkey.AddBinding("BossFaceAlert_Remove", "Xóa mục tiêu khỏi danh sách theo dõi", "",
	function()
		local playerClient = GetClientPlayer()
		local nTargetType, dwTargetID = playerClient.GetTarget()
		if dwTargetID and dwTargetID > 0 then
			BossFaceAlert.RemoveCharacterFromList(dwTargetID)
		end
		BossFaceAlert.ClearAllItem()
	end,
	nil)

Hotkey.AddBinding("BossFaceAlert_Clearlist", "Xóa dữ liệu trong danh sách hiện tại", "",
	function()
		for dwID, character in pairs(BossFaceAlert.tScrutinyList) do
			BossFaceAlert.RemoveCharacterFromList(dwID)
		end
		BossFaceAlert.ClearAllItem()
	end,
	nil)
	
Hotkey.AddBinding("BossFaceAlert_AddPoint", "Thêm đánh dấu ở vị trí hiện tại", "",
	function()
		GetUserInput("Tên thiết lập đánh dấu:", function(szText) BossFaceAlert.AddPoint(szText) end, nil, nil, nil, GetCurrentTime())
	end,
	nil)
	
Hotkey.AddBinding("BossFaceAlert_SetMaxMenu", "Thiết lập số cài đặt tối đa", "",
	function()
		BossFaceAlert.SetMaxMenuListCount()
	end,
	nil)

Hotkey.AddBinding("BossFaceAlert_ShowWnd", "Mở bảng thiết lập", "",
	function()
		BossFaceAlertUI.ShowWnd()
	end,
	nil)

RegisterEvent("LOGIN_GAME", function()
	local tMenu = {
		function()
			return {BossFaceAlert.GetMenuList()}
		end,
	}
	Player_AppendAddonMenu(tMenu)
end)


function BossFaceAlert.TargetPanelAddItem()
	local dwID,dwType = Target_GetTargetData()
	Target_AppendAddonMenu({function(dwID)
	local target = BossFaceAlert.GetCharacter(dwID)
	local rgb = {255,255,0}
	local szOption = "Thêm mục tiêu - " .. target.szName
	local szIcon = "ui/Image/UICommon/Talk_Face.UITex"
	local nFrame = 119
	local szLayer = "ICON_RIGHT"
	local handleIndex = nil
	if dwID and dwID > 0 then
		if target then
			for i = 1, #BossFaceAlert.DrawFaceLineNames, 1 do
				if tostring(BossFaceAlert.DrawFaceLineNames[i].szName) == tostring(target.szName) then
					handleIndex = i
					rgb = {255,0,255}
					szOption = "Thay đổi thiết lập - " .. target.szName
					nFrame = 33
					break
				end
			end
		end
	end
	local fnAction = function()
		BossFaceAlert.AppendCharacterToList(dwID,true)
		for BossFaceAlertdwID,v in pairs(BossFaceAlert.tSyncNpcAndPlayerID) do
			BossFaceAlert.AppendCharacterToList(BossFaceAlertdwID)
		end
		if handleIndex then
			BossFaceAlertUI.handleIndex = handleIndex
			BossFaceAlertUI.handleRecord = BossFaceAlert.DrawFaceLineNames[handleIndex]
			BossFaceAlertUI.RefreshRecordShow(BossFaceAlertUI.handleRecord, BossFaceAlertUI.handleIndex)
		end
		BossFaceAlertUI.ShowWnd()
	end	
	return 	{{szOption = szOption,rgb = rgb,szIcon = szIcon,nFrame = nFrame,szLayer = szLayer,fnAction = fnAction}}
	end })
end
BossFaceAlert.TargetPanelAddItem()