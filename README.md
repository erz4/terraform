
## commands
Initialize tf project, check & download plugins for all the .tf files in the repo
```terraform
terraform init 
```

Generates plan that indicated which action tf will perform, what for 'yes' to deploy
```
# deploy .tf files, wait for 'yes' to deploy
terraform apply
# by plan file
terraform apply <filename>
# auto approve
terraform apply -auto-approve
# pass a variable
terraform apply -var="<var_name>=<var_value>" / -var-file=<filename>
```

Generates an execution plan for tf
```
# whats needs to deploy, -out generate non-human-readable file
terraform plan -out=<filename>
# whats going to destroy
terraform plan -destroy
```

Reads and outputs a tf state or plan file
```
# output state
terraform show
# output file plan
terraform show <filename>
```

```
# list all resources created by tf
terraform state list
# describe resource
terraform state show <resource_name>
```

Outputs the visual execution graph of tf resources at DOT format
[web visual tool](http://www.webgraphviz.com/)
```
terraform graph <dir>
```

Destroy Terraform-managed infrastructure.
```
terraform destroy
```

## tf style
[tf style doc](https://www.terraform.io/docs/configuration/style.html)
* identation: 2 spaces
* single meta-arguments first
* block meta-arguments last
* blank line between diffrent code type
* group single arguments together
* line up the equal signs
* resource name: snake_case