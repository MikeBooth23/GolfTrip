# == Schema Information
#
# Table name: members
#
#  id         :integer          not null, primary key
#  bio        :string
#  hometown   :string
#  image      :string
#  name       :string
#  nickname   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Member < ApplicationRecord
end
