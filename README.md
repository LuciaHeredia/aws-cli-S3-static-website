In process..

## Folders Structure:
```
static_website/
│── aws/                  # # AWS CLI scripts
│   ├── init.sh           
│   └── policy.json       
│── terraform/            # Infrastructure as Code (IaC)
│   ├── main.tf           
│   ├── variables.tf      
│   ├── outputs.tf         
│   └── provider.tf       
└── web/                  # All website content
    ├── static/
    │   └── style.css     # CSS style
    ├── templates/
    │   └── index.html    # HTML for visualization
    └──  app.py           # Main Flask app
```
