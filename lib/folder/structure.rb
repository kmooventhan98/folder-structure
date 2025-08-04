# frozen_string_literal: true

require_relative "structure/version"

module Folder
  module Structure
    class Error < StandardError; end
    # Your code goes here...
    def self.print_structure
      Dir.pwd
    end
  end
end
