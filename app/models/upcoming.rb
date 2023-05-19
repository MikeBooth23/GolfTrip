# == Schema Information
#
# Table name: upcomings
#
#  id          :integer          not null, primary key
#  downvote    :integer
#  image       :string
#  location    :string
#  price_range :string
#  upvote      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Upcoming < ApplicationRecord
end


# validates :user_id, { :uniqueness => { :scope => :upcoming_id } }
