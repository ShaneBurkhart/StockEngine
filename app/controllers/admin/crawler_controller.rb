class Admin::CrawlerController < ApplicationController
	require "open-uri"
  
  def show
  end

  def execute
  	@data = Company.update_companies
  end
end