#!/bin/bash

echo "=============================="
echo " Uninstalling Minikube"
echo "=============================="

# Stop and delete Minikube cluster (if exists)
if command -v minikube >/dev/null 2>&1; then
    echo "[INFO] Stopping Minikube..."
    minikube stop || true

    echo "[INFO] Deleting Minikube cluster..."
    minikube delete || true
else
    echo "[INFO] Minikube not found, skipping stop/delete"
fi

# Remove Minikube binary
echo "[INFO] Removing Minikube binary..."
sudo rm -f /usr/local/bin/minikube

# Remove Minikube directories
echo "[INFO] Removing Minikube config and cache..."
rm -rf ~/.minikube
rm -rf ~/.kube

# Optional: remove kubectl
echo "[INFO] Removing kubectl (if installed manually)..."
sudo rm -f /usr/local/bin/kubectl

echo "=============================="
echo " Minikube uninstallation done"
echo "=============================="
