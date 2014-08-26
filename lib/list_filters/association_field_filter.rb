class ListFilters::AssociationFieldFilter < ActiveScaffold::DataStructures::ListFilter
  attr_accessor :association_field

  # Return a list of conditions based on the params 
  def find_options
    begin
      association = association_class
      options = {}
      options[:include] = association_name
      options[:conditions] = ["#{association.table_name}.#{association_field} LIKE ?", "%#{params[0]}%"]

      return options      
    end unless params.nil? || params[0].blank?
  end

  def verbose
    begin
      params[0] unless params[0].blank?
    end unless params[0].blank?
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
