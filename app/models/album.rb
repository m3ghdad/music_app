# == Schema Information
#
# Table name: albums
#
#  id         :integer          not null, primary key
#  title      :string           not null
#  band_id    :integer          not null
#  year       :integer          not null
#  studio     :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Album < ApplicationRecord
  validates :title, :year, :studio, presence: true

  belongs_to :band,
    primary_key: :id,
    foreign_key: :band_id,
    class_name: 'Band'

end
