class UdaciList
  attr_reader :type, :title, :items

  def initialize(options={})
    @title = options[:title] || "Untitled List"
    @items = []
  end

  def add(type, description, options={})
    type = type.downcase
    if type == "todo"
      @items.push TodoItem.new(description, options)
    elsif type == "event"
      @items.push EventItem.new(description, options)
    elsif type == "link"
      @items.push LinkItem.new(description, options)
    else
      raise UdaciListErrors::InvalidItemType, "Please specify a valid item."
    end
  end

  def delete(index)
    if @items.length >= index
      @items.delete_at(index - 1)
    else
      raise UdaciListErrors::IndexExceedsListSize, "Please enter a valid number"
    end
  end

  def filter(type)
    items = @items.select { |item| item.class.type == type }
    if items.empty?
      raise UdaciListErrors::InvalidItemType, "Please use a valid item type."
    else
      puts items
    end
  end


  def all
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      puts "#{position + 1}) #{item.details}"
    end
  end
end
