# load all our files, eventually figure out how to get these to load by themselves by convention
$:.unshift(File.dirname(__FILE__))

require "#{File.dirname(__FILE__)}/lib/helpers/view_helpers.rb"
require "#{File.dirname(__FILE__)}/lib/active_scaffold/helpers/view_helpers.rb"

ActiveScaffold::Config::Core.send(:include, Extensions::Core)

# custom
ActionDispatch::Routing::ACTIVE_SCAFFOLD_CORE_ROUTING[:collection][:export] = :get

## replace 
# ActionView::Base.send(:include, Helpers::ViewHelpers)

ActionView::Base.send(:include, ActiveScaffoldListFilter::ViewHelpers)
