class ListFilters::DateFilter < ActiveScaffold::DataStructures::ListFilter

  # Return a list of conditions based on the params 
  def find_options
    start_date = parse_date(params[:start_date])
    end_date   = parse_date(params[:end_date])
    end_date = end_date && end_date.end_of_day
    column = @options[:column] || @name

    if start_date && end_date
      return :conditions => ["#{@core.model.table_name}.#{column} BETWEEN ? AND ?", start_date, end_date]
    elsif start_date
      return :conditions => ["#{@core.model.table_name}.#{column} >= ?", start_date]
    elsif end_date
      return :conditions => ["#{@core.model.table_name}.#{column} <= ?", end_date]
    end
  end

  def verbose
    start_date = parse_date(params[:start_date])
    end_date   = parse_date(params[:end_date])
    
    
    if start_date && end_date
      "between #{start_date.to_s(:normal)} and #{end_date.to_s(:normal)}"
    elsif start_date
      "from #{start_date.to_s(:normal)}"
    elsif end_date
      "up to #{end_date.to_s(:normal)}"
    end
  end

  def parse_date(date)
    begin
      # If they are both strings, use String#to_date
      if (date.is_a? String)
        date = date.to_date
      end

      # Otherwise, parse them both as hashes instead (Rails default way)
      date ||= Date.new(date["year"].to_i, date["month"].to_i, date["day"].to_i)

      return date
    rescue
      return nil
    end
  end
end
