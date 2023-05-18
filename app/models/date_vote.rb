# == Schema Information
#
# Table name: date_votes
#
#  id         :integer          not null, primary key
#  date       :date
#  votes      :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class DateVote < ApplicationRecord
end
