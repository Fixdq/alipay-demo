#!/bin/bash
# 设置开始系统时间
# date -s $1
# 初始化git仓库
output=`git init`
# 计算天数
days=$(($(($(($(date -d $2 "+%s" ) - $(date -d $1 "+%s" ))) / 86400 ))+1))
# 获取当前执行脚本的绝对路径
basepath=$(cd `dirname $0`; pwd)
# 循环提交
for i in $(seq 1 $days)
do
random=$((RANDOM % 5 + 1))
        for i in $(seq 1 $random)
        do
#	输出内容 模拟更改
	time=$(date "+%Y%m%d %H:%M:%S")
        echo $time >> ${basepath}"/log"
#       echo $time > ${basepath}"/log"
        git add .
        git commit -m"$time"

        done

time=`date +'%G%m%d %H:%M:%S' -d '+1 days'`
# 更新提交时间
output=`date -s "$time"`
done

git remote add origin git@github.com:Fixdq/alipay-demo.git
git push -u origin master 
