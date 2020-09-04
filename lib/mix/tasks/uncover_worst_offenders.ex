defmodule Mix.Tasks.UncoverWorstOffenders do
  @moduledoc false

  use Mix.Task

  require Logger

  @impl Mix.Task
  @shortdoc "Uncover the worst offenders"
  def run(_) do
    Application.ensure_all_started(:project_x)

    Logger.info("Booting")

    {:ok, _} = ProjectX.GenServers.UncoverWorstOffenders.start_link()

    Logger.info("Gathering information")

    [most_offensive, second_most_offensive, third_most_offensive] =
      ProjectX.GenServers.UncoverWorstOffenders.uncover_worst_offenders()

    Logger.info("Worst offenders \n")

    Mix.shell().info("Worst offender: #{most_offensive.offender}")
    Mix.shell().info("Worst offender review: \n #{most_offensive.content}")
    Mix.shell().info("Worst offender publish date: #{most_offensive.publish_date}")
    Mix.shell().info("Worst offender severity: #{ProjectX.review_severity(most_offensive)}")
    Mix.shell().info("\n")

    Mix.shell().info("Second worst offender: #{second_most_offensive.offender}")
    Mix.shell().info("Second worst offender review: \n #{second_most_offensive.content}")
    Mix.shell().info("Second worst offender publish date: #{second_most_offensive.publish_date}")

    Mix.shell().info(
      "Second worst offender severity: #{ProjectX.review_severity(second_most_offensive)}"
    )

    Mix.shell().info("\n")

    Mix.shell().info("Third worst offender: #{third_most_offensive.offender}")
    Mix.shell().info("Third worst offender review: \n #{third_most_offensive.content}")
    Mix.shell().info("Third worst offender publish date: #{third_most_offensive.publish_date}")

    Mix.shell().info(
      "Third worst offender severity: #{ProjectX.review_severity(third_most_offensive)}"
    )

    :ok = ProjectX.GenServers.UncoverWorstOffenders.stop()

    Logger.info("Terminated")
  end
end
