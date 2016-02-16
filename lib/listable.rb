module Listable
  def format_description(description)
    "#{description}".ljust(30)
  end
  def priority_validation(priority)
    if priority == "high" || priority == "medium" || priority =="low" || !priority
      return priority
    else
      raise UdaciListErrors::InvalidPriorityValue
    end
  end
  def format_priority(priority)
    priority_validation(priority)
    value = " ⇧".colorize(:red) if priority == "high"
    value = " ⇨".colorize(:orange) if priority == "medium"
    value = " ⇩".colorize(:green) if priority == "low"
    value = " " if !priority
    return value
  end
  def format_date(options = {})
    if options[:start_date]
      dates = options[:start_date].strftime("%D")
    if options[:end_date]
      dates << " -- " + options[:end_date].strftime("%D")
    end
    !dates == "N/A" if !dates
    else
    dates = options[:due] ? options[:due].strftime("%D") : "No due date"
  end
  return dates
  end
  def format_type(type)
    value = "To-do" if type == "todo"
    value = "Link" if type == "link"
    value = "Event" if type == "event"
    value = "Wish" if type == "wish"
  end
end
