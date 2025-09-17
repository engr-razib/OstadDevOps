# Implementing Horizontal Pod Autoscaler (HPA) with Load Testing Using k6

## 📌 Assignment Title
Implementing Horizontal Pod Autoscaler (HPA) with Load Testing Using k6

---

## 🎯 Objective
The objective of this assignment is to:
- Deploy a sample application on Kubernetes
- Configure a **Horizontal Pod Autoscaler (HPA)**
- Generate traffic using **k6 load testing tool**
- Analyze the **auto-scaling behavior** of the application

---

## 🛠️ Steps to Perform

### 1. Deploy Metrics Server
- Install the **Metrics Server** to enable resource utilization monitoring in Kubernetes.
- This is required for HPA to gather CPU and memory metrics.

### 2. Deploy a Sample Application
- Create a sample application (e.g., NGINX, Node.js, or any HTTP service).
- Deploy it using Kubernetes Deployment and Service.

### 3. Configure Resource Requests and Limits
- Define **CPU and memory requests/limits** in the Deployment manifest.
- Example:
  ```yaml
  resources:
    requests:
      cpu: "100m"
      memory: "128Mi"
    limits:
      cpu: "500m"
      memory: "256Mi"

4. Create a Horizontal Pod Autoscaler (HPA)

Configure HPA to scale pods based on CPU utilization (or other metrics).

Example:

kubectl autoscale deployment my-app --cpu-percent=50 --min=1 --max=10

5. Install and Configure k6

Install k6 on your local machine or use a containerized version.

Verify installation:

k6 version

6. Write a k6 Load Testing Script

Example script.js:

import http from 'k6/http';
import { sleep } from 'k6';

export let options = {
  vus: 10,
  duration: '30s',
};

export default function () {
  http.get('http://<your-service-endpoint>');
  sleep(1);
}

7. Run the k6 Load Test

Execute the load test:

k6 run script.js

8. Monitor HPA Behavior

Check the scaling status:

kubectl get hpa
kubectl get pods -w

9. Observe Scaling

Watch how pods scale up during heavy load.

Observe how pods scale down once traffic decreases.

📊 Expected Outcome

The application should automatically scale up pods when CPU utilization increases due to load.

After the load test finishes, the HPA should gradually scale down the pods to save resources.