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


* docker 파일 구성 (우분투+nginx)  
https://github.com/bodybreaker/blockchain/blob/master/Dockerfile


* 파일 빌드  
docker build -t my_nginx:latest .  

* 실행  
docker run -itd -p 8888:80 my_nginx 

* 태그 부여(동일한 이미지에 태그만 부여)  
docker tag nginx_0721:5.0 nginx_0721:latest

* 실행  
docker run -d -p 8888:80 nginx_0721

# Node js 환경 구성  
* 교재 2-2-2 도커파일 빌드  
docker build -t docker_node:step1 .
  
* 실행  
docker run --name step1 -it docker_node:step1 bash  
 node --version  
 npm --version  
 yarn --version  
 yarn create nuxt-app  
 yarn run dev  
docker cp step1:/app ~/app

* 교재 2-2-3도커파일 빌드  
docker build -t docker_node:step2 .  
docker run --init --name step2 -p 8888:3000 -it docker_node:step2


* 도커 컴포스  
https://docs.docker.com/compose/install/



* 마스터, 워커 1, 워커 2 가동  

* 각 머신에 도커 설치  
https://docs.docker.com/engine/install/ubuntu/


* Swarm 설정  
Master:  docker swarm init --advertise-addr 172.20.0.100  
각 워커: docker swarm join --token SWMTKN-1-5zelvbv43ls1dnu5720amsfi6v1s8a3jsbua9bhgwcru0zqg0s-21y2zomjcflixu019wc3r9jkw 172.20.0.100:2377





# Mysql(mariadb)    

* 마리아DB 설치  
choco install mariadb

* 마리아DB 접속  
mysql -uroot

* 패스워드 설정  
flush privileges;  
alter user 'root'@'localhost' identified by '87654321';  
use mysql;  
select host, user, password from user;(비밀번호 세팅되어있는지 확인)

* mysqladmin을 이용한 패스워드 변경방법  
mysqladmin -uroot password '새패스워드' -p기존패스워드  

* 샘플 테이블 생성  
https://github.com/bodybreaker/blockchain/blob/master/mysqlsampledatabase.sql  

* sql 튜토리얼  
https://www.mysqltutorial.org/mysql-basics/  


# MongoDB  

* mongodb 설치  
choco install mongodb -y

* Studio(Robo) 3T 설치 (mongodb IDE)  
choco install studio3t -y

* Studio 3T 실행 후 mongodb 연결  
localhost:27017  

* MapReduce  
map -> reduce 작업을 통해 집계 데이터 분산 처리  


* Studio 3T 튜토리얼  
https://studio3t.com/academy


# mongodb replica 설정

* Ubuntu에 몽고DB 설치  
https://docs.mongodb.com/manual/tutorial/install-mongodb-on-ubuntu/  

* replica set 매뉴얼  
https://docs.mongodb.com/manual/tutorial/deploy-replica-set/  

* 디렉토리 생성  
c:\db\rs0_0  
c:\db\rs0_1  
c:\db\rs0_2  

* 각 서버 설정  
mongod --configsvr --replSet "rs0" --dbpath c:\db\rs0_0 --bind_ip 0.0.0.0 --port 28017  
mongod --configsvr --replSet "rs0" --dbpath c:\db\rs0_1 --bind_ip 0.0.0.0 --port 28018  
mongod --configsvr --replSet "rs0" --dbpath c:\db\rs0_2 --bind_ip 0.0.0.0 --port 28019  

rs.initiate( {  
   _id : "rs0",  
   members: [  
      { _id: 0, host: "mongodb0.example.net:27017" },  
      { _id: 1, host: "mongodb1.example.net:27017" },  
      { _id: 2, host: "mongodb2.example.net:27017" }  
   ]  
})


# Go Lang

* Go Lang 설치
https://golang.org/dl/  

