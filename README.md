# 블록체인 연수

## 기본 유틸리티 설치  

* Chocolatey 설치 (윈도우 패키지 관리 유틸리티)  
https://chocolatey.org/

* 파워쉘 관리자권한 실행 후 붙여넣기  
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

* 윈도우 터미널 설치  
https://community.chocolatey.org/packages/microsoft-windows-terminal/1.8.1444.0

* VirtualBox 설치 (우분투 가상화 머신 설치 위해서)  
https://community.chocolatey.org/packages/virtualbox

* Git (소스형상관리) 설치  
choco install git  

* winscp (ftp 클라이언트) 설치  
choco install winscp

* golang 설치(프로그램 언어)  
choco install golang

* atom 설치(개발도구)  
choco install atom

* mariadb 설치(DB)  
choco install mariadb

* mysql.workbench 설치 (DB 접근 클라이언트)  
choco install mysql.workbench

* 몽고db 설치 (DB)  
choco install mongodb

* studio3t 설치 (몽고 DB 클라이언트)  
choco install studio3t


## Vagrant 설정  

* Vagrant 설치 (가상머신들을 생성,환경설정,관리 하는 도구)  
https://community.chocolatey.org/packages/vagrant  
설치후 재부팅

* 폴더 생성  
C:\VAGRANT\ubuntu18

* UBUNTU 18.04 버전 설치(C:\VAGRANT\ubuntu18 폴더에서 명령어 실행)  
https://app.vagrantup.com/ubuntu/boxes/bionic64  
vagrant init ubuntu/bionic64  
vagrant up

* centos 다운로드  
https://www.centos.org/  
7버젼 > x86_64