module Scormtrooper
  module Manifest
    class OrganizationsParser < Parser
      attr_accessor :organizations

      def parse
        organizations = []
        default_organization_id = node.attributes['default']
        current_organization = Organization.new

        while (node.read && !Utils.is_end_of('organizations').(node)) do
          case node
            when Utils.is_beginning_of('organization')
              current_organization.identifier = node.attributes['identifier']
              current_organization.isdefault = (current_organization.identifier == default_organization_id)
            when Utils.is_beginning_of('title')
              current_organization.title = TitleParser.new(node).parse
            when Utils.is_beginning_of('item')
              current_organization.items << ItemParser.new(node).parse
            when Utils.is_beginning_of('sequencing')
              # TODO Sequencing
            when Utils.is_beginning_of('metadata')
              # TODO Metadata
            when Utils.is_end_of('organization')
              organizations << current_organization
              current_organization = Organization.new
          end
        end

        organizations
      end
    end
  end
end
