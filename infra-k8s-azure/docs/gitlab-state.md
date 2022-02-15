## Storing Remote Terraform State in GitLab
Terraform State is undoubtedly the hardest part of creating a shared environment where teams can work on the same sets of resources without causing headaches for each other. 

The state file ensures that Terraform knows what it is responsible for and the current condition of these resources. Because terraform is idempotent, meaning that it will only update resources that have changed and leave other items alone, it needs to track changes to any and all resources.  The json file used for this keeps track of anything that terraform has done and should almost never be edited manually - trust me, things break.

Because the state file is so sensitive and can cause damage or undue changes to managed infrastructure keeping it in source control is generally not recommended, though possible through the use of remote backend providers.

GitLab has included integrations for terraform that aid in the management of state by allowing it to exist in the repository for the terraform code.  This document outlines what is needed to configure the remote backend and a couple of gotchas to watch for.

### Configuration
In your terraform.tf file for a project you will specify any and all provider(s) and remote backend information needed. The providers outline which resources types/items you will be creating and backend(s) specify where the precious state file lives.

The setup looks something like this

```
terraform {
    backend "http" {
      
    }
  required_providers {
      azurerm = {
          source = "hashicorp/azurerm"
          version = "2.81.0"
      }
  }
}


provider "azurerm" {
    features {}

 #subscription chosen inside of workspace in terraform cloud    
}
```
Inside the terraform block backend is included to explain that terraform should use an http endpoint for state storage.  How this gets configured is discussed below.

The provider(s) used will each have an item in required_providers that names them, calls out where they are sourced, and their version. 

The version tells terraform which provider to use, and allows the providers themselves to be iterated just like any other code.

The provider block allows configuration of the chosen provider. In the case of azurerm, a features block is required, but does not need anything specific called out.

**Note:** Subscriptions can be assigned in the configuration of the azurerm provider, however - since the file is in source control and subscription ids might be considered sensitive - I would avoid it. 

Once the backend has been set to use http terraform knows there will be other information coming.
```
backend "http" {

}
```

### Configuring the backend
To use GitLab for remote state you will need to configure the following items:

- address=: the URL of the API for the projects state file. 
- lock_address=: the url of the api for the state file with the lock endpoint appended
- unlock_address=: the url of the api for the state file with the lock endpoint appended
- username=: your gitlab username should be used for this 
- password:= a project token should be used for this 
- lock_method=: the post API method, used to lock the state during use
- unlock_method=: the DELETE API method, used to unlock the state file 
- retry_wait_min=:  the number of minutes to wait for a retry

You will need to know the project id for the project containing the terraform code. You can find it on the general settings page of the repository in GitLab.

An example config can be seen below:
```
address="https://gitlab.zywave.com/api/v4/projects/{ProjectID}/terraform/state/{repo name}"
lock_address="https://gitlab.zywave.com/api/v4/projects/4040/terraform/state/infra-k8s-azure/lock"
unlock_address="https://gitlab.zywave.com/api/v4/projects/4040/terraform/state/infra-k8s-azure/lock"
username="your gitlab username should be used for this" 
password= "a project token should be used for this" 
lock_method="POST"
unlock_method="DELETE"
retry_wait_min=5
```

Because the URLs are specific to a repository and project I would recommend leveraging a variable to store these items or replace them with the correct values on execution.

The username and password values can also be handled this way - the password is a project level API token generated in GitLab - this should only require the API scope when creating the token. More about creating an access token can be [found here](https://docs.gitlab.com/ee/user/project/settings/project_access_tokens.html#project-access-tokens).

In creating this document, I created a backend.config file within the terraform project directory to house the username and password values for local use. **This file was added to gitignore and not stored in source control!**

To use the backend.config file when running terraform commands append it to the command line:

terraform init --backend-config "./backend.conf"
terraform plan --backend-config "./backend.conf"
terraform apply --backend-config "./backend.conf"


If you are so inclined, you can also pass all of the values above at the command line directly, but that is a lot of typing so I do not use that method... ever. An example is below:

```
terraform init \
    -backend-config="address=https://gitlab.com/api/v4/projects/<YOUR-PROJECT-ID>/terraform/state/<YOUR-STATE-NAME>" \
    -backend-config="lock_address=https://gitlab.com/api/v4/projects/<YOUR-PROJECT-ID>/terraform/state/<YOUR-STATE-NAME>/lock" \
    -backend-config="unlock_address=https://gitlab.com/api/v4/projects/<YOUR-PROJECT-ID>/terraform/state/<YOUR-STATE-NAME>/lock" \
    -backend-config="username=<YOUR-USERNAME>" \
    -backend-config="password=<YOUR-ACCESS-TOKEN>" \
    -backend-config="lock_method=POST" \
    -backend-config="unlock_method=DELETE" \
    -backend-config="retry_wait_min=5"
```

To initially get off the ground with remote state in GitLab works much like other remote state solutions and is pretty straight forward. As we use more terraform, additional items will be documented to help ease understanding and point out any pitfalls encountered along the way.

**Remember - sensitive values are stored in the state file, the remote copy of state is encrypted within the repository, but may appear on your local machine as a json file.**