# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

3.times do
  schooln = Schooln.create!(name: Faker::Space.galaxy)

  10.times do
    teacher = Teacher.create!(schooln_id: schooln.id,
                              name: Faker::Superhero.name)

    15.times do
      Student.create!(teacher_id: teacher.id,
                      name: Faker::Name.name)
    end
  end
end
