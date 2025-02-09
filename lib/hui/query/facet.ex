defmodule Hui.Query.Facet do
  @moduledoc """
  Struct related to [faceting](http://lucene.apache.org/solr/guide/faceting.html).
  
  ### Example

      iex> x = %Hui.Query.Facet{field: ["type", "year"], query: "year:[2000 TO NOW]"}
      %Hui.Query.Facet{
        contains: nil,
        "contains.ignoreCase": nil,
        "enum.cache.minDf": nil,
        excludeTerms: nil,
        exists: nil,
        facet: true,
        field: ["type", "year"],
        interval: nil,
        limit: nil,
        matches: nil,
        method: nil,
        mincount: nil,
        missing: nil,
        offset: nil,
        "overrequest.count": nil,
        "overrequest.ratio": nil,
        pivot: [],
        "pivot.mincount": nil,
        prefix: nil,
        query: "year:[2000 TO NOW]",
        range: nil,
        sort: nil,
        threads: nil
      }
    iex> x |> Hui.Encoder.encode
    "facet=true&facet.field=type&facet.field=year&facet.query=year%3A%5B2000+TO+NOW%5D"
  """
  defstruct [facet: true, field: [], query: []]
         ++ [:"pivot.mincount", pivot: []]
         ++ [:prefix, :contains, :"contains.ignoreCase", :matches]
         ++ [:sort, :limit, :offset, :mincount,
             :missing, :method, :"enum.cache.minDf", :exists]
         ++ [:excludeTerms, :"overrequest.count", :"overrequest.ratio",
             :threads]
         ++ [:interval, :range]

  @typedoc """
  Struct for faceting.
  """
  @type t :: %__MODULE__{facet: boolean, field: binary | list(binary), query: binary | list(binary),
                         "pivot.mincount": number, pivot: binary | list(binary),
                         prefix: binary, contains: binary, "contains.ignoreCase": binary, matches: binary,
                         sort: binary, limit: number, offset: number, mincount: number,
                         missing: boolean, method: binary, "enum.cache.minDf": number, exists: boolean,
                         excludeTerms: binary, "overrequest.count": number, "overrequest.ratio": number,
                         threads: binary,
                         interval: Hui.Query.FacetInterval.t | list(Hui.Query.FacetInterval.t),
                         range: Hui.Query.FacetRange.t | list(Hui.Query.FacetRange.t)}

end