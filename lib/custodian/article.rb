module Custodian
  class Article
    attr_accessor :xml
    
    def initialize(xml)
      @xml = xml
    end
    
    def [](search_string)
      xml.search(search_string).first
    end
    
    def method_missing(search_string)
      search_string = search_string.to_s.gsub("_", "-")
      self[search_string].html
    end
  end
end