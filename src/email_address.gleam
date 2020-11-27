import gleam/option.{Option, Some, None}
import gleam/regex

pub opaque type T {
  EmailAddress(String)
}

pub fn create(s: String) -> Option(T) {
  let Ok(re) = regex.from_string("^.+$")
  case regex.check(with: re, content: s) {
    True -> Some(EmailAddress(s))
    False -> None
  }
}

pub fn value(e: T) -> String {
  let EmailAddress(e) = e
  e
}
