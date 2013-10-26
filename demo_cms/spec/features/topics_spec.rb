require 'spec_helper'

describe "Topics" do
  describe "Admin" do
    let(:admin) { create(:admin) }
    
    # Signin with admin
    before(:each) do
      visit new_user_session_path
      fill_in "Email", with: admin.email
      fill_in "Password", with: admin.password
      click_button "Sign in"
      page.should have_content "Signed in successfully."
    end

    it "Admin can visit all topics" do
      topics = create_list(:topic, 10)

      visit topics_path
      page.should have_content "Listing topics (#{topics.count})"

      visit topic_path topics[0]
      page.should have_content topics[0].title

      visit topic_path topics[1]
      page.should have_content topics[1].title
    end

    it "Admin can create topic" do
      visit new_topic_path
      fill_in "Title", with: "title t1"
      fill_in "Content", with: "content t1"
      click_button "Create Topic"
      page.should have_content("Topic was successfully created.")
      page.should have_content("title t1")
    end
  end

  describe "Member" do
    let(:member) { create(:member) }

    # Signin with admin
    before(:each) do
      visit new_user_session_path
      fill_in "Email", with: member.email
      fill_in "Password", with: member.password
      click_button "Sign in"
      page.should have_content "Signed in successfully."
    end

    it "Member can visit all topics" do
      topics = create_list(:topic, 10)

      visit topics_path
      page.should have_content "Listing topics (10)"

      visit topic_path topics[0]
      page.should have_content topics[0].title

      visit topic_path topics[1]
      page.should have_content topics[1].title
    end

    it "Member cannot create topic" do
      expect { visit new_topic_path }.to raise_exception CanCan::AccessDenied
    end
  end

  describe "NonMember" do
    it "Non Member can visit all public topics" do
      topics = create_list(:topic, 10)

      visit topics_path
      page.should have_content "Listing topics (5)"

      public_topic = topics.select { |topic| topic.visible == 'public' }.first
      visit topic_path public_topic
      page.should have_content public_topic.title

      # Can not visit prevate topic
      private_topic = topics.select { |topic| topic.visible == 'private' }.first
      expect { visit topic_path private_topic }.to raise_exception CanCan::AccessDenied
    end

    it "Non Member cannot create topic" do
      visit new_topic_path
      page.should have_content "You need to sign in or sign up before continuing."
    end
  end
end
