module Scormtrooper
  module Manifest
    module Utils
      def self.is_beginning_of(name)
        ->(n) { n.name == name && is_start(n) }
      end

      def self.is_end_of(name)
        ->(n) { n.name == name && is_end(n) }
      end

      def self.is_start(n)
        n.node_type == Nokogiri::XML::Reader::TYPE_ELEMENT
      end

      def self.is_end(n)
        n.node_type == Nokogiri::XML::Reader::TYPE_END_ELEMENT
      end
    end
  end
end
