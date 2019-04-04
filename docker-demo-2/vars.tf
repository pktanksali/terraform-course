variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "us-east-1"
}
variable "PATH_TO_PRIVATE_KEY" {
  default = "prasadkey"
}
variable "PATH_TO_PUBLIC_KEY" {
  default = "prasadkey.pub"
}
variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}
variable "ECS_AMIS" {
  type = "map"
  default = {
    us-east-1 = "ami-007571470797b8ffa"
    us-west-2 = "ami-56ed4936"
    eu-west-1 = "ami-c8337dbb"
  }
}
# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html
