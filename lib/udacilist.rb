class UdaciList
  attr_reader :type, :title, :items

  def initialize(options={})
    @title = (options[:title]) || ("Untitled List")
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
    elsif type == "wish"
      @items.push WishItem.new(description)
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
    rows = []
    puts "-" * @title.length
    puts @title
    puts "-" * @title.length
    @items.each_with_index do |item, position|
      rows << ["#{position + 1})", "#{item.details}"]
    end
    table = Terminal::Table.new :headings => ["No.", "Description"], :rows => rows
    puts table
  end
end
