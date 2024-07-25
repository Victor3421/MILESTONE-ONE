methods::setClass("Policyholder",
                  slots = c(id = "numeric", name = "character", email = "character", is_active = "logical", products = "list", payments = "list"),
                  prototype = list(id = NA_real_, name = NA_character_, email = NA_character_, is_active = TRUE, products = list(), payments = list())
)

methods::setMethod("initialize", "Policyholder",
                   function(.Object, id, name, email) {
                     .Object@id <- id
                     .Object@name <- name
                     .Object@email <- email
                     .Object@is_active <- TRUE
                     .Object@products <- list()
                     .Object@payments <- list()
                     .Object
                   }
)

methods::setGeneric("register_product", function(object, product) standardGeneric("register_product"))
methods::setMethod("register_product", "Policyholder",
                   function(object, product) {
                     if (object@is_active) {
                       object@products[[length(object@products) + 1]] <- product
                       cat(sprintf("Product %s registered for %s.\n", product@name, object@name))
                     } else {
                       cat(sprintf("Cannot register product for suspended policyholder %s.\n", object@name))
                     }
                   }
)

methods::setGeneric("suspend", function(object) standardGeneric("suspend"))
methods::setMethod("suspend", "Policyholder",
                   function(object) {
                     object@is_active <- FALSE
                     cat(sprintf("Policyholder %s has been suspended.\n", object@name))
                   }
)

methods::setGeneric("reactivate", function(object) standardGeneric("reactivate"))
methods::setMethod("reactivate", "Policyholder",
                   function(object) {
                     object@is_active <- TRUE
                     cat(sprintf("Policyholder %s has been reactivated.\n", object@name))
                   }
)

methods::setGeneric("add_payment", function(object, payment) standardGeneric("add_payment"))
methods::setMethod("add_payment", "Policyholder",
                   function(object, payment) {
                     object@payments[[length(object@payments) + 1]] <- payment
                     cat(sprintf("Payment of %f added for %s.\n", payment@amount, object@name))
                   }
)

methods::setGeneric("display_account_details", function(object) standardGeneric("display_account_details"))
methods::setMethod("display_account_details", "Policyholder",
                   function(object) {
                     cat(sprintf("Policyholder: %s\n", object@name))
                     cat(sprintf("Email: %s\n", object@email))
                     cat(sprintf("Active: %s\n", object@is_active))
                     cat("Products: ", sapply(object@products, function(p) p@name), "\n")
                     cat("Payments: ", sapply(object@payments, function(p) p@amount), "\n")
                   }
)
