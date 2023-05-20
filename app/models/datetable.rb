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
  def comment
    my_id = self.id

    matching_comments = DateComment.where({:trip_date_id => self.id})

    return matching_comments
  end
end
