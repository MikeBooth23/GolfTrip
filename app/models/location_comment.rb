class LocationComment < ApplicationRecord

  def commenter
    my_author_id = self.author_id

    matching_users = User.where({ :id => my_author_id})

    the_user = matching_users.at(0)

    return the_user

  end
end
