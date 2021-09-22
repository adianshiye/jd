# QLScript

注意事项: 

    ql.js 是jd_CheckCK.js和sendNotify.js的依赖,
	
	只要你使用了这两个脚本就一定保证放在同个文件夹里面.
	
	使用Ninjia要注意Extra.sh中把 cp sendNotify.js /ql/scripts/sendNotify.js 这一句删除，
	
	不然每次重启容器sendNotify.js都会被覆盖.

脚本介绍:

1.jd_CheckCK.js

自动检测账号是否正常，不正常的自动禁用，正常的如果是禁用状态则自动启用.

当有自动禁用或自动启用事件发生才会发送通知.如果要每次都通知则需设定变量.

本脚本最后一次重试检测调用X1a0He写的接口加强验证.Thanks.

变量列表:
	
	显示正常CK:  export SHOWSUCCESSCK="true"

	永远通知CK状态:  export CKALWAYSNOTIFY="true"

	停用自动启用CK:  export CKAUTOENABLE="false"

	不显示CK备注:  export CKREMARK="false"
	
	服务器空数据等错误不触发通知:  export CKNOWARNERROR="true"

2.jd_bean_change.js

自用的京东资产变动查询加强版

注意: 

	如果你遇到TG报错，请参考https://github.com/ccwav/QLScript/issues/8
	
	如果你遇到Bark报错，请参考https://github.com/ccwav/QLScript/issues/7

变量列表:

(1) BEANCHANGE_PERSENT

    拆分通知
	
    例子 :  export BEANCHANGE_PERSENT="10"  总共有22个账号
	
	结果会分成3条推送通知，1~10为第一条推送，11~20为第二条推送，剩余的为第三条推送

(2)京东白嫖榜会独立通知
   
	即需要通过设置sendNotify的NOTIFY_GROUP_LIST加入“京东白嫖榜”单独控制通知组别.


3.sendNotify.js 

变量列表:

(1) NOTIFY_SKIP_LIST

    如果通知标题在此变量里面存在(&隔开),则用屏蔽不发送通知.
	(PS: Ningjia 作者写的功能，继承过来.)
	
    例子 :  export NOTIFY_SKIP_LIST="京东CK检测&京东资产变动"
	
(2) NOTIFY_GROUP_LIST

    如果通知标题在此变量里面存在(&隔开),则用第2套推送变量进行配置.
	
	(PS:例子使用了企业微信的变量QYWX_AM,实际是所有推送变量后加2都会有效.)
	
    例子 :  export NOTIFY_GROUP_LIST="京东CK检测&京东资产变动&Ninja 运行通知"
	
	假如企业微信配置了QYWX_AM和QYWX_AM2,则执行京东资产变动时会推送到QYWX_AM2配置的企业微信.
	
(3) SHOWREMARKTYPE

	例子: 账号名:ccwav  别名:ccwav的别名  Remark: 代码玩家
	
	export SHOWREMARKTYPE="1"    效果是 :  账号名称：代码玩家
	
    export SHOWREMARKTYPE="2"    效果是 :  账号名称：ccwav的别名(代码玩家)
	
    export SHOWREMARKTYPE="3"    不做处理,效果是 :  账号名称：ccwav   
	
	export SHOWREMARKTYPE="4"    效果是 :  账号名称：ccwav(代码玩家)
	
(4) NOTIFY_SKIP_REMARK_LIST 

	单独指定某些脚本不做REMARK处理
	
	(PS:京东CK检测我加了处理Remark，所以最好是加上不处理)
	
	例子 :  export NOTIFY_SKIP_REMARK_LIST="京东CK检测"  

(5) NOTIFY_COMPTOGROUP2 和 NOTIFY_NOREMIND (待验证)

	用法1 : export NOTIFY_COMPTOGROUP2="true"	

		    东东农场 东东萌宠 京喜工厂  这三个任务接收到产品可以兑换通知时推送到群组2.
			
	用法2 : export NOTIFY_COMPTOGROUP2="东东农场&东东萌宠&京喜工厂"	

		    东东农场 东东萌宠 京喜工厂的兑换通知推送到群组2,可自行删减.		
			
	用法3 : export NOTIFY_NOREMIND="东东农场&东东萌宠&京喜工厂"	

		    屏蔽东东农场 东东萌宠 京喜工厂的兑换通知,可自行删减.		
	
	群组2的介绍:假如企业微信配置了QYWX_AM和QYWX_AM2,则发送兑换通知时会推送到QYWX_AM2配置的企业微信.
	
	(PS:例子使用了企业微信的变量QYWX_AM,实际是所有推送变量后加2都会有效.)

(6) NOTIFY_NOCKFALSE

	屏蔽任务脚本的ck失效通知

	例子 :  export NOTIFY_NOCKFALSE="true"	
	
	        执行所有脚本时，如果有单独推送CK失效的请求也不会推送失效通知

(6) NOTIFY_AUTHOR	
		
	例子 :  export NOTIFY_AUTHOR="测试人"
			
			通知底部显示 本通知 By 测试人

(7) NOTIFY_NOLOGINSUCCESS

	例子 :  export NOTIFY_NOLOGINSUCCESS="true" 
			
			屏蔽青龙登陆成功通知，登陆失败不屏蔽.

4.jd_speed_sign_Part1~jd_speed_sign_Part3

	简单粗暴的极速版的分任务版，将总ck数除以3后平均分配成三个任务同时执行.
	
	如果使用请务必禁用其他库的jd_speed_sign脚本.感谢jd_speed_sign原作者。
	
	例子 : 有24个ck，则Part1 执行1~8,Part2 执行9~16，Part3 执行17以后剩下的所有ck.

5.jd_zy_ddwj_Mod.js 和 jd_zy_ddwj_help.js

	主要功能来源于Ariszy大佬，我这种小白,只是改下一些执行逻辑。
	
	jd_zy_ddwj_Mod是东东玩家任务,jd_zy_ddwj_help是东东玩家的内部互助.
	
	源项目地址:https://github.com/Ariszy/Private-Script/tree/master/JD/zy_ddwj.js
	
青龙拉库命令:

	不包含sendNotify:

	ql repo https://github.com/ccwav/QLScript.git "jd_" "sendNotify.js" "ql.js"

	包含sendNotify:

	ql repo https://github.com/ccwav/QLScript.git "jd_" "" "ql.js|sendNotify.js"
