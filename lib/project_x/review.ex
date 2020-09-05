defmodule ProjectX.Review do
  @moduledoc """
  It represents a review made by
  any offender.
  """

  alias ProjectX.ReviewRating

  defstruct offender: nil, content: nil, publish_date: nil, ratings: nil

  @type t :: %__MODULE__{
          offender: String.t(),
          content: String.t(),
          publish_date: Date.t(),
          ratings: list(ReviewRating.t())
        }

  @spec cast(%{
          content: String.t(),
          offender: String.t(),
          publish_date: Date.t(),
          ratings: list(ReviewRating.t())
        }) :: t()
  def cast(%{
        offender: offender,
        content: content,
        publish_date: %Date{} = publish_date,
        ratings: ratings
      })
      when is_binary(offender) and is_binary(content) and is_list(ratings) do
    %__MODULE__{
      offender: offender,
      content: content,
      publish_date: publish_date,
      ratings: ratings
    }
  end

  @spec severity_rating(t()) :: float()
  def severity_rating(%__MODULE__{ratings: []}), do: 0

  def severity_rating(%__MODULE__{} = review) do
    severities = Enum.map(review.ratings, &(&1.severity))

    Enum.sum(severities) / length(severities)
  end
end
