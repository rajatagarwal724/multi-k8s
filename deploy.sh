docker buiild -t agarwalrajat724/multi-client:latest -t agarwalrajat724/multi-client:$SHA -f ./client/Dockerfile.dev ./client
docker buiild -t agarwalrajat724/multi-server:latest -t agarwalrajat724/multi-server:$SHA -f ./server/Dockerfile.dev ./server
docker buiild -t agarwalrajat724/multi-worker:latest -t agarwalrajat724/multi-worker:$SHA -f ./worker/Dockerfile.dev ./worker

docker push agarwalrajat724/multi-client:latest
docker push agarwalrajat724/multi-client:$SHA
docker push agarwalrajat724/multi-server:latest
docker push agarwalrajat724/multi-server:$SHA
docker push agarwalrajat724/multi-worker:latest
docker push agarwalrajat724/multi-worker:$SHA

kubectl apply -f k8s

kubectl set image deployments/server-deployment server=agarwalrajat724/multi-server:$SHA

kubectl set image deployments/client-deployment client=agarwalrajat724/multi-client:$SHA

kubectl set image deployments/worker-deployment worker=agarwalrajat724/multi-worker:$SHA
