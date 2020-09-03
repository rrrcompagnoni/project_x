defmodule ProjectX.ReviewRating do
  @enforce_keys :severity

  @moduledoc """
  It represents a review rating present
  in any review.
  """

  defstruct severity: nil

  @type t :: %__MODULE__{
          severity: integer()
        }

  @spec cast(%{severity: integer}) :: t()
  def cast(%{severity: severity}) when is_integer(severity) do
    %__MODULE__{
      severity: severity
    }
  end
end
