class ListFilters::FieldContainsFilter < ActiveScaffold::DataStructures::ListFilter
  
  def find_options
    begin
      options = {}
      if params[0].blank?
        options[:conditions] = nil
      else
        options[:conditions] = ["#{core.model.table_name}.#{field_name.to_s} LIKE ?", "%#{params[0]}%"]
      end
      return options
    end unless params.blank? || params[0].blank?
  end
  
  def verbose
    begin
      return params[0] unless params[0].blank?
    end unless params.blank?
  end
  
  def field_name
    @name
  end
  
end