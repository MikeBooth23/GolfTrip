# == Schema Information
#
# Table name: datetables
#
#  id         :integer          not null, primary key
#  date       :date
#  downvotes  :integer
#  upvotes    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Datetable < ApplicationRecord
end
