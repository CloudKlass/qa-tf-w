resource "azurerm_function_app_function" "lab5fafx" {  #defines the function code to be deployed to our function APP
  name            = "httptrigger"
  function_app_id = azurerm_function_app.lab5function.id
  language        = "Python"
  

  file {
    name    = "http_invoke.py"
    content = file("./http_invoke.py")
  }
    config_json = jsonencode({
      "bindings": [
    {
      "authLevel": "function",
      "type": "httpTrigger",
      "direction": "in",
      "name": "req",
      "methods": [
        "get",
        "post"
      ]
    },
    {
      "type": "http",
      "direction": "out",
      "name": "$return"
    }
  ] 
  })
}