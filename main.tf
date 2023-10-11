terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.49.2"
    }
  }
}

provider "tfe" {
  # Configuration options
}

resource "tfe_team" "admin" {
  name         = "my-admin-team"
  organization = "diana-viktorova"
}

resource "tfe_project" "test" {
  name         = "myproject"
  organization = "diana-viktorova"
}

resource "tfe_team_project_access" "admin" {
  access       = "admin"
  team_id      = tfe_team.admin.id
  project_id   = tfe_project.test.id
}
