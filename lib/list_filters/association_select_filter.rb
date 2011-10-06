class ListFilters::AssociationSelectFilter < ActiveScaffold::DataStructures::ListFilter
  # Return a list of conditions based on the params 
  def find_options
    begin
      association = association_class
      options = {}
      options[:include] = association_name
      options[:conditions] = ["#{association.table_name}.id IN (?)", params]

      return options      
    end unless params.nil? || params.empty?
  end

  def verbose
    begin
      ar_class = association_class
      associated_values = [ar_class.find(params).to_label]
      verbose_values = associated_values
      return verbose_values
    end unless params.nil? || params.empty?
  end

  def association_name
    @options[:association] || @name
  end

  def association_class
    association = @core.model.reflect_on_association(association_name)
    association.klass
  end
  
  # Custom added
  def association
    @core.model.send(association_name)
  end
end
