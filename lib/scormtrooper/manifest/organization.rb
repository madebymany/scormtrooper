module Scormtrooper
  module Manifest
    class Organization
      attr_accessor :identifier, :title, :items, :isdefault

      def initialize
        @items = []
        @isdefault = false
      end

      def first_item
        items.first.first_item
      end

      def menu_needed?
        items.count > 1
      end
    end
  end
end
