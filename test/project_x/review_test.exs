defmodule ProjectX.ReviewTest do
  use ExUnit.Case, async: true

  describe "severity_rating/1" do
    test "a list of review ratings" do
      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 5})

      assert 5.0 =
               %{
                 offender: "Mauricio",
                 content: "Lorem ipsum dolor sit amet.",
                 publish_date: ~D[2020-09-02],
                 ratings: [review_rating]
               }
               |> ProjectX.Review.cast()
               |> ProjectX.Review.severity_rating()
    end

    test "an empty list" do
      assert 0 =
               %{
                 offender: "Mauricio",
                 content: "Lorem ipsum dolor sit amet.",
                 publish_date: ~D[2020-09-02],
                 ratings: []
               }
               |> ProjectX.Review.cast()
               |> ProjectX.Review.severity_rating()
    end
  end
end
