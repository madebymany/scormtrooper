module Scormtrooper
  module Manifest
    class Organization
      attr_accessor :identifier, :title, :items, :isdefault

      def initialize
        @items = []
        @isdefault = false
      end
    end
  end
end
