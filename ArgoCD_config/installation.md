# ArgoCD Hub-Spoke Model Setup Guide

## ✅ Step 1: Install ArgoCD on the Hub Cluster

**Install `kubectl` (Kubernetes CLI)**

To install `kubectl` on Amazon Linux:

```bash
curl -LO "https://dl.k8s.io/release/v1.24.6/bin/linux/amd64/kubectl"
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
```

Let’s assume the staging cluster is the hub. First, switch context to the staging cluster:

```bash
aws eks update-kubeconfig --region <region> --name staging-cluster
```

### 1.1: Add the ArgoCD Helm Repository

```bash
helm repo add argo https://argoproj.github.io/argo-helm
helm repo update

```

### 1.2: Create a Namespace for ArgoCD
```bash
kubectl create namespace argocd
```

### 1.3: Install ArgoCD using Helm
```bash
helm install argocd argo/argo-cd -n argocd
```

### 1.4: Verify Installation
Check if all pods are running:
```bash
kubectl get pods -n argocd
```
Expected Output

```bash
NAME                                               READY   STATUS    RESTARTS   AGE
argocd-application-controller-5d6f7c9d89-vk9p6     1/1     Running   0          1m
argocd-dex-server-7d6b8d7f86-89c6l                 1/1     Running   0          1m
argocd-redis-7fd7f69b9b-5m7gj                      1/1     Running   0          1m
argocd-repo-server-8c9f98fd7-rm2d5                 1/1     Running   0          1m
argocd-server-6bbf8c8d7-k7jxr                      1/1     Running   0          1m
```

## 🔧 Step 2: Expose ArgoCD via LoadBalancer
By default, ArgoCD runs as a ClusterIP service. To access it externally, change it to a LoadBalancer.

### 2.1: Patch the ArgoCD Service

```bash
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
```

### 2.2: Get the External DNS
```bash
kubectl get svc -n argocd
```
Look for argocd-server:

```bash
NAME                 TYPE           CLUSTER-IP       EXTERNAL-IP    
argocd-server        LoadBalancer   10.100.200.21     < DNS >        
```

## 🔐 Step 3: Retrieve ArgoCD Admin Password
### Get the Initial Admin Password
```bash
kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d
```
Save this password for the first login.

## 🌍 Step 4: Add Spoke Clusters to ArgoCD

### 4.1 **Install `ArgoCD CLI`**
To install the ArgoCD CLI, run the following commands:

```bash
curl -sSL -o /tmp/argocd https://github.com/argoproj/argo-cd/releases/download/v2.6.3/argocd-linux-amd64
chmod +x /tmp/argocd
sudo mv /tmp/argocd /usr/local/bin/argocd
```

### 4.2 Login to ArgoCD via CLI

Use the ArgoCD CLI to log in:

```bash
argocd login <ARGOCD_SERVER_IP> --username admin --password <initial-admin-password>
```
Replace `<ARGOCD_SERVER_IP>` with the External IP of the ArgoCD server obtained in

- **ARGOCD_SERVER_IP**: The external IP or domain name of the ArgoCD server.
- **initial-admin-password**: The password you retrieved in the previous step.

Now, add prod clusters to the hub cluster (staging).

### 4.3: Get Dev and Prod cluster contexts
```bash
kubectl config get-contexts
```

### 4.4 Register Spoke Clusters in ArgoCD
```bash
argocd cluster add <prod-context-name> <argoCD-server-url>
```

### 4.5: Verify the Clusters Are Added
```bash
argocd cluster list
```
Expected Output
```bash
SERVER                          NAME         STATUS
https://staging-cluster         in-cluster   Successful
https://prod-cluster            prod-cluster Successful
```

## Step5: Automate Sync via GitHub Webhook

To automate synchronization of your applications with GitHub, set up a webhook in your GitHub repository:

1. Go to your **GitHub Repo** → **Settings** → **Webhooks**.

2. Add a new webhook with the following details:

   - **Payload URL**: `http://<ARGOCD_SERVER_IP>/api/webhook`
   - **Content type**: `application/json`
   - **Secret**: `<your-secret>`
   - **Trigger**: Push events

---

## 🎯 Conclusion

- **Staging cluster** = Hub (Runs ArgoCD)
- **Prod clusters** = Spokes (Managed by ArgoCD)
- Applications sync via GitOps (Changes pushed to Git trigger deployments)






