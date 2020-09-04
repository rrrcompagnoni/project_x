defmodule ProjectX do
  @moduledoc """
  The ProjectX public interface.
  """

  alias ProjectX.{Review, ReviewRating}

  @spec uncover_worst_offenders(list(Review.t())) :: list(Review.t())
  def uncover_worst_offenders(reviews) when is_list(reviews) do
    reviews
    |> Enum.sort_by(
      &{Review.severity_rating(&1),
       {&1.publish_date.year, &1.publish_date.month, &1.publish_date.day}},
      :desc
    )
    |> Enum.take(3)
  end

  @spec review_severity(Review.t()) :: float()
  def review_severity(%Review{} = review) do
    Review.severity_rating(review)
  end

  @spec cast_review(%{
          content: any,
          offender: any,
          publish_date: String.t(),
          ratings: list(ReviewRating.t())
        }) ::
          {:error,
           {:publish_date_cast_fail, :incompatible_calendars | :invalid_date | :invalid_format}}
          | {:ok, ProjectX.Review.t()}
  def cast_review(%{
        offender: offender,
        content: content,
        publish_date: publish_date,
        ratings: ratings
      }) do
    with {:offender_cast, offender} <- {:offender_cast, to_string(offender)},
         {:content_cast, content} <- {:content_cast, to_string(content)},
         {:publish_date_cast, {:ok, publish_date}} <-
           {:publish_date_cast, Date.from_iso8601(publish_date)} do
      {:ok,
       Review.cast(%{
         offender: offender,
         content: content,
         publish_date: publish_date,
         ratings: ratings
       })}
    else
      {:publish_date_cast, {:error, any}} -> {:error, {:publish_date_cast_fail, any}}
    end
  end

  @spec cast_review_rating(%{severity: any}) ::
          {:error, :severity_cast_fail} | {:ok, ReviewRating.t()}
  def cast_review_rating(%{severity: severity}) do
    with string <- to_string(severity),
         {:severity_cast, {number, _}} <- {:severity_cast, Integer.parse(string)} do
      {:ok, ReviewRating.cast(%{severity: number})}
    else
      {:severity_cast, :error} -> {:error, :severity_cast_fail}
    end
  end
end
