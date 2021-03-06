import email_address
import gleam/io
import gleam/option.{None, Some}
import gleam/should

pub fn email_address_test() {
  let address1 = email_address.create("x@example.com")
  let address2 = email_address.create("")

  case address1 {
    Some(e) -> e |> email_address.value |> should.equal("x@example.com")
    None -> None |> should.equal(None)
  }

  case address2 {
    Some(e) -> e |> email_address.value |> should.equal("x@example.com")
    None -> None |> should.equal(None)
  }

  let Some(address) = address1
  let assertion = fn(s) { s |> should.equal("x@example.com") }
  address |> email_address.apply(assertion)
}
