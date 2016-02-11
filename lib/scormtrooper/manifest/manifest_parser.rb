module Scormtrooper
  module Manifest
    class ManifestParser
      attr_accessor :manifest, :source

      def initialize(source)
        @source = source
        @manifest = Manifest.new
      end

      def parse
        Nokogiri::XML::Reader(source).each do |node|
          case node
            when Utils.is_beginning_of('organizations')
              @manifest.organizations = OrganizationsParser.new(node).parse
          end
        end
        @manifest
      end
    end
  end
end
