module Scormtrooper
  module Manifest
    class Item
      attr_accessor :identifier, :identifierref, :parameters,
        :isvisible, :title, :items

      def initialize
        @items = []
      end
    end
  end
end
