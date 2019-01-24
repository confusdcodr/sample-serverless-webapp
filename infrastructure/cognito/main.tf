provider "aws" {
  region  = "us-east-1"
  version = "~> 1.56"
}

variable "cognito_pool" {
  type    = "string"
  default = "notes-cognito-pool"
}

variable "webapp_name" {
  type    = "string"
  default = "notes-webapp"
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

  # Remove this in and enable below for email addresses
  alias_attributes = ["email"]

  # This alters the signin to use email as opposed to usernames
  #username_attributes = ["email"] 
  auto_verified_attributes = ["email"]

  # This adds required standard attributes. 
  # Terraform doesn't seem to support required customer attributes
  #schema {
  #  name                = "email"
  #  required            = true
  #  attribute_data_type = "String"
  #  mutable             = false
  #}

  #schema {
  #  name                = "family_name"
  #  required            = true
  #  attribute_data_type = "String"
  #  mutable             = false

  #  string_attribute_constraints {
  #    min_length = 7
  #    max_length = 15
  #  }
  #}

  verification_message_template {
    default_email_option = "CONFIRM_WITH_CODE"
  }

  tags {  
    Project = "gowens-serverless"
  }
}

# App Client allows your webapp to call your user pool
resource "aws_cognito_user_pool_client" "pool_client" {
  name = "${var.webapp_name}"

  user_pool_id = "${aws_cognito_user_pool.pool.id}"
}
