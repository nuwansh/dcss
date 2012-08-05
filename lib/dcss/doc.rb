module Dcss
  #Dcss main parser. This class takes a given directory files of SCSS and parsers the DCSS them
  class Doc
    # Public: Returns a hash of the description sections given DCSS file.
    attr_accessor :sections

    # Initializes a new doc given direcotry fo files. Read fileis within the directory and find DCSS blocks
    def initialize(*paths)
      @sections = {}

      paths.each do |path|
        Dir["#{path}/**/*.*"].each do |filename|
          block_obj = BlockParser.new(filename)
          block_obj.blocks.each do |block|
            add_section block, filename
          end
        end
      end
    end

    def section(reference)
      @sections[reference] || Section.new
    end

    private 
    def add_section comment_text, filename
      base_name = File.basename(filename, ".scss")
      section = Section.new(comment_text, base_name)
      @sections[base_name] = section
    end

  end
end
