docker build -t shandak/multi-client:latest -t shandak/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t shandak/multi-server:latest -t shandak/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t shandak/multi-worker:latest -t shandak/multi-worker:$SHA -f ./worker/Dockerfile ./worker

docker push shandak/multi-client:latest
docker push shandak/multi-server:latest
docker push shandak/multi-worker:latest

docker push shandak/multi-client:$SHA
docker push shandak/multi-server:$SHA
docker push shandak/multi-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=shandak/multi-server:$SHA
kubectl set image deployments/client-deployment server=shandak/multi-client:$SHA
kubectl set image deployments/worker-deployment server=shandak/multi-worker:$SHA