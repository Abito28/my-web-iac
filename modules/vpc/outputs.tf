output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}

output "public_subnet_ids" {
  description = "The ID of the public subnet"
  value = [
    for key, subnet in aws_subnet.subnet : subnet.id
    if var.subnet[key].public == true
  ]
}