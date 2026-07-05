defmodule ElixirNoLockTest do
  use ExUnit.Case
  doctest ElixirNoLock

  test "greets the world" do
    assert ElixirNoLock.hello() == :world
  end
end
