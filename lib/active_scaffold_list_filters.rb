require 'active_scaffold_list_filters/version'
require 'active_scaffold_list_filters/active_scaffold/'
require 'active_scaffold_list_filters/active_scaffold/actions/'
require 'active_scaffold_list_filters/active_scaffold/config/'
require 'active_scaffold_list_filters/active_scaffold/data_structures/'
require 'active_scaffold_list_filters/active_scaffold/helpers/'
require 'active_scaffold_list_filters/extensions/'
require 'active_scaffold_list_filters/list_filters/'

module ActiveScaffoldListFilters

  if Rails::VERSION::MAJOR <= 3
    raise "This version of ActiveScaffoldListFilters requires Rails 3.0 or higher.  Please use an earlier version."
  else
    ActiveScaffold::Config::Core.send(:include, Extensions::Core)
    ActionDispatch::Routing::ACTIVE_SCAFFOLD_CORE_ROUTING[:collection][:export] = :get
    ActionView::Base.send(:include, ActiveScaffoldListFilter::ViewHelpers)
  end

end
