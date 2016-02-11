module Scormtrooper
  module Manifest
    class Manifest
      attr_accessor :organizations, :resources

      def initialize
        @organizations = []
        @resources = []
      end
    end
  end
end
