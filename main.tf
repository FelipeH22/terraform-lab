variable "GITHUB_TOKEN"{
  type = string
}
variable "GH_USER"{
  type = string
}
terraform {
  required_providers {
    github = {
      source = "integrations/github"
      version = "~> 6.0"
    }
  }
}
# Configure the GitHub Provider
provider "github" {
  token = var.GITHUB_TOKEN
}
# Repo 
resource "github_repository" "example" {
  name        = "example"
  description = "My awesome codebase"

  visibility = "public"

  template {
    owner                = var.GH_USER
    repository           = "terraform_lab"
    include_all_branches = true
  }
}
# Branch 3
resource "github_branch" "branch3" {
  repository = "example"
  branch = "branch3"
}
# Branch 2
resource "github_branch" "branch2" {
  repository = "example"
  branch = "branch2"
}
# Branch 1
resource "github_branch" "branch1" {
  repository = "example"
  branch = "branch1"
}