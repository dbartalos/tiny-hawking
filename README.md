# tiny-hawking [![Build Status](https://travis-ci.org/dbartalos/tiny-hawking.svg?branch=master)](https://travis-ci.org/dbartalos/tiny-hawking)

## Github

https://github.com/StephenGrider/DockerCasts

## Udemy link

https://www.udemy.com/docker-and-kubernetes-the-complete-guide/

## Start / Stop minikube

```shell
minikube start
minikube stop
```

## Apply changes example

```shell
kubectl apply -f simplek8s/client-pod.yaml
```

## Getting details of objects example

```shell
kubectl describe pod client-pod
```

### Deleting a resource example

```shell
kubectl delete -f simplek8s/client-pod.yaml
```

### Imperative image update example

```shell
docker build -t dbartalos/multi-client:v5 .
docker push dbartalos/multi-client:v5
kubectl set image deployment/client-deployment client=dbartalos/multi-client:v5
```

### Temprorarly reconfigure docker to look into Kubernetes (current terminal window)

```shell
eval $(minikube docker-env)
```

### Checking minikube ip

```shell
minikube ip
```

### Apply multiple config files

```shell
kubectl apply -f k8s
```

### Creating a secret (E.g.: PGPASSWORD)

```shell
kubectl create secret genericd pgpassword --from-literal PGPASSWORD=somepassword
```

### Ingress Nginx

https://github.com/kubernetes/ingress-nginx
https://www.joyfulbikeshedding.com/blog/2018-03-26-studying-the-kubernetes-ingress-system.html