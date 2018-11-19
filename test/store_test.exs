defmodule ElhexDelivery.PostalCode.StoreTest do
  use ExUnit.Case
  alias ElhexDelivery.PostalCode.Store
  doctest ElhexDelivery

  # remember: must explicitly start gen server in testing
  # ^until top level supervisor is implemented and starting module specified
  # removed Store.start_link() after top level supervisor implemented 11192019

  test "get_geolocation" do
    {latitude, longitude} = Store.get_geolocation("94062")
    assert is_float(latitude)
    assert is_float(longitude)
  end
end
