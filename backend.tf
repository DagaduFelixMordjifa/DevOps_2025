terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "env/dev/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "your-lock-table"
  }
}
