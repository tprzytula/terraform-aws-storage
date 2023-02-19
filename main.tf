module "random" {
  source = "./modules/random"
}

module "dynamodb" {
  source = "./modules/dynamodb"

  random_name = module.random.random_name
}

module "lambda" {
  source = "./modules/lambda"

  random_name              = module.random.random_name
}

module "api_gateway" {
  source = "./modules/api_gateway"

  random_name      = module.random.random_name
  lambda_functions = module.lambda.lambda_functions
}

module "policies" {
  source = "./modules/policies"

  random_name              = module.random.random_name
  lambda_functions         = module.lambda.lambda_functions
  dynamodb_items_arn       = module.dynamodb.items_arn
}

module "s3" {
  source = "./modules/s3"

  random_name              = module.random.random_name
}
