module Custodian
  class Article
    attr_accessor :xml
    
    def initialize(xml)
      @xml = xml
    end
    
    def [](search_string)
      xml.search(search_string)
    end
    
    def method_missing(search_string)
      search_string = search_string.to_s.gsub("_", "-")
      if self[search_string].size == 0
        #raise NoMethodError
        nil
      else
        self[search_string].html
      end
    end
    
    def api_url
      xml.attributes["api-url"]
    end
    
    def web_url
      xml.attributes["web-url"]
    end
    
  end
end