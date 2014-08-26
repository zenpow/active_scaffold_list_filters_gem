class ListFilters::EmptyOrNotFilter < ActiveScaffold::DataStructures::ListFilter
  def find_options
    begin
      options = {}
      if params.blank?
        options[:conditions] = nil
      elsif params == "0"
        options[:conditions] = ["#{field_name.to_s} IS NULL"]
      elsif params == "1"
        options[:conditions] = ["#{field_name.to_s} IS NOT NULL"] 
      end
      
      return options
    end unless params.blank? || params[0].blank?
  end
  
  def verbose
    options_labels = self.options[:options_labels] || ["N/A", "Not Empty", "Empty"]
    begin
      if params == "0"
        options_labels[2]
      else
        options_labels[1]
      end
    end unless params.blank?
  end
  
  def field_name
    @name
  end
end