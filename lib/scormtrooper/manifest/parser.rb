require 'nokogiri'

module Scormtrooper
  module Manifest
    class Parser
      attr_accessor :node

      def initialize(node)
        @node = node
      end
    end
  end
end
