docker build -t dbartalos/multi-client:latest -t dbartalos/multi-client:$SHA -f ./complex/client/Dockerfile ./complex/client
docker build -t dbartalos/multi-server:latest -t dbartalos/multi-server:$SHA -f ./complex/server/Dockerfile ./complex/server
docker build -t dbartalos/multi-worker:latest -t dbartalos/multi-worker:$SHA -f ./complex/worker/Dockerfile ./complex/worker

docker push dbartalos/multi-client:latest
docker push dbartalos/multi-server:latest
docker push dbartalos/multi-worker:latest

docker push dbartalos/multi-client:$SHA
docker push dbartalos/multi-server:$SHA
docker push dbartalos/multi-worker:$SHA

kubectl apply -f ./complex/k8s
kubectl set image deployments/server-deployment server=dbartalos/multi-server:$SHA
kubectl set image deployments/client-deployment client=dbartalos/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=dbartalos/multi-worker:$SHA