# FloraBot-Installer
**FloraBot 的一键安装脚本**
## 目的
* **为了解决繁琐的安装步骤**
## 使用方法
* **Windows: 下载 `WindowsInstaller.ps1` 文件, 将脚本移动至你想安装 FloraBot 的目录中, 右键选择 `使用 PowerShell 运行`**  
* **Linux: 下载 `LinuxInstaller.sh` 文件, 将脚本移动至你想安装 FloraBot 的目录中, 无需 sudo 可直接运行**  
## 使用须知
* **Windows 用户使用一键安装脚本系统里需要有 PowerShell, 通常 Windows 10 以上系统已内置 PowerShell**  
* **Linux 用户使用一键安装脚本因系统而异, 运行脚本前请确认你的系统中是否有 `make` 等编译工具, 有些发行版编译出来的 Python 可能会存在一些问题**
## 注意
**使用一键安装脚本不会检测你的系统中是否已经存在 Python3.11 及以上的 Python, 而是单独安装一个 Python3.11 为 Bot 运行, 且安装不会添加环境变量**  
**若你的系统中已经存在 Python3.11 及以上的 Python, 推荐手动安装**
