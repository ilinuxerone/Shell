#!/bin/bash

#替换指定目录包含指定字符串的文件---文件名未知
#grep "abcdecde" * -R | awk -F: '{print $1}' | sort | uniq | xargs sed -i 's/abcdecde/abcdecdecde/g' 

#替换指定目录指定文件中的指定字符串---文件名已知
#find ./ -name "test" | xargs sed -i 's/a/ddd/g'

#清理指定目录下指定n天/月/年的文件;目录格式需要为yyyymmdd
expiredDay=$(date -d "$1 days" "+%Y%m%d")
Dir=$2

for dir in $(find  $Dir -mindepth 1 -type d )
do
	case ${dir##*/} in
		[1-9][0-9]*)
			#for dir in $(ls -ld *|grep ^d|cut -d" " -f 12) 
			if [ ${dir##*/} -le  ${expiredDay} ]; then
				echo ${expiredDay}
				echo ${dir##*/}
			fi
			;;
		*)
			;;
	esac
done
