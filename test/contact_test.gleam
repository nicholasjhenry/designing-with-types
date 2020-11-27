import contact
import gleam/option
import gleam/should

pub fn contact_test() {
  let new_contact = contact.Contact(
      name: contact.PersonalName(
        first_name: "Bob",
        middle_initial: option.None,
        last_name: "Smith"
      ),
      email_contact_info: contact.EmailContactInfo(
        email_address: contact.EmailAddress("bob@example.com"),
        is_email_verified: False
      ),
      postal_contact_info: contact.PostalContactInfo(
        address: contact.PostalAddress(
          address1: "7 Henley Cresent",
          address2: "Apt 2",
          city: "Los Angeles",
          state: contact.StateCode("CA"),
          zip: contact.ZipCode("90100")
        ),
        is_address_valid: True
      )
    )

  new_contact.name.first_name |> should.equal("Bob")
  let expected_email_address = contact.EmailAddress("bob@example.com")
  new_contact.email_contact_info.email_address |> should.equal(expected_email_address)

  let contact.EmailAddress(unwrapped_email_address) = expected_email_address
  unwrapped_email_address |> should.equal("bob@example.com")
}

pub fn create_email_address_test() {
  let expected_email_address = option.Some(contact.EmailAddress("bob@example.com"))
  contact.create_email_address("bob@example.com") |> should.equal(expected_email_address)

  contact.create_email_address("") |> should.equal(option.None)
}

pub fn create_state_code_test() {
  let expected_state_code = option.Some(contact.StateCode("CA"))
  contact.create_state_code("CA") |> should.equal(expected_state_code)

  contact.create_state_code("NC") |> should.equal(option.None)
}
