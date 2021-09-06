# QLScript

注意: 

    ql.js 是jd_CheckCK.js和sendNotify.js的依赖,只要你使用了这两个脚本就一定保证放在同个文件夹里面.
	
	使用Ninjia要注意Extra.sh中把 cp sendNotify.js /ql/scripts/sendNotify.js 这一句删除，不然每次重启容器sendNotify.js都会被覆盖.

脚本介绍:


1.jd_CheckCK.js

自动检测账号是否正常，不正常的自动禁用，正常的如果是禁用状态则自动启用.

当有自动禁用或自动启用事件发生才会发送通知.如果要每次都通知则需设定变量.

	Update : 20210904

	更换检测接口.

变量列表:

	显示正常CK:  export SHOWSUCCESSCK="true"

	永远通知CK状态:  export CKALWAYSNOTIFY="true"

	停用自动启用CK:  export CKAUTOENABLE="false"

	不显示CK备注:  export CKREMARK="false"



2.jd_bean_change.js

自用的京东资产变动查询加强版

Update :

	Update : 20210905

	更换领现金获取签名接口.
	
	新增拆分通知.

	Update : 20210903

	增加领现金金额显示.

变量列表:

(1) BEANCHANGE_PERSENT

    拆分通知
	
    例子 :  export BEANCHANGE_PERSENT="10"  总共有22个账号
	
	结果会分成3条推送通知，1~10为第一条推送，11~20为第二条推送，剩余的为第三条推送
	
3.sendNotify.js 

Update :

	Update : 20210905:	
	
	格式化京东到家果园互助码，原内容后面显示，去除无用的互助码.
	
	永远屏蔽东东农场忘了种植水果的烦人通知,永远且没有开关.....
	
	新增NOTIFY_COMPTOGROUP2，具体用法看下方说明

	Update : 20210904:

	新增一堆变量

变量列表:

(1) NOTIFY_SKIP_LIST

    如果通知标题在此变量里面存在(&隔开),则用屏蔽不发送通知.
	(PS: Ningjia 作者写的功能，继承过来.)
	
    例子 :  export NOTIFY_SKIP_LIST="京东CK检测&京东资产变动"
	
(2) NOTIFY_GROUP_LIST

    如果通知标题在此变量里面存在(&隔开),则用第2套推送变量进行配置.
	
	(PS:例子使用了企业微信的变量QYWX_AM,实际是所有推送变量后加2都会有效.)
	
    例子 :  export NOTIFY_GROUP_LIST="京东CK检测&京东资产变动&Ninja 运行通知"
	
	企业微信配置了QYWX_AM和QYWX_AM2,则执行京东资产变动时会推送到QYWX_AM2配置的企业微信.
	
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

(5) NOTIFY_COMPTOGROUP2 (京喜工厂已验证有效，其他需验证,能用记得告诉我)

	东东农场 东东萌宠 京喜工厂  这三个任务接收到产品可以兑换通知时推送到群组2.
	
	例子 :  export NOTIFY_COMPTOGROUP2="true"
	
	企业微信配置了QYWX_AM和QYWX_AM2,则发送兑换通知时会推送到QYWX_AM2配置的企业微信.

(6) NOTIFY_NOCKFALSE

	屏蔽任务脚本的ck失效通知

	例子 :  export NOTIFY_NOCKFALSE="true"	
	
	        执行东东农场等脚本时有CK失效也不会推送ck失效通知

青龙拉库命令:

	不包含sendNotify:

	ql repo https://github.com/ccwav/QLScript.git "jd_" "sendNotify.js" "ql.js"

	包含sendNotify:

	ql repo https://github.com/ccwav/QLScript.git "jd_" "" "ql.js|sendNotify.js"
