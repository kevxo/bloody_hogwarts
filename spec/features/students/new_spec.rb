require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit /students/:id' do
    it 'should display the students courses' do
      student1 = Student.create!(name: 'John', age: 8, house: 'Slytherian')
      student2 = Student.create!(name: 'Phil', age: 9, house: 'Ravenclaw')
      student3 = Student.create!(name: 'Kim', age: 8, house: 'Gryffindor')
      course1 = Course.create!(name: 'Herbology')
      course2 = Course.create!(name: 'Defense against the Drak Arts')
      course3 = Course.create!(name: 'Potions')
      courses1 = StudentCourse.create!(student: student1, course: course1)
      courses2 = StudentCourse.create!(student: student1, course: course2)
      courses3 = StudentCourse.create!(student: student1, course: course3)
      courses4 = StudentCourse.create!(student: student2, course: course1)
      courses5 = StudentCourse.create!(student: student2, course: course2)
      courses6 = StudentCourse.create!(student: student3, course: course3)
      courses7 = StudentCourse.create!(student: student3, course: course1)

      visit "/students/#{student1.id}"

      expect(page).to have_content(courses1.course.name)
      expect(page).to have_content(courses2.course.name)
      expect(page).to have_content(courses3.course.name)

      visit "/students/#{student2.id}"

      expect(page).to have_content(courses4.course.name)
      expect(page).to have_content(courses5.course.name)

      visit "/students/#{student3.id}"

      expect(page).to have_content(courses6.course.name)
      expect(page).to have_content(courses7.course.name)
    end
  end
end