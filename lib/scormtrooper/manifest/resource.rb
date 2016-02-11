module Scormtrooper
  module Manifest
    class Resource
      attr_accessor :identifier, :type, :scorm_type, :href, :files

      def initialize()
        @files = []
      end
    end
  end
end
