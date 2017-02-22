class ListFilters::FieldSelectFilter < ActiveScaffold::DataStructures::ListFilter
  
  def find_options
    begin
      options = {}
      if params.blank?
        options[:conditions] = nil
      else
        options[:conditions] = ["`#{field_name.to_s}` = ?", params]
      end
      return options
    end unless params.blank? || params[0].blank?
  end
  
  def verbose
    begin
      return params unless params.blank?
    end unless params.blank?
  end
  
  def field_name
    @name
  end
  
end
