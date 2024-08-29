terraform {
  backend "s3" {
    bucket         = "techwhisper-ami-snapshot-ebs-volume-inventory"
    key            = "file/create-s3.tfstate"
    region         = "ap-south-1"
  }
}
