defmodule SchedulerTest do
  use ExUnit.Case
  doctest Scheduler

  test "find range overlaps" do
    assert Scheduler.find_range_overlaps([[0, 15], [30, 60], [80, 85]], [[10, 20], [40, 55], [58, 70], [100, 120]], 5) == [[10, 15], [40, 45]]
  end

  test "get first overlap" do
    assert Scheduler.get_first_overlap([[0, 15], [30, 60], [80, 85]], [[10, 20], [40, 55], [58, 70], [100, 120]], 5) == [10, 15]
  end

  test "no overlaps" do
    assert Scheduler.get_first_overlap([[20, 60], [150, 200]], [[58, 80], [100, 125]], 5) == nil
  end
end
