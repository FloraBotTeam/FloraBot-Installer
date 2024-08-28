# FloraBot-Installer
**FloraBot 的一键安装脚本**
## 目的
* **为了解决繁琐的安装步骤**
## 食用方法
* **Windows: 进入你想安装 FloraBot 的目录中, 然后运行以下命令(请使用命令提示符(CMD)来运行):**  
**GitHub 官方源:**  
```Shell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/FloraBotTeam/FloraBot-Installer/main/WindowsInstaller.ps1" -OutFile "WindowsInstaller.ps1"; powershell -File WindowsInstaller.ps1; Remove-Item WindowsInstaller.ps1
```
**GitHub 镜像源:**  
```Shell
Invoke-WebRequest -Uri "https://github.moeyy.xyz/https://raw.githubusercontent.com/FloraBotTeam/FloraBot-Installer/main/WindowsInstaller.ps1" -OutFile "WindowsInstaller.ps1"; powershell -File WindowsInstaller.ps1; Remove-Item WindowsInstaller.ps1
```
* **Linux: 进入你想安装 FloraBot 的目录中, 然后运行以下命令:**  
**GitHub 官方源:**  
```Shell
wget -O LinuxInstaller.sh "https://raw.githubusercontent.com/FloraBotTeam/FloraBot-Installer/main/LinuxInstaller.sh" && ./LinuxInstaller.sh && rm LinuxInstaller.sh
```
**GitHub 镜像源:**  
```Shell
wget -O LinuxInstaller.sh "https://github.moeyy.xyz/https://raw.githubusercontent.com/FloraBotTeam/FloraBot-Installer/main/LinuxInstaller.sh" && ./LinuxInstaller.sh && rm LinuxInstaller.sh
```
## 使用须知
* **Windows 用户使用一键安装脚本系统里需要有 PowerShell, 通常 Windows 10 以上系统已内置 PowerShell, 使用上方命令一键安装需要系统内有 curl 命令, 如果没有则需要手动下载 `WindowsInstaller.ps1` 文件然后使用 PowerShell 运行**  
* **Linux 用户使用一键安装脚本因系统而异, 运行脚本前请确认你的系统中是否有 `make` 等编译工具, 有些发行版编译出来的 Python 可能会存在一些问题**
## 注意
**使用一键安装脚本不会检测你的系统中是否已经存在 Python3.11 及以上的 Python, 而是单独安装一个 Python3.11 为 Bot 运行, 且安装不会添加环境变量**  
**若你的系统中已经存在 Python3.11 及以上的 Python, 推荐手动安装**
