# Timeoff-management application CI/CD pipeline

<br>
<p align="center">
Architecture Diagram
<br>
<br>

<img src="https://user-images.githubusercontent.com/36462985/222253330-7151db25-6585-4262-9b1f-e9f2849e5229.png" width="640">
</p>

The Timeoff-management application is accessible at [https://venisso.com](https://venisso.com). Any attempt to access it using an http address is automatically redirected to https, thereby ensuring secure communication between the client and the application server. The application is highly available and load balanced in two availability zones.
</p>


<h3> Technology Stack </h3>
<p>
The pipeline, fully automated from code change to deployment, is implemented in AWS utilizing various open sources tools. The following is a list of the tools employed:
</p>

__GitHub__ serves as the source code management repository <br> __Jenkins__ implements CI/CD pipeline <br> __Ansible__ packages the application into a docker image and uploads it to Docker Hub <br> __Docker/Docker Hub__ containerizes the applicaiton into a Docker image and stores it in a repository <br> __Kubernetes__ runs application containers <br> __eksctl__ is used to create the Kubernetes cluster <br> __kubectl__ is used to manage the Kubernetes cluster <br> __AWS Certificate Manager__ issues public certificate for SSL/TLS encryption <br> __Terraform__ is used to provision AWS resrouces

<h3> Workflow </h3>
<p>
  Whenever there is a code change pushed to the GitHub repository, it triggers a Jenkins CI job. This job then copies the complete application onto the Ansible server and runs an Ansible playbook to containerize it into a Docker image. It then uploads the image to a Docker Hub repository. Once the CI job is completed successfully, the CD job starts.

  The CD job runs Kubernetes manifest scripts to create a deployment and a service on the Kubernetes cluster, which consists of three nodes distributed across three different availability zones. The deployment is designed to facilitate rolling updates while ensuring at least one healthy node is maintained at all times, resulting in zero downtime.
  
  The network connection between a client's browser and the application server is made secure through the provision of SSL/TLS certificates by AWS.
</p>

<h3> IAC </h3>
<p>
  While Terraform scripts can provision EC2 instances in the default VPC with necessary packages installed, some tasks such as creating Jenkins jobs, configuring authentication between instances, and deploying Ansible and Kubernetes scripts need to be completed manually.
</p>
