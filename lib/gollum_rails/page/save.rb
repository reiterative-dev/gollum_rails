module GollumRails
  module PageActions
    # Public: .save or .save! builtin extension for GollumRails::Page
    class Save < GollumRails::PageHelper
      # Public: Page.<call_by> . The method call will be generated with this information
      call_by 'save'
      call_by 'save!'
      class << self
        # Public: runs the initializer from superclass ( super clears the error buffer )
        #
        # Returns nothing
        def initialized_first
          super
        end

        # Public: performs upper methods in Page class
        #
        #
        # Examples
        #
        # Loaded
        #   @name, @format, @content, @commit
        #
        # Returns String
        def single_run
          name, format, content, commit = DependencyInjector.page_resource

          begin
            DependencyInjector.wiki.write_page(name, format, content, commit)

          rescue Gollum::DuplicatePageError => e
          end
        end
      end
    end
  end
end