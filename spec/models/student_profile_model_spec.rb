require 'rails_helper'

describe StudentProfile, type: :model do
  it 'StudentProfile class implemented' do
    expect(class_exists?('StudentProfile'))
    expect(StudentProfile < ActiveRecord::Base).to eq(true)
  end
  context 'StudentProfile class properties defined' do
    subject(:student) { StudentProfile.new }
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:native_language) }
    it { is_expected.to respond_to(:learning_objectives) }
    it { is_expected.to respond_to(:skype_username)}
  end
  context 'Student profile validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:native_language) }
    it { should validate_presence_of(:learning_objectives) }
  end

  context "StudentProfile associations" do
    context "StudentProfile 1:1 belongs_to relationship to Student in place" do
      it { should belong_to(:student) }
    end
  end
end
