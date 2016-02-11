module Scormtrooper
  module Manifest
    class ResourcesParser < Parser
      attr_accessor :resources

      def parse
        resources = []
        current_resource = Resource.new
        # TODO Add xml:base support here

        while (node.read && !Utils.is_end_of('resources').(node)) do
          case node
            when Utils.is_beginning_of('resource')
              current_resource.identifier = node.attributes['identifier']
              current_resource.type = node.attributes['type']
              current_resource.scorm_type = node.attributes['adlcp:scormType']
              current_resource.href = node.attributes['href']
              # TODO Add xml:base support here as well
            when Utils.is_beginning_of('file')
              current_resource.files << node.attributes['href']
            when Utils.is_beginning_of('dependency')
              # TODO Dependency
            when Utils.is_beginning_of('metadata')
              # TODO Metadata
            when Utils.is_end_of('resource')
              resources << current_resource
              current_resource = Resource.new
          end
        end

        resources
      end
    end
  end
end
