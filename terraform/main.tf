provider "aws" {
  region = "us-east-1"
}

resource "aws_lambda_function" "status_api" {
  filename      = "lambda.zip"  # Ensure this path is correct
  function_name = "StatusAPI"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "main.lambda_handler"
  runtime       = "python3.9"
  source_code_hash = filebase64sha256("lambda.zip")  # Ensure this is updated when lambda.zip changes
}

resource "aws_iam_role" "lambda_exec" {
  name = "lambda_exec_role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = { Service = "lambda.amazonaws.com" }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}