defmodule Auction.FakeRepo do
  alias Auction.Item

  @items [
    %Item{
      id: 1,
      title: "Deep fryer",
      description: "Very good condition",
      ends_at: ~N[2020-02-15 10:00:00]
    },
    %Item{
      id: 2,
      title: "Book about Elixir programming language",
      description: "Never read!",
      ends_at: ~N[2020-02-16 15:15:00]
    },
    %Item{
      id: 3,
      title: "PC",
      description: "Raspberry PI 2",
      ends_at: ~N[2020-02-10 09:33:00]
    },
  ]

  def all(Item), do: @items

  def get!(Item, id) do
    Enum.find(@items, fn item -> item.id == id end)
  end

  def get_by(Item, attrs) do
    Enum.find(@items, fn item ->
      Enum.all?(Map.keys(attrs), fn key -> 
        Map.get(item, key) === attrs[key]
      end)
    end)
  end
end