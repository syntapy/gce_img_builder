output "project_name" {
  value = module.project.name
}

output "project_id" {
  value = local.project_id
}

output "project_number" {
  value = module.project.number
}

output "packer_build_repo" {
  value = module.build.packer_build_repo
}

output "machine_image_repo" {
  value = module.build.machine_image_repo
}
