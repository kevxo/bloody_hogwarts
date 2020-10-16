require 'rails_helper'

RSpec.describe 'As a visitor' do
  describe 'When I visit /courses' do
    it 'should see a list of courses and the number of students in each course' do
      student1 = Student.create!(name: 'John', age: 8, house: 'Slytherian')
      student2 = Student.create!(name: 'Phil', age: 9, house: 'Ravenclaw')
      student3 = Student.create!(name: 'Kim', age: 8, house: 'Gryffindor')
      course1 = Course.create!(name: 'Herbology')
      course2 = Course.create!(name: 'Defense against the Dark Arts')
      course3 = Course.create!(name: 'Potions')
      courses1 = StudentCourse.create!(student: student1, course: course1)
      courses2 = StudentCourse.create!(student: student1, course: course2)
      courses3 = StudentCourse.create!(student: student1, course: course3)
      courses4 = StudentCourse.create!(student: student2, course: course1)
      courses5 = StudentCourse.create!(student: student2, course: course2)
      courses6 = StudentCourse.create!(student: student3, course: course3)
      courses7 = StudentCourse.create!(student: student3, course: course1)

      visit '/courses'

      expect(page).to have_content("Herbology: 3")
      expect(page).to have_content("Defense against the Dark Arts: 2")
      expect(page).to have_content("Potions: 2")
    end
  end
end