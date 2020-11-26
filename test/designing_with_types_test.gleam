import designing_with_types
import gleam/should

pub fn hello_world_test() {
  designing_with_types.hello_world()
  |> should.equal("Hello, from designing_with_types!")
}
