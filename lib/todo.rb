class TodoItem
  include Listable
  attr_reader :description, :due, :priority

  def initialize(description, options={})
    @description = description
    @due = options[:due] ? Chronic.parse(options[:due]) : options[:due]
    @priority = options[:priority]
  end

  def self.type
    "todo"
  end

  def update_priority(new_priority)
    @priority = new_priority
  end

  def details
    "To-Do: " +
    format_description(@description) + "due: " +
    format_date(due: @due) +
    format_priority(@priority)
  end
end
