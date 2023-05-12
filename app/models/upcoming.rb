# == Schema Information
#
# Table name: upcomings
#
#  id          :integer          not null, primary key
#  image       :string
#  location    :string
#  price_range :string
#  votes       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Upcoming < ApplicationRecord
end
