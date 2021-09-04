# QLScript

脚本介绍:
ql.js 是jd_CheckCK.js和sendNotify.js的依赖,只要你使用了这两个脚本就一定保证放在同个文件夹里面.


1.jd_CheckCK.js

自动检测账号是否正常，不正常的自动禁用，正常的如果是禁用状态则自动启用.

Update : 20210904

更换检测接口.

Update : 20210903

增加变量显示正常CK:  export SHOWSUCCESSCK="true"

增加变量永远通知CK状态:  export CKALWAYSNOTIFY="true"

增加变量停用自动启用CK:  export CKAUTOENABLE="false"

增加变量不显示CK备注:  export CKREMARK="false"



2.jd_bean_change.js

自用的京东资产变动查询加强版

Update : 20210903

增加领现金金额显示.


4.sendNotify.js 

Update : 20210904

新增一堆变量，要自己看好，我尽量写详细点:

(1) NOTIFY_SKIP_LIST

    如果通知标题在此变量里面存在(&隔开),则用屏蔽不发送通知.
	
    例子 :  export NOTIFY_SKIP_LIST="京东CK检测&京东资产变动"
	
(2) NOTIFY_GROUP_LIST

    如果通知标题在此变量里面存在(&隔开),则用第2套推送变量进行配置.
	
	(PS:例子使用了企业微信的变量QYWX_AM,实际是所有推送变量后加2都会有效.)
	
    例子 :  export NOTIFY_GROUP_LIST="京东CK检测&京东资产变动&Ninja 运行通知"
	
	企业微信配置了QYWX_AM和QYWX_AM2,则执行京东资产变动时会推送到QYWX_AM2配置的企业微信.
	
(3) SHOWREMARKTYPE

	例子: 账号名:ccwav   Remark: 代码玩家
	
	export NOTIFY_GROUP_LIST="1"    效果是 :  账号名称：代码玩家
	
    export NOTIFY_GROUP_LIST="2"    效果是 :  账号名称：ccwav(代码玩家)
	
    export NOTIFY_GROUP_LIST="3"    不做处理,效果是 :  账号名称：ccwav      
	
(4) NOTIFY_SKIP_REMARK_LIST 

	单独指定某些脚本不做REMARK处理
	
	(PS:京东CK检测我加了处理Remark，所以最好是加上不处理)
	
	例子 :  export NOTIFY_SKIP_REMARK_LIST="京东CK检测"  



青龙拉库命令(不包含sendNotify.js):

ql repo https://github.com/ccwav/QLScript.git "jd_" "sendNotify.js" "ql.js"

青龙拉库命令(包含sendNotify.js):

ql repo https://github.com/ccwav/QLScript.git "jd_" "" "ql.js"
