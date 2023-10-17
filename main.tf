terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.49.2"
    }
  }
}

resource "tfe_team" "admin" {
  name         = "admin"
  organization = "diana-viktorova"
}
resource "tfe_project" "test" {
  name         = "Default"
  organization = "diana-viktorova"
}
resource "tfe_team_project_access" "admin" {
  access       = "read"
  team_id      = tfe_team.admin.id
  project_id   = tfe_project.test.id
}
