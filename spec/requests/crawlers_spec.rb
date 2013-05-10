require 'spec_helper'

describe Admin::CrawlerController do

  subject { page }

  describe "Crawler Start Page" do
    before{ visit admin_root_path }

    it{ should have_selector('title', text: 'Stock Engine') }
    it{ should have_selector('h1', text: 'Start Crawling Stock') }
  end

  describe "Search Results Page" do
    before{ visit admin_root_path }

    it{ should have_selector('title', text: 'Stock Engine') }
    it{ should have_selector('h1', text: 'Start Crawling Stock') }
  end
end