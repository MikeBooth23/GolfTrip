# == Schema Information
#
# Table name: historicals
#
#  id           :integer          not null, primary key
#  date         :date
#  losing_team  :string
#  punishment   :string
#  winning_team :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Historical < ApplicationRecord
end
