require File.dirname(__FILE__) + '/spec_helper.rb'

describe "Using the find method with :all" do
  it "should call find_tags_by_conditions" do
    Custodian::Tag.should_receive(:find_tags_by_conditions)
    Custodian::Tag.find(:all)
  end
end

describe "Processing 10 tag search results" do
  before(:each) do
    @search = Custodian::Tag.extract_tags(File.open(File.dirname(__FILE__) + '/tags.xml'))
  end

  it "should create an array of 10 Tag instances" do
    @search.class.should == Array
    @search.size.should == 10
    @search.each {|x| x.class.should == Custodian::Tag}
  end
end

describe "Counting results for a particular query" do
  before(:each) do
    @search = Custodian::Tag.extract_tags(File.open(File.dirname(__FILE__) + '/tags.xml'))
    Custodian::Tag.stub!(:count_tags).and_return(Hpricot(File.open(File.dirname(__FILE__) + '/tags.xml')).search("/tags").first.attributes["count"].to_i)
  end
  
  it "should return the total number of available results for a query" do
    Custodian::Tag.count_tags(:q => "uk").should == 13
  end
end

describe "A tag" do
  before(:each) do
    @tag = Custodian::Tag.new(Hpricot(File.open(File.dirname(__FILE__) + '/tag.xml')))
  end

  it "should return the value of an attribute on method missing" do
    @tag.name.should == "UK general election 2001"
  end
end
