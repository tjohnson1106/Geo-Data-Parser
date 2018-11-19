defmodule ElhexDelivery.PostalCode.Navigator do
  alias ElhexDelivery.PostalCode.Store

  def get_distance(from, to) do
    do_get_distance(from, to)
  end

  # note: when a private method shares a name as a 
  # ^public method convention dictates it's prefixed with 'do'
  # def foo_bar defp defp do_foo_bar

  # calculate_distance should remain static, at least for now

  defp do_get_distance(from, to) do
    {lat1, long1} = get_geolocation(from)
    {lat2, long2} = get_geolocation(to)

    calculate_distance({lat1, long1}, {lat2, long2})
  end

  defp get_geolocation(postal_code) when is_binary(postal_code) do
    {123, 456}
  end

  # convert input value from integer to string
  # enable user to use numbers

  defp get_geolocation(postal_code) when is_integer(postal_code) do
    postal_code = Integer.to_string(postal_code)
    get_geolocation(postal_code)
  end

  defp get_geolocation(postal_code) do
    error = "unexpected `postal_code` received:
       (#{inspect(postal_code)})"
    raise ArgumentError, error
  end
end
