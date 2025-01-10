##Add your terraform core and provider version constrains here.
terraform {
  required_version = ">= 1.0"
  required_providers {
    tfe = ">= 0.59.0"
    github = {
      source  = "integrations/github"
      version = ">= 6.3.1"
    }
  }
}

