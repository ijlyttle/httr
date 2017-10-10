oauth2.0_error_codes <- c(
  400,
  401
)

oauth2.0_errors <- c(
  "invalid_request",
  "invalid_client",
  "invalid_grant",
  "unauthorized_client",
  "unsupported_grant_type",
  "invalid_scope"
)

# This implements error checking according to the OAuth2.0
# specification: https://tools.ietf.org/html/rfc6749#section-5.2
known_oauth2.0_error <- function(response) {
  if (status_code(response) %in% oauth2.0_error_codes) {
    content <- content(response)
    print(content$error)
    if (content$error %in% oauth2.0_errors) {
      return(TRUE)
    }
  }
  FALSE
}
