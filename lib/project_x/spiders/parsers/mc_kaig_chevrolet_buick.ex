defmodule ProjectX.Spiders.Parsers.MCKaigChevroletBuick do
  @moduledoc false

  alias ProjectX.Review

  @spec parse_review_page(String.t()) :: list(Review.t()) | {:error, String.t()} | no_return()
  def parse_review_page(raw_content) when is_binary(raw_content) do
    with {:ok, document} <- Floki.parse_document(raw_content),
         offenders <- find_offenders(document),
         publish_dates <- find_publish_dates(document),
         contents <- find_contents(document),
         ratings <- find_ratings(document) do
      Enum.zip([offenders, publish_dates, contents, ratings])
      |> Enum.map(&maybe_build_review/1)
    end
  end

  defp maybe_build_review({offender, publish_date, content, ratings}) do
    case ProjectX.cast_review(%{
           offender: offender,
           content: content,
           publish_date: publish_date,
           ratings: ratings
         }) do
      {:ok, reviews} -> reviews
      any -> any
    end
  end

  defp find_offenders(document) do
    Floki.find(document, ".review-wrapper > div > span")
    |> Enum.reduce([], fn {"span", [{"class", "italic font-18 black notranslate"}], [offender]},
                          acc ->
      [String.replace(offender, ~r/\A- /, "") | acc]
    end)
  end

  defp find_publish_dates(document) do
    Floki.find(
      document,
      ".review-entry .review-date .italic.col-xs-6.col-sm-12.pad-none.margin-none.font-20"
    )
    |> Enum.reduce([], fn {"div",
                           [
                             {"class", "italic col-xs-6 col-sm-12 pad-none margin-none font-20"}
                           ], [publish_date]},
                          acc ->
      [maybe_build_publish_date(publish_date) | acc]
    end)
  end

  defp maybe_build_publish_date(raw_publish_date) do
    with sanitized_publish_date <- String.replace(raw_publish_date, ~r/\b\s|,\s/, "-"),
         {:ok, timestamp} <- Timex.parse(sanitized_publish_date, "{0Mfull}-{0D}-{YYYY}"),
         %Date{} = publish_date <- NaiveDateTime.to_date(timestamp) do
      to_string(publish_date)
    end
  end

  defp find_contents(document) do
    Floki.find(document, ".review-wrapper .review-content")
    |> Enum.reduce([], fn {"p",
                           [
                             {"class", "font-16 review-content margin-bottom-none line-height-25"}
                           ], [content]},
                          acc ->
      [content | acc]
    end)
  end

  defp find_ratings(document) do
    Floki.find(document, ".review-wrapper .table .rating-static-indv")
    |> Enum.reduce([], fn {"div", [{"class", css_class}], []}, acc ->
      [maybe_build_rating(css_class) | acc]
    end)
    |> Enum.chunk_every(5)
  end

  defp maybe_build_rating(raw_rating) do
    case ProjectX.cast_review_rating(%{severity: String.replace(raw_rating, ~r/\D/, "")}) do
      {:ok, rating} -> rating
      any -> any
    end
  end
end
