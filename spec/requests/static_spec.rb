require 'spec_helper'

describe "Static Pages" do
  
  subject { page }

  describe "Search Page" do
  	before{ visit root_path }

  	it{ should have_selector('title', text: 'Stock Engine') }
  	it{ should have_selector('h1', text: 'Search For Stocks') }
  end
end