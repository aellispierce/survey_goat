class Author < ActiveRecord::Base
  has_secure_password
  has_many :surveys

  def self.with_specific_email
    Author.find_by_email("shakespeare@example.com")
  end

  def self.most_recent
    Author.order(created_at: :desc).first
  end

  def self.without_surveys
    Author.joins("LEFT JOIN surveys ON authors.id = surveys.author_id").
          order(:id).where("surveys.id IS NULL").all
  end
end
