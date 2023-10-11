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

resource "tfe_team" "dev" {
  name         = "my-dev-team"
  organization = "my-org-name"
}

resource "tfe_project" "test" {
  name         = "myproject"
  organization = "my-org-name"
}

resource "tfe_team_project_access" "custom" {
  access       = "custom"
  team_id      = tfe_team.dev.id
  project_id   = tfe_project.test.id

  project_access {
    settings = "read"
    teams    = "none"
  }
  workspace_access {
    state_versions = "write"
    sentinel_mocks = "none"
    runs           = "apply"
    variables      = "write"
    create         = true
    locking        = true
    move           = false
    delete         = false
    run_tasks      = false
  }
}
