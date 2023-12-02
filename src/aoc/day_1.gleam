import simplifile
import gleam/list
import gleam/io
import gleam/int
import gleam/string
import gleam/option.{type Option, None, Some}
import gleam/result

pub fn main() {
  let assert Ok(contents) = simplifile.read("input/input-one.txt")
  let sum =
    string.split(contents, "\n")
    |> sum_all

  io.println("The sum is: " <> int.to_string(sum))
}

pub fn sum_all(items: List(String)) -> Int {
  items
  |> list.map(fn(line) {
    parse_line(line)
    |> option.unwrap(0)
  })
  |> list.fold(from: 0, with: fn(a, b) { a + b })
}

pub fn parse_line(line: String) -> Option(Int) {
  string.to_graphemes(line)
  |> list.filter(keeping: fn(v) {
    case v {
      "0" | "1" | "2" | "3" | "4" | "5" | "6" | "7" | "8" | "9" -> True
      _ -> False
    }
  })
  |> extract_first_last_pair
  |> string.concat
  |> int.parse
  |> fn(v) {
    case v {
      Ok(value) -> Some(value)
      Error(_) -> None
    }
  }
}

pub fn extract_first_last_pair(items: List(String)) -> List(String) {
  case items {
    [] -> []
    [item] -> [item, item]
    [_, _] -> items
    [first, ..rest] -> [
      first,
      list.last(rest)
      |> result.unwrap(""),
    ]
  }
}
