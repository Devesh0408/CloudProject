/*data "archive_file" "lambda_function" {
  type        = "zip"
  output_path = "${path.module}/lambda_function.zip"
  source {
    content  = <<EOF
def lambda_handler(event, context):
    return {
        'statusCode': 200,
        'body': 'Hello from Lambda!'
    }
EOF
    filename = "lambda_function.py"
  }
}

resource "aws_iam_role" "lambda_execution_role" {
  name = "lambda-execution-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "lambda_basic_execution_policy" {
  role       = aws_iam_role.lambda_execution_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

resource "aws_lambda_function" "hello_lambda" {
  function_name    = "hello-lambda"
  description      = "Hello Lambda function"
  runtime          = "python3.8"
  handler          = "lambda_function.lambda_handler"
  timeout          = 10
  memory_size      = 128
  role             = aws_iam_role.lambda_execution_role.arn
  source_code_hash = data.archive_file.lambda_function.output_base64sha256

  environment {
    variables = {
      PARAMETER_NAME = "parameter-value"
    }
  }
}
*/