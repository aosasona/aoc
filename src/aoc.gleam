import gleam/erlang
import gleam/io
import gleam/list
import gleam/string
import gleam/result
import simplifile

pub fn main() {
  let args = erlang.start_arguments()
  let assert Ok(files) = simplifile.read_directory("src/aoc")
  let files =
    files
    |> list.map(fn(filename) {
      string.split(filename, ".")
      |> list.first
      |> result.unwrap("")
    })
    |> list.filter(fn(filename) { filename != "" })

  case args {
    _ -> {
      io.println("List of available days:")
      files
      |> list.map(fn(filename) {
        case filename {
          "day_" <> day -> "- Day " <> day
          _ -> "- Unknown: " <> filename
        }
        |> io.println
      })
    }
  }
  // io.println("Run a day with: `gleam run --day <day>`")
  // ["--day", day] -> {
  //   case list.find(files, fn(filename) { filename == "day_" <> day }) {
  //     Error(_) -> io.println("Unknown day: " <> day)
  //     Ok(_) -> {
  //       todo as "Run day"
  //     }
  //   }
  // }
}
