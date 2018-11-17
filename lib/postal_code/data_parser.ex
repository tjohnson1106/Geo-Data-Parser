defmodule ElhexDelivery.PostalCode.DataParser do
  @postal_codes_filepath "data/2018_Gaz_zcta_national.txt"

  def parse_data do
    [header | data_rows] =
      File.read!(@postal_codes_filepath)
      |> String.split("/n")

    data_rows
    |> Enum.map(fn row ->
      String.split(row, "\t")
    end)
    |> Enum.map(fn row ->
      [postal_code, _, _, _, _, latitude, longitude] = row
      [postal_code, latitude, longitude]
    end)
  end
end
