##main.tf
resource "github_repository" "repo" {
  name        = var.name
  description = "Github repository for TFC workspace ${var.name}"

  visibility = "private"

  template {
    owner      = var.github_owner
    repository = var.template_repo
    include_all_branches = true
  }
}

resource "tfe_workspace" "workspace" {
  description           = var.workspace_description
  allow_destroy_plan    = true
  auto_apply            = true
  file_triggers_enabled = false
  # global_remote_state   = false         # This is a deprecated attribute from tfe provider 0.61.0

  name = var.name

  organization                  = var.organization
  queue_all_runs                = true
  speculative_enabled           = true
  structured_run_output_enabled = true
  tag_names                     = var.tags
  terraform_version             = var.terraform_version
  trigger_prefixes              = []
  working_directory             = var.vcsworkingdirectory
  vcs_repo {
    identifier         = github_repository.repo.full_name
    ingress_submodules = false
    oauth_token_id     = var.tfc_oauth_token
    branch             = var.vcsbranch
  }

  lifecycle {
    ignore_changes = [
      # Ignore changes to tags, e.g. because a management agent
      # updates these based on some ruleset managed elsewhere.
      # agent_pool_id,
      # execution_mode,
    ]
  }
}