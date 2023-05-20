# == Schema Information
#
# Table name: date_votes
#
#  id         :integer          not null, primary key
#  downvotes  :integer
#  upvotes    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date_id    :integer
#  user_id    :integer
#
class DateVote < ApplicationRecord
end
