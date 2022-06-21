# Scheduler

- Code in `lib/scheduler.ex`.
- Tests in `test/scheduler_test.exs`
- To run tests, run `mix test`

NOTE: This module assumes lists of intervals are already sorted,
otherwise could use a List.sort or convert to MapSets

To test, run `mix test`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `scheduler` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:scheduler, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/scheduler](https://hexdocs.pm/scheduler).
