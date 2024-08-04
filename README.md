
# Sample Kubernetes Application with Helm

This project demonstrates deploying a sample NGINX application on Kubernetes using Helm. It includes configurations for namespaces, ConfigMaps, Secrets, PersistentVolumes, PersistentVolumeClaims, Deployments, Services, and Ingress.

## Prerequisites

- Kubernetes cluster (e.g., EKS on AWS)
- Helm 3.x installed
- kubectl configured to communicate with your cluster

## Project Structure
k8s-project/
├── charts/
│   └── sample-app/
│       ├── Chart.yaml
│       ├── values.yaml
│       └── templates/
│           ├── deployment.yaml
│           ├── service.yaml
│           ├── ingress.yaml
│           ├── configmap.yaml
│           └── secret.yaml
├── .helmignore
└── README.md

## Configuration

The `values.yaml` file in the `sample-app` chart contains configurable parameters for the application. Modify this file to customize the deployment.

## Deployment

To deploy the application:

1. Navigate to the project root:

    ```bash
    cd k8s-project
    ```

2. Install the Helm chart:

    ```bash
    helm install sample-app ./charts/sample-app
    ```

3. To upgrade the release:

    ```bash
    helm upgrade sample-app ./charts/sample-app
    ```

## Accessing the Application

After deployment, you can access the application using the LoadBalancer URL:

1. Get the external IP of the service:

    ```bash
    kubectl get services -n sample-app
    ```

2. Access the application in your browser using the EXTERNAL-IP of the `sample-app-service`.

## Components

- **Namespace**: A dedicated namespace `sample-app` is created for the application.
- **ConfigMap**: The `app-config` ConfigMap contains configuration data for the application.
- **Secret**: The `app-secret` Secret stores sensitive data such as passwords.
- **PersistentVolume and PersistentVolumeClaim**: A PersistentVolume `app-pv` and a PersistentVolumeClaim `app-pvc` are configured to provide persistent storage for the application.
- **Deployment**: The `sample-app` Deployment manages the NGINX pods.
- **Service**: The `sample-app-service` Service exposes the NGINX pods and provides load balancing.
- **Ingress**: The `sample-app-ingress` Ingress resource manages external access to the application.

## Troubleshooting

If you encounter issues:

- Check pod status:

    ```bash
    kubectl get pods -n sample-app
    ```

- View pod logs:

    ```bash
    kubectl logs <pod-name> -n sample-app
    ```

- Describe the pod for more details:

    ```bash
    kubectl describe pod <pod-name> -n sample-app
    ```

- Check the service and endpoints:

    ```bash
    kubectl get services -n sample-app
    kubectl get endpoints sample-app-service -n sample-app
    ```

- Verify the node status:

    ```bash
    kubectl describe nodes
    ```

## Cleanup

To remove the application:

```bash
helm uninstall sample-app

