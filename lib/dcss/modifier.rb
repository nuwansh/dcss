module Dcss
  # Public: Represents a style modifier. Usually a class return name or description object
  class Modifier
    attr_accessor :name, :description

    def initialize(name, description=nil)
      @name = name.to_s
      @description = description
    end
  end
end
