resource "aws_s3_bucket" "statefile_bucket" {
    bucket = "talacademy-so1-tflab-bucket"
    tags = {
        Name = "TA-so1-tflab-bucket"
        Environment = "Lab"
    }

    lifecycle {
        prevent_destroy = true
    }
}

resource "aws_s3_bucket_versioning" "version_my_bucket" {
    bucket = aws_s3_bucket.statefile_bucket.id

    versioning_configuration {
        status = "Enabled"
    }
}