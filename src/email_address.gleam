import gleam/option.{Option, Some, None}
import gleam/regex

pub opaque type T {
  EmailAddress(String)
}

// create with continuation
pub fn create_with_cont(success, failure, s: String) {
  let Ok(re) = regex.from_string("^.+$")
  case regex.check(with: re, content: s) {
    True -> success(EmailAddress(s))
    False -> failure("Email address must contain an @ sign")
  }
}

// create directly
pub fn create(s: String) -> Option(T) {
  let success = fn(e) { Some(e) }
  let failure = fn(_msg) { None }
  create_with_cont(success, failure, s)
}

pub fn id(value) {
  value
}

// unwrap directly with continuation
pub fn apply(e: T, f) {
  let EmailAddress(e) = e
  f(e)
}

// unwrap directly
pub fn value(e: T) -> String {
  apply(e, id)
}
