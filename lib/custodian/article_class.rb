module Custodian
  class Article
    require 'hpricot'
  
    def self.find(type, conditions={})
      if type.class == Fixnum
        find_article_by_id(type)
      elsif type == :first
        find_articles_by_conditions(conditions.merge({:limit => 1}).first)
      elsif type == :all
        find_articles_by_conditions(conditions)
      else
        raise "Does not support type #{type}"
      end
    end
  
    def self.find_article_by_id(id)
    
    end
  
    def self.find_articles_by_conditions(conditions={})
      conditions = normalise_conditions(conditions)
      Hpricot(request('/content/search', conditions))
    end
  
    private
  
    def self.request(resource, args = nil)
      url = URI.join('http://api.guardianapis.com', resource)
      if args
  			url.query = args.map { |k,v| "%s=%s" % [URI.encode(k), URI.encode(v)] }.join("&")
  		end
		
  		req = Net::HTTP::Get.new(url.request_uri)
  		http = Net::HTTP.new(url.host, url.port)
      # http.use_ssl = (url.port == 443)

  		res = http.start() { |conn| conn.request(req) }
  		res.body
    end
  
    def self.normalise_conditions(conditions)
      conditions['api_key'] ||= Custodian.api_key
      conditions
    end
  end
end