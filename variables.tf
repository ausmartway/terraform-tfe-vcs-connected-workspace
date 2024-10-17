# Define your variables in here.
variable "tfc_oauth_token" {
  type        = string
  description = "TFC/E oauth id"
}

variable "github_owner" {
  type        = string
  default     = "ausmartway"
  description = "the owner of the template repository, this can be github orgnization name."
}

variable "template_repo" {
  type        = string
  default     = "terraform-template"
  description = "the name of the template repository"
}

variable "name" {
  type        = string
  description = "Name of the workspace, this will also be used as the name of the github.com repository."
}

variable "workspace_description" {
  type        = string
  description = "The description of workspace"
}

variable "terraform_version" {
  type        = string
  description = "The version of Terraform CLI,eg, 1.0.7"
}

variable "tags" {
  type        = list(string)
  default     = []
  description = "list of tags that should be added to workspace"
}

variable "organization" {
  type        = string
  description = "TFC/E orgnization name"
}

variable "vcsbranch" {
  type        = string
  description = "The branch of the repository"
  default     = ""
}

variable "vcsworkingdirectory" {
  type        = string
  description = "The root directory of Terraform code in the repository"
  default     = ""
}