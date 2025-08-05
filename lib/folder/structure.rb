# frozen_string_literal: true

require_relative "structure/version"

module Folder
  module Structure
    class Error < StandardError; end
    # Your code goes here...
      def self.print_structure(path = Dir.pwd, prefix = "")
        entries = Dir.children(path).reject { |e| e.start_with?(".") }.sort
        print_entries(entries, path, prefix)
      end

      def self.print_structure_with_hidden(path = Dir.pwd, prefix = "")
        entries = Dir.children(path).sort
        print_entries(entries, path, prefix)
      end

      def self.print_entries(entries, path, prefix)
        entries.each_with_index do |entry, index|
          full_path = File.join(path, entry)
          is_last = index == entries.length - 1
          connector = is_last ? "└── " : "├── "
          puts "#{prefix}#{connector}#{entry}"

          if File.directory?(full_path)
            new_prefix = prefix + (is_last ? "    " : "│   ")
            print_structure_with_hidden(full_path, new_prefix) if respond_to?(:print_structure_with_hidden)
            print_structure(full_path, new_prefix) if respond_to?(:print_structure) && !entry.start_with?(".")
          end
        end
      end



  end 
end
