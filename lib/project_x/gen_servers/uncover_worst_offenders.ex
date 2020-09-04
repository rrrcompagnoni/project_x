defmodule ProjectX.GenServers.UncoverWorstOffenders do
  @moduledoc false

  use GenServer

  @file_path "/tmp/ProjectX.Spiders.MCKaigChevroletBuick.json"

  @impl true
  def init(_) do
    File.rm("/tmp/ProjectX.Spiders.MCKaigChevroletBuick*")

    :ok = Crawly.Engine.start_spider(ProjectX.Spiders.MCKaigChevroletBuick)

    :timer.sleep(7_000)

    {:ok, []}
  end

  @impl true
  def handle_call(:stop, _from, state) do
    {:stop, :normal, state}
  end

  @impl true
  def handle_call(:uncover_worst_offenders, _, _) do
    worst_offenders =
      File.stream!(@file_path, [], :line)
      |> Enum.map(fn line -> maybe_build_review(Jason.decode!(line)) end)
      |> ProjectX.uncover_worst_offenders()

    {:reply, worst_offenders, worst_offenders}
  end

  @impl true
  def terminate(_, _) do
    Crawly.Engine.stop_spider(ProjectX.Spiders.MCKaigChevroletBuick)

    :ok
  end

  defp maybe_build_review(%{
         "offender" => offender,
         "content" => content,
         "publish_date" => publish_date,
         "ratings" => ratings
       }) do
    ratings = Enum.map(ratings, &maybe_build_review_rating/1)

    case ProjectX.cast_review(%{
           offender: offender,
           content: content,
           publish_date: publish_date,
           ratings: ratings
         }) do
      {:ok, review} -> review
      any -> any
    end
  end

  defp maybe_build_review_rating(%{"severity" => severity}) do
    case ProjectX.cast_review_rating(%{severity: severity}) do
      {:ok, review_rating} -> review_rating
      any -> any
    end
  end

  def start_link do
    GenServer.start_link(__MODULE__, nil, name: __MODULE__, timeout: 7_100)
  end

  def stop do
    GenServer.stop(__MODULE__, :normal, 1000)
  end

  def uncover_worst_offenders() do
    GenServer.call(__MODULE__, :uncover_worst_offenders)
  end
end
