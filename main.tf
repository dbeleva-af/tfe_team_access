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

resource "tfe_team" "Dev-Team" {
  name         = "my-admin-team"
  organization = "diana-viktorova"
}

resource "tfe_project" "No-Code" {
  name         = "myproject"
  organization = "diana-viktorova"
}

resource "tfe_team_project_access" "admin" {
  access       = "custom"
  team_id      = tfe_team.Dev-Team.id
  project_id   = tfe_project.No-Code.id

  project_access {
    settings = "read"
    teams    = "read"
  }
}
