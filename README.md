# HiWiFi-ssh-token
本地计算极路由(HiWiFi) ssh解锁Cloud_Token

提供uuid、local token即可计算cloud token，开启ssh，修复了极路由官网下线无法开启ssh的bug

与`www.hiwifi.wtf`作用一致，然而这个网站已经似了
## 使用说明
推荐使用2（python）或3（powershell）脚本，原版`JiLuYouGo.py`有点小问题，计算好后无法跳转到打开的界面，所以重写为手动输入、输出的版本。
1. 打开脚本（以下操作要尽快，token有效期大概在5分钟左右，且期间不能刷新网页）
2. 访问`https://192.168.199.1/cgi-bin/turbo/proxy/router_info`，网页返回一串json信息，在其中找到`uuid`字段，复制路由器uuid，回去粘贴，回车
3. 访问`http://192.168.199.1/local-ssh`，复制token（**文本框没有显示完整，要全选复制才能复制完整，不然下一步算码会报错！**），再回去粘贴
4. 回车，脚本会计算给出cloud_token
5. 复制脚本给出的cloud_token，返回`3.`中网页，粘贴cloud_token，确认
## 算法来源
https://www.right.com.cn/forum/thread-8339743-1-1.html
