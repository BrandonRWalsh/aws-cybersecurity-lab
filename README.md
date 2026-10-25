# AWS Cybersecurity Lab with Terraform



## Project Overview



This project documents my first hands-on experience with Amazon Web Services (AWS) and Terraform. I manually created a cloud network consisting of a Virtual Private Cloud (VPC), public and private subnets, an Internet Gateway, routing configurations, and a Security Group.



I then used Terraform to write infrastructure configurations, import my existing AWS resources, and verify that the code matched the deployed infrastructure. The purpose of this project is to develop practical skills in cloud networking, infrastructure as code, and cybersecurity.



## Network Architecture



The infrastructure was deployed in the AWS Ohio region (`us-east-2`) using the following configuration:



| Component | Configuration |

|---|---|

| VPC | `10.10.0.0/16` |

| Public Subnet | `10.10.1.0/24` |

| Private Subnet | `10.10.2.0/24` |

| Availability Zone | `us-east-2a` |

| Internet Gateway | Attached to the VPC |

| Public Route Table | `0.0.0.0/0` routes to the Internet Gateway |

| Security Group | No inbound rules; all outbound IPv4 traffic permitted |



The private subnet has no direct route to the internet. The public subnet uses a route table associated with the Internet Gateway. No compute instances have been deployed as part of this project.



## Security Considerations



### Network Segmentation

The VPC contains separate public and private subnets. The private subnet does not have a default route to the internet, reducing direct internet exposure for resources deployed within it.



### Firewall Configuration

An AWS Security Group was created with no inbound rules, blocking new incoming connections by default. The existing outbound rule allows all IPv4 traffic.



### Infrastructure as Code

Terraform was used to import and manage the existing AWS infrastructure. Running `terraform plan` allowed configuration differences to be identified before making changes, helping prevent accidental resource modifications or deletion.



### Future Security Improvements

\- Restrict outbound traffic according to the principle of least privilege.

\- Deploy test instances and associate the Security Group to verify traffic restrictions.

\- Enable network logging and monitoring.

\- Expand infrastructure across multiple Availability Zones for improved resilience.



## Tools and Technologies



\- \*\*Amazon Web Services (AWS):\*\* Created and configured cloud networking infrastructure.

\- \*\*Terraform:\*\* Wrote Infrastructure as Code (IaC) configurations and imported existing AWS resources.

\- \*\*AWS CLI:\*\* Inspected cloud resources and verified their configurations.

\- \*\*Git:\*\* Tracked changes to infrastructure code.

\- \*\*GitHub:\*\* Repository for documenting and showcasing the project.

\- \*\*PowerShell:\*\* Executed Terraform, AWS CLI, and Git commands.



## Project Workflow



1\. Manually created networking infrastructure through the AWS Management Console.

2\. Wrote Terraform configurations to represent the existing infrastructure.

3\. Imported eight AWS resources into Terraform state.

4\. Used `terraform validate` to check configuration validity.

5\. Used `terraform plan` to identify configuration differences and avoid unintended changes.

6\. Verified that the final Terraform plan reported no changes.

7\. Used Git to track the configuration and prepare it for publication on GitHub.



\*\*Note:\*\* The AWS resources were originally created manually and subsequently imported into Terraform. They have not yet been deployed from scratch using Terraform.


