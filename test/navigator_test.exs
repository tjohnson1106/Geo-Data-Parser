defmodule ElhexDelivery.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator

  describe "get_distance format tests" do
    test "postal code strings" do
      distance = Navigator.get_distance("94062", "94104")

      assert distance = 22.95
    end

    test "postal code integers" do
      distance = Navigator.get_distance(94062, 94104)

      assert distance = 22.95
    end

    test "postal code mixed string and integers" do
      distance = Navigator.get_distance("94062", 94104)

      assert distance = 22.95
    end

    test "postal code unexpected format" do
      assert_raise ArgumentError, fn ->
        distance = Navigator.get_distance(94062.9876, "94104")
      end
    end
  end
end
