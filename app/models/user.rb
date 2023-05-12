# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  #validates :last_name, :uniqueness => { :case_sensitive => false }
  #validates :last_name, :presence => true
  has_secure_password
end
