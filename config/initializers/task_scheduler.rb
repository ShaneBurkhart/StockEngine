require 'rubygems'
require 'rufus-scheduler'

scheduler = Rufus::Scheduler.start_new

scheduler.cron '30 20 * * * *' do
	Company.update_companies
end