require 'rails_helper'

describe 'As a visitor' do
  describe 'when I visit /students' do
    it 'should list students with their information' do
      student1 = Student.create!(name: 'John', age: 8, house: 'Slytherian')
      student2 = Student.create!(name: 'Phil', age: 9, house: 'Ravenclaw')
      student3 = Student.create!(name: 'Kim', age: 8, house: 'Gryffindor')

      visit '/students'

      expect(page).to have_content(student1.name)
      expect(page).to have_content(student1.age)
      expect(page).to have_content(student1.house)
      expect(page).to have_content(student2.name)
      expect(page).to have_content(student2.age)
      expect(page).to have_content(student2.house)
      expect(page).to have_content(student3.name)
      expect(page).to have_content(student3.age)
      expect(page).to have_content(student3.house)
    end

    it 'should have average age of all students' do
      student1 = Student.create!(name: 'John', age: 8, house: 'Slytherian')
      student2 = Student.create!(name: 'Phil', age: 9, house: 'Ravenclaw')
      student3 = Student.create!(name: 'Kim', age: 8, house: 'Gryffindor')

      visit '/students'

      within "#students-average-age" do
        expect(page).to have_content('Average Age: 8')
      end
    end
  end
end