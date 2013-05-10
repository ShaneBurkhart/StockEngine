class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
    	t.string :symbol
			t.decimal :percent_from_fifty_day_moving_average
			t.decimal	:market_cap
			t.decimal :thirty_day_percent_volume_rate_of_change
      t.timestamps
    end
  end
end