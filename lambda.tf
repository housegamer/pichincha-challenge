resource "aws_lambda_function" "lambda_func_App" {
  filename = "app.py"
	function_name = "Lambda-func App"
	role = ""
	handler = "lambda_function.handler"
	runtime = "python3.8"
	source_code_hash = filebase64sha256("app.py")
}