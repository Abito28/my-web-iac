terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}
provider "aws" {
  region = "ap-northeast-1"
}

terraform {
 backend "s3" {
  bucket = "my-s3-4-web-iac-292967571286-ap-northeast-1-an"
  region = "ap-northeast-1"
  key    = "terraform.tfstate"
 }
}