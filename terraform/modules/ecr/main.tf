locals {
  repositories = ["frontend", "backend"]
}

resource "aws_ecr_repository" "app" {
  for_each = toset(local.repositories)

  name                 = "${var.name}-${each.key}"
  image_tag_mutability = "IMMUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }

  encryption_configuration {
    encryption_type = "AES256"
  }
}
