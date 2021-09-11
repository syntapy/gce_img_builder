Overview
========
Automated GCE image build pipeline with Google Cloud Build triggers using Terraform and Packer

There are two source repos to be hosted on Google Cloud Repository:
 - Packer image builder in `repos/packer` to allow running packer in cloud build
 - The GCE image builder in `repos/machine_image` which uses packer

The terraform configs will also creates the project as well

To Run
======

Needs an organization level account (google workspace account) and works with the following roles assigned to the account terraform uses (`gcloud auth application-default login`)
 - roles/billing.creator
 - roles/resourcemanager.organizationAdmin
 - roles/resourcemanager.projectCreator
 - roles/storage.admin

You may need to run `terraform apply` twice, since I think a service acount gets created on first run for a project

You will get the output URLs for the two google source repositories

Then cd into `repos/packer/` and run `git add remote google <packer_build_repo>` and push

A build should be triggered as indicated by `gcloud builds list`

Once thats done go into `repos/machine_image` and run `git add remote google <machine_image_repo` and push

This should trigger machine image build which you can use in a GCE instance (heres a [terraform config for GCE server](https://github.com/syntapy/gce_server) you can use)
