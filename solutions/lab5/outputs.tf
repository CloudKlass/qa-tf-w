output "Function_App_Name" {
  description = "Name of the App."

  value = azurerm_function_app.lab5function.name
}

output "Function_Name" {
  description = "Name of the function."

  value = azurerm_function_app_function.lab5fafx.name
}