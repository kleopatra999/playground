require 'spec_helper'

describe "topics/show" do
  before(:each) do
    @topic = assign(:topic, stub_model(Topic,
      :title => "Title",
      :content => "Content"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/Content/)
  end
end
