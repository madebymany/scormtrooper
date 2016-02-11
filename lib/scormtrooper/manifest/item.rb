module Scormtrooper
  module Manifest
    class Item
      attr_accessor :identifier, :identifierref, :parameters,
        :isvisible, :title, :items

      def initialize
        @items = []
      end

      def leaf?
        @items.empty?
      end

      def first_item
        if items.any?
          items.first.first_item
        else
          self
        end
      end
    end
  end
end
