module Dcss
  #Public: Retreive a file in given file text and extract comments blocks from it.
  #Examples:  /* Mulit line styles*/
  #
  #Credit: KSS project (https://github.com/kneath/kss/blob/master/lib/kss/comment_parser.rb)
  class BlockParser

    #@file_path: Full file path of related directory
    #@block: Find the commentes blocks one file
    def initialize(file_path)
      @file_path = file_path
      @blocks = []
      @parsed = false
    end

    def blocks
      @parsed ? @blocks : find_comment_blocks
    end

    private 
    def find_comment_blocks
      #Open the given file
      File.open @file_path do |doc|
        inside_multi_line_block = false
        current_block = nil

        doc.each_line do |line|
          if self.class.start_multi_line_comment?(line) || inside_multi_line_block
            parsed = self.class.parse_multi_line line
            if inside_multi_line_block
              current_block += "\n#{parsed}"
            else
              current_block = parsed
              inside_multi_line_block = true
            end

            # End a multi-line block if detected
            inside_multi_line_block = false if self.class.end_multi_line_comment?(line)

            # Store the current block if we're done
            unless inside_multi_line_block
              #@blocks << normalize(current_block) unless current_block.nil?
              @blocks << current_block unless current_block.nil?

              #inside_single_line_block = false
              current_block = nil
            end

          end
        end 

      end

      @parsed = true
      @blocks
    end

    class << self
      def start_multi_line_comment?(line)
        !!(line =~ /^\s*\/\*/)
      end

      def parse_multi_line(line)
        cleaned = line.to_s.sub(/\s*\/\*/, '')
        cleaned = cleaned.sub(/\*\//, '')
        cleaned.rstrip
      end

      def end_multi_line_comment?(line)
        #return false if self.single_line_comment?(line)
        !!(line =~ /.*\*\//)
      end
    end
  end
end
