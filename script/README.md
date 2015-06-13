我在linux tools下积累的常用工具

Java线程过高问题排查
```
curl -sLk "https://raw.github.com/oldmanpushcart/unixtools/master/javatop.sh" | ksh -s 5 `pgrep -u admin java`
```

Java Dump脚本
```
/usr/bin/jmap -dump:live,format=b,file=heap-`date +%Y%m%d%H%M`.bin `pgrep -u admin java`
```

常用分析命令和脚本
  
##mysql监控脚本

##cookielog分析脚本

##线上java进程信息dump和机器信息dump脚本

##cpu监控相关

##dish 磁盘管理

##process 进程管理

linux tools
=========

