# Timeoff-management application CI/CD

<br>
<br>
<p align="center">
Architecture Diagram
<br>
<br>
<img src="https://user-images.githubusercontent.com/36462985/222253330-7151db25-6585-4262-9b1f-e9f2849e5229.png" width="700">
</p>

The imeoff-management application is accessible at [https://venisso.com](https://venisso.com). Any attempt to access it using http address is automatically redirected to https, thereby ensuring secure communication between the client and the application server.
</p>

<h3> Technology Stack </h3>
The pipeline is implemented in AWS utilizing some open sources tools. The following is a list of the tools employed:

__GitHub__ serves as the source code management repository 

<br>

__Jenkins__ implements CI/CD pipeline 

<br>

__Ansible__ packages the application into a docker image and uploads it to Docker Hub 

<br>

__Docker Hub__ stores the application docker image 

<br>

__Kubernetes__ runs application containers 

<br>

__eksctl__ is used to create the Kubernetes cluster 

<br>

__kubectl__ is used to manage the Kubernetes cluster 
__AWS__ Certificate Manager issues public certificate for SSL/TLS encryption <br>

