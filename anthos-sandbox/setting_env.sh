#!/bin/bash
 
echo "======================================="
echo "Startup Minikube"

minikube -p sandbox delete && minikube -p sandbox start --kubernetes-version=v1.29.12 \
--cpus=4 \
--memory=8g \
--bootstrapper=kubeadm \
--extra-config=kubelet.authentication-token-webhook=true \
--extra-config=kubelet.authorization-mode=Webhook \
--extra-config=scheduler.bind-address=0.0.0.0 \
--extra-config=controller-manager.bind-address=0.0.0.0 \
--extra-config=kubeadm.pod-network-cidr=192.168.0.0/16



echo "======================================="
echo "Add the bitnami helm chart" 
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update

echo "======================================="
echo "Deploying Spring Cloud Data Flow"

BASE=$(pwd)

kubectl create ns scdf-system
helm install scdf bitnami/spring-cloud-dataflow -n scdf-system \
    --set server.service.type=LoadBalancer \
    --set server.service.loadBalancerIP=${ingress} \
    --set server.ingress.enabled=true \
    --set server.ingress.server.host=scdf.${ingress}.xip.io