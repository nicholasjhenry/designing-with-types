import core

pub type PersonalName {
  PersonalName(
    first_name: String,
    middle_initial: core.Option(String),
    last_name: String
  )
}

pub type EmailContactInfo {
  EmailContactInfo(
    email_address: String,
    is_email_verified: Bool
  )
}

pub type PostalAddress {
  PostalAddress(
    address1: String,
    address2: String,
    city: String,
    state: String,
    zip: String
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
