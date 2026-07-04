# HiWiFi-ssh-token
本地计算极路由(HiWiFi) ssh解锁Cloud_Token

提供uuid、local token即可计算cloud token，开启ssh，修复了极路由官网下线无法开启ssh的bug

与`www.hiwifi.wtf`作用一致，然而这个网站已经似了
## 使用说明
1. 访问`https://192.168.199.1/cgi-bin/turbo/proxy/router_info`获取路由器uuid
2. 访问`http://192.168.199.1/local-ssh`，复制token（**文本框没有显示完整，要全选复制才能复制完整，不然下一步算码会报错！**）
3. 打开计算脚本，按照顺序输入token、uuid（这一步尽快，token有效期大概在5分钟左右，且期间不能刷新网页）
4. 复制脚本给出的cloud_token，返回`2.`中网页，粘贴cloud_token，确认
## 算法来源
https://www.right.com.cn/forum/thread-8339743-1-1.html