* Atom 및 플러그인 설치  
http://golang.site/go/article/2-Go-%EC%84%A4%EC%B9%98%EC%99%80-Go-%ED%8E%B8%EC%A7%91%EA%B8%B0-%EC%86%8C%EA%B0%9C  

* Go 언어 가이드  
http://golang.site/go/article/21-Go-%EB%A3%A8%ED%8B%B4-goroutine  

* Go 모듈 환경설정  
go env -w GO111MODULE=auto

* http request 테스트 사이트  
http://httpbin.org/  


* DB 라이브러리 다운로드 ( GOPATH 환경변수를 프로젝트 경로로 설정해 주어야 함)  
go get -u github.com/go-sql-driver/mysql

* go web 프레임워크(martini)  
https://github.com/go-martini/martini  

* martini 및 render 설치  
go get github.com/go-martini/martini  
go get github.com/martini-contrib/render


* dockerfile 생성  
FROM golang  

RUN go get github.com/go-martini/martini  
RUN go get github.com/go-sql-driver/mysql  
RUN go get github.com/martini-contrib/render  

* docker image 빌드  
docker build -t my/goapi:latest .  

* docker image 실행 (현재 ${PWD}/app 폴더내에 파일들을 /go/app 복사하여 실행)  
docker run -it --rm --name go_api -v ${PWD}/app:/go/app my/goapi


# node.js  
* node.js Long Term Support 설치  
choco install nodejs-lts

* npm 설정  
npm init -y



# 하이퍼레저 패브릭  
* 공식 홈페이지  
https://www.hyperledger.org/


* Mable 예제  
https://github.com/IBM-Blockchain-Archive/marbles/blob/master/README-ko.md

* 폴더 생성  
C:\VAGRANT\fabric14  

* Vagrant file 생성  
vagrant init acaruso/fabric-14

* Vagrantfile 수정 
<pre><code>
  config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "1024"
	 vb.cpus = 4
  end
</code></pre>

* vagrant 기동  
vagrant up  
vagrant ssh

* Marbles git clone  
git clone https://github.com/IBM-Blockchain/marbles.git --depth 1

* Hpyerledger git clone  
git clone https://github.com/hyperledger/fabric-samples.git  

* nexus 도메인이 없어져서 hyperledger 다운로드부분을 변경해야함  
curl -sSL https://raw.githubusercontent.com/hyperledger/fabric/main/scripts/bootstrap.sh -o setup_script.sh


* 튜토리얼  
https://hyperledger-fabric.readthedocs.io/en/release-2.2/tutorials.html




