defmodule Scheduler do
  @moduledoc """
  Documentation for `Scheduler`.
  """

  @doc """
  Get first overlap between two lists of a given duration (default duration = 1).

  Returns `nil` if no overlap of a given duration is found between the given lists.

  ## Examples

      iex> Scheduler.get_first_overlap([[0, 15], [30, 60], [80, 85]], [[10, 20], [40, 55], [58, 70], [100, 120]], 5)

      [10, 15]

      iex> Scheduler.get_first_overlap([[20, 60], [150, 200]], [[58, 80], [100, 125]], 5)

      nil
  """
  def get_first_overlap(list_one, list_two, duration \\ 1) do
    case find_range_overlaps(list_one, list_two, duration) do
      # NOTE Pattern matching a list with [head | tail] will always work for a non-empty list,
      # even there is no tail, e.g.:
        # if [head | _] = [1], then head == 1
      [first_overlap | _] ->
        first_overlap
      _ ->
        nil
    end
  end

  @doc """
  Range overlap finder, finds overlaps between two given lists.
  Default duration is 1.

  ## Examples

      iex> Scheduler.find_range_overlaps([[0, 15], [30, 60], [80, 85]], [[10, 20], [40, 55], [58, 70], [100, 120]], 5)

      [[10, 15], [40, 45]]

      iex> Scheduler.find_range_overlaps([[20, 60], [150, 200]], [[58, 80], [100, 125]], 5)

      []
  """
  def find_range_overlaps(list_one, list_two, duration \\ 1) do
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
