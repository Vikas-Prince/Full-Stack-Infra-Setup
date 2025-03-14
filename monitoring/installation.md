# **Prometheus Federation Setup for Multi-Cluster EKS**

## **Overview**
This guide provides a detailed step-by-step setup of **Prometheus Federation** for a multi-cluster **EKS** environment. The **staging cluster** will serve as the central monitoring hub, collecting metrics from the **prod cluster** using Prometheus Federation.

## **Architecture**
- **Staging Cluster (Hub)** → Runs **Prometheus, Grafana, and Alertmanager** for centralized monitoring.
- **Prod Cluster (Spoke)** → Exposes **kube-state-metrics & node-exporter** for Prometheus in **staging** to scrape.
- **Prometheus Federation** → Staging pulls metrics from **prod** using `additionalScrapeConfigs`.

---

## **Step 1: Set Up Helm Repository**
📌 **Execute on Local Machine** (where `kubectl` is configured)  
📌 **Why?** Helm repositories must be added before installation.

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

---

## **Step 2: Deploy Kube State Metrics & Node Exporter on Prod Cluster**
📌 **Execute on Prod Cluster**  
📌 **Why?** These components expose Kubernetes metrics for Prometheus in `staging` to scrape.

### **Switch to Prod Cluster**
```sh
kubectl config use-context <prod-cluster-context>
```

### **Install Kube-State-Metrics & Node Exporter**
```sh
helm upgrade --install kube-metrics prometheus-community/kube-state-metrics -n monitoring --create-namespace
helm upgrade --install node-exporter prometheus-community/prometheus-node-exporter -n monitoring
```

---

## **Step 3: Deploy Prometheus on Staging Cluster**
📌 **Execute on Staging Cluster**  
📌 **Why?** This is the centralized Prometheus that scrapes metrics from `prod`.

### **Switch to Staging Cluster**
```sh
kubectl config use-context <staging-cluster-context>
```

### **Create Prometheus Values File (`prometheus-values.yaml`)**
📌 **Where to create the file?** On local machine (where `kubectl` is configured)

```bash
prometheus:
  prometheusSpec:
    additionalScrapeConfigs:
      - job_name: "prod-cluster"
        honor_labels: true
        kubernetes_sd_configs:
          - role: endpoints
            namespaces:
              names: ["monitoring"]
        relabel_configs:
          - source_labels: [__meta_kubernetes_namespace, __meta_kubernetes_service_name]
            action: keep
            regex: monitoring;kube-state-metrics
```

### **Deploy Prometheus Using Helm**
```sh
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring --create-namespace \
  -f prometheus-values.yaml
```

### **Expose Prometheus Server Using Ingress**
Instead of using a LoadBalancer, expose Prometheus using **Ingress**. The Ingress rule is defined separately in the `ingress-monitoring.yaml` file.

```sh
kubectl apply -f ingress-monitoring.yaml
```

---

## **Step 4: Deploy Grafana & Configure Dashboards**
📌 **Execute on Staging Cluster**  
📌 **Why?** Grafana queries Prometheus in `staging` for multi-cluster metrics.

### **Expose Grafana Using Ingress**
The Ingress rule is defined in `ingress-monitoring.yaml`.

```sh
kubectl apply -f ingress-monitoring.yaml
```

### **Access Grafana**
👀 **Open in browser:**  
```bash
http://<your-ingress-domain>/grafana
```
(Default username: `admin`, Password: `prom-operator`)

---

## **Step 5: Deploy Alertmanager with Gmail SMTP**
📌 **Execute on Staging Cluster**  
📌 **Why?** Alertmanager will handle alerts from all clusters and send notifications via **Gmail SMTP**.

### **Modify Prometheus Values File (`prometheus-values.yaml`)**
```bash
alertmanager:
  alertmanagerSpec:
    externalUrl: "http://alertmanager.monitoring.svc:9093"
    route:
      receiver: "email"
    receivers:
      - name: "email"
        email_configs:
          - to: "your-email@gmail.com"
            from: "your-gmail@gmail.com"
            smarthost: "smtp.gmail.com:587"
            auth_username: "your-gmail@gmail.com"
            auth_identity: "your-gmail@gmail.com"
            auth_password: "your-app-password"
            send_resolved: true
```

### **Apply Alertmanager Configuration**
```sh
helm upgrade --install prometheus prometheus-community/kube-prometheus-stack \
  -n monitoring -f prometheus-values.yaml
```

### **Expose Alertmanager Using Ingress**
```sh
kubectl apply -f ingress-monitoring.yaml
```

---

## **Testing & Validation**
### **Test Prometheus Federation in Grafana**
1️⃣ **Open Grafana and run queries:**
```sh
up{ job="prod-cluster" }
```
2️⃣ **Check Prometheus targets:**
```sh
http://<your-ingress-domain>/prometheus/targets
```
3️⃣ **Verify Alerts in Alertmanager:**
```sh
http://<your-ingress-domain>/alertmanager
```

---

## **Conclusion**
🔹 **Prod cluster** exposes metrics via **kube-state-metrics & node-exporter**.  
🔹 **Staging cluster** runs **Prometheus, Grafana, and Alertmanager**.  
🔹 **Prometheus Federation** pulls metrics from **prod**.  
🔹 **Grafana dashboards** provide centralized monitoring.  
🔹 **Alertmanager in staging** handles all alerts using **Gmail SMTP**.  
🔹 **Ingress** is used for exposing Prometheus, Grafana, and Alertmanager instead of LoadBalancer.  

This setup ensures **efficient, scalable, and centralized monitoring** across multiple Kubernetes clusters. 🚀

