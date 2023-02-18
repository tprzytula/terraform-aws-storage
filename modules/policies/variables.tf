variable "random_name" {
  description = "Random string to add to names for this environment."
  type        = string
}

variable "dynamodb_items_arn" {
  type = string
}

variable "lambda_functions" {
  type = map(object({
    iam_role_name : string
  }))
}
