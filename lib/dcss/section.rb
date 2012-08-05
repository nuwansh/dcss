module Dcss

  #Section returns will return the collections of the descriptions tags and styleguides
  class Section

    # @raw: Returns the raw comment text for the sections
    # @filename: Returns the filename
    attr_reader :raw, :filename, :description, :html, :modifiers, :version, :experimental, :deprecated, :compatible

    def initialize(comment_string=nil, filename=nil)
      @raw = comment_string
      @filename = filename
      comment_sections
    end

    private
      def comment_sections
        sections ||= raw ? raw.split("\n\n") : []

        current = sections.shift

        while current 
          
          case current
          when /:description:/
            @description = /:description:/.match(current).post_match.strip
          when /:html:/
            @html = /:html:/.match(current).post_match.strip
          when /:modifiers:/
            @modifiers = parse_modifires(/:modifiers:/.match(current).post_match)
          when /:styleguide:/
            @version = /:styleguide:/.match(current).post_match.strip
          when /:experimental:/
            @experimental = /:experimental:/.match(current).post_match.strip
          when /:deprecated:/
            @deprecated = /:deprecated:/.match(current).post_match.strip
          when /:compatible:/
            @compatible = /:compatible:/.match(current).post_match.strip
          end

          current = sections.shift
        end
      end

      def parse_modifires(modifier_comment_block)
        modifiers = []

        modifier_comment_block.split("\n").each do |line|
          next if line.strip.empty?
          
          #slipt modifier and description
          modifier, desc = line.split(" - ")

          modifiers << Modifier.new(modifier.strip, desc.strip) if modifier && desc
        end
        modifiers
      end

  end
end
