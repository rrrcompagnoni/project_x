defmodule ProjectX.ReviewRating do
  @moduledoc """
  It represens a review rating present
  in any review.
  """

  defstruct severity: 0

  @type t :: %__MODULE__{
          severity: integer()
        }
end
