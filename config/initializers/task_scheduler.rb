scheduler = Rufus::Scheduler.start_new

scheduler.every('30 20 * * * *') do
	Company.update_companies
end