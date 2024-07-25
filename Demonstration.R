tryCatch({
  # Create products
  product1 <- new("Product", id = 1, name = "Health Insurance", premium = 500)
  product2 <- new("Product", id = 2, name = "Life Insurance", premium = 1000)
  cat("Products created successfully\n")
  
  # Create policyholders
  policyholder1 <- new("Policyholder", id = 1, name = "Victor George Dardoe", email = "victorgeorgedardoe@gmail.com")
  policyholder2 <- new("Policyholder", id = 2, name = "Joana Philomina Ddardoe", email = "jdardoe@gmail.com")
  cat("Policyholders created successfully\n")
  
  # Register products to policyholders
  register_product(policyholder1, product1)
  register_product(policyholder2, product2)
  cat("Products registered to policyholders successfully\n")
  
  # Create and add payments
  payment1 <- new("Payment", id = 1, policyholder_id = 1, amount = 500, date = "2023-07-01")
  payment2 <- new("Payment", id = 2, policyholder_id = 2, amount = 1000, date = "2023-07-01")
  add_payment(policyholder1, payment1)
  add_payment(policyholder2, payment2)66
  cat("Payments added to policyholders successfully\n")
  
  # Display account details
  display_account_details(policyholder1)
  display_account_details(policyholder2)
}, error = function(e) {
  cat(sprintf("An error occurred: %s\n", e$message))
})
