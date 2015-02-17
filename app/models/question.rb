class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :options, dependent: :destroy
  has_many :responses, dependent: :destroy

  validates :question_text, presence: true

  accepts_nested_attributes_for :options,
      :allow_destroy => true,
      :reject_if     => :all_blank

  def self.num_types
    Question.select("question_type, count(*) AS count").
       group(:question_type).
       order("count(*)").all
  end


end
