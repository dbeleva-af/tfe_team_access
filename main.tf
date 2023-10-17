terraform {
  required_providers {
    tfe = {
      source = "hashicorp/tfe"
      version = "0.44.1"
    }
  }
}

resource "tfe_team" "admin" {
  name         = "my-admin-teamtest"
  organization = "diana-new"
}
resource "tfe_project" "test" {
  name         = "myprojectTEST1"
  organization = "diana-new"
}
# resource "tfe_team_project_access" "admin" {
#   access       = "read"
#   team_id      = tfe_team.admin.id
#   project_id   = tfe_project.test.id
# }

