# Setting Up NGINX Ingress Controller for ArgoCD & Monitoring Stack

This guide will walk you through installing the **NGINX Ingress Controller** and setting up routing for **ArgoCD and the Monitoring stack (Prometheus, Alertmanager, Grafana)**.

## 1. Install NGINX Ingress Controller

### **Using Helm (Recommended)**

Ensure you have Helm installed. If not, install it first:

```bash
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

Now, add the **Ingress NGINX Helm repo**:

```bash
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo update
```

Then, install the NGINX Ingress Controller:

```bash
helm install ingress-nginx ingress-nginx/ingress-nginx \
  --namespace monitoring \
  --set controller.service.type=LoadBalancer
```

This will install the **Ingress Controller** and expose it as a LoadBalancer service.

---

## 2. Verify Installation

Check if the NGINX Ingress Controller is running:

```bash
kubectl get pods -n monitoring
```

Check the **LoadBalancer IP**:

```bash
kubectl get svc -n monitoring
```

You should see an external IP assigned to `ingress-nginx-controller`.

---

## 3. Configure DNS Resolution

If you are not using a DNS provider, manually add an entry to `/etc/hosts`:

```bash
<YOUR_INGRESS_CONTROLLER_IP> argocd.example.com prometheus.example.com alertmanager.example.com grafana.example.com
```

Replace `<YOUR_INGRESS_CONTROLLER_IP>` with the external IP of your **Ingress Controller**.

---

## 4. Deploy the Ingress Rules

Now that the **Ingress Controller** is running, apply the **Ingress rules**. Refer to the separate Ingress file:

```bash
kubectl apply -f monitoring-argocd-ingress.yaml
```

This will route traffic to **ArgoCD and Monitoring services**.

---

## 5. Access the Services

Once everything is set up, you can access your services via:
- **ArgoCD** → `http://argocd.example.com`
- **Prometheus** → `http://prometheus.example.com`
- **Alertmanager** → `http://alertmanager.example.com`
- **Grafana** → `http://grafana.example.com`


---

## Conclusion

You have successfully set up **NGINX Ingress Controller** and routed traffic for ArgoCD and Monitoring. Ensure that the Ingress rules are applied and DNS is correctly configured to access the services. 🚀

