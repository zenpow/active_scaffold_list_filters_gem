require 'rails/generators'

module ActiveScaffoldListFilters
  class InstallGenerator < Rails::Generators::Base
    desc "Installation for ActiveScaffoldListFilters"

    def install
      gem_dir     = File.dirname(__FILE__)
      source      = "#{gem_dir}/../../../app/views/active_scaffold_list_filters/*.*"
      destination = Rails.root.join("app/views/active_scaffold_list_filters")

      FileUtils.mkdir(destination) unless File.exist?(destination)
      FileUtils.cp_r Dir.glob(source), destination

      puts "ActiveScaffoldListFilter views are now copied"
    end
  end
end
