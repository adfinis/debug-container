# debug-container

[![](https://images.microbadger.com/badges/image/adfinissygroup/debug.svg)](https://microbadger.com/images/adfinissygroup/debug "Get your own image badge on microbadger.com") [![](https://images.microbadger.com/badges/version/adfinissygroup/debug.svg)](https://microbadger.com/images/adfinissygroup/debug "Get your own version badge on microbadger.com")

A container image packed with debugging tools

# quickstart

```
podman run -it adfinissygroup/debug
Trying to pull docker.io/adfinissygroup/debug...
Getting image source signatures
Copying blob df20fa9351a1 skipped: already exists
Copying blob 95af1e08e02d done
Copying config 533c2b3bb9 done
Writing manifest to image destination
Storing signatures
bash-5.0# which tcpdump
/usr/sbin/tcpdump
bash-5.0# which nc
/usr/bin/nc
bash-5.0# which ping
/bin/ping
bash-5.0# which dig
/usr/bin/dig
```
