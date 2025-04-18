In process..

## Folders Structure:
```
static_website/
│── terraform/            # Infrastructure as Code (IaC)
│   ├── static-site-s3/   # Static site module
│   │   ├──  s3.tf
│   │   ├──  iam.tf
│   │   ├──  variables.tf
│   │   └──  outputs.tf   
│   ├── terraform.tf      # Root terraform file
│   └── terraform.tfvars  # Variables to be defined during runtime
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
2. **AWS S3 Bucket** with **Terraform**:
- Create the S3 bucket to host the static website. 

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
    Default region name [None]: <us-west-2>
    Default output format [None]:
    ```
3. **AWS S3 Bucket**:
- Enter to the **Terraform** folder:
    ```
    $ cd static_website/terraform
    ```
- Initialize Terraform:
    ```
    $ terraform init
    ```
- Run **terraform** files with a globally unique bucket name:
    ```
    $ terraform apply -var="bucket_name=<my-static-site-bucket>"
    ```

    