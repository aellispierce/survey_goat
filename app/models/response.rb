class Response < ActiveRecord::Base
  belongs_to :question
  belongs_to :submission

  def self.most_common_answer(id)
    responses= Response.where("question_id = id")
    responses.select("response_text, count(*) AS count")
  end

end
