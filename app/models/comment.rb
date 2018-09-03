class Comment < ActiveRecord::Base
  belongs_to :article
  belongs_to :user
  validates :body, presence: true 
  validate :article_id_should_be_present, :user_id_should_be_present

  def article_id_should_be_present
    if article_id.nil? || !(Article.where("id = ?", article_id).exists?)
      errors.add(:article_id, "Should be present")
    end
  end

  def user_id_should_be_present
    if user_id.nil? || !(User.where("id = ?", user_id).exists?)
      errors.add(:user_id, "Should be present")
    end
  end
end
