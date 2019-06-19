docker build -t maxipaolucci/fibonacci-client:latest -t maxipaolucci/fibonacci-client:$SHA -f ./client/Dockerfile ./client
docker build -t maxipaolucci/fibonacci-server:latest -t maxipaolucci/fibonacci-server:$SHA -f ./server/Dockerfile ./server
docker build -t maxipaolucci/fibonacci-worker:latest -t maxipaolucci/fibonacci-worker:$SHA -f ./worker/Dockerfile ./worker
# docker push just pushes and specific tag, so we need to do it twice to push all the tags
docker push maxipaolucci/fibonacci-client:latest
docker push maxipaolucci/fibonacci-server:latest
docker push maxipaolucci/fibonacci-worker:latest

docker push maxipaolucci/fibonacci-client:$SHA
docker push maxipaolucci/fibonacci-server:$SHA
docker push maxipaolucci/fibonacci-worker:$SHA

kubectl apply -f k8s
kubectl set image deployments/server-deployment server=maxipaolucci/fibonacci-server:$SHA
kubectl set image deployments/client-deployment client=maxipaolucci/fibonacci-client:$SHA
kubectl set image deployments/worker-deployment worker=maxipaolucci/fibonacci-worker:$SHA