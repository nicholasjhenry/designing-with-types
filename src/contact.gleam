import gleam/list
import gleam/option
import gleam/regex
import gleam/string

pub type PersonalName {
  PersonalName(
    first_name: String,
    middle_initial: option.Option(String),
    last_name: String
  )
}

pub type EmailAddress { EmailAddress(String) }

pub type EmailContactInfo {
  EmailContactInfo(
    email_address: EmailAddress,
    is_email_verified: Bool
  )
}

pub type ZipCode { ZipCode(String) }
pub type StateCode { StateCode(String) }

pub type PostalAddress {
  PostalAddress(
    address1: String,
    address2: String,
    city: String,
    state: StateCode,
    zip: ZipCode
  )
}

pub type PostalContactInfo {
  PostalContactInfo(
    address: PostalAddress,
    is_address_valid: Bool
  )
}

pub type Contact {
  Contact(
    name: PersonalName,
    email_contact_info: EmailContactInfo,
    postal_contact_info: PostalContactInfo
  )
}

pub fn create_email_address(s: String) -> option.Option(EmailAddress) {
  let Ok(re) = regex.from_string("^.+$")
  case regex.check(with: re, content: s) {
    True -> option.Some(EmailAddress(s))
    False -> option.None
  }
}

pub fn create_state_code(s: String) -> option.Option(StateCode) {
  let s = string.uppercase(s)
  let state_codes = ["AB", "CA", "NY"]
  case list.any(state_codes, fn(sc) {sc == s}) {
    True -> option.Some(StateCode("CA"))
    False -> option.None
  }
}
