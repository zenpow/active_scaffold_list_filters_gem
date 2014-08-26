class ListFilters::StatesFilter < ActiveScaffold::DataStructures::ListFilter
  
  def find_options
    begin
      options = {}
      if params.blank?
        options[:conditions] = nil
      else
        # for cases when field_name also exists in an association's table
        options[:conditions] = ["#{core.model.table_name}.#{field_name.to_s} = (?)", params]
      end
      return options
    end unless params.blank?
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
