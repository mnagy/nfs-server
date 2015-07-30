# NFS server for Docker
Docker nfs-server based on CentOS. To use, run the image as follows:

```
$ docker run -d --net=bridge --privileged --name nfs-server mnagy/nfs-server foo bar
```

You can then mount NFS shares:

```
# mount <CONTAINER_IP>:/exports/foo /foo
# mount <CONTAINER_IP>:/exports/bar /bar
```
