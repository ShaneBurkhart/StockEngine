# == Schema Information
#
# Table name: companies
#
#  id                                       :integer          not null, primary key
#  symbol                                   :string(255)
#  percent_from_fifty_day_moving_average    :decimal(, )
#  market_cap                               :decimal(, )
#  thirty_day_percent_volume_rate_of_change :decimal(, )
#  created_at                               :datetime         not null
#  updated_at                               :datetime         not null
#

class Company < ActiveRecord::Base
  attr_accessible :symbol, :percent_from_fifty_day_moving_average, :market_cap,
                  :thirty_day_percent_volume_rate_of_change, :name

  #Symbol, Percent From 50 MA, Market Cap, Name
  FORMAT = "s0m8j3n0"
  NUM_PER_REQUEST = 50

  require 'csv'

  def self.update_companies
    puts 'Updating Data'
  	data = []
    excluded = []
  	tickers = Company.get_tickers
  	for i in 1..(tickers.length/NUM_PER_REQUEST + 1)
  		min = (i - 1) * NUM_PER_REQUEST
  		max = i * NUM_PER_REQUEST > tickers.length ? tickers.length - 1 : i * NUM_PER_REQUEST - 1
  		symbols = tickers[min..max].join(",")
  		url = "http://download.finance.yahoo.com/d/quotes.csv?s=#{symbols}&f=#{FORMAT}&e=.csv"	
  		d = CSV.parse(open(url).read().gsub(/\%/, ""))
  		for j in 0..(d.length - 1)
  			columns = d[j]
        begin
          hist = CSV.parse(open(Company.get_one_month_historic_url(columns[0])).read().gsub(/[^\S\n]/, ""))
          if (Company.is_number?(hist[hist.length - 1][5]) && Company.is_number?(hist[1][5]))
            vol_n = Float(hist[hist.length - 1][5])
            vol_t = Float(hist[1][5])
            vroc = (vol_t - vol_n) / vol_n * 100
          else
            vroc = 0
          end
          vroc = vroc.nan? ? 0 : vroc
          o = Company.where(symbol: columns[0]).first_or_create
          o.update_attributes(percent_from_fifty_day_moving_average: columns[1],
                market_cap: columns[2], name: columns[3], thirty_day_percent_volume_rate_of_change: vroc)
        rescue
          excluded << columns[0]
        end
  		end
  	end
    return excluded
  end

  private
	  def self.get_tickers
	  	path = "files/tickers.csv"
			CSV.parse(open(path).read().gsub(/[^\S\n]/, ""))
	  end

    def self.get_one_month_historic_url(symbol)
      today = Date.today
      prev = today.prev_month
      "http://ichart.yahoo.com/table.csv?s=#{ symbol }&a=#{ prev.month - 1 }&b=#{ prev.day }&c=#{ prev.year }&d=#{ today.month }&e=#{ today.day }&f=#{ today.year }&g=d&ignore=.csv"
    end

    def self.is_number?(object)
      true if Float(object) rescue false
    end
end
