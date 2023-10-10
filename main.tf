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
  name         = "Dev-Team"
  organization = "diana-viktorova"
}

resource "tfe_project" "No-Code" {
  name         = "No-Code"
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
