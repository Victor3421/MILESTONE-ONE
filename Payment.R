methods::setClass("Payment",
                  slots = c(id = "numeric", policyholder_id = "numeric", amount = "numeric", date = "character"),
                  prototype = list(id = NA_real_, policyholder_id = NA_real_, amount = NA_real_, date = NA_character_)
)

methods::setMethod("initialize", "Payment",
                   function(.Object, id, policyholder_id, amount, date) {
                     .Object@id <- id
                     .Object@policyholder_id <- policyholder_id
                     .Object@amount <- amount
                     .Object@date <- date
                     .Object
                   }
)

methods::setGeneric("process_payment", function(object) standardGeneric("process_payment"))
methods::setMethod("process_payment", "Payment",
                   function(object) {
                     cat(sprintf("Processing payment of %f for policyholder %d.\n", object@amount, object@policyholder_id))
                   }
)

methods::setGeneric("send_reminder", function(object) standardGeneric("send_reminder"))
methods::setMethod("send_reminder", "Payment",
                   function(object) {
                     cat(sprintf("Sending payment reminder for policyholder %d.\n", object@policyholder_id))
                   }
)

methods::setGeneric("apply_penalty", function(object, penalty_amount) standardGeneric("apply_penalty"))
methods::setMethod("apply_penalty", "Payment",
                   function(object, penalty_amount) {
                     object@amount <- object@amount + penalty_amount
                     cat(sprintf("Penalty of %f applied. New amount is %f.\n", penalty_amount, object@amount))
                   }
)
