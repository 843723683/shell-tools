#!/usr/bin/env bash

BLUE_LLE="\033[34m"
GREEN_LLE="\033[32m"
YELLOW_LLE="\033[33m"
RED_LLE="\033[31m"
ENDCOLOR_LLE="\033[0m"

# 当前日志级别（debug:0, info:1, warn:2, error:3）
LOGLEVEL_LLE="0"

################################################################

## TODO:日志级别输出函数
##  In :$1 => 日志级别（debug:0, info:1, warn:2, error:3）
##      $2 => 颜色
##      $3 => 打印字符串
##
##  Out:0 => Success
##      other => Fail

Log-LLE(){
	[ $# -ne 3 ] && return 1
	
	local infolevel=$1
	local color=$2
	local logstr=$3

	case $infolevel in
	debug)
		if [ $LOGLEVEL_LLE -le 0 ];then
			echo -e "$color $logstr $ENDCOLOR_RLE"		
		fi
	;;
	info)
		if [ $LOGLEVEL_LLE -le 1 ];then
			echo -e "$color $logstr $ENDCOLOR_RLE"		
		fi
	;;
	warn)
		if [ $LOGLEVEL_LLE -le 2 ];then
			echo -e "$color $logstr $ENDCOLOR_RLE"		
		fi
	;;
	error)
		if [ $LOGLEVEL_LLE -le 3 ];then
			echo -e "$color $logstr $ENDCOLOR_RLE"		
		fi
	;;
	esac
	
	return 0
}


## TODO:Debug级别输出函数,默认颜色为 蓝色
##  In :$1 => 打印字符串
##
Debug-LLE(){
	local logstr=$1

	Log-LLE "debug"	"${BLUE_LLE}" "[ Debug ] `date +'%F %H:%M:%S'` : ${logstr}"
}


## TODO:Info级别输出函数,默认颜色为 绿色
##  In :$1 => 打印字符串
##
Info-LLE(){
	local logstr=$1

	Log-LLE "info"	"${GREEN_LLE}" "[ Info ] `date +'%F %H:%M:%S'` : ${logstr}"
}


## TODO:Warn级别输出函数,默认颜色为 黄色
##  In :$1 => 打印字符串
##
Warn-LLE(){
	local logstr=$1

	Log-LLE "warn"	"${YELLOW_LLE}" "[ Warn ] `date +'%F %H:%M:%S'` : ${logstr}"
}


## TODO:Error级别输出函数,默认颜色为 红色
##  In :$1 => 打印字符串
##
Error-LLE(){
	local logstr=$1

	Log-LLE "error"	"${RED_LLE}" "[ Error ] `date +'%F %H:%M:%S'` : ${logstr}"
}


# Debug-LLE "hello debug"
# Info-LLE "hello info"
# Warn-LLE "hello warn"
# Error-LLE "hello error"
