module Custodian
  class Tag
    require 'hpricot'
    
    def self.count(conditions)
      conditions = normalise_conditions(conditions)
      count_tags(request('/content/tags', conditions))
    end
  
    def self.find(type, conditions={})
      if type == :all
        find_tags_by_conditions(conditions)
      else
        raise "Does not support type #{type}"
      end
    end
  
    def self.find_tags_by_conditions(conditions={})
      conditions = normalise_conditions(conditions)
      extract_tags(request('/content/tags', conditions))
    end
    
    def self.extract_tags(xml)
      Hpricot(xml).search('//tags/tag').collect{|r| Tag.new(r)}
    end
    
    def self.count_tags(xml)
      Hpricot(xml).search("/tags").first.attributes["count"].to_i
    end
  
    private
  
    def self.request(resource, args = nil)
      
      url = URI.join('http://api.guardianapis.com', resource)
      if args
    		url.query = args.map { |k,v| "%s=%s" % [URI.encode(k.to_s), URI.encode(v)] }.join("&")
    	end
  		
    	#puts "http://#{url.host}#{url.request_uri}"
		  
		  begin
    		req = Net::HTTP::Get.new(url.request_uri)
    		if Custodian.proxy_addr && Custodian.proxy_port
    		  http = Net::HTTP::Proxy(Custodian.proxy_addr, Custodian.proxy_port).new(url.host, url.port)
  		  else
    		  http = Net::HTTP.new(url.host, url.port)
  		  end
        # http.use_ssl = (url.port == 443)

    		res = http.start() { |conn| conn.request(req) }
    		res.body
  		rescue
  		  throw "An Error Occurred connecting: #{$!}"
		  end
    end
  
    def self.normalise_conditions(conditions)
      conditions['api_key'] ||= Custodian.api_key
      conditions
    end
  end
end