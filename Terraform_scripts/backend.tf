terraform {
  backend "s3" {
    bucket  = "vikas-multi-env-bucket"
    key     = "full_stack_infra/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}