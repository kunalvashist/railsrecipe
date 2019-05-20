class Chef < ApplicationRecord
  before_save { self.email = self.email.to_s.downcase }
  validates :name, presence: true, length: { maximum:30 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:255},format: {with:VALID_EMAIL_REGEX},uniqueness: { case_sensitive: true}
  has_many :recipes
end