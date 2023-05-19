# == Schema Information
#
# Table name: location_votes
#
#  id          :integer          not null, primary key
#  downvotes   :integer
#  upvotes     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  location_id :integer
#  user_id     :integer
#
class LocationVote < ApplicationRecord
end
