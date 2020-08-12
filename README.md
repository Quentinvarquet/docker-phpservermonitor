
# PHPServerMonitor in Docker (Last version 3.5.1)

**Notes:**

* Last update : 04/08/2020, updated version to 3.5.1.
* Forked from [Quentinvarquet](https://github.com/Quentinvarquet/docker-phpservermonitor).
* Please open issues on [github](https://github.com/alwynpan/docker-phpservermonitor/issues).
  
## PHPServerMonitor

[PHPServerMonitor](http://www.phpservermonitor.org/) is a script that checks whether your websites and servers are up and running. It comes with a web based user interface where you can manage your services and websites, and you can manage users for each server with a mobile number and email address.

## Docker

[Docker](https://www.docker.com/) allows you to package an application with all of its dependencies into a standardized unit for software development.

More information :

* [What is docker](https://www.docker.com/what-docker)
* [How to Create a Docker Business Case](https://www.brianchristner.io/how-to-create-a-docker-business-case/)

## Information

This is the unofficial (updated when I can!) repository for PHPServerMonitor

I will update the repository every time there is a new version of PHPServerMonitor available

## Build the image

### Build the 3.5.1 version

```bash
docker build --no-cache -t alwynpan/phpservermonitor:latest \
                        -t alwynpan/phpservermonitor:3.5.1 \
                        -f dockerfile/Dockerfile .
```

## Run the image

To run this Docker image, the following configurations need to be set:

* **DATABASE_HOST:** (optional) database host URI, i.e. mysql container name, default to `mysql`
* **DATABASE_PORT:** (optional) database port, default to `3306`
* **DATABASE_NAME:** (optional) database name, default to `psm`
* **DATABASE_USER:** (optional) database user, default to `psm`
* **DATABASE_PASSWORD:** database password, no default value
* **DATABASE_PREFIX:** (optional) database table prefix, default to `psm_`
* **BASE_URL:** base URL, no default value
* **DEBUG:** (optional) debug mode, default to `false`
* **CHECK_INTERVAL:** (optional) the inverval between each checks, default to `2` mins
* **TIMEOUT:** (optional) timeout, default to `10` seconds

### Example

```bash
docker run --name phpservermonitor -p 80:80 \
                                   -e DATABASE_HOST=mysql \
                                   -e DATABASE_PORT=3306 \
                                   -e DATABASE_NAME=psm \
                                   -e DATABASE_USER=psm \
                                   -e DATABASE_PASSWORD=psm \
                                   -e DATABASE_PREFIX=psm \
                                   -e BASE_URL=http://localhost \
                                   -e CHECK_INTERVAL=5 \
                                   -e TIMEOUT=15 \
                                   -e DEBUG=true \
                                   -d quentinv/phpservermonitor:latest
```

### Docker Compose

```bash
version: '3.8'
services:
 psm:
   image: alwynpan/phpservermonitor:3.5.1
   restart: always
   ports:
     - 80:80
   depends_on:
     - mysql
   environment:
     - DATABASE_HOST=mysql
     - DATABASE_PORT=3306
     - DATABASE_NAME=psm
     - DATABASE_USER=psm
     - DATABASE_PASSWORD=psm
     - DATABASE_PREFIX=psm
     - BASE_URL=http://localhost
     - CHECK_INTERVAL=1
     - TIMEOUT=15
     - DEBUG=true
   container_name: psm

 mysql:
   image: mysql:5.7
   restart: always
   ports:
     - 3306:3306
   environment:
     - MYSQL_ROOT_PASSWORD=top_secret
     - MYSQL_DATABASE=psm
     - MYSQL_USER=psm
     - MYSQL_PASSWORD=psm
   volumes:
     - ./data/:/var/lib/mysql
   container_name: mysql
```

### Using the PHP Server Monitor

Just head to http://your_url_or_ip, complete the admin user setup and you are good to go.
