import core
import contact
import gleam/should

pub fn contact_test() {
  let contact = contact.Contact(
      name: contact.PersonalName(
        first_name: "Bob",
        middle_initial: core.None,
        last_name: "Smith"
      ),
      email_contact_info: contact.EmailContactInfo(
        email_address: "bob@example.com",
        is_email_verified: False
      ),
      postal_contact_info: contact.PostalContactInfo(
        address: contact.PostalAddress(
          address1: "7 Henley Cresent",
          address2: "Apt 2",
          city: "Los Angeles",
          state: "CA",
          zip: "90100"
        ),
        is_address_valid: True
      )
    )

  contact.name.first_name |> should.equal("Bob")
}

