# Container to launch Oracle SqlDeveloper

## Details to run the container
Allow X connection from docker
> xhost +

Set a volume to persiste authentification / connection of databases
> ORACLE_SQLDEVELOPER_VOLUME=/home/me/oracle_data


## Full script to start the application:

```
xhost +
docker run \
    -e DISPLAY=$DISPLAY \
    -v /tmp/.X11-unix:/tmp/.X11-unix \
    -v $ORACLE_SQLDEVELOPER_VOLUME:/data \
    --rm \
    -d shenron/oracle-sqldeveloper:4.0.2
```

---

**TODO**
- Add compatibility with MacOS
