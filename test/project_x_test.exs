defmodule ProjectXTest do
  use ExUnit.Case, async: true

  describe "uncover_worst_offenders/1" do
    test "the ranking of most offensive reviews" do
      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 5})

      {:ok, mauricio_review} =
        ProjectX.cast_review(%{
          offender: "Mauricio",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 4})

      {:ok, sanchez_review} =
        ProjectX.cast_review(%{
          offender: "Sanchez Family",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 3})

      {:ok, fleticia_review} =
        ProjectX.cast_review(%{
          offender: "Fleticia1",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 2})

      {:ok, evie_review} =
        ProjectX.cast_review(%{
          offender: "Evie Brown",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 1})

      {:ok, nurseton_review} =
        ProjectX.cast_review(%{
          offender: "nurseton",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 0})

      {:ok, brendaates_review} =
        ProjectX.cast_review(%{
          offender: "brendaates",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      reviews = [
        sanchez_review,
        mauricio_review,
        brendaates_review,
        evie_review,
        nurseton_review,
        fleticia_review
      ]

      assert ProjectX.uncover_worst_offenders(reviews) == [
               mauricio_review,
               sanchez_review,
               fleticia_review
             ]
    end

    test "the ranking precedence in case of ties" do
      # mauricio and nurseton have the same severity rating and different
      # publish dates

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 5})

      {:ok, mauricio_review} =
        ProjectX.cast_review(%{
          offender: "Mauricio",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-01",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 4})

      {:ok, sanchez_review} =
        ProjectX.cast_review(%{
          offender: "Sanchez Family",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-02",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 3})

      {:ok, evie_review} =
        ProjectX.cast_review(%{
          offender: "Evie Brown",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-01",
          ratings: [
            review_rating
          ]
        })

      {:ok, review_rating} = ProjectX.cast_review_rating(%{severity: 5})

      {:ok, nurseton_review} =
        ProjectX.cast_review(%{
          offender: "nurseton",
          content: "Lorem ipsum dolor sit amet.",
          publish_date: "2020-09-03",
          ratings: [
            review_rating
          ]
        })

      reviews = [
        mauricio_review,
        evie_review,
        nurseton_review,
        sanchez_review
      ]

      assert ProjectX.uncover_worst_offenders(reviews) == [
               nurseton_review,
               mauricio_review,
               sanchez_review
             ]
    end
  end
end
