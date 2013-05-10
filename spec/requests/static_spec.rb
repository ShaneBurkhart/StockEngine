require 'spec_helper'

describe "Static Pages" do
  
  subject { page }

  describe "Home Page" do
  	before{ visit root_path }

  	it{ should have_selector('title', text: 'Stock Engine') }
  	it{ should have_selector('h1', text: 'Search For Stocks') }
  end

  describe "Results Page" do
  	before{ visit results_path }

  	it{ should have_selector('title', text: 'Results - Stock Engine') }
  	it{ should have_selector('h1', text: 'Results') }
  end
end