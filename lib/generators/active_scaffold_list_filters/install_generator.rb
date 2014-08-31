require 'rails/generators'

module ActiveScaffoldListFilters
  class InstallGenerator < Rails::Generators::Base
    desc "Installation for ActiveScaffoldListFilters"

    def install
      FileUtils.cp_r("app/views/", Rails.root.join("app/views/").to_s)
    end
  end
end
