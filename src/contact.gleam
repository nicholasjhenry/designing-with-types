pub type Contact {
  Contact(
    first_name: String,
    middle_initial: String,
    last_name: String,

    email_address: String,
    is_email_verified: Bool,

    address_1: String,
    address_2: String,
    city: String,
    state: String,
    zip: String,
    is_address_valid: Bool
  )
}