# 블록체인 네트워크(하이퍼레저 패브릭) 구성  
(https://hyperledger-fabric.readthedocs.io/en/release-2.2/install.html)  

* golang 설치  
* docker 설치  
* docker-compose 설치  

* nodejs 설치 (https://github.com/nodesource/distributions) - 10버젼대 설치(하이퍼렛져 지원)  
curl -fsSL https://deb.nodesource.com/setup_10.x | sudo -E bash - 
sudo apt-get install -y nodejs  
sudo apt-get install -y build-essential

* libtool 설치  
sudo apt-get install -y libtool  


* hyperledger 바이너리 설치  
curl -sSL https://bit.ly/2ysbOFE | bash -s -- 2.2.3 1.5.1  

export PATH=<path to download location>/bin:$PATH  


* 테스트 네트워크 실행
/fabric-samples/test-network/network.sh up

* org1과 org2 사이 트렌젝션을 위한 채널 생성  
./network.sh createChannel (기본 이름은 mychannel)  

* COMPOSE_PROJECT_NAME 환경변수 설정
export COMPOSE_PROJECT_NAME=docker  


* 체인코드 배포  
./network.sh deployCC -ccn basic -ccp ../asset-transfer-basic/chaincode-go -ccl go  



* peer 명령어 사용을 위한 path 설정  
<pre><code>
export PATH=${PWD}/../bin:$PATH
export FABRIC_CFG_PATH=$PWD/../config/  
export CORE_PEER_TLS_ENABLED=true
export CORE_PEER_LOCALMSPID="Org1MSP"
export CORE_PEER_TLS_ROOTCERT_FILE=${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt
export CORE_PEER_MSPCONFIGPATH=${PWD}/organizations/peerOrganizations/org1.example.com/users/Admin@org1.example.com/msp
export CORE_PEER_ADDRESS=localhost:7051
</code></pre>


* 체인코드 실행  
<pre><code>
peer chaincode invoke \
-o localhost:7050 \
--ordererTLSHostnameOverride orderer.example.com \
--tls \
--cafile ${PWD}/organizations/ordererOrganizations/example.com/orderers/orderer.example.com/msp/tlscacerts/tlsca.example.com-cert.pem \
-C mychannel \
-n basic \
--peerAddresses localhost:7051 \
--tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org1.example.com/peers/peer0.org1.example.com/tls/ca.crt \
--peerAddresses localhost:9051 \
--tlsRootCertFiles ${PWD}/organizations/peerOrganizations/org2.example.com/peers/peer0.org2.example.com/tls/ca.crt \
-c '{"function":"InitLedger","Args":[]}'
</code></pre>

* 조회하는 체인코드 실행  
<pre><code>
peer chaincode query -C mychannel -n basic -c '{"Args":["GetAllAssets"]}'
peer chaincode query -C mychannel -n basic -c '{"function":"ReadAsset","Args":["asset1"]}'
</code></pre>



# 영상 녹화 링크  
0712-1 https://youtu.be/Qq6ZZxA8SoI  
0712-2 https://youtu.be/4ssMfkXGP2s  
0712-3 https://youtu.be/-pHXd7aTacg  

0713-1 https://youtu.be/cJW549rfzOY  
0713-2 https://youtu.be/K-d7Mlnw758  
0713-3 https://youtu.be/_Z00oAKfLAw  
0713-4 https://youtu.be/JzyKn3rAz6Y  

0714-1 https://youtu.be/aAaIzK8cSB8  
0714-2 https://youtu.be/BRijUZRIv6E  
0714-3 https://youtu.be/dUWmvhYONio  
0714-4 https://youtu.be/SJFSpJR4b9s  

0715-1 https://youtu.be/7EY9eNsoxmA  
0715-2 https://youtu.be/8OaXy8Vy7Vo  
0715-3 https://youtu.be/1GHo8en-R0g  
0715-4 https://youtu.be/ozXUuprBff4  

0716-1 https://youtu.be/MJgms-iLAPs  
0716-2 https://youtu.be/eTI4dUDfJJA  
0716-3 https://youtu.be/nHd9SYZiN_0  
0716-4 https://youtu.be/FtKL2lUCLKg  

0719-1 https://youtu.be/ePBdRd0vSxI  
0719-2 https://youtu.be/HR55etpczuk  
0719-3 https://youtu.be/vNFgQP6IEls  
0719-4 https://youtu.be/TxFvbyuzZuQ  

0720-1 https://youtu.be/Qbzkqa2L3qo  
0720-2 https://youtu.be/HLVA0tDa9iI  
0720-3 https://youtu.be/FtYn-PI76DU  
0720-4 https://youtu.be/QQO9vAPWuf8  

0721-1 https://youtu.be/C0PZrPvt4fw  
0721-2 https://youtu.be/UQc38vp5et0  
0721-3 https://youtu.be/4StKpP3FmeE  
0721-4 https://youtu.be/kFXJ0skgbUw  

0722-1 https://youtu.be/zBBtkFgCHNk  
0722-2 https://youtu.be/9EZFvbKO2ME  
0722-3 https://youtu.be/WgI1vS-Bp3o  
0722-4 https://youtu.be/gxJaeu1vq-Y  

0723-1 https://youtu.be/V4HvsxinG3E  
0723-2 https://youtu.be/83Uk5IGDuAY  
0723-3 https://youtu.be/dlOuFYlJW1M  
0723-4 https://youtu.be/uUBJEnWMQ50  

0726-1 https://youtu.be/F-3u9pkuNIc  
0726-2 https://youtu.be/4nVjLzhI7as  
0726-3 https://youtu.be/8e-iKKn9Kpo  
0726-4 https://youtu.be/ogune4078ec  

0727-1 https://youtu.be/3uc7K1uqM6A  
0727-2 https://youtu.be/1hJtgFIVGRA  
0727-3 https://youtu.be/CIrORc-Jg1w  
0727-4 https://youtu.be/912K05o0OO0  

0728-1 https://youtu.be/GWEFlto7LZk  
0728-2 https://youtu.be/YQJODhfR9Es  
0728-3 https://youtu.be/_sKRftSCAuw  
0728-4 https://youtu.be/PaHP9yfGrbU  

0730-1 https://youtu.be/MJf0ETVRUsY  
0730-2 https://youtu.be/ZV5oYoytFsg  
0730-3 https://youtu.be/0BK1VCindMw  
0730-4 https://youtu.be/12HMGdfdEgs  

0809-1 https://youtu.be/0AuGBSd6aNY  
0809-2 https://youtu.be/-G1Fn4EC184  
0809-3 https://youtu.be/Ho3Zcj5puBQ  
0809-4 https://youtu.be/Pf3gDiLi70k  

0810-1 https://youtu.be/HJ1BaHr4wiM  
0810-2 https://youtu.be/RWP2XGfSxN8  
0810-3 https://youtu.be/hHv1aQXW6aE  
0810-4 https://youtu.be/oQUvNz22Td4  

0811-1 https://youtu.be/dH-PeiY4iww  
0811-2 https://youtu.be/bVCsnmBSzvk  
0811-3 https://youtu.be/hHrHc9pw8fA  
0811-4 https://youtu.be/-OEKFD9Oytw  

0812-1 https://youtu.be/Ga0PDsP0hBE  
0812-2 https://youtu.be/QkxKVy00WWY  
0812-3 https://youtu.be/pesXZd5ijPA  
0812-4 https://youtu.be/UgcmiJzEKCw  
 
0813-1 https://youtu.be/mqyuAmMwF3Q  
0813-2 https://youtu.be/KKK23pFCQtY  
0813-3 https://youtu.be/L45ImSehFbg  
0813-4 https://youtu.be/dJDpZHwsEdU  

0817-1 https://youtu.be/pvXHYq4hbSI  
0817-2 https://youtu.be/yeMn6h5wrrM  
0817-3 https://youtu.be/mcYHPCxUFRE  
0817-4 https://youtu.be/yuI4GrvXqqI  
 
0818-1 https://youtu.be/F8F6evvy7NM  
0818-2 https://youtu.be/y3qeg9hO83o  
0818-3 https://youtu.be/AQTc07TT29Y  
0818-4 https://youtu.be/p_byHqCHzUM  

0819-1 https://youtu.be/UhOlDsOvIAo  
0819-2 https://youtu.be/VT7iJJTDivs  
0819-3 https://youtu.be/0bLw_CCHe2c  
0819-4 https://youtu.be/_zPlFHd1vVc  

0820-1 https://youtu.be/KsBZBfSvB4c  
0820-2 https://youtu.be/Q2XaKofR-TQ  
0820-3 https://youtu.be/DYLnoLW58Bc  
0820-4 https://youtu.be/BJPBCfUGD0Y  

0823-1 https://youtu.be/1DJOsqBpwHY  
0823-2 https://youtu.be/VFfrbSlVaQo  
0823-3 https://youtu.be/DGM1ixhslB4  
0823-4 https://youtu.be/_WzKsb9dRF4  

0824-1 https://youtu.be/E-gZTkKT9ww  
0824-2 https://youtu.be/D9gl_oV-MwU  
0824-3 https://youtu.be/8aG_vpU9e2k  
0824-4 https://youtu.be/bW0J5UnnHlo  
