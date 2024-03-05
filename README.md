# AWS With Terraform

## What Is Cloud Computing
[Cloud Computing](https://aws.amazon.com/es/what-is-cloud-computing/) is the on-demand supply of computing power, database storage, applications, and other IT resources through a cloud services platform with pay-as-you-go pricing. You can provision exactly the type and size of computing resources you need. You can access as many resources as you need, almost instantly. It's an easy way to access servers, storage, databases, and a set of application services. Amazon Web Services (AWS) owns and maintains the hardware connected to the network necessary for these application services, while you provision and use what you need through a web application.
### Benefits of cloud computing
**Agility:**

* Access to a wide range of technologies to innovate faster.
* Rapid resource provisioning from basic infrastructure to IoT, machine learning, and analytics.
* Service deployment in minutes and rapid transformation of ideas into solutions.
* Freedom to experiment with new ideas that enhance customer experience and transform the business.

**Elasticity:**

* Resource provisioning only when needed, without the need for upfront investments.
* Instant scalability to increase or decrease capacity according to business needs.
* Cost optimization by paying only for the resources used.

**Cost savings:**

* Replacement of fixed data center costs with variable cloud costs.
* Economies of scale that significantly reduce IT costs.

**Global deployment:**

* Reach new regions and launch global solutions in minutes.
* Infrastructure distributed worldwide for lower latency and better user experience.

**In summary, the cloud offers agility to innovate, elasticity to adapt to changing needs, and significant cost savings. It also allows for rapid global deployment of applications and solutions.**

## What is AWS?

[AWS](https://docs.aws.amazon.com/es_es/whitepapers/latest/aws-overview/introduction.htm), or Amazon Web Services, is a cloud computing platform that offers a wide range of services to businesses and organizations of all types. These services range from basic infrastructure such as computing, storage, and networking, to more advanced tools such as artificial intelligence, data analysis, application development, and much more.

## What is Infrastructure as Code
[Infrastructure as Code](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-a) (IaC) is the practice of managing and provisioning infrastructure through code rather than manual processes. It involves creating configuration files that specify infrastructure details, making it easier to edit, distribute, and ensure consistent environments. IaC helps in configuration management, avoids ad-hoc changes, and supports version control like software code. By automating infrastructure provisioning, developers can focus on application development without manually managing servers, operating systems, and storage each time. IaC allows for modular infrastructure components that can be combined through automation. There are two approaches to IaC: declarative and imperative, with declarative being more common for automatically configuring desired infrastructure states. Without IaC, managing modern infrastructure complexities becomes challenging. IaC offers benefits like cost reduction, faster deployments, error reduction, improved consistency, and elimination of configuration drift.

**DevOps and CI/CD Integration:**
IaC plays a crucial role in DevOps practices and continuous integration/continuous delivery (CI/CD) by automating infrastructure provisioning and ensuring consistency between development and operations teams.

**Alignment with DevOps Best Practices:**
IaC aligns development and operations teams by providing a consistent deployment process for all environments, supporting a DevOps approach. It ensures reproducible production environments and applies CI/CD principles to infrastructure.

In summary, Infrastructure as Code revolutionizes infrastructure management by automating provisioning through code, enhancing consistency, reducing errors, and aligning with modern DevOps practices.

## What is Terraform
[Terraform](https://www.terraform.io/) is an [Infrastructure as Code](https://www.redhat.com/en/topics/automation/what-is-infrastructure-as-code-a) (IaC) tool that allows you to create, modify and delete infrastructure automatically.

[Terraform](https://www.terraform.io/) can manage resources from different cloud service providers, such as AWS, Google Cloud, Azure, etc.

## Basic commands
### Initialize the working directory
First of all you have to download the necessary plugins from the provider specified in the configuration file.
```
terraform init
```

### Formatting and validating the configuration file
Terraform provides a command to format the configuration file to make it more readable. Some of the tasks this command performs are, adjust indentation, sort the arguments of the configuration blocks, etc.
```
terraform fmt
```
To validate the syntax of the configuration file we can use the following command.
```
terraform validate
```
### Show the changes to be made
Compares the configuration in the Terraform file with the one that currently exists in the infrastructure provider and shows the actions that need to be performed to achieve the desired configuration. Allows the user to verify the changes before applying them to the provider.
```
terraform plan
```

### Apply changes
Creates the configuration file resources in your AWS account.
```
terraform apply
```
If we want to create the resources without having to type `yes` to confirm the command execution, we can use the `-auto-approve option`.
```
terraform apply -auto-aprove
```
### Delete resources
Delete the resources indicated in the provider.
```
terraform destroy
```