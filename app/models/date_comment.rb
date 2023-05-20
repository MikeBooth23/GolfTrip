# == Schema Information
#
# Table name: date_comments
#
#  id           :integer          not null, primary key
#  body         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  author_id    :integer
#  trip_date_id :integer
#
class DateComment < ApplicationRecord

  def commenter
    my_author_id = self.author_id

    matching_users = User.where({ :id => my_author_id})

    the_user = matching_users.at(0)

    return the_user

  end
end
