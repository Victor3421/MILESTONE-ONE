methods::setClass("Product",
                  slots = c(id = "numeric", name = "character", premium = "numeric", is_active = "logical"),
                  prototype = list(id = NA_real_, name = NA_character_, premium = NA_real_, is_active = TRUE)
)

methods::setMethod("initialize", "Product",
                   function(.Object, id, name, premium) {
                     .Object@id <- id
                     .Object@name <- name
                     .Object@premium <- premium
                     .Object@is_active <- TRUE
                     .Object
                   }
)

methods::setGeneric("update_product", function(object, name = NULL, premium = NULL) standardGeneric("update_product"))
methods::setMethod("update_product", "Product",
                   function(object, name = NULL, premium = NULL) {
                     if (!is.null(name)) object@name <- name
                     if (!is.null(premium)) object@premium <- premium
                     cat(sprintf("Product %d updated.\n", object@id))
                   }
)

methods::setGeneric("suspend_product", function(object) standardGeneric("suspend_product"))
methods::setMethod("suspend_product", "Product",
                   function(object) {
                     object@is_active <- FALSE
                     cat(sprintf("Product %s has been suspended.\n", object@name))
                   }
)

methods::setGeneric("reactivate_product", function(object) standardGeneric("reactivate_product"))
methods::setMethod("reactivate_product", "Product",
                   function(object) {
                     object@is_active <- TRUE
                     cat(sprintf("Product %s has been reactivated.\n", object@name))
                   }
)
