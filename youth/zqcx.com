hostname = ios.baertt.com,kd.youth.cn,kandian.wkandian.com

[Script]
cron "15 2 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqqd.js, tag=中青签到
cron "30 7,12,18 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqwz.js, tag=中青文章
cron "45 9 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqkkz.js, tag=中青看看赚
cron "15 6,12,18 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_share.js, tag=中青火爆转发
cron "20 21 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_Adv_video.js, tag=中青福利视频
cron "15 22 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqbox.js, tag=中青每日任务宝箱领取
cron "15 23 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_today_score.js, tag=中青每日收益统计
cron "15 7 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_friendSign.js, tag=中青好友签到红包
cron "34 22 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_Rotary.js, tag=中青抽奖
cron "34 5,9 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_wakeup.js, tag=中青打卡赚
cron "35 5 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqssz.js, tag=中青搜索赚
cron "34 6 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqllz.js, tag=中青浏览赚
cron "34 5 * * 1" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_double.js, tag=中青阅读翻倍
cron "25 10 * * *" script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_withdraw.js, tag=中青自动提现



http-request https://kandian.wkandian.com/v5/article/info.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqwz.js,enabled=true,tag=中青文章

http-request https://kandian.wkandian.com/v5/article/detail.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqwz.js,enable=true,tag=中青文章

http-request https://kandian.wkandian.com/v5/user/stay.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqwz.js,enable=true,tag=中青文章

http-request https://kandian.wkandian.com/v5/CommonReward/toGetReward.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqqd.js,enable=true,tag=中青签到

http-request https://kandian.wkandian.com/v17/NewTask/getTaskList.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_today_score.js,enable=true,tag=中青每日收益统计

http-request https://kandian.wkandian.com/v5/nameless/adlickstart.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqkkz.js,requires-body=true,enable=true,tag=中青看看赚

http-request https://kandian.wkandian.com/v5/CommonReward/toGetReward.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqbox.js,enabled=true,tag=中青每日任务宝箱领取

http-request https://kandian.wkandian.com/v5/wechat/withdraw2.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zq_withdraw.js,requires-body=true,enabled=true,tag=中青自动提现

http-request https://kandian.wkandian.com/v5/task/browse_start.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqllz.js,requires-body=true,enabled=true,tag=中青浏览赚

http-request https://kandian.wkandian.com/v5/Sousuo/playStart.json script-path=https://raw.githubusercontent.com/shaolin-kongfu/js_scripts/main/zq/zqssz.js,requires-body=true,enable=true,tag=中青看看赚

