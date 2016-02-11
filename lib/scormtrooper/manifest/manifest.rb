module Scormtrooper
  module Manifest
    class Manifest
      attr_accessor :organizations, :resources

      def initialize
        @organizations = []
        @resources = []
      end

      def first_item
        default_organization.first_item
      end

      def default_organization
        organizations.detect { |o| o.isdefault }
      end

      def find_resource(item)
        resources.detect { |r| r.identifier == item.identifierref }
      end
    end
  end
end
