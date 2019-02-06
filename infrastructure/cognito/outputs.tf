output "cognito_pool" {
    value = "${aws_cognito_user_pool.pool.id}"
}

output "cognito_pool_client" {
    value = "${aws_cognito_user_pool_client.pool_client.id}"
}

output "cognito_pool_arn" {
    value = "${aws_cognito_user_pool.pool.arn}"
}
