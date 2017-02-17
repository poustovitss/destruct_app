require File.expand_path 'spec/spec_helper'

describe Message, type: :model do
  describe 'validations' do
    context 'for content' do
      it { should validate_presence_of(:content) }
    end

    context 'for ttl' do
      it { should validate_presence_of(:ttl) }
      it { should validate_numericality_of(:ttl).is_greater_than_or_equal_to(1) }
      it { should validate_numericality_of(:ttl).is_less_than(30*24*60*60) }
      it { should validate_numericality_of(:ttl).only_integer }
    end

    context 'for init_views' do
      it { should validate_presence_of(:init_views) }
      it { should validate_numericality_of(:init_views).is_greater_than_or_equal_to(1) }
      it { should validate_numericality_of(:init_views).is_less_than(1000) }
      it { should validate_numericality_of(:init_views).only_integer }
    end
  end

  before :each do
    @default_message = FactoryGirl.create(:message)
    @build_message = FactoryGirl.build(:message)
  end

  describe 'callbacks' do
    before :each do
      @message_with_password = FactoryGirl.create(:message, :with_password)
    end

    it 'set init viewed before create' do
      @build_message.save!
      expect(@build_message.reload.viewed).to be -1
    end

    it 'set unique hash after_create' do
      @build_message.unique_hash = nil
      @build_message.save!
      expect(@default_message.unique_hash).not_to be_nil
    end
  end

  describe 'instance methods' do
    it 'is not expired after create' do
      expect(@default_message.is_expired?).to be false
    end

    it 'is expired after few hours' do
      @default_message.ttl = 0
      expect(@default_message.is_expired?).to be true
    end

    it 'is expired after few views' do
      @default_message.init_views = 1
      @default_message.viewed = 1
      expect(@default_message.is_expired?).to be  true
    end

    it 'has no password by default' do
      expect(@default_message.has_password?).to be false
    end

    it 'has password when set' do
      @default_message.has_password = true
      expect(@default_message.has_password?).to be true
    end

    it 'increase view to 0 on default' do
      @default_message.increase_view
      expect(@default_message.viewed).to be 0
    end

    it 'increase view' do
      10.times { @default_message.increase_view }
      expect(@default_message.viewed).to be 9
    end

    it 'set nil content' do
      @default_message.set_nil_content
      expect(@default_message.content).to eq 'none'
    end
  end

  describe 'factories' do
    it 'has a valid message default factory' do
      expect(FactoryGirl.create(:message)).to be_valid
    end

    it 'has a valid message factory with password' do
      expect(FactoryGirl.create(:message, :with_password)).to be_valid
    end
  end
end