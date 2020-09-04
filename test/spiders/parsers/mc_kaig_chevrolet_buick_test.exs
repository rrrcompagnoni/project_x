defmodule ProjectX.Spiders.Parsers.MCKaigChevroletBuickTest do
  use ExUnit.Case, async: true

  alias ProjectX.{
    Review,
    ReviewRating,
    Spiders.Parsers.MCKaigChevroletBuick
  }

  describe "parse_review_page/1" do
    test "the correctness of the task of parsing the reviews page" do
      raw_content = File.read!("test/support/mc_kaig_reviews_page_fixture.txt")

      assert MCKaigChevroletBuick.parse_review_page(raw_content) == [
               %Review{
                 content:
                   "Always friendly with no hassle. Great experience every time we come. From the people to the Great deals. Honestly can’t imagine a better dealership.",
                 offender: "Jesus, Aguillon123",
                 publish_date: ~D[2020-08-12],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0}
                 ]
               },
               %Review{
                 content:
                   "I’m from White Oak and have bought all my vehicles from Mckaig Chevrolet since the 70’s and decided to do it again. The staff at this dealership are great people and a pleasure to do business with. Within a short time I was the proud owner of a new car. I highly recommend Mckaig Chevrolet Buick for a great car buying experience. A special thanks to Tim Pritchett, Jeriamy Schumacher and Brandon McCloskey for making my experience such a pleasant one. ",
                 offender: "smoknpawpaw",
                 publish_date: ~D[2020-08-12],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0}
                 ]
               },
               %Review{
                 content:
                   "When our car’s engine went out Bucky helped us get into a brand new Buick Encore. He was very helpful and made us feel like family. We appreciate the job he did for us and recommend him to anyone!",
                 offender: "msettaj1958",
                 publish_date: ~D[2020-08-13],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0}
                 ]
               },
               %Review{
                 content:
                   "Hello I am from gilmer Texas and I bought a car recently from Tim Pritchett!! He and jeriamry schumacher and Brandon mccloskey all made sure that I got the car I wanted for a price I could manage. They were very nice and very helpful. ",
                 offender: "Baileyrae007",
                 publish_date: ~D[2020-08-13],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 40},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               },
               %Review{
                 content:
                   "Bucky was a great help! Very professional and positive. I highly recommend him. Even after my purchase he went out of his way to make sure I was completely satisfied with my car. ",
                 offender: "bluteg84",
                 publish_date: ~D[2020-08-19],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               },
               %Review{
                 content:
                   "Yesterday I closed a deal on a 2017 Buick Enclave after searching for a good used SUV. Dennis Smith was very helpful and patient in my selection process. I was was assisted by Jeriamy Schumacher, Freddie Tomlinson, and Brandon McCloskey. The short drive from Longview was well worth the time and distance involved in several trips to select, purchase, and complete the financial process. I highly recommend Dennis and McKaig Chevrolet Buick.",
                 offender: "chaps610",
                 publish_date: ~D[2020-08-20],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 0},
                   %ReviewRating{severity: 0}
                 ]
               },
               %Review{
                 content:
                   "I purchased my Enclave from McKaig in 2008.  They have done all of the service on my vehicle since then and helped me maintain it so that it is still in good shape.\nPrompt Service.  Had appointment and they took my car in right on time. Mariela and Patrick were very friendly ",
                 offender: "Gabby",
                 publish_date: ~D[2020-08-25],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 30},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               },
               %Review{
                 content:
                   "Hand's down the best service I've received in a long time... I called Taylor and talked to him about my trade and he was very helpful and so I decided to go talk to him and they gave me a very good price on it before we even started talking about what kinda car I wanted so there was no number game like most dealers play... Long story short Taylor from start to finish was very helpful we got a great price on a new Buick enclave and he stayed with us until everything was set up and we knew every feature on the car...",
                 offender: "timpatrick4133",
                 publish_date: ~D[2020-08-26],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               },
               %Review{
                 content:
                   "Just bought a new 2020 Buick Encore GX After a lot of search they gave me the vest deal.  Dennis Smith and Jeremy S worked hard to get me the best cost and interest.  Dennis went out of his way to help me and make sure I was Happy...  They get all my future business",
                 offender: "N. Kinney",
                 publish_date: ~D[2020-09-01],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 40},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               },
               %Review{
                 content:
                   "I just purchased a preowned Yukon that I saw online and contacted the dealer Mckaig Chevrolet. Salesman Taylor Prickett was fantastic to work with since I am four hours away in Houston. Taylor provided me with all the information and honest answers I needed to make the purchase with no worries. We worked out the price and financing that day.  Taylor setup delivery for me all the way to Houston  and I had the truck the next day! Great experience and it was fast and smooth.  Ask for Taylor Prickett and you will get the same great service.",
                 offender: "Mike Farris",
                 publish_date: ~D[2020-09-02],
                 ratings: [
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50},
                   %ReviewRating{severity: 50}
                 ]
               }
             ]
    end
  end
end
