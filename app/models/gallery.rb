# == Schema Information
#
# Table name: galleries
#
#  id          :integer          not null, primary key
#  description :string
#  image       :string
#  trip        :string
#  votes       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
class Gallery < ApplicationRecord
end
