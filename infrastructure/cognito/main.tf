provider "aws" {
  region  = "us-east-1"
  version = "~> 1.56"
}

resource "aws_cognito_user_pool" "pool" {
  name = "${var.cognito_pool}"
 
  password_policy {
    minimum_length    = 8
    require_numbers   = true
    require_lowercase = true
    require_symbols   = true
    require_uppercase = true
  }

  username_attributes = ["email"] 
  auto_verified_attributes = ["email"]

  # This adds required standard attributes. 
  schema {
    name                = "email"
    required            = true
    attribute_data_type = "String"
    mutable             = false
  }

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }

  tags {  
    Name = "serverless-demo"
    Environment = "demo"
    Project = "serverless-demo"
  }
}

# App Client allows your webapp to call your user pool
resource "aws_cognito_user_pool_client" "pool_client" {
  name = "${var.webapp_name}"

  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}
