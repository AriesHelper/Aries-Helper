script_version(16)
script_author("Papa_Rimskiy")

local nalogovaya = 0

local imgui = require 'imgui'
local encoding = require 'encoding'
local inicfg = require 'inicfg'
local hook = require 'lib.samp.events'
encoding.default = 'CP1251'
u8 = encoding.UTF8

local mainIni = inicfg.load({
config =
{
lic = false,
dmg = false,
sbiv = false,
timer = false,
trade = false,
lays = false,
kapacb = false,
spawncara = false,
olen = false,
tlf = false,
arm = false,
msk = false,
smk = false,
time = false,
lock = false,
jlock = false,
fcar = false,
recar = false,
key = false,
vr = false,
aut = false,
abc = false,
acd = false,
mbc = false,
at = false,
act = false,
zz = false,
pizza = false,
vip = false,
drugs = false,
flood = false,
olock = false,
doppiar = false,
nalogi = false,
asc = false,
nalog = false,
chatsms = " ",
rtsms = " ",
famsms = " ",
smsbc = " ",
smsvip = " ",
chasi = " ",
keyAdminMenu = " "
}
}, "Aries Helper")

local lic = imgui.ImBool(mainIni.config.lic)
local trade = imgui.ImBool(mainIni.config.trade)
local tlf = imgui.ImBool(mainIni.config.tlf)
local arm = imgui.ImBool(mainIni.config.arm)
local msk = imgui.ImBool(mainIni.config.msk)
local nalog = imgui.ImBool(mainIni.config.nalog)
local asc = imgui.ImBool(mainIni.config.asc)
local smk = imgui.ImBool(mainIni.config.smk)
local time = imgui.ImBool(mainIni.config.time)
local lock = imgui.ImBool(mainIni.config.lock)
local sbiv = imgui.ImBool(mainIni.config.sbiv)
local dmg = imgui.ImBool(mainIni.config.dmg)
local nalogi = imgui.ImBool(mainIni.config.nalogi)
local slider = imgui.ImInt(15000)
local jlock = imgui.ImBool(mainIni.config.jlock)
local fcar = imgui.ImBool(mainIni.config.fcar)
local recar = imgui.ImBool(mainIni.config.recar)
local key = imgui.ImBool(mainIni.config.key)
local vr = imgui.ImBool(mainIni.config.vr)
local doppiar = imgui.ImBool(mainIni.config.doppiar)
local aut = imgui.ImBool(mainIni.config.aut)
local abc = imgui.ImBool(mainIni.config.abc)
local timer = imgui.ImBool(mainIni.config.timer)
local zz = imgui.ImBool(mainIni.config.zz)
local olock = imgui.ImBool(mainIni.config.olock)
local acd = imgui.ImBool(mainIni.config.acd)
local pizza = imgui.ImBool(mainIni.config.pizza)
local kapacb = imgui.ImBool(mainIni.config.kapacb)
local lays = imgui.ImBool(mainIni.config.lays)
local olen = imgui.ImBool(mainIni.config.olen)
local at = imgui.ImBool(mainIni.config.at)
local flood = imgui.ImBool(mainIni.config.flood)
local vip = imgui.ImBool(mainIni.config.vip)
local drugs = imgui.ImBool(mainIni.config.drugs)
local spawncara = imgui.ImBool(mainIni.config.spawncara)
local smsbc = imgui.ImBuffer(''..mainIni.config.smsbc, 500) 
local chatsms = imgui.ImBuffer(''..mainIni.config.chatsms, 500) 
local rtsms = imgui.ImBuffer(''..mainIni.config.rtsms, 500) 
local famsms = imgui.ImBuffer(''..mainIni.config.famsms, 500)
local smsvip = imgui.ImBuffer(''..mainIni.config.smsvip, 500)
local chasi = imgui.ImBuffer(''..mainIni.config.chasi, 500)
local mbc = imgui.ImBool(mainIni.config.mbc)

local status = inicfg.load(mainIni, 'Aries Helper.ini')
if not doesFileExist('moonloader/config/Aries Helper.ini') then inicfg.save(mainIni, 'Aries Helper.ini') end

