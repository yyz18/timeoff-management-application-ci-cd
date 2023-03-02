# Timeoff-management application CI/CD

<br>
<p align="center">
<img src="https://user-images.githubusercontent.com/36462985/222253330-7151db25-6585-4262-9b1f-e9f2849e5229.png" width="700">
</p>

<h5 align="center"> Architecture Diagram </h5>
<br>

<p>
The Timeoff-management application is accessible at [https://venisso.com](https://venisso.com). Any attempt to access it using http address is automatically redirected to https, thereby ensuring secure communication between the client and the application server.
</p>

<h3> Technology Stack </h3>
The pipeline is implemented in AWS utilizing some open sources tools. The following is a list of the tools employed:

**GitHub** serves as the source code management repository
Jenkins implements CI/CD pipeline
Ansible packages the application into a docker image and uploads it to Docker Hub
Docker Hub stores the application docker image
Kubernetes runs application containers
eksctl is used to create the Kubernetes cluster
kubectl is used to manage the Kubernetes cluster
AWS Certificate Manager issues public certificate for SSL/TLS encryption

