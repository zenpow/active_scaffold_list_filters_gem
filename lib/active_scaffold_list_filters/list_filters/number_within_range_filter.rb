class ListFilters::NumberWithinRangeFilter < ActiveScaffold::DataStructures::ListFilter
  
  def find_options
    begin
      options = {}
      # how many params
      if params[0].blank? && params[1].blank?
        options[:conditions] = nil
      elsif params[0].to_i.zero? && !params[1].blank?
        options[:conditions] = ["#{field_name.to_s} <= ?", params[1]]
      elsif !params[0].to_i.zero? && params[1].blank?
        options[:conditions] = ["#{field_name.to_s} >= ?", params[0]]
      else
        options[:conditions] = ["#{field_name.to_s} >= ? AND #{field_name.to_s} <= ?", params[0], params[1]]
      end
      return options
    end unless params.blank? || params[0].blank?
  end
  
  def verbose
    begin
      if params[0].to_i.zero? && !params[1].blank?
        return "less than #{params[1]}"
      elsif !params[0].to_i.zero? && params[1].blank?
        return "greater than #{params[0]}"
      else
        return "between #{params[0]} and #{params[1]}"
      end
    end unless params[0].blank? && params[1].blank? 
  end
  
  def field_name
    @name
  end
  
end