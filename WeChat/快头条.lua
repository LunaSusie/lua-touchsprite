



if t == nil then
	t={}
end

t['快头条_tips']={{337,0,0x999999}, {366,1,0x999999}, }
t['快头条_tips_我知道了']={ 0xf54343, "140|4|0xf54343,64|-632|0xffbe22,68|-656|0xffe26f", 90, 95, 182, 540, 948}
t['快头条_tips_显示']={ 0x007aff, "-236|-6|0x007aff,-273|-2|0x007aff", 90, 79, 442, 563, 804}
t['快头条_tips_其它弹窗']={ 0x007aff, "3|-13|0x007aff,6|9|0x007aff", 90, 72, 372, 624, 1009}


t['快头条_写评论_阅读界面']={ 0xa7a7a7, "6|7|0xa7a7a7,30|2|0x9a9a9a,538|5|0x6f6f6f,541|5|0xffffff", 90, 11, 1031, 633, 1134}
t['快头条_写评论_已经领取']={ 0xf86663, "-14|-55|0xfeca27,-8|-13|0xffffff,-72|-3|0xfeca27,-26|-53|0xfeca27", 90, 481, 111, 634, 263}
t['快头条_写评论_展开全文']={ 0x3091f5, "68|-4|0x4398ee,73|-9|0xe8f3fd,30|-12|0x3091f5", 90, 176, 150, 461, 1034}
t['快头条_写评论_在播视频']={ 0xf54343, "-17|2|0xffffff,3|-24|0xf54343,6|29|0xf54343", 90, 493, 404, 636, 524}
t['快头条_写评论_没有红包']={ 0xff9522, "-4|5|0xffcb27,12|14|0xfc5753", 90, 532, 152, 595, 223}


t['快头条_ad_back']={ 0x5e5e5e, "7|-3|0xffffff,11|-14|0x5e5e5e", 90, 8, 47, 86, 125}

t['快头条_首页']={ 0xfe7153, "153|12|0x6e6e6e,320|3|0x6e6e6e,478|18|0x6e6e6e", 90, 15, 1044, 628, 1128}
t['快头条_首页_领取']={ 0xff6600, "-4|1|0xff6600,-3|1|0xffeec8", 90, 558, 60, 628, 133}

t['快头条_首页']={{75,1091,0xf54343}, {235,1073,0x6e6e6e}, {399,1066,0x6e6e6e}, {559,1081,0x6e6e6e}, }
t['快头条_首页_任务']={{399,1088,0xf64846}, {561,1090,0x6e6e6e}, {235,1074,0x6e6e6e}, {79,1069,0x6e6e6e}, }
	t['快头条_首页_任务_立即签到']={ 0xffe5d4, "-49|0|0xff9637,2|-18|0xff8a36,2|18|0xff7a30,52|0|0xff702f", 90, 469, 22, 634, 221}
	t['快头条_首页_任务_签到成功']={ 0x999999, "-195|-66|0xff6767,-187|-71|0xfff7f7,-202|-115|0xffe657,-192|481|0xf54343", 90, 75, 140, 543, 913}
	t['快头条_首页_任务_已签到']={ 0x9c9c9c, "0|-1|0xececec,-54|-2|0xececec,3|-21|0xececec,5|20|0xececec", 90, 471, 54, 635, 220}

t['快头条_首页_我']={ 0xfc6a50, "-156|1|0x6e6e6e,-322|9|0x6e6e6e,-476|5|0x6e6e6e", 90, 16, 1032, 628, 1132}
t['快头条_我的金币']={ 0xf34548, "41|707|0xcecece,523|706|0xcecece,295|699|0xffffff", 90, 9, 43, 624, 1123}



function 快头条tips()
	if d('快头条_tips')then
		if d('快头条_tips_我知道了',true,1)then
		elseif d('快头条_tips_显示',true,1) then
		elseif d('快头条_tips_其它弹窗',true)then
		else
			return true
		end
	else
		return true
	end
end


function kuaitoutiao()
	local TimeL = os.time()
	local outTime = rd(5,10)*60
	local 签到 = true
	local 签到成功 = false
	local 领取金币 = true
	local other_tips = 0
	
	

	while (os.time()-TimeL < outTime ) do
		if active(arr.newsbid['快头条'],5)then
			if 签到 and d("快头条_首页",true,3)then
				
			elseif d('快头条_首页_任务')then
				if d('快头条_首页_任务_立即签到',true)then
				elseif d('快头条_首页_任务_签到成功',true) or d('快头条_首页_任务_已签到') then
					签到 = false
					签到成功 = true
				end
				if 签到成功 then
					d('快头条_首页_任务',true,4)
				else
					click(320,911)
				end
			
			elseif d('快头条_写评论_阅读界面')then
				if d('快头条_写评论_在播视频')then
					click(40,60,2)
					moveTo(width/2,900,width/2,500,rd(15,30))
				elseif d('快头条_写评论_已经领取')then
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(1)
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(2)
					click(width/2,rd(300,900))
					delay(1)
				elseif not(d('快头条_写评论_没有红包'))then
					click(40,60,2)
					moveTo(width/2,900,width/2,500,rd(15,30))
				else
					d('快头条_写评论_展开全文',true)
					moveTo(width/2,900,width/2,500,rd(15,30))
					delay(rd(3,5))
				end
			elseif d('快头条_首页')then
				if 领取金币 and d('快头条_首页_领取',true)then
					领取金币 = false
				else
					click(width/2,rd(300,900))
				end
			elseif d('快头条_ad_back',true)then
				moveTo(width/2,900,width/2,500,rd(15,30))
			elseif d('快头条_首页_我',true,4)then
			else
				if 快头条tips()then
					click(320,948)
					moveTo(width/2,900,width/2,500,10)
					delay(rd(3,5))
					other_tips = other_tips + 1
					log(other_tips)
					if other_tips > 30 then
						closeApp(frontAppBid())
						delay(1)
						other_tips = 0
					end
				end
			end
		end
		delay(1)
	end

end















