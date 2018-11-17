defmodule ElhexDelivery.PostalCode.DataParser do
  @postal_codes_filepath "data/2018_Gaz_zcta_national.txt"

  def parse_data do
    [header | data_rows] =
      File.read!(@postal_codes_filepath)
      |> String.split("/n")

    data_rows
    |> Stream.map(&String.split(&1, "\t"))
    |> Stream.filter(&data_row?(&1))
    |> Stream.map(&parse_data_columns(&1))
    |> Stream.map(&format_row(&1))

    Enum.into(%{})
  end

  defp data_row?(row) do
    case row do
      [postal_code, _, _, _, _, _latitude, _longitude] ->
        true

      _ ->
        false
    end
  end

  defp parse_data_columns(row) do
    [postal_code, _, _, _, _, latitude, longitude] = row
    [postal_code, latitude, longitude]
  end

  defp parse_number(str) do
    str
    |> String.replace(" ", "")
    |> String.to_float()
  end

  # format three elements into a two element tuple

  defp format_row([postal_code, latitude, longitude]) do
    latitude = parse_number(latitude)
    longitude = parse_number(longitude)

    {postal_code, {latitude, longitude}}
  end
end
