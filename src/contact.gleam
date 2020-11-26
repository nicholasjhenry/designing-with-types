import core

pub type PersonalName {
  PersonalName(
    first_name: String,
    middle_initial: core.Option(String),
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
