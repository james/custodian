require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Searching for multiple Articles" do
  before(:each) do
    Custodian.api_key = 'ca5vtx73fdrrydq7vwrxvqvn'
  end

  it "should create a new instance given valid attributes" do
    Custodian::Article.find(:all, 'q' => "James Darling")
  end
end
