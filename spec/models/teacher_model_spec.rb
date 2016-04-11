require 'rails_helper'

describe Teacher, type: :model do
  it "Teacher class implemented" do
    expect(class_exists?("Teacher"))
    expect(Teacher < ActiveRecord::Base).to eq(true)
  end
  context "Teacher class properties defined" do
    subject(:teacher) { Teacher.new }
    it { should have_db_column(:email) }
    it { should have_db_column(:encrypted_password) }
    it { should have_db_column(:created_at) }
    it { should have_db_column(:updated_at) }
  end
  context "A Teacher's TeacherProfile is deleted when the teacher is deleted" do
    it "Teacher model has dependent destroy option" do
      expect(Teacher.reflect_on_association(:teacher_profile).options[:dependent]).to eq :destroy
    end
  end
  context 'Teacher associations'
  it 'Should have and belong to many students' do
    should have_and_belong_to_many(:students)
  end
  it 'Should have one teacher_profile' do
    should have_one(:teacher_profile)
  end
end
