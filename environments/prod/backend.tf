terraform {
  backend "s3" {
    bucket       = "tc-terraform-bucket"
    key          = "serverless/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
}