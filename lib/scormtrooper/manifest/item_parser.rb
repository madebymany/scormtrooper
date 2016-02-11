module Scormtrooper
  module Manifest
    class ItemParser < Parser
      def parse
        item = Item.new
        item.identifier = node.attributes['identifier']
        item.identifierref = node.attributes['identifierref']
        item.parameters = node.attributes['parameters']
        item.isvisible = node.attributes['isvisible']

        while(node.read && !Utils.is_end_of('item').(node)) do
          case node
            when Utils.is_beginning_of('title')
              item.title = TitleParser.new(node).parse
            when Utils.is_beginning_of('item')
              item.items << ItemParser.new(node).parse
            when Utils.is_beginning_of('metadata')
              # TODO Metadata
            when Utils.is_beginning_of('adlcp:timeLimitAction')
              # TODO Adlcp
            when Utils.is_beginning_of('adlcp:dataFromLMS')
              # TODO Adlcp
            when Utils.is_beginning_of('adlcp:completionThreshold')
              # TODO Adlcp
            when Utils.is_beginning_of('imss:sequencing')
              # TODO Sequencing
            when Utils.is_beginning_of('adlnav:presentation')
              # TODO Presentation
          end
        end

        item
      end
    end
  end
end
