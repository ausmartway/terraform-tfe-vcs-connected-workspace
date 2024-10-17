run "valid_basic_unit_test" {
  variables {
    tfc_oauth_token       = "ot-yH9fUQEiw1MTAeo5" # this is not a secret, it is just a reference to the token in TFC
    github_owner          = "ausmartway"
    template_repo         = "terraform-template"
    name                  = "my-test-workspace-terraform-test"
    workspace_description = "test workspace description"
    terraform_version     = "1.9.8"
    tags                  = ["test"]
    organization          = "yulei"
    vcsbranch             = ""
    vcsworkingdirectory   = ""
  }

  command = apply
  assert {
    condition     = github_repository.repo.name == var.name
    error_message = "github repository name did not match expected"
  }

  assert {
    condition     = tfe_workspace.workspace.name == var.name
    error_message = "TFC/E workspace name did not match expected"
  }
}

run "delay_destroy_plan" {
  command = apply
  module {
    source  = "ausmartway/destroy-delay/time"
    version = "0.1.0"
  }

  variables {
    delay_seconds = 15
  }
}