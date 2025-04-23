# 📦 Static Website Hosting with AWS S3 & Terraform
This project demonstrates how to host a fully static website on **Amazon S3**, using **Terraform** to automate the infrastructure setup and **AWS CLI**/**Jenkins** to streamline deployment.

## Folders Structure:
```
static_website/
│── aws/                  # AWS CLI scripts
│   └── s3_upload.sh 
│── terraform/            # Infrastructure as Code (IaC)
│   ├── static-site-s3/   # Module
│   │   ├──  s3.tf
│   │   └──  variables.tf   
│   ├── terraform.tf      # Root terraform file
│   ├── terraform.tfvars  # Variables to be defined automatically during runtime
│   ├── variables.tf
│   └── outputs.tf      
└── web/                  # All website content
    ├── css/
    │   └── style.css     
    ├── js/
    │   └── script.js   
    └── templates/
        ├── about.html 
        ├── contact.html 
        └── index.html    
```

## Creation Steps:
1. **Website**:
    - Create a basic static website (**HTML, CSS, and JavaScript**).
    - To check that the static website works locally before uploading it to **AWS S3**, click [here](https://github.com/LuciaHeredia/cloud-hosted-site-terraform/blob/master/static_website/web/README.md).
2. **AWS S3 Bucket** creation with **Terraform**:
    - Create the **S3 bucket** to host the static website.
    - Set appropriate permissions to allow public access to the files.
    - Set a globally unique *bucket name* and *region* inside *.tfvars* file.
3. **AWS S3 Bucket** deployment:
    #### Option 1: with **AWS CLI** script
    - Upload the static website files to the **S3 bucket**.
    #### Option 2: with **Jenkins**
    - TODO
## How to use:
1. Clone this project.
2. **AWS Configuration**:
    - Login with *IAM user* credentials (*access/secret key*) and configure default *region* name:
        ```
        $ aws configure
        ```
        ```
        AWS Access Key ID [None]: <accesskey>
        AWS Secret Access Key [None]: <secretkey>
        Default region name [None]: <region>
        Default output format [None]:
        ```
3. **AWS S3 Bucket** creation with **Terraform**:
    - Go to the **Terraform** folder:
        ```
        $ cd static_website/terraform
        ```
    - Initialize and Plan **Terraform**:
        ```
        $ terraform init
        $ terraform plan
        ```
    - Apply **Terraform**:
        ```
        $ terraform apply
        ```
    - (optional) To remove the **S3** module run:
        ```
        $ terraform state list | grep module
        $ terraform state rm module.<module_name>
        ```
4. **AWS S3 Bucket** deployment:
    #### Option 1: with **AWS CLI** script
    - Run **AWS CLI** script to upload the web files to the **S3 bucket**:
        ```
        $ cd ..
        $ chmod +x aws/s3_deploy.sh     # Give permission to execute
        $ ./aws/s3_deploy.sh            # run script
        ```
    #### Option 2: with **Jenkins**
    - TODO