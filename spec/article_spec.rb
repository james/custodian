require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Using the find method with an ID" do
  it "should call find_article_by_id" do
    Custodian::Article.should_receive(:find_article_by_id)
    Custodian::Article.find(1234)
  end
end

describe "Using the find method with :all" do
  it "should call find_articles_by_conditions" do
    Custodian::Article.should_receive(:find_articles_by_conditions)
    Custodian::Article.find(:all)
  end
end

describe "Using the find method with :first" do
  it "should call find_articles_by_conditions with {:limit => 1}" do
    Custodian::Article.should_receive(:find_articles_by_conditions).and_return([])
    Custodian::Article.find(:first)
  end
end

describe "Processing 10 search results" do
  before(:each) do
    Custodian.api_key = 'ca5vtx73fdrrydq7vwrxvqvn'
    @search = Custodian::Article.extract_articles(File.open(File.dirname(__FILE__) + '/search.xml'))
  end

  it "should create an array of 10 Article instances" do
    @search.class.should == Array
    @search.size.should == 10
    @search.each {|x| x.class.should == Custodian::Article}
  end
end
