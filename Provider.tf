terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.67.0"
    }
  }
}

provider "aws" { 
  # Configuration options 
  region ="eu-central-1"
  access_key = "access_key"
  secret_key = "secret_key"

}
