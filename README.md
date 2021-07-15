# 블록체인 연수

## Chocolatey 설치 (윈도우 패키지 관리 유틸리티)   

* Chocolatey 다운로드 주소  
https://chocolatey.org/

* 파워쉘 관리자권한 실행 후 붙여넣기  
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))


## Chocolatey 를 통한 필요 유틸리티 설치(파워쉘 관리자권한 실행 후 각 명령어 실행)  

* 윈도우 터미널 설치(https://community.chocolatey.org/packages/microsoft-windows-terminal/1.8.1444.0)  
choco install microsoft-windows-terminal -y

* VirtualBox 설치(https://community.chocolatey.org/packages/virtualbox)  
choco install virtualbox -y

* Git 설치 (소스형상관리)  
choco install git -y

* winscp 설치 (ftp 클라이언트)  
choco install winscp -y

* golang 설치 (프로그램 언어)  
choco install golang -y

* atom 설치 (개발도구)  
choco install atom -y

* mariadb 설치 (DB)  
choco install mariadb -y

* mysql.workbench 설치 (DB 접근 클라이언트)  
choco install mysql.workbench -y

* 몽고db 설치 (DB)  
choco install mongodb -y

* studio3t 설치 (몽고 DB 클라이언트)  
choco install studio3t -y


## Vagrant로 ubuntu 설치 및 설정  

* Vagrant 설치 (가상머신들을 생성,환경설정,관리 하는 도구)  
https://community.chocolatey.org/packages/vagrant  
설치후 재부팅

* 폴더 생성  
C:\VAGRANT\ubuntu18


* Vagrant를 통한 UBUNTU 18.04 버전 설치(C:\VAGRANT\ubuntu18 폴더에서 명령어 실행)  
https://app.vagrantup.com/ubuntu/boxes/bionic64  
vagrant init ubuntu/bionic64  
vagrant up
up 후에 virtualbox 에서 정상 실행 여부 확인

* vagrant 상태 확인  
vagrant status

* vagrant 종료  
vagrant halt

* vagrant 실행  
vagrant up

* SSH 접속  
vagrant ssh

* winscp 접속  
   ip : localhost  
   포트 : 2222  
   계정명 : vagrant  
   비밀번호 : ssh-puttygen을 통해서 아래의 파일을 불러와 ppk 파일 생성 후 인증  
   C:\VAGRANT\ubuntu18\.vagrant\machines\default\virtualbox\private_key 


## Virtualbox에 centos 설치  

* centos7 이미지(iso) 다운로드  
https://www.centos.org/  
7버젼 > x86_64

* virtualbox에 설치 과정(이미지)  
https://github.com/bodybreaker/blockchain/tree/master/image/virtualbox-centos%EC%84%A4%EC%B9%98

* VirtualBox Guest Addition 설치 실패시  
yum install "kernel-devel-uname-r == $(uname -r)"  
수행 후 재설치


## 우분투 접속  
vagrant/ubuntu18 에서 가상머신 시작 및 점속  
vagrant upvagrant ssh

* 패키지 리스트 업데이트  
sudo apt-get update

* 패키지 업그레이드  
sudo apt-get upgrade -y

* 환경변수 조회
env

* 환경변수 추가  
vi ~/.profile
export PATH=$PATH:/ home/username/abc
source.profile
