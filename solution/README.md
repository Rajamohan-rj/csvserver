1. Create a repo in your GitHub account with the same name
2. Clone the provided repo "git clone https://github.com/infracloudio/csvserver.git"
3. Pull both the docker images
4. Issues during triggerring the gencsv.sh script
    chmod 777 gencsv.sh; dos2unix gencsv.sh; ./gencsv.sh 2 8
5. Removing all docker containers -  docker rm -f $(docker ps -a -q) 
6. Error while running container

[node1] (local) root@192.168.0.18 ~/csvserver/solution
$ docker run infracloudio/csvserver
2024/08/07 16:58:48 error while reading the file "/csvserver/inputdata": open /csvserver/inputdata: no such file or directory

7. [node1] (local) root@192.168.0.18 ~/csvserver/solution
$ docker build -t newimage .
[+] Building 0.1s (7/7) FINISHED                                                   docker:default
 => [internal] load build definition from Dockerfile                                         0.0s
 => => transferring dockerfile: 108B                                                         0.0s
 => [internal] load .dockerignore                                                            0.0s
 => => transferring context: 2B                                                              0.0s
 => [internal] load metadata for docker.io/infracloudio/csvserver:latest                     0.0s
 => [internal] load build context                                                            0.0s
 => => transferring context: 30B                                                             0.0s
 => [1/2] FROM docker.io/infracloudio/csvserver:latest                                       0.0s
 => CACHED [2/2] COPY inputFile /csvserver/inputdata                                         0.0s
 => exporting to image                                                                       0.0s
 => => exporting layers                                                                      0.0s
 => => writing image sha256:641a11b80284267f85b65d047dcdc7d5f28bf4ba3275dae1918607225aa7dc1  0.0s
 => => naming to docker.io/library/newimage                                                  0.0s
[node1] (local) root@192.168.0.18 ~/csvserver/solution

8. Container details

[node1] (local) root@192.168.0.18 ~/csvserver/solution
$ docker ps
CONTAINER ID   IMAGE      COMMAND                  CREATED         STATUS         PORTS      NAMES
92a36b11f25f   newimage   "/csvserver/csvserver"   7 seconds ago   Up 5 seconds   9300/tcp   gracious_beaver

9. docker exec -it gracious_beaver sh
netstat -ltpn

10. docker run -p 9393:9300 -e CSVSERVER_BORDER="Orange" -d newimage