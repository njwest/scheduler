defmodule Scheduler do
  def find_range_overlap(list_one, list_two, duration \\ 1) do
    Enum.reduce(list_one, [], fn [start_one, end_one], acc ->
      acc ++
        Enum.reduce(list_two, [], fn [start_two, end_two], acc ->
          min_end = Enum.min([end_one, end_two])
          max_start = Enum.max([start_one, start_two])

          overlap = min_end - max_start

          if overlap >= duration do
            acc ++ [[max_start, max_start + duration]]
          else
            acc
          end
        end)
    end)
    # NOTE Could make this function more succinct with Elixir  capture(&) syntax,
    # however that would make it less readable to non-Elixirists
  end
end
