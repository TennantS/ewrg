class User < ActiveRecord::Base
  attr_accessor :updating_password
  has_secure_password

  before_save :downcase_email
  before_create { generate_token(:remember_token) }


  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: ConstantData::VALID_EMAIL_REGEX }
  validates :password, presence: true, length: {minimum: 6}, if: :should_validate_password?
  validates :password_confirmation, presence: true, if: :should_validate_password?

  private

    def downcase_email
      self.email.to_s.downcase!
    end

    def generate_token(column)
      begin
        self[column] = SecureRandom.urlsafe_base64
      end while User.exists?(column => self[column])
    end

    def should_validate_password?
      updating_password || new_record?
    end
  
end
 