
# PHPServerMonitor in Docker (Last version 3.3.2)

**Notes:**

* Last update : 04/10/2019, updated version to 3.3.2.
* Please open issues on [github](https://github.com/Quentinvarquet/docker-phpservermonitor/issues).
* Version 3.3.2 is the last release version of PHPServerMonitor that tested working with website check out-of-the-box. For details please see issues: [#664](https://github.com/phpservermon/phpservermon/issues/664), [#745](https://github.com/phpservermon/phpservermon/issues/745), [#756](https://github.com/phpservermon/phpservermon/issues/756). A possible workaround is to deploy the 3.3.2 first and then upgrade it to 3.4.5
  
## PHPServerMonitor

[PHPServerMonitor](http://www.phpservermonitor.org/) is a script that checks whether your websites and servers are up and running. It comes with a web based user interface where you can manage your services and websites, and you can manage users for each server with a mobile number and email address.

## Docker

[Docker](https://www.docker.com/) allows you to package an application with all of its dependencies into a standardized unit for software development.

More information :

* [What is docker](https://www.docker.com/what-docker)
* [How to Create a Docker Business Case](https://www.brianchristner.io/how-to-create-a-docker-business-case/)

## Information

This is the unofficial (updated when I can !) repository for PHPServerMonitor

I will update the repository every time there is a new version of PHPServerMonitor available

## Supported tags and respective Dockerfile links

* **[3.3.2, latest]((https://github.com/Quentinvarquet/docker-phpservermonitor/blob/master/dockerfile/Dockerfile))**

## Build the image

### Build the 3.3.2 version

```bash
docker build --no-cache -t quentinv/phpservermonitor:latest \
                        -t quentinv/phpservermonitor:3.3.2 \
                        -f dockerfile/latest/Dockerfile .
```

### Build the 3.4.5 version

```bash
docker build --no-cache --build-arg VERSION=3.4.5 \
                        -t quentinv/phpservermonitor:latest \
                        -t quentinv/phpservermonitor:3.3.2 \
                        -f dockerfile/latest/Dockerfile .
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

I created a [docker-compose.yml]((https://github.com/Quentinvarquet/docker-phpservermonitor/blob/master/docker-compose/docker-compose.yml)) with two containers : PhpServerMonitor and MySQL.

### Using the PHP Server Monitor

Just head to http://your_url_or_ip, complete the admin user setup and you are good to go.
