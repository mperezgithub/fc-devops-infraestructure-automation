provider "aws" {
  region                      = "us-east-1"
  access_key                  = "test"
  secret_key                  = "test"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_region_validation      = true

  endpoints {
    ec2             = "http://localhost:4566"
    eks             = "http://localhost:4566"
    cloudformation  = "http://localhost:4566"
    autoscaling     = "http://localhost:4566"
    iam             = "http://localhost:4566"
    s3              = "http://localhost:4566"
    elbv2           = "http://localhost:4566"
  }
}
