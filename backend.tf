terraform {
  backend "s3" {
    bucket         = "dags25042025"
    key            = "terraform/state.tfstate"
    region         = "us-west-2"  # ✅ Make sure this matches the actual region
    encrypt        = true
    dynamodb_table = "terraform-locks" # optional but recommended
  }
}
