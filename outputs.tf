# Define your outputs here
output "repository_url" {
  value = github_repository.repo.full_name
}
