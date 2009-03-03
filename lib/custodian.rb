$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Custodian
  VERSION = '0.0.1'
  def self.api_key
    @@api_key
  end
  def self.api_key=(api_key)
    @@api_key = api_key
  end
  
end

require 'net/http'

require 'rubygems'
require 'hpricot'

require 'custodian/article'
require 'custodian/article_class'