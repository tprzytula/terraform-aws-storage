locals {
  root_directory        = "modules/lambda"
  source_root_directory = format("%s/sources", local.root_directory)
  output_root_directory = format("%s/archives", local.root_directory)

  lambda_functions = {
    "add_item" = {
      source_dir  = format("%s/add_item", local.source_root_directory)
      output_path = format("%s/add_item.zip", local.output_root_directory)
    }
  }
}
