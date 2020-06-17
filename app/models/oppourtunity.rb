class Oppourtunity < ApplicationRecord
  mount_uploader :photo, PhotoUploader 
  belongs_to :account

  scope :latest, -> { order created_at: :desc }

  scope :open, -> { where open: true }
  scope :closed, -> { where open: false }
end
