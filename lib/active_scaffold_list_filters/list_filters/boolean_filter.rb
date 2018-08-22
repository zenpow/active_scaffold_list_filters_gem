class ListFilters::BooleanFilter < ActiveScaffold::DataStructures::ListFilter
  
  def find_options
    begin
      options = {}
      if params[0].blank?
        options[:conditions] = nil
      else
        true_or_false = ActiveRecord::Type::Boolean.new.cast(params)
        options[:conditions] = "#{field_name.to_s} is #{true_or_false}"
      end
      return options
    end unless params.blank? || params[0].blank?
  end
  
  def verbose
    begin
      return ActiveRecord::Type::Boolean.new.cast(params).yes_or_no unless params.blank?
    end unless params.blank?
  end
  
  def field_name
    @name
  end
  
end
