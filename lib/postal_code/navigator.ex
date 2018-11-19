defmodule ElhexDelivery.PostalCode.Navigator do
  alias :math, as: Math
  alias ElhexDelivery.PostalCode.Store

  # @radius 6371 #km
  @radius 3959

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
    Store.get_geolocation(postal_code)
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

  # calculate_distance helper method
  # this needs to convert degrees to radians
  # multiply degrees by pi and divide by 180

  defp calculate_distance({lat1, long1}, {lat2, long2}) do
    lat_diff = degrees_to_radians(lat2 - lat1)
    long_diff = degrees_to_radians(long2 - long1)

    lat1 = degrees_to_radians(lat1)
    lat2 = degrees_to_radians(lat2)

    cos_lat1 = Math.cos(lat1)
    cos_lat2 = Math.cos(lat2)

    sin_lat_diff_sq = Math.sin(lat_diff / 2) |> Math.pow(2)
    sin_long_diff_sq = Math.sin(long_diff / 2) |> Math.pow(2)

    a = sin_lat_diff_sq + cos_lat1 * cos_lat2 * sin_long_diff_sq
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))

    (@radius * c) |> Float.round(2)
  end

  defp degrees_to_radians(degrees) do
    degrees * (Math.pi() / 180)
  end
end
