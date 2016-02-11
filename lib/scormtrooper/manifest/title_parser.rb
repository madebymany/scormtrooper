module Scormtrooper
  module Manifest
    class TitleParser < Parser
      attr_accessor :title

      def parse
        node.read
        title = node.value
        node.read
        title
      end
    end
  end
end
