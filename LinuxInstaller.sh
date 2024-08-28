#!/bin/bash
echo "欢迎使用 FloraBot 一键安装脚本"
install_python=true

# 检测是否已经安装 Python
if [ -d "Python3.11.9" ]; then
    read -p "检测到你已经安装了 Python, Python 是否被正确安装(y/N): " input_
    if [ "${input_,,}" == "y" ]; then
        echo "已跳过 Python 安装"
        install_python=false
    else
        rm -rf "Python3.11.9"
        echo "已删除 Python, 开始重新安装 Python"
    fi
fi

# 如果需要安装 Python，则进行安装
if [ "$install_python" = true ]; then
    echo "请选择一个 Python 下载源:"
    echo "1. 官方源(python.org)"
    echo "2. 阿里云(mirrors.aliyun.com)"
    read -p "请输入对应的序号(1~2): " input_0
    python_source=1
    case $input_0 in
        1)
            echo "你选择了 1, 即将使用 官方 源进行下载 Python"
            python_release="https://www.python.org/ftp/python/3.11.9/Python-3.11.9.tgz"
            ;;
        2)
            echo "你选择了 2, 即将使用 阿里云 镜像源下载 Python"
            python_release="https://mirrors.aliyun.com/python-release/source/Python-3.11.9.tgz"
            ;;
        *)
            echo "无效的序号, 请输入 1 到 2 之间的数字"
            exit 1
            ;;
    esac

    echo "Python 下载地址:"
    echo "$python_release"
    echo "开始下载 Python3.11 压缩包, 请耐心等待..."
    wget -O Python3.11.9.tgz "$python_release"
    echo "Python3.11 压缩包下载完毕, 开始解压 Python"
    mkdir -p Python3.11.9-src
    tar -xzf Python3.11.9.tgz -C Python3.11.9-src --strip-components=1
    rm Python3.11.9.tgz
    echo "Python 解压完毕, 开始编译 Python, 请耐心等待..."
    cd Python3.11.9-src
    ./configure --prefix=$(pwd)/../Python3.11.9 --with-ensurepip=install
    make
    make install
    cd ..
    echo "Python 编译完毕, 开始安装 pip"
    wget -O Python3.11.9/get-pip.py "https://bootstrap.pypa.io/get-pip.py"
    ./Python3.11.9/bin/python3.11 Python3.11.9/get-pip.py
    rm -rf Python3.11.9/get-pip.py
    ./Python3.11.9/bin/python3.11 -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    echo "pip 安装完毕"
    rm -rf Python3.11.9-src
fi

install_bot=true

# 检测是否已经安装 FloraBot
if [ -f "FloraBot.py" ]; then
    read -p "检测到你已经安装了 FloraBot, FloraBot 是否被正确安装(y/N): " input_
    if [ "${input_,,}" == "y" ]; then
        echo "已跳过 FloraBot 安装"
        install_bot=false
    else
        rm README.md LICENSE FloraBot.py
        echo "已删除 FloraBot, 开始重新安装 FloraBot"
    fi
fi

# 如果需要安装 FloraBot，则进行安装
if [ "$install_bot" = true ]; then
    echo "请选择一个 GitHub 下载源:"
    echo "1. 官方源(github.com)"
    echo "2. gh.llkk.cc"
    echo "3. github.moeyy.xyz"
    echo "4. mirror.ghproxy.com"
    echo "5. ghproxy.net"
    echo "6. gh.ddlc.top"
    read -p "请输入对应的序号(1~6): " input_1
    download_source="https://github.com/FloraBotTeam/FloraBot/archive/main.tar.gz"
    case $input_1 in
        1)
            echo "你选择了 1, 即将使用 官方 源下载 FloraBot"
            ;;
        2)
            echo "你选择了 2, 即将使用 gh.llkk.cc 镜像源下载 FloraBot"
            download_source="https://gh.llkk.cc/$download_source"
            ;;
        3)
            echo "你选择了 3, 即将使用 github.moeyy.xyz 镜像源下载 FloraBot"
            download_source="https://github.moeyy.xyz/$download_source"
            ;;
        4)
            echo "你选择了 4, 即将使用 mirror.ghproxy.com 镜像源下载 FloraBot"
            download_source="https://mirror.ghproxy.com/$download_source"
            ;;
        5)
            echo "你选择了 5, 即将使用 ghproxy.net 镜像源下载 FloraBot"
            download_source="https://ghproxy.net/$download_source"
            ;;
        6)
            echo "你选择了 6, 即将使用 gh.ddlc.top 镜像源下载 FloraBot"
            download_source="https://gh.ddlc.top/$download_source"
            ;;
        *)
            echo "无效的序号, 请输入 1 到 6 之间的数字"
            exit 1
            ;;
    esac

    echo "FloraBot 下载地址:"
    echo "$download_source"
    wget -O FloraBot.tar.gz "$download_source"
    echo "FloraBot 下载完毕, 开始解压 FloraBot"
    tar -xzf FloraBot.tar.gz --strip-components=1
    rm FloraBot.tar.gz
    rm -rf PluginTemplate
    echo "FloraBot 解压完毕, 开始安装所需的库..."
    ./Python3.11.9/bin/python3.11 -m pip install -r requirements.txt
    rm requirements.txt
    echo "库安装完毕, 开始生成启动脚本"
    echo "./Python3.11.9/bin/python3.11 FloraBot.py" > Run.sh
    chmod +x Run.sh
    echo "启动脚本生成完毕, 开始首次运行 FloraBot"
    ./Run.sh
    echo "启动脚本为 Run.sh, 运行该脚本即可启动 FloraBot"
fi
