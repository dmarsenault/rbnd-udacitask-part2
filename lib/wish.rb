class WishItem
  include Listable
  attr_reader :description

  def initialize(description)
    @description = description
  end

  def self.type
    "wish"
  end

  def details
    "Wish: " + format_description(@description)
  end
end
