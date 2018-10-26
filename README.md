# dockerfiles-root
Docker context to create docker root image to run ROOT version 6.12
# dockerfiles-root

Docker __context__ to create docker [ROOT CERN](https://root.cern.ch/guides/users-guide "User's guide") version 6.12 image.

## Install

#### installing prerequisites
Assuming `docker` and `docker-compose` is installed on your system (host-computer). If not follow
the links below:

1. [how to install docker](https://docs.docker.com/install/linux/docker-ce/debian/#install-docker-ce-1) for	 linux
2. [how to install docker-compose](https://docs.docker.com/compose/install/#install-compose) for linux
3. [post-installation steps](https://docs.docker.com/install/linux/linux-postinstall/#manage-docker-as-a-non-root-user) for linux


#### 1. Clone the docker root repository

	```bash
	$ git clone https://github.com/ncastello/dockerfiles-root.git
	$ cd dockerfiles-root
	```
#### 2. Change user name and ID number

	* search for FIXME in the Docker file and change 1000 for your linux ID user number (in your
	  bash just do *** $ id -u $USER *** to get your ID number)

	* searh for FIXME in the docker-compose.yml and change USER for your linux ID name (in your bash
	  just do *** echo $USER ***)

#### 3. To build the docker container
   	```bash
   	# Using docker
   	$ docker build github.com/ncastello/dockerfiles-damicm-G410.4
   	# Using docker-compose within the repo directory
   	$ docker-compose build damicm-geant4.10.4
   	```

## USAGE

The first to do is to give permissions to docker to access the X-server
```bash
$ xhost +local:docker
```

#### How to use

    The recommended way to run dockerfiles-root container is with docker-compose. To start to use
    ROOT you only need to run the following command in your bash

    ```bash
    $ docker-compose run --rm rootdocker
    ```


## Usefull `docker` commands

#### 1. List containers
    ```bash
    $ docker ps
    ```

#### 2. Deleting ...
    ```bash
    $ docker image prune
    $ docker container prune
    $ docker system prune
    $ docker network prune
    ```
