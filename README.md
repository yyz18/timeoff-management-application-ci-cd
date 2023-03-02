# Timeoff-management application CI/CD

<br>
<br>
<p align="center">
Architecture Diagram
<br>
<img src="https://user-images.githubusercontent.com/36462985/222253330-7151db25-6585-4262-9b1f-e9f2849e5229.png" width="700">
</p>

The __Timeoff-management__ application is accessible at [https://venisso.com](https://venisso.com). Any attempt to access it using http address is automatically redirected to https, thereby ensuring secure communication between the client and the application server.
</p>

<h3> Technology Stack </h3>
The pipeline is implemented in AWS utilizing some open sources tools. The following is a list of the tools employed:
<br>
**GitHub** serves as the source code management repository 
<br>
**Jenkins** implements CI/CD pipeline <br>
**Ansible** packages the application into a docker image and uploads it to Docker Hub <br>
**Docker Hub** stores the application docker image <br>
**Kubernetes** runs application containers <br>
**eksctl** is used to create the Kubernetes cluster <br>
**kubectl** is used to manage the Kubernetes cluster <br>
**AWS** Certificate Manager issues public certificate for SSL/TLS encryption <br>

