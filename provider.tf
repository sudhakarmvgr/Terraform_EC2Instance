provider "aws" {
  region = "ap-southeast-2"
}


terraform {
  backend "s3" {
    bucket         = "teki123"
    key            = "local.tfstate"
    region         = "ap-southeast-2"
  }
}
