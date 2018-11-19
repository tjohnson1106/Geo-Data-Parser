defmodule ElhexDelivery.PostalCode.NavigatorTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Navigator

  describe "get_distance" do
    test "basic_test" do
      distance = Navigator.get_distance("94062", "94104")

      assert distance = 22.95
    end
  end
end
