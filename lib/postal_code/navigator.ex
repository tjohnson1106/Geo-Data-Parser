defmodule ElhexDelivery.PostalCode.Navigator do
  def get_distance(from, to) do
    do_get_distance(from, to)
  end

  # note: when a private method shares a name as a 
  # ^public method convention dictates it's prefixed with 'do'
  # def foo_bar defp defp do_foo_bar

  defp do_get_distance(from, to) do
    {lat1, long1} = get_geolocation(from)
    {lat2, long2} = get_geolocation(to)

    22.95
  end

  defp get_geolocation(postal_code) do
    {123, 456}
  end
end
