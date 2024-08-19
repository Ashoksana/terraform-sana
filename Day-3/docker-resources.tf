# Build the Docker image from a Dockerfile
resource "docker_image" "terraform_image" {  # Changed the hyphen to an underscore for consistency
  name         = "terraform-image:latest"
  build {
    context    = "${path.module}/Day-3"
    dockerfile = "${path.module}/Dockerfile"
  }
}

# Create a Docker container using the built image
resource "docker_container" "terraform_container" {
  image = docker_image.terraform_image.image_id 
  name  = "terraform-container"
  ports {
    internal = 80
    external = 8001
  }
}
