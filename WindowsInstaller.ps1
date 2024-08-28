Write-Output "��ӭʹ�� FloraBot һ����װ�ű�"
$install_python = $true
if (Test-Path -Path "Python3.11.9") {
    $input_ = Read-Host "��⵽���Ѿ��Ѿ���װ�� Python, Python �Ƿ���ȷ��װ(y/N)"
    if ($input_.ToLower() -eq "y".ToLower()) {
        Write-Output "������ Python ��װ"
        $install_python = $false
    }
    else {
        Remove-Item -Path "Python3.11.9"
        Write-Output "��ɾ�� Python, ��ʼ���°�װ Python"
    }
}
$install = $false
if ($install_python) {
    Write-Output "��ѡ��һ�� Python ����Դ:`n1. �ٷ�Դ(python.org)`n2. ������(mirrors.aliyun.com)"
    $input_0 = Read-Host "�������Ӧ�����(1~2)"
    $python_source = 1
    switch ($input_0) {
        1 {
            Write-Output "��ѡ���� 1, ����ʹ�� �ٷ� Դ�������� Python"
        }
        2 {
            Write-Output "��ѡ���� 2, ����ʹ�� ������ ����Դ���� Python"
            $python_source = 2
        }
        default {
            Write-Output "��Ч�����, ������ 1 �� 2 ֮�������"
            exit
        }
    }
    Write-Output "��ѡ����Ҫ��װ�� Python �汾:`n1. Windows 64λ`n2. Windows 32λ`n3. Windows Arm64λ"
    $input = Read-Host "�������Ӧ�����(1~3)"
    $python_release = ""
    switch ($input) {
        1 {
            Write-Output "��ѡ���� 1, ������װ Windows 64λ �İ汾"
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
            Write-Output "��ѡ���� 2, ������װ Windows 32λ �İ汾"
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
            Write-Output "��ѡ���� 3, ������װ Windows Arm64λ �İ汾"
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
            Write-Output "��Ч�����, ������ 1 �� 3 ֮�������"
            exit
        }
    }
    Write-Output "Python ���ص�ַ:"
    Write-Output $python_release
    Write-Output "��ʼ���� Python3.11 ѹ����, �����ĵȴ�..."
    Invoke-WebRequest -Uri $python_release -OutFile "Python3.11.9.zip"
    Write-Output "Python3.11 ѹ�����������, ��ʼ��ѹ Python"
    Expand-Archive -Path "Python3.11.9.zip" -DestinationPath "Python3.11.9"
    # ɾ��ѹ����
    Remove-Item -Path "Python3.11.9.zip"
    # �༭ Python �����ļ�
    Set-Content -Path "Python3.11.9\python311._pth" -Value "python311.zip`n.`n`n# Uncomment to run site.main() automatically`nimport site"
    Write-Output "Python ��ѹ���, ��ʼ��װ pip, �����ĵȴ�..."
    # ���� get-pip.py
    Invoke-WebRequest -Uri "https://bootstrap.pypa.io/get-pip.py" -OutFile "Python3.11.9\get-pip.py"
    # ��װ pip
    Python3.11.9\python.exe Python3.11.9\get-pip.py
    # ɾ�� get-pip.py
    Remove-Item -Path "Python3.11.9\get-pip.py"
    # ���� pip �廪Դ
    Python3.11.9\python.exe -m pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
    Write-Output "pip ��װ���"
}
$install_bot = $true
if (Test-Path -Path "FloraBot.py") {
    $input_ = Read-Host "��⵽���Ѿ��Ѿ���װ�� FloraBot, FloraBot �Ƿ���ȷ��װ(y/N)"
    if ($input_.ToLower() -eq "y".ToLower()) {
        Write-Output "������ FloraBot ��װ"
        $install_bot = $false
    }
    else {
        Remove-Item -Path "README.md"
        Remove-Item -Path "LICENSE"
        Remove-Item -Path "FloraBot.py"
        Write-Output "��ɾ�� FloraBot, ��ʼ���°�װ FloraBot"
    }
}
if ($install_bot) {
    Write-Output "��ѡ��һ�� GitHub ����Դ:`n1. �ٷ�Դ(github.com)`n2. gh.llkk.cc`n3. github.moeyy.xyz`n4. mirror.ghproxy.com`n5. ghproxy.net`n6. gh.ddlc.top"
    $input_1 = Read-Host "�������Ӧ�����(1~6)"
    $download_source = "https://github.com/FloraBotTeam/FloraBot/archive/main.zip"
    switch ($input_1) {
        1 {
            Write-Output "��ѡ���� 1, ����ʹ�� �ٷ� Դ���� FloraBot"
        }
        2 {
            Write-Output "��ѡ���� 2, ����ʹ�� gh.llkk.cc ����Դ���� FloraBot"
            $download_source = "https://gh.llkk.cc/" + $download_source
        }
        3 {
            Write-Output "��ѡ���� 3, ����ʹ�� github.moeyy.xyz ����Դ���� FloraBot"
            $download_source = "https://github.moeyy.xyz/" + $download_source
        }
        4 {
            Write-Output "��ѡ���� 4, ����ʹ�� mirror.ghproxy.com ����Դ���� FloraBot"
            $download_source = "https://mirror.ghproxy.com/" + $download_source
        }
        5 {
            Write-Output "��ѡ���� 5, ����ʹ�� ghproxy.net ����Դ���� FloraBot"
            $download_source = "https://ghproxy.net/" + $download_source
        }
        6 {
            Write-Output "��ѡ���� 6, ����ʹ�� gh.ddlc.top ����Դ���� FloraBot"
            $download_source = "https://gh.ddlc.top/" + $download_source
        }
        default {
            Write-Output "��Ч�����, ������ 1 �� 6 ֮�������"
            exit
        }
    }
     Write-Output "FloraBot ���ص�ַ:"
     Write-Output $download_source
     # ���� FloraBot.zip
    Invoke-WebRequest -Uri $download_source -OutFile "FloraBot.zip"
    Write-Output "FloraBot �������, ��ʼ��ѹ FloraBot"
    # ��ѹ FloraBot.zip
    Expand-Archive -Path "FloraBot.zip" -DestinationPath .
    # ɾ�� FloraBot.zip
    Remove-Item -Path "FloraBot.zip"
    # ɾ�����ģ��
    Remove-Item -Path "FloraBot-main\PluginTemplate" -Recurse
    Write-Output "FloraBot ��ѹ���, ��ʼ��װ����Ŀ�..."
    # ��װ����Ŀ�
    Python3.11.9\python.exe -m pip install -r FloraBot-main\requirements.txt
    # ɾ�� requirements.txt
    Remove-Item -Path "FloraBot-main\requirements.txt"
    # �ƶ� FloraBot
    Get-ChildItem -Path "FloraBot-main" -Recurse | ForEach-Object {
        Move-Item -Path $_.FullName -Destination . -Force
    }
    # ɾ�� FloraBot-main �ļ���
    Remove-Item -Path "FloraBot-main"
    Write-Output "�ⰲװ���, ��ʼ���������ű�"
    # ���������ű�
    Set-Content -Path "Run.bat" -Value "Python3.11.9\python.exe FloraBot.py"
    Write-Output "�����ű��������, ��ʼ�״����� FloraBot"
    # �״����� FloraBot
    Python3.11.9\python.exe FloraBot.py
    Write-Output "�����ű�Ϊ Run.bat, ���иýű��������� FloraBot"
}
pause