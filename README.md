# debug-container

A container image packed with debugging tools

# Quick start

```
podman run -it --entrypoint=/bin/bash ghcr.io/adfinis-sygroup/debug
Trying to pull ghcr.io/adfinis-sygroup/debug...
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

# using the debug container on k8s

Modify your deployment / pod to include a second container:

```
containers:
  - name: debug
    image: ghcr.io/adfinis-sygroup/debug:latest
    imagePullPolicy: Always
```

Example Diff:

```
diff -y deployment.yaml deployment_debug.yaml

apiVersion: apps/v1                                             apiVersion: apps/v1
kind: Deployment                                                kind: Deployment
metadata:                                                       metadata:
  name: nginx-deployment                                          name: nginx-deployment
  labels:                                                         labels:
    app: nginx                                                      app: nginx
spec:                                                           spec:
  replicas: 3                                                     replicas: 3
  selector:                                                       selector:
    matchLabels:                                                    matchLabels:
      app: nginx                                                      app: nginx
  template:                                                       template:
    metadata:                                                       metadata:
      labels:                                                         labels:
        app: nginx                                                      app: nginx
    spec:                                                           spec:
      containers:                                                     containers:
                                                              >       - name: debug
                                                              >         image: ghcr.io/adfinis-sygroup/debug:latest
      - name: nginx                                                   - name: nginx
        image: nginx:1.14.2                                             image: nginx:1.14.2
        ports:                                                          ports:
        - containerPort: 80                                             - containerPort: 80
```

## Patch Deployments

Create a patch snippet `debug-patch.yml` to amend the debug container:
```yaml
---

spec:
  template:
    spec:
      containers:
      - name: debug
        image: ghcr.io/adfinis-sygroup/debug:latest
```

Apply the patch:
```bash
kubectl patch deployment nginx-deployment --patch "$(cat debug-patch.yml)"
```

## Debugging Container Logs

You can then access the debug container inside your pod 

```
kubectl exec -it nginx-deployment-5bcb96d5d7-stfx5 -c debug -- bash
bash-5.0# which tcpdump
/usr/sbin/tcpdump
bash-5.0# curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
```
