#!/bin/bash
echo "> 正在安装依赖..."
brew install libusbmuxd https://raw.githubusercontent.com/kadwanev/bigboybrew/master/Library/Formula/sshpass.rb
echo
echo "> 正在备份SSH信任列表到~/.ssh/known_hosts.bak..."
mv ~/.ssh/known_hosts ~/.ssh/known_hosts.bak
clear
echo "==================== 激活锁绕过脚本 ==================="
echo
echo "> Script By @xapenny"
echo "> Checkra1n By King Jon Cracks"
echo "> Method By r/jailbreak & Twitter"
echo
echo
echo "********************警告⚠️********************"
echo 
echo "> 此方法仅供学习和交流使用，请勿用于非法用途！<"
echo "> 由此脚本造成的问题，本人概不负责！<"
echo 
echo "********************警告⚠️********************"
echo
echo

read -p "> 请使用Checkra1n激活越狱，并将设备连接到此Mac。完成后按[Return]键继续。。。 "

clear

echo "> 正在映射SSH端口到@localhost [已完成1/8]"
iproxy 2333 44 2> /dev/null &
echo
echo "> 正在通过SSH访问设备 [已完成2/8]"
runcmd () {
    sshpass -p alpine ssh -o StrictHostKeyChecking=no root@localhost -p 2333 "$1" > /dev/null
}
echo
echo "> 正在挂载根目录文件系统为读写 [已完成3/8]"
runcmd "mount -o rw,union,update / "
echo
echo "> 正在重命名Setup.app [已完成4/8]"
runcmd "mv /Applications/Setup.app /Applications/Setup.app.bak"
echo
echo "> 正在终止设置向导 [已完成5/8]"
runcmd "killall Setup"
echo
echo "> 正在清理缓存 [已完成6/8]"
runcmd "uicache --all"
echo
echo "> 正在重启backboardd [已完成7/8]"
runcmd "killall backboardd"
runcmd "killall backboardd"
echo
echo "> 正在修复国行网络访问 [已完成8/8]"
runcmd "rm -rf /Library/Preferences/com.apple.networkextension.plist"
runcmd "killall -9 Commcenter"
clear
echo
echo "> 所有操作已完成！如无报错，设备应进入桌面。"
echo
echo "> 请按视频执行第二部分操作。"
