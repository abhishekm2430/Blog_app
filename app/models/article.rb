class Article < ActiveRecord::Base
	has_many :comments, dependent: :destroy
  has_many :photos, as: :imageable
  belongs_to :user
	validates :title, presence: true,
					  length: {minimum: 5}
  validate :user_id_should_be_present
  
   def user_id_should_be_present
    if user_id.nil? || !(User.where("id = ?", user_id).exists?)
      errors.add(:user_id, "Should be present")
    end
  end          
end
