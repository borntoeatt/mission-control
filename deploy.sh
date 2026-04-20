#!/bin/bash
set -e

IMAGE="dimitar6768/mission-control:latest"

echo "==> Building image..."
docker build -t "$IMAGE" .

echo "==> Pushing to Docker Hub..."
docker push "$IMAGE"

echo "==> Deploying to k3s..."
kubectl apply -f k8s.yaml

echo "==> Waiting for rollout..."
kubectl rollout status deployment/mission-control -n mission-control

echo "==> Done! Check:"
echo "    kubectl get pods -n mission-control"
echo "    kubectl get ingress -n mission-control"
echo ""
echo "Update the Ingress host in k8s.yaml to match your domain."
echo "For quick local access:  kubectl port-forward -n mission-control svc/mission-control 8080:80"
