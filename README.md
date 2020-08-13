### Build the image
`docker build -t kindlab .`  

### Running in Docker standalone (without K8s)
```bash
docker run \
    -p 3300:3300 \
    -p 9229:9229 \
    kindlab
```

### Running with Kind (Kubernetes)
**first you need to create and start a cluster**  
```bash
chmod +x cluster-kind.bash
./cluster-kind.bash
```
this will create a cluster and start a docker registry  
**you need to install nginx for ingress**  
`kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/static/provider/kind/deploy.yaml`  
**now you need to deploy the image into kubernetes**  
`kubectl apply -f kindlab-deployments.yml` 

### Testing the application
```bash
curl -i \
    -X POST \
    -d '{"valor1": "120", "valor2": "10"}' \
    http://localhost:3300
```



### Restarting docker service  
`service docker restart`  


### Opening a shell when a Pod has more than one container  
`kubectl exec -i -t my-pod --container main-app -- /bin/bash`  

### Running individual commands in a container  
```bash
kubectl exec shell-demo env
kubectl exec shell-demo -- ps aux
kubectl exec shell-demo -- ls /
kubectl exec shell-demo -- cat /proc/1/mounts
```

_____


cluster kind
https://gist.github.com/danilobatistaqueiroz/6f1ad7f6ae20344d1e425cd2c6a47807

https://gist.github.com/danilobatistaqueiroz/a028ebd08b1def84727756c11a2053b6

cluster-kind.bashcluster-kind.bash
https://gist.github.com/danilobatistaqueiroz/d844b8d87fe33fdf176f506b60ac3fb6

https://tortuemat.gitlab.io/blog/2018/03/18/kubernetes-with-local-registry/
