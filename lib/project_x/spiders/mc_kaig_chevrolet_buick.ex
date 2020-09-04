defmodule ProjectX.Spiders.MCKaigChevroletBuick do
  @moduledoc false

  use Crawly.Spider

  alias ProjectX.Spiders.Parsers

  @impl Crawly.Spider
  def base_url(), do: "https://www.dealerrater.com"

  @impl Crawly.Spider
  def init(),
    do: [
      start_urls: [
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page1/?filter=ALL_REVIEWS#link",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page2/?filter=ALL_REVIEWS#link",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page3/?filter=ALL_REVIEWS#link",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page4/?filter=ALL_REVIEWS#link",
        "https://www.dealerrater.com/dealer/McKaig-Chevrolet-Buick-A-Dealer-For-The-People-dealer-reviews-23685/page5/?filter=ALL_REVIEWS#link"
      ]
    ]

  @impl Crawly.Spider
  def parse_item(response) do
    items = Parsers.MCKaigChevroletBuick.parse_review_page(response.body)

    %Crawly.ParsedItem{
      requests: [],
      items: items
    }
  end
end
