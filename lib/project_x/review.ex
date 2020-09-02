defmodule ProjectX.Review do
  @moduledoc """
  It represents a review made by
  any offender.
  """

  defstruct offender: "", review: "", review_ratings: []

  @type t :: %__MODULE__{
          offender: String.t(),
          review: String.t(),
          review_ratings: String.t()
        }
end
