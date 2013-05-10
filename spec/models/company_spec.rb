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

require 'spec_helper'

describe Company do
  pending "add some examples to (or delete) #{__FILE__}"
end
