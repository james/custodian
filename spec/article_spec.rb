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
    @search = Custodian::Article.extract_articles(File.open(File.dirname(__FILE__) + '/search.xml'))
  end

  it "should create an array of 10 Article instances" do
    @search.class.should == Array
    @search.size.should == 10
    @search.each {|x| x.class.should == Custodian::Article}
  end
end

describe "Counting results for a particular query" do
  before(:each) do
    Custodian::Article.stub!(:count_tags).and_return(Hpricot(File.open(File.dirname(__FILE__) + '/search.xml')).search("/search").first.attributes["count"].to_i)
  end
  
  it "should return the total number of available results for a query" do
    Custodian::Article.count_tags(:q => "uk").should == 1007029
  end
end


describe "An article" do
  before(:each) do
    @article = Custodian::Article.new(Hpricot(File.open(File.dirname(__FILE__) + '/article.xml')))
  end

  it "should return the innerHTML of a single xml field on method_missing" do
    @article.publication.should == "guardian.co.uk"
  end
  
  it "should replace section-name with section-name on method_missing" do
    @article.section_name.should == "Media"
  end
end
