class Link < ApplicationRecord

  validates :user_id, presence: true
  validates :uuid, presence: true
  validates :redirect, presence: true

  belongs_to :user

end
