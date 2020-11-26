import contact
import gleam/should

pub fn contact_test() {
  let contact = contact.Contact(
    first_name: "Bob",
    middle_initial: "J",
    last_name: "Snith",

    email_address: "bob@example.com",
    is_email_verified: False,

    address_1: "7 Henley Cresent",
    address_2: "Apt 2",
    city: "Los Angeles",
    state: "CA",
    zip: "90100",
    is_address_valid: True
  )

  contact.first_name |> should.equal("Bob")
}
