require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create(:user, email: "TEST@TEST.TEST") }
  
  describe "should respond to its attributes" do
    it { should respond_to(:email) }
    it { should respond_to(:password) }
    it { should respond_to(:password_confirmation) }
    it { should respond_to(:password_digest) }
    it { should respond_to(:remember_token) }
    it { should respond_to(:authenticate) }
    it { should be_valid }
  end

  describe "should be related to other classes" do

  end

  describe "should only allow valid attributes" do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_confirmation) }

    it { should validate_uniqueness_of(:email) }

    it { should ensure_length_of(:username).is_at_most(50)}
    it { should ensure_length_of(:password).is_at_least(6)}

    it { should allow_value("a@b.com").for(:email) }
    it { should allow_value("a@b.museum").for(:email) } #sufficiently long/weird
    it { should_not allow_value("ab.com").for(:email) }
    it { should_not allow_value("a@bcom").for(:email) }
    it { should_not allow_value("a@@b.com").for(:email) }
    it { should_not allow_value("!a@b.com").for(:email) }

    describe "should not allow differing password and password_confirmation" do
      before { user.password_confirmation = "mismatch" }
      it { should_not be_valid }
    end

  end

  describe "a saved user" do
    it "should save with a lowercase email" do
      user.reload.email.should == "test@test.test"
    end
    
    it "should save with a remember_token" do
      user.reload.remember_token.should_not be_nil
    end

    it "should save with an activation_token" do
      user.reload.activation_token.should_not be_nil
    end
  end

end