local main_window_state = imgui.ImBool(false)
function imgui.OnDrawFrame()
  		imgui.ShowCursor = main_window_state.v
  if main_window_state.v then
		imgui.SetNextWindowSize(imgui.ImVec2(1080, 520), imgui.Cond.FirstUseEver)
		if not window_pos then
			ScreenX, ScreenY = getScreenResolution()ScreenX, ScreenY = getScreenResolution()
			imgui.SetNextWindowPos(imgui.ImVec2(ScreenX / 2 , ScreenY / 2), imgui.Cond.FirsUseEver, imgui.ImVec2(0.5, 0.5))
		end
	  imgui.Begin('By Papa_Rimskiy | Aries Helper', main_window_state, imgui.WindowFlags.NoResize + imgui.WindowFlags.NoCollapse + imgui.WindowFlags.NoScrollbar)
	  	imgui.Text(u8"VK Author: @thecloufer | Сокращенные команды: cooming soon...")
	  	imgui.BeginChild("##g_sexbar", imgui.ImVec2(300, 120), true, imgui.WindowFlags.NoScrollbar)
	  		imgui.Checkbox(u8"Паспорт ближайшему игроку", lic)
				imgui.SameLine()
				imgui.TextQuestion(u8'При нажатии клавиш ALT + 1 вы покажите паспорт ближайшему человеку')
				imgui.Checkbox(u8"Торговля ближайшему игроку", trade)
				imgui.SameLine()
				imgui.TextQuestion(u8'При нажатии клавиш ALT + 2 вы предложите торговлю ближайшему игроку')
				imgui.Checkbox(u8"Телефон", tlf)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавишу P вы откроете меню телефона" )
				imgui.SameLine()
				imgui.Checkbox(u8"Удаление хуйни", flood)
				imgui.SameLine()
				imgui.TextQuestion(u8"Данная функция удалит из чата такие сообщения как: пригласите друга, топы игроков, эфиры и т.д" )
	  	imgui.EndChild()
	  	imgui.BeginChild("##gay_bar", imgui.ImVec2(300, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Бронник(скоро)", arm)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш ARM у вас появится бронежилет")
				imgui.SameLine()
				imgui.Checkbox(u8"VIP смс", vip)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только какой-то игрок купит Iridium/Premium VIP - скрипт отправит в чат это сообщение")
				imgui.Checkbox(u8"Маска", msk)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш MSK вы оденете маску")
				imgui.SameLine()
				imgui.PushItemWidth(170)
				imgui.InputText(u8"", smsvip)
				imgui.Checkbox(u8"Сигарета", smk)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш SMK у вас появится сигарета. Требуется купить в 24/7")
				imgui.SameLine()
				imgui.Checkbox(u8"Наркотики", drugs)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш alt + 1/2/3 (нумпад) вы используете наркотики")
				imgui.EndChild()
				imgui.BeginChild("##bar_bar", imgui.ImVec2(300, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Часы", time)
				imgui.SameLine()
				imgui.PushItemWidth(70)
				imgui.InputText(u8"Отыгровка часов", chasi)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш EZ вы посмотрите на часы")
				imgui.Checkbox(u8"Закрытие транспорта", lock)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавишу L вы закроете/откроете свой транспорт")
				imgui.EndChild()
				imgui.BeginChild("##bar_bar", imgui.ImVec2(300, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Закрытие аренды", jlock)
				imgui.SameLine()
				imgui.PushItemWidth(170)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавишу L вы закроете/откроете свой транспорт")
				imgui.SameLine()
	  	imgui.EndChild()
			if imgui.Button(u8'Сохранить настройки',imgui.ImVec2(150,65)) then
				mainIni.config.lic = lic.v
				mainIni.config.trade = trade.v
				mainIni.config.tlf = tlf.v
				mainIni.config.arm = arm.v
				mainIni.config.msk = msk.v
				mainIni.config.smk = smk.v
				mainIni.config.nalogi = nalogi.v
				mainIni.config.time = time.v
				mainIni.config.spawncara = spawncara.v
				mainIni.config.lock = lock.v
				mainIni.config.jlock = jlock.v
				mainIni.config.fcar = fcar.v
				mainIni.config.recar = recar.v
				mainIni.config.key = key.v
				mainIni.config.aut = aut.v
				mainIni.config.abc = abc.v
				mainIni.config.acd = acd.v
				mainIni.config.nalog = nalog.v
				mainIni.config.dmg = dmg.v
				mainIni.config.asc = asc.v
				mainIni.config.mbc = mbc.v
				mainIni.config.sbiv = sbiv.v
				mainIni.config.timer = timer.v
				mainIni.config.at = at.v
				mainIni.config.smsbc = smsbc.v
				mainIni.config.chatsms = chatsms.v
				mainIni.config.rtsms = rtsms.v
				mainIni.config.famsms = famsms.v
				mainIni.config.zz = zz.v
				mainIni.config.flood = flood.v
				mainIni.config.olock = olock.v
				mainIni.config.pizza = pizza.v
				mainIni.config.vip = vip.v
				mainIni.config.smsvip = smsvip.v
				mainIni.config.chasi = chasi.v
				mainIni.config.drugs = drugs.v
				mainIni.config.doppiar = doppiar.v
				mainIni.config.olen = olen.v
				mainIni.config.kapacb = kapacb.v
				mainIni.config.lays = lays.v
				inicfg.save(mainIni, 'Aries Helper.ini')
			end
			imgui.SetCursorPos(imgui.ImVec2(325, 61))
			imgui.BeginChild("##ear_bar", imgui.ImVec2(365, 120), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Заправить авто", fcar)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочитании клвишь CAN вы заправите транспорт используя канистру")
				imgui.SameLine()
				imgui.Checkbox(u8"Cкип диалога о ЗЗ", zz)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только скрипт увидит диалог с текстом •запрещено дратся• - он его пропустит")
				imgui.Checkbox(u8"Починить авто", recar)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочитании клвишь RECAR вы почините транспорт используя ремкомплект")
				imgui.SameLine()
				imgui.Checkbox(u8"Cкип диалога о пицце", pizza)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только скрипт увидит диалог с текстом •Вы успешно положили пиццу• - он его пропустит")
				imgui.Checkbox(u8"Спавн кар", key)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии на клавиру K откроете меню респавна транспорта.")
				imgui.SameLine()
				imgui.Checkbox(u8"Транспорт семьи/аренда", olock)
				imgui.SameLine()
				imgui.TextQuestion(u8"При сочетании клавиш OL вы откроете/закроете арендованный/семейный транспорт")
	  	imgui.EndChild()
	 	 	imgui.SetCursorPos(imgui.ImVec2(325, 189))
	  	imgui.BeginChild("##g_leftbar", imgui.ImVec2(365, 173), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Авто скип ответа на репорт/мут", aut)
				imgui.SameLine()
				imgui.TextQuestion(u8"Как только скрипт увидит ответ администратора/диалог с мутом он пропустит диалог")
				imgui.Text(u8"Активация: /piar")
				imgui.SameLine()
				imgui.SliderInt('Задержка', slider, 15000, 300000)
				imgui.InputText(u8"Реклама в /vc", chatsms)
				imgui.Checkbox(u8"Включить доп пиар", doppiar)
				imgui.InputText(u8"Доп пиар", famsms)
		  imgui.EndChild()
			imgui.SetCursorPos(imgui.ImVec2(325, 370))
			imgui.BeginChild("##g_pftbar", imgui.ImVec2(365, 144), true, imgui.WindowFlags.NoScrollbar)
			   	imgui.Checkbox(u8"Сбив через анимацию", sbiv)
				imgui.SameLine()
				imgui.TextQuestion(u8"При нажатии клавиши Q пропишется /anim 1, вам остается лишь нажать Enter (не активируется в транспорте)")
				imgui.Checkbox(u8"Waiting for the update", mbc)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
				imgui.InputText(u8"...", smsbc)
				imgui.Checkbox(u8"Waiting for the update", at)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
			imgui.EndChild()
			imgui.SetCursorPos(imgui.ImVec2(700, 370))
		    	if imgui.Button(u8"О создателе", imgui.ImVec2(365,140)) then
					sampAddChatMessage("Papa_Rimskiy - Aries",-1)
					sampAddChatMessage("Papa_Rimskiy - Aries",-1)
					sampAddChatMessage("Papa_Rimskiy - Aries",-1)
					sampAddChatMessage("Если вы хотите меня поддержать - qiwi.com/n/n4tef",-1)
				end
			imgui.SetCursorPos(imgui.ImVec2(700, 61))
			    imgui.BeginChild("##g_pfabar", imgui.ImVec2(365, 145), true, imgui.WindowFlags.NoScrollbar)
			    imgui.Checkbox(u8"Waiting for the update",asc)
			    imgui.SameLine()
			    imgui.TextQuestion(u8"Waiting for the update")
		    	imgui.Checkbox(u8"Waiting for the update",nalog)
		    	imgui.SameLine()
		    	imgui.TextQuestion(u8"Waiting for the update")
				imgui.Checkbox(u8"Waiting for the update",olen)
				imgui.SameLine()
				imgui.Checkbox(u8"Waiting for the update",lays)
				imgui.Checkbox(u8"Waiting for the update",kapacb)
			imgui.EndChild()
			imgui.SetCursorPos(imgui.ImVec2(700, 212))
				imgui.BeginChild("##g_psdbar", imgui.ImVec2(365, 145), true, imgui.WindowFlags.NoScrollbar)
				imgui.Checkbox(u8"Waiting for the update",timer)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
				imgui.Checkbox(u8"Waiting for the update",acd)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
				imgui.Checkbox(u8"Waiting for the update",dmg)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
				imgui.Checkbox(u8"Waiting for the update",spawncara)
				imgui.SameLine()
				imgui.TextQuestion(u8"Waiting for the update")
			imgui.EndChild()
		    	imgui.SetCursorPos(imgui.ImVec2(175, 445))
		    	if imgui.Button(u8"Перезагрузить скрипт", imgui.ImVec2(140,65)) then
		    		thisScript():reload()
				end
	    	imgui.End()
	    end
end
function main()
	while not isSampAvailable() do wait(0) end
    autoupdate("https://www.dropbox.com/s/pjfzgpgu7ndrgem/huita.json?dl=1", '['..string.upper(thisScript().name)..']: ', "https://www.dropbox.com/s/jt5k96otghj3b5g/ARZ_Helper.lua?dl=1")
	sampRegisterChatCommand("piar", function() 
	act = not act; sampAddChatMessage(act and '{01A0E9}Реклама включена!' or '{01A0E9}Реклама выключена!', -1)
	if act then
     piar()
    end
	end)
	sampRegisterChatCommand("arsh", function()
      main_window_state.v = not main_window_state.v
    end)
	sampRegisterChatCommand("arsobnova",obnova)
	sampRegisterChatCommand('fh', function(num) 
			sampSendChat('/findihouse '..num) 
	end)
	sampRegisterChatCommand('fbiz', function(num) 
			sampSendChat('/findibiz '..num) 
	end)
	sampAddChatMessage("{01A0E9}[Aries Helper] {ffffff}Загружен!",-1)
  while true do
	  wait(0)
	  imgui.Process = main_window_state.v
		if lic.v and wasKeyPressed(0x31) and isKeyDown(0x12) then 
			local veh, ped = storeClosestEntities(PLAYER_PED)
			local _, id = sampGetPlayerIdByCharHandle(ped)
			if id then
					sampSendChat('/showpass '..id)
			end
		end
		if trade.v and wasKeyPressed(0x32) and isKeyDown(0x12) then
			local veh, ped = storeClosestEntities(PLAYER_PED)
			local _, id = sampGetPlayerIdByCharHandle(ped)
			if _ then
					sampSendChat('/trade '..id)
			end
		end
		if tlf.v and wasKeyPressed(0x50) and not sampIsCursorActive() then
			sampSendChat("/tel")
		end
		if sbiv.v then
			if testCheat("Q") and not isCharInAnyCar(PLAYER_PED) then
               sampSendChat("/anim 1")
			end
		end
		if arm.v then
			if testCheat("arm") and not sampIsChatInputActive() then
				sampSendChat("")
				sampSendChat("/armour")
			end
		end
		if spawncara.v then
			if wasKeyPressed(4) then
              if not isCharOnFoot(playerPed) then
                 car = storeCarCharIsInNoSave(playerPed)
                 _, id = sampGetVehicleIdByCarHandle(car)
                 sampSendChat('/fixmycar '..id)
				end
			end
       end
		if smk.v then
			if testCheat("smk") then
				sampSendChat("/smoke")
			end
		end
		if msk.v then
			if testCheat("msk") and not sampIsCursorActive() then
				sampSendChat("/mask")
			end
		end
		if kapacb.v then
			sampSendChat("/eat")
			if sampIsDialogActive() then
				sampSendDialogResponse(9965,1,1,"")
				kapacb.v = false 
			end
			sampAddChatMessage("Не жри карасей! Карась святой",-1)
		end
		if olen.v then
				sampSendChat("/eat")
				if sampIsDialogActive() then
				sampSendDialogResponse(9965,1,2,"")
				olen.v = false
				end
		end
		if timer.v then
			if sampIsDialogActive() and (sampGetCurrentDialogId() == 8869 or sampGetCurrentDialogId() == 8868) then
			ttime = os.clock()
			while sampIsDialogActive() do
				wait(0)
			end
			sampSendChat(string.format("Капча [%s] ввел за [%s] секунд",sampGetCurrentDialogEditboxText(), string.sub(os.clock() - ttime, 1, 5)), 16777215)
			end
		end
		if lays.v then
				sampSendChat("/eat")
				if sampIsDialogActive() then
				sampSendDialogResponse(9965,1,0,"")
				lays.v = false
				end
		end
		if time.v then
			if testCheat("ez") and not sampIsCursorActive() then
				sampSendChat(u8:decode(chasi.v))
				wait(1200)
				sampSendChat("/time")
				wait(1200)
				sampSendChat ("/do На часах  "..os.date('%H:%M:%S'))
			end 
		end
		if olock.v and not sampIsCursorActive() then
			if testCheat("ol") then
				sampSendChat("/lock 2")
			end
		end
		if jlock.v and not sampIsChatInputActive() then
			if testCheat("jl") then
				sampSendChat("/jlock")
			end
		end
		if lock.v and not sampIsChatInputActive() then
			if testCheat("l") then
				sampSendChat("/lock 1")
			end
		end
		if drugs.v and not sampIsCursorActive() then
			if wasKeyPressed(0x61) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 1")
            end
            if wasKeyPressed(0x62) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 2")
            end
            if wasKeyPressed(0x63) and isKeyDown(0x12) then
                sampSendChat("/usedrugs 3")
			end
		end
		if fcar.v and not sampIsCursorActive() then
			if testCheat("can") then
				sampSendChat("/fillcar")
			end
		end
		if recar.v and not sampIsCursorActive() then
			if testCheat("recar") then
				sampSendChat("/remcar")
			end
		end
		if key.v and not sampIsCursorActive() then
			if testCheat("k") then
				sampSendChat("/fixcar")
			end
		end
	end
end

function hook.onServerMessage(color, text)
	if nalogi.v then
		if text:find("за проделанную работу") and not text:find('говорит') and not text:find('- |') and not text:find('Тел.') and not text:find('News') then
		   nalogovaya = nalogovaya + 32800
		   sampAddChatMessage("{73b461}[Информация] {ffffff}Вы заработали уже {73b461}"..nalogovaya..'$',-1)
		   return false
		end
	end
    if acd.v then
     if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") and not text:find('говорит') and not text:find('- |') then
			sampSendChat('/lock')
	  end
	end
	if asc.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") and not text:find('говорит') and not text:find('- |') then
			lua_thread.create(function()
              if not isCharOnFoot(playerPed) then
                 car = storeCarCharIsInNoSave(playerPed)
                 _, id = sampGetVehicleIdByCarHandle(car)
                 sampSendChat('/fixmycar '..id)
				 sampAddChatMessage("{01A0E9}[ARZ Helper] {ffffff}Вы успешно заспавнили свой кар",-1)
			  end
		  end)
		end
	end  
	if mbc.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") or text:find("(.-)Поздравляю! Теперь этот дом ваш!(.-)") then
			lua_thread.create(function()
				wait(500)
				sampSendChat(u8:decode(smsbc.v))
			end)
		end
	end
	if at.v then
		if text:find("Поздравляем! Теперь этот транспорт принадлежит вам!") or text:find("(.-)Поздравляю! Теперь этот дом ваш!(.-)")  and not text:find('говорит') and not text:find('- |') then
			lua_thread.create(function()
				if mbc.v then
					wait(5000)
				end
				sampSendChat(u8:decode(chasi.v))
				sampSendChat("/time")
				wait(1200)
				sampSendChat ("/do На часах  "..os.date('%H:%M:%S'))
			end)
		end
	end
	if vip.v then
		if text:find 'Игрок (.-) приобрел Titan VIP' and not text:find('говорит') and not text:find('- |') then
			sampSendChat(u8:decode(smsvip.v))
		end
	end
	if flood.v then
		if text:find("~~~~~~~~~~~~~~~~~~~~~~~~~~") and not text:find('говорит') then
			return false
		end
		if text:find("- Основные команды") and not text:find('говорит') then
			return false
		end
		if text:find("- Пригласи друга") and not text:find('говорит') then
			return false
		end
		if text:find("- Донат и получение") and not text:find('говорит') then
			return false
		end
		if text:find("выехал") and not text:find('говорит') then
			return false
		end
		if text:find("убив его") and not text:find('говорит') then
			return false
		end
		if text:find("начал работу") and not text:find('говорит') then
			return false
		end
		if text:find("Убив его") and not text:find('говорит') then
			return false
		end
		if text:find("между использованием") and not text:find('говорит') then
			return false
		end
		if text:find("обновлениях сервера") and not text:find('говорит') then
			return false
		end
		if text:find("Пополнение игрового счета") and not text:find('говорит') then
			return false
		end
		if text:find("Наш сайт") and not text:find('говорит') then
			return false
		end
		if text:find('/top') and not text:find('говорит') and not text:find('- |') and not text:find('сайт') then 
			return false 
		end
	end
end
function hook.onDisplayGameText(style, time, text)
	if dmg.v then
	    if style == 3 and time == 1000 and text:find("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %d+ Sec%.") then
		  local c, _ = math.modf(tonumber(text:match("Jailed (%d+)")) / 60)
		  return {style, time, string.format("~n~~n~~n~~n~~n~~n~~n~~n~~n~~n~~g~Jailed %s Sec = %s Min.", text:match("Jailed (%d+)"), c)}
		end
	end
end
function hook.onShowDialog(dialogId, dialogStyle, dialogTitle, okButtonText, cancelButtonText, dialogText)
	if aut.v then
			if dialogText:find("Вы получили бан") then
			return false
		end
	  if dialogId == 1333 then
         return false
        end
       if dialogId == 1332 then
         return false
		end
	end
    if zz.v then
	    if dialogText:find("В этом месте запрещено") then
			return false
		end
	end
	if pizza.v then	
	    if dialogText:find("Вы хотите начать") then
			return false
		end
	end
	if tlf.v then
	   if dialogId == 1000 then
		   sampSendDialogResponse(1000,1,0,"")
		   return false
		end
	end
	if nalogi.v then
		if dialogText:find("чек на оплату") then
			sampAddChatMessage("{01A0E9}Вы оставили чек на оплату налогов",-1)
			return false
		end
		if dialogText:find("для выдачи счета") then
			return false
		end
	end
end

function piar()
	lua_thread.create(function()
		if act and doppiar.v then
		  sampSendChat(u8:decode(chatsms.v))
		  wait(1200)
	      sampSendChat(u8:decode(famsms.v))
          wait(slider.v)
		  return true
		end
		if act then
		  sampSendChat(u8:decode(chatsms.v))
		  wait(slider.v)
		  return true
		end
	end)
end
function apply_custom_style()
	if not state then
  	imgui.SwitchContext()
  	local style = imgui.GetStyle()
   	local colors = style.Colors
   	local clr = imgui.Col
   	local ImVec4 = imgui.ImVec4
   	local ImVec2 = imgui.ImVec2
		style.WindowPadding = ImVec2(15, 15)
		style.WindowRounding = 5.0
		style.FramePadding = ImVec2(5, 5)
		style.FrameRounding = 4.0
		style.ItemSpacing = ImVec2(12, 8)
		style.ItemInnerSpacing = ImVec2(8, 6)
		style.IndentSpacing = 25.0
		style.ScrollbarSize = 15.0
		style.ScrollbarRounding = 9.0
		style.GrabMinSize = 5.0
		style.GrabRounding = 3.0

		colors[clr.Text] = ImVec4(1.00, 1.00, 1.00, 1.00)
		colors[clr.TextDisabled] = ImVec4(0.60, 0.60, 0.60, 1.00)
		colors[clr.WindowBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
		colors[clr.ChildWindowBg] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PopupBg] = ImVec4(0.11, 0.10, 0.11, 1.00)
		colors[clr.Border] = ImVec4(0.86, 0.86, 0.86, 1.00)
		colors[clr.BorderShadow] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.FrameBg] = ImVec4(0.21, 0.20, 0.21, 0.60)
		colors[clr.FrameBgHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.FrameBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.TitleBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.TitleBgCollapsed] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.TitleBgActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.MenuBarBg] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.ScrollbarBg] = ImVec4(0.00, 0.46, 0.65, 0.00)
		colors[clr.ScrollbarGrab] = ImVec4(0.00, 0.46, 0.65, 0.44)
		colors[clr.ScrollbarGrabHovered] = ImVec4(0.00, 0.46, 0.65, 0.74)
		colors[clr.ScrollbarGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.ComboBg] = ImVec4(0.15, 0.14, 0.15, 1.00)
		colors[clr.CheckMark] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.SliderGrab] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.SliderGrabActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.Button] = ImVec4(0.10, 0.09, 0.12, 1.00)
		colors[clr.ButtonHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.ButtonActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.Header] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.HeaderHovered] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.HeaderActive] = ImVec4(0.00, 0.46, 0.65, 1.00)
		colors[clr.ResizeGrip] = ImVec4(1.00, 1.00, 1.00, 0.30)
		colors[clr.ResizeGripHovered] = ImVec4(1.00, 1.00, 1.00, 0.60)
		colors[clr.ResizeGripActive] = ImVec4(1.00, 1.00, 1.00, 0.90)
		colors[clr.CloseButton] = ImVec4(0.10, 0.09, 0.12, 1.00)
		colors[clr.CloseButtonHovered] = ImVec4(0.11, 0.10, 0.11, 1.00)
		colors[clr.CloseButtonActive] = ImVec4(0.11, 0.10, 0.11, 1.00)
		colors[clr.PlotLines] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PlotLinesHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PlotHistogram] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.PlotHistogramHovered] = ImVec4(0.00, 0.00, 0.00, 0.00)
		colors[clr.TextSelectedBg] = ImVec4(0.25, 1.00, 0.00, 0.43)
		colors[clr.ModalWindowDarkening] = ImVec4(0.00, 0.00, 0.00, 0.00)
	end
end
apply_custom_style()

function imgui.TextQuestion(text)
	imgui.TextDisabled('(?)')
	if imgui.IsItemHovered() then
		imgui.BeginTooltip()
		imgui.PushTextWrapPos(450)
		imgui.TextUnformatted(text)
		imgui.PopTextWrapPos()
		imgui.EndTooltip()
	end
end

function autoupdate(json_url, prefix, url)
  local dlstatus = require('moonloader').download_status
  local json = getWorkingDirectory() .. '\\'..thisScript().name..'-version.json'
  if doesFileExist(json) then os.remove(json) end
  downloadUrlToFile(json_url, json,
    function(id, status, p1, p2)
      if status == dlstatus.STATUSEX_ENDDOWNLOAD then
        if doesFileExist(json) then
          local f = io.open(json, 'r')
          if f then
            local info = decodeJson(f:read('*a'))
            updatelink = info.updateurl
            updateversion = info.latest
            f:close()
            os.remove(json)
            if updateversion ~= thisScript().version then
              lua_thread.create(function(prefix)
                local dlstatus = require('moonloader').download_status
                local color = -1
                sampAddChatMessage((prefix..'Обнаружено обновление. Пытаюсь обновиться c '..thisScript().version..' на '..updateversion), color)
                wait(250)
                downloadUrlToFile(updatelink, thisScript().path,
                  function(id3, status1, p13, p23)
                    if status1 == dlstatus.STATUS_DOWNLOADINGDATA then
                      print(string.format('Загружено %d из %d.', p13, p23))
                    elseif status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
                      print('Загрузка обновления завершена.')
					  sampAddChatMessage((prefix..'{01A0E9}Обновление завершено!'), color)
					  sampAddChatMessage((prefix..'Пропишите {01A0E9}/arsobnova {ffffff}что бы узнать подробнее!'), color)
                      goupdatestatus = true
                      lua_thread.create(function() wait(500) thisScript():reload() end)
                    end
                    if status1 == dlstatus.STATUSEX_ENDDOWNLOAD then
                      if goupdatestatus == nil then
                        sampAddChatMessage((prefix..'Обновление прошло неудачно. Запускаю устаревшую версию..'), color)
                        update = false
                      end
                    end
                  end
                )
                end, prefix
              )
            else
              update = false
              sampAddChatMessage("{01A0E9}[Aries Helper] {ffffff}Обновление не требуется", -1)
            end
          end
        else
          print('v'..thisScript().version..': Не могу проверить обновление. Смиритесь или проверьте самостоятельно на '..url)
          update = false
        end
      end
    end
  )
  while update ~= false do wait(100) end
end
function obnova()
	sampAddChatMessage("Первая версия скрипта. 0.0.1-beta",-1)
end
