output "public" {
  value = aws_subnet.public-subnet.id
}

output "private" {
  value = aws_subnet.private-subnet.id
}
