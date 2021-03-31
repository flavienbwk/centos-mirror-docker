# centos-mirror-docker

<p align="center">
    <a href="https://travis-ci.com/github/flavienbwk/centos-mirror-docker" target="_blank">
        <img src="https://travis-ci.com/flavienbwk/centos-mirror-docker.svg?branch=main&status=passed"/>
    </a>
</p>
<p align="center">Status : tested & working :heavy_check_mark:</p>

## Downloading & updating

1. Setup your CentOS version and releases in `mirror.sh`

2. Run the `mirror` container :

    ```bash
    docker-compose build
    docker-compose up mirror
    ```

> Tips: We recommend you downloading the mirror from [a cloud provider](https://www.scaleway.com/en/) and then transfer the files to your computer.

## Serving

1. Check your mirroring succeeded in `./mirror/*` or typing `du -sh ./mirror` to check the volume

    The default configuration should make you download _22G_

2. Run the server :

    ```bash
    docker-compose up -d server
    ```

    Server will run on [`localhost:8080`](http://localhost:8080)  

## Client configuration

To point your CentOS clients to your mirror, create a `/etc/yum.repos.d/localmirror.repo` file as follow :

```txt
[mymirror-base]
name=My CentOS 7 local mirror for os packages
baseurl=http://localhost:8080/7/os/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[mymirror-extras]
name=My CentOS 7 local mirror for extras packages
baseurl=http://localhost:8080/7/extras/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[mymirror-updates]
name=My CentOS 7 local mirror for updates packages
baseurl=http://localhost:8080/7/updates/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1

[mymirror-centosplus]
name=My CentOS 7 local mirror for centosplus packages
baseurl=http://localhost:8080/7/centosplus/$basearch/
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-CentOS-7
enabled=1
```

:point_right: Feel free to add a reverse proxy or update the [nginx configuration file](./nginx.conf) to secure the mirror with SSL/TLS  
:point_right: Feel free to send **pull requests** as well !
