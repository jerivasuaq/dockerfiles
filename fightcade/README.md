# popcorntime


Without Nvidia:
=====================================

```
git clone https://github.com/jerivasuaq/popcorntime.git

cd popcorntime

./build.sh

docker run -ti --rm --entrypoint "/bin/bash" jerivas/popcorntime /config.sh > popcorntime.sh

sed -i 's/\r//' popcorntime.sh

chmod +x popcorntime.sh

./popcorntime.sh

```

The next time do:
-------------------------------------

```
docker start popcorntime
```


For Nvidia support do:
======================================

```
git clone https://github.com/jerivasuaq/popcorntime.git

cd popcorntime

./build-withNvidia.sh

docker run -ti --rm --entrypoint "/bin/bash" jerivas/popcorntime /config-withNvidia.sh > popcorntime-withNvidia.sh

sed -i 's/\r//' popcorntime-withNvidia.sh

chmod +x popcorntime-withNvidia.sh

./popcorntime-withNvidia.sh
```


The next time do:

```
docker start popcorntime_nvidia
```


