require 'rails/generators'

module ActiveScaffoldListFilters
  class UninstallGenerator < Rails::Generators::Base
    desc "Uninstallation for ActiveScaffoldListFilters"

    def uninstall
      destination = Rails.root.join("app/views/active_scaffold_list_filters")

      FileUtils.rmtree(destination)

      puts "ActiveScaffoldListFilter views are now removed"
    end

  end
end
