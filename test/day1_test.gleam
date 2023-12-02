import gleeunit/should
import gleam/option.{None, Some}
import aoc/day1.{extract_first_last_pair, parse_line, sum_all}

pub fn parse_line_test() {
  parse_line("nd5lp0ty")
  |> should.equal(Some(50))

  parse_line("five7one")
  |> should.equal(Some(77))

  parse_line("treb7uchet")
  |> should.equal(Some(77))

  parse_line("4threesixeightfcvjl")
  |> should.equal(Some(44))

  parse_line("4threesixeightfcvjl7")
  |> should.equal(Some(47))

  parse_line("four")
  |> should.equal(None)

  parse_line("four4")
  |> should.equal(Some(44))
}

pub fn extract_first_last_pair_test() {
  extract_first_last_pair(["2", "d", "5", "s", "p", "8", "y"])
  |> should.equal(["2", "y"])

  extract_first_last_pair(["2", "d", "5", "s", "p", "8", "y", "4"])
  |> should.equal(["2", "4"])

  extract_first_last_pair([])
  |> should.equal([])

  extract_first_last_pair(["a"])
  |> should.equal(["a", "a"])

  extract_first_last_pair(["a", "b"])
  |> should.equal(["a", "b"])
}

pub fn sum_all_test() {
  sum_all(["nd5lp0ty", "nd5lp0ty"])
  |> should.equal(100)

  sum_all(["plj9ery5kv1", "1ml0sw", "yt9z", "asdf3bn9lm0"])
  |> should.equal(230)

  sum_all([
    "9pklsdndiue8", "09jsbisoh2", "urt5lmp2", "9plsnbjbs9dh", "hlwp8jsbbi2jfu",
  ])
  |> should.equal(333)
}
