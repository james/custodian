module Custodian
  class Article
    attr_accessor :xml
    
    def initialize(xml)
      @xml = xml
    end
    
    def [](search_string)
      xml.search(search_string)
    end
  end
end