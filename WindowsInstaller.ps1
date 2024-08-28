Write-Output "欢迎使用 FloraBot 一键安装脚本"
$install_python = $true
if (Test-Path -Path "Python3.11.9") {
    $input_ = Read-Host "检测到你已经已经安装了 Python, Python 是否被正确安装(y/N)"
    if ($input_.ToLower() -eq "y".ToLower()) {
        Write-Output "已跳过 Python 安装"
        $install_python = $false
    }
    else {
        Remove-Item -Path "Python3.11.9"
        Write-Output "已删除 Python, 开始重新安装 Python"
    }
}
$install = $false
if ($install_python) {
    Write-Output "请选择一个 Python 下载源:`n1. 官方源(python.org)`n2. 阿里云(mirrors.aliyun.com)"
    $input_0 = Read-Host "请输入对应的序号(1~2)"
    $python_source = 1
    switch ($input_0) {
        1 {
            Write-Output "你选择了 1, 即将使用 官方 源进行下载 Python"
        }
        2 {
            Write-Output "你选择了 2, 即将使用 阿里云 镜像源下载 Python"
            $python_source = 2
        }
        default {
            Write-Output "无效的序号, 请输入 1 到 2 之间的数字"
            exit
        }
    }
    Write-Output "请选择你要安装的 Python 版本:`n1. Windows 64位`n2. Windows 32位`n3. Windows Arm64位"
    $input = Read-Host "请输入对应的序号(1~3)"
    $python_release = ""
    switch ($input) {
        1 {
            Write-Output "你选择了 1, 即将安装 Windows 64位 的版本"
            $install = $true
            switch ($python_source) {
                1 {
                    $python_release = "https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-amd64.zip"
                }
                2 {
                    $python_release = "https://mirrors.aliyun.com/python-release/windows/python-3.11.9-embed-amd64.zip"
                }
            }
        }
        2 {
            Write-Output "你选择了 2, 即将安装 Windows 32位 的版本"
            $install = $true
            switch ($python_source) {
                1 {
                    $python_release = "https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-win32.zip"
                }
                2 {
                    $python_release = "https://mirrors.aliyun.com/python-release/windows/python-3.11.9-embed-win32.zip"
                }
            }
        }
        3 {
            Write-Output "你选择了 3, 即将安装 Windows Arm64位 的版本"
            $install = $true
            switch ($python_source) {
                1 {
                    $python_release = "https://www.python.org/ftp/python/3.11.9/python-3.11.9-embed-arm64.zip"
                }
                2 {
                    $python_release = "https://mirrors.aliyun.com/python-release/windows/python-3.11.9-embed-arm64.zip"
                }
            }
        }
        default {
            Write-Output "无效的序号, 请输入 1 到 3 之间的数字"
            exit
        }
    }
    Write-Output "Python 下载地址:"
    Write-Output $python_release
    Write-Output "开始下载 Python3.11 压缩包, 请耐心等待..."
    Invoke-WebRequest -Uri $python_release -OutFile "Python3.11.9.zip"
    Write-Output "Python3.11 压缩包下载完毕, 开始解压 Python"
    Expand-Archive -Path "Python3.11.9.zip" -DestinationPath "Python3.11.9"
    # 删除压缩包
    Remove-Item -Path "Python3.11.9.zip"
    # 编辑 Python 配置文件
    Set-Content -Path "Python3.11.9\python311._pth" -Value "python311.zip`n.`n`n# Uncomment to run site.main() automatically`nimport site"
    Write-Output "Python 解压完毕, 开始安装 pip, 请耐心等待..."
    # 下载 get-pip.py
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile "Python3.11.9\get-pip.py"
    # 安装 pip
    Python3.11.9\python.exe Python3.11.9\get-pip.py
    # 删除 get-pip.py
    Remove-Item -Path "Python3.11.9\get-pip.py"
    # 设置 pip 清华源
    Python3.11.9\python.exe -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    Write-Output "pip 安装完毕"
}
$install_bot = $true
if (Test-Path -Path "FloraBot.py") {
    $input_ = Read-Host "检测到你已经已经安装了 FloraBot, FloraBot 是否被正确安装(y/N)"
    if ($input_.ToLower() -eq "y".ToLower()) {
        Write-Output "已跳过 FloraBot 安装"
        $install_bot = $false
    }
    else {
        Remove-Item -Path "README.md"
        Remove-Item -Path "LICENSE"
        Remove-Item -Path "FloraBot.py"
        Write-Output "已删除 FloraBot, 开始重新安装 FloraBot"
    }
}
if ($install_bot) {
    Write-Output "请选择一个 GitHub 下载源:`n1. 官方源(github.com)`n2. gh.llkk.cc`n3. github.moeyy.xyz`n4. mirror.ghproxy.com`n5. ghproxy.net`n6. gh.ddlc.top"
    $input_1 = Read-Host "请输入对应的序号(1~6)"
    $download_source = "https://github.com/FloraBotTeam/FloraBot/archive/main.zip"
    switch ($input_1) {
        1 {
            Write-Output "你选择了 1, 即将使用 官方 源下载 FloraBot"
        }
        2 {
            Write-Output "你选择了 2, 即将使用 gh.llkk.cc 镜像源下载 FloraBot"
            $download_source = "https://gh.llkk.cc/" + $download_source
        }
        3 {
            Write-Output "你选择了 3, 即将使用 github.moeyy.xyz 镜像源下载 FloraBot"
            $download_source = "https://github.moeyy.xyz/" + $download_source
        }
        4 {
            Write-Output "你选择了 4, 即将使用 mirror.ghproxy.com 镜像源下载 FloraBot"
            $download_source = "https://mirror.ghproxy.com/" + $download_source
        }
        5 {
            Write-Output "你选择了 5, 即将使用 ghproxy.net 镜像源下载 FloraBot"
            $download_source = "https://ghproxy.net/" + $download_source
        }
        6 {
            Write-Output "你选择了 6, 即将使用 gh.ddlc.top 镜像源下载 FloraBot"
            $download_source = "https://gh.ddlc.top/" + $download_source
        }
        default {
            Write-Output "无效的序号, 请输入 1 到 6 之间的数字"
            exit
        }
    }
     Write-Output "FloraBot 下载地址:"
     Write-Output $download_source
     # 下载 FloraBot.zip
    Invoke-WebRequest -Uri $download_source -OutFile "FloraBot.zip"
    Write-Output "FloraBot 下载完毕, 开始解压 FloraBot"
    # 解压 FloraBot.zip
    Expand-Archive -Path "FloraBot.zip" -DestinationPath .
    # 删除 FloraBot.zip
    Remove-Item -Path "FloraBot.zip"
    # 删除插件模板
    Remove-Item -Path "FloraBot-main\PluginTemplate" -Recurse
    Write-Output "FloraBot 解压完毕, 开始安装所需的库..."
    # 安装所需的库
    Python3.11.9\python.exe -m pip install -r FloraBot-main\requirements.txt
    # 删除 requirements.txt
    Remove-Item -Path "FloraBot-main\requirements.txt"
    # 移动 FloraBot
    Get-ChildItem -Path "FloraBot-main" -Recurse | ForEach-Object {
        Move-Item -Path $_.FullName -Destination . -Force
    }
    # 删除 FloraBot-main 文件夹
    Remove-Item -Path "FloraBot-main"
    Write-Output "库安装完毕, 开始生成启动脚本"
    # 生成启动脚本
    Set-Content -Path "Run.bat" -Value "Python3.11.9\python.exe FloraBot.py"
    Write-Output "启动脚本生成完毕, 开始首次运行 FloraBot"
    # 首次运行 FloraBot
    Python3.11.9\python.exe FloraBot.py
    Write-Output "启动脚本为 Run.bat, 运行该脚本即可启动 FloraBot"
}
pause