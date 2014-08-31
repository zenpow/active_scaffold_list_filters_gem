require 'active_scaffold'
require 'active_scaffold_list_filters/version'
require 'active_scaffold_list_filters/active_scaffold/actions/list_filter'
require 'active_scaffold_list_filters/active_scaffold/config/list_filter'
require 'active_scaffold_list_filters/active_scaffold/data_structures/list_filter'
require 'active_scaffold_list_filters/active_scaffold/data_structures/list_filters'
require 'active_scaffold_list_filters/active_scaffold/helpers/view_helpers'
require 'active_scaffold_list_filters/extensions/core'
require 'active_scaffold_list_filters/helpers/id_helpers'
require 'active_scaffold_list_filters/helpers/view_helpers'
require 'active_scaffold_list_filters/list_filters'
require 'active_scaffold_list_filters/list_filters/association_field_filter'
require 'active_scaffold_list_filters/list_filters/association_filter'
require 'active_scaffold_list_filters/list_filters/association_select_filter'
require 'active_scaffold_list_filters/list_filters/boolean_filter'
require 'active_scaffold_list_filters/list_filters/date_filter'
require 'active_scaffold_list_filters/list_filters/empty_or_not_filter'
require 'active_scaffold_list_filters/list_filters/field_begins_with_filter'
require 'active_scaffold_list_filters/list_filters/field_contains_filter'
require 'active_scaffold_list_filters/list_filters/field_filter'
require 'active_scaffold_list_filters/list_filters/field_set_filter'
require 'active_scaffold_list_filters/list_filters/number_within_range_filter'
require 'active_scaffold_list_filters/list_filters/record_select_association_filter'
require 'active_scaffold_list_filters/list_filters/states_filter'

module ActiveScaffoldListFilters

  if Rails::VERSION::MAJOR <= 3
    raise "This version of ActiveScaffoldListFilters requires Rails 3.0 or higher.  Please use an earlier version."
  else
    ActiveScaffold::Config::Core.send(:include, Extensions::Core)
    ActionDispatch::Routing::ACTIVE_SCAFFOLD_CORE_ROUTING[:collection][:export] = :get
    ActionView::Base.send(:include, ActiveScaffoldListFilter::ViewHelpers)
  end

end
