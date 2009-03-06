$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module Custodian
  VERSION = '0.0.2'
  
  def self.proxy_addr
    @@proxy_addr
  end
  
  def self.proxy_port
    @@proxy_port
  end
  
  def self.proxy_addr=(proxy_addr)
    @@proxy_addr = proxy_addr
  end
  
  def self.proxy_port=(proxy_port)
    @@proxy_port = proxy_port
  end
  
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

require 'custodian/tag'
require 'custodian/tag_class'