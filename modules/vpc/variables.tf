variable "vpc_cidr" {
  type        = string
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "subnet" {
  type = map(object({
    cidr_block        = string
    availability_zone = string
    public            = bool
  }))

  default = {
    public_a = {
      cidr_block        = "10.0.1.0/24"
      availability_zone = "ap-northeast-1a"
      public            = true
    }

    public_c = {
      cidr_block        = "10.0.2.0/24"
      availability_zone = "ap-northeast-1c"
      public            = true
    }

    private_a = {
      cidr_block        = "10.0.11.0/24"
      availability_zone = "ap-northeast-1a"
      public            = false
    }

    private_c = {
      cidr_block        = "10.0.12.0/24"
      availability_zone = "ap-northeast-1c"
      public            = false
    }
  }
}