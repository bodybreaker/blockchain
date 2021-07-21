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
* 경로(vagrant/ubuntu18) 에서 가상머신 시작 및 점속  
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

* echo 명령어  
echo "test" > test.txt (test.txt 파일에 test 덮어씀)
echo "test" >> test.txt (test.txt 파일에 test Append)

* 가상 머신과 공유되는 폴더  
윈도우 : C:\VAGRANT\ubuntu18  
우분투 : /vagrant



## vagrant로 우분투 노드 생성
* 폴더 생성  
C:\VAGRANT\4ubuntu

* Vagrantfile파일 생성  
C:\VAGRANT\4ubuntu\Vagrantfile  
(https://github.com/bodybreaker/blockchain/tree/master/vagrantFile4ubuntu/Vagrantfile)

* box 생성  
vagrant up  

* virtual box 에서 확인 시 Master 머신 1개, worker 머신 2개가 생성된것 확인  


## 우분투에 도커 설치 (https://docs.docker.com/engine/install/ubuntu/)  

* 기존 도커 있으면 삭제  
sudo apt-get remove docker docker-engine docker.io containerd runc

* 패키지 정보 업데이트  
sudo apt-get update

* 의존 패키지 도구 설치  
sudo apt-get install -y \  
    apt-transport-https \  
    ca-certificates \  
    curl \  
    gnupg \  
    lsb-release

* docker gpg 키 생성  
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg


* apt 소스에 추가  
echo \  
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \  
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

* docker.com 포함 패키지 정보 업데이트  
sudo apt-get update

* docker CE 설치  
sudo apt-get install docker-ce docker-ce-cli containerd.io

* Hello World 실행
sudo docker run hello-world

* ubuntu 20.04(latest) 실행  
sudo docker run -it ubuntu bash


* root 아닌 사용자로 sudo 없이 도커 명령어 사용  
(1) 도커 그룹 확인  
cat /etc/group  
(2) docker 그룹에 사용자 추기  
sudo usermod -aG docker $USER  
(3) 로그아웃 후 재 접속
exit

* 재부팅시에 도커 활성화  
sudo systemctl enable docker.service  
sudo systemctl enable containerd.service  

* 도커 모든 컨테이너 삭제  
docker stop $(docker ps -a -q)  
docker rm $(docker ps -a -q)

* 도커 중지되있는 모든 컨테이너 삭제  
docker container prune

* 도커 컨테이너 제어   
(1)실행 후 컨테이너 exit  
docker run ubuntu

(2)컨테이너 run 상태 유지  
docker run -it ubuntu bash : Ctrl+p,q

(3)실행중인 컨테이너 접속  
docker exec -it 컨테이너ID bash

(4)컨테이너 정보 확인(Json 형태 결과 출력)  
docker inspect 컨테이너ID

* mysql 이미지 다운로드  
docker pull mysql:5.6

* mysql 실행(-d 데몬) 및 환경변수(-e 옵션), 포트(-p 3306->13306) 설정  
docker run -d \  
--name=mysql_56 \  
-e MYSQL_ROOT_PASSWORD=root \  
-e MYSQL_DATABASE=mydb \  
-p 13306:3306 \  
mysql:5.6

* mysql bash 접속  
docker exec -it mysql_56 bash

* mysql 접속  
docker exec -it mysql_56 mysql -uroot -proot

* sudo apt-get install mysql-client  
mysql -P13306 -h127.0.0.1 -uroot -proot

* mysql 클라이언트 설치  
sudo apt-get install mysql-client

* VagrantFile 수정 ( 포트포워딩 추가)  
config.vm.network "forwarded_port", guest: 13306, host: 3333  
-> 윈도우에서 3333 포트 virtualbox 13306 포트 docker 3306

* Docker Volume 생성 및 조회  
docker volume create mysql56  
docker volume ls  

* mysql Volume 지정 후 재 실행(컨테이너 삭제를 하여도 볼륨은 유지됨)  
docker run -d \  
--name=mysql_56 \  
-e MYSQL_ROOT_PASSWORD=root \  
-e MYSQL_DATABASE=mydb \  
-p 13306:3306 \  
-v mysql56:/var/lib/mysql \  
mysql:5.6


* mysql 컨테이너 볼륨을 윈도우와 연결  
docker run -d \  
--name=mysql_56 \  
-e MYSQL_ROOT_PASSWORD=root \  
-e MYSQL_DATABASE=mydb \  
-p 13306:3306 \  
-v /vagrant/mysql56:/var/lib/mysql \  
mysql:5.6

* VagrantFile 수정 후 reload  
config.vm.network "forwarded_port", guest: 80, host: 8080  
config.vm.network "forwarded_port", guest: 8888, host: 8888

vagrant reload

* nginx 컨테이너 설정
docker run --name my_nginx \  
-v /vagrant/html:/usr/share/nginx/html \  
-p 8888:80 \  
-d nginx

* 네트워크 설정  
docker network connect test my_nginx  
docker network inspect bridge  
docker network inspect test  
docker inspect my_nginx  

* Mysql + Wordpress 설치  
docker run -d \  
-e MYSQL_ROOT_PASSWORD=root \  
-e MYSQL_DATABASE=new_database \  
-p 13306:3306 \  
-v  /home/vagrant/mysql56:/var/lib/mysql \  
--network test \  
--name my_mysql \  
mysql:5.6  

---------------------------  
docker run -d \  
--name my_wordpress \  
-p 8888:80 \  
--network test \  
wordpress  


* wordpress 세팅  
데이터베이스 이름 : new_database  
사용자명 : root  
비밀번호 : root  
데이터베이스 호스트 : (docker network inspect test 해서 나오는 mysql ip)




# 도커파일 만들기(이미지)  


* 폴더 생성  
mkdir ~/ubuntu nginx


* docker 파일 구성  
https://github.com/bodybreaker/blockchain/Dockerfile


* 파일 빌드  
docker build -t my_nginx:latest .  

* 실행  
docker run -itd -p 8888:80 my_nginx 

