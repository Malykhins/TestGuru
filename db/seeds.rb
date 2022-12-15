# frozen_string_literal: true

categories = Category.create!([
                                { title: 'Ruby language' },
                                { title: 'Internet protocols' }
                              ])
users = User.create!([
                       { name: 'Sergey', email: 'msa@mail.ru' },
                       { name: 'Kirill', email: 'mks@mail.ru' },
                       { name: 'Irina', email: 'mio@mail.ru' }
                     ])

tests = Test.create!([
                       { title: 'Ruby', level: 1, category: categories[0], author: users[0] },
                       { title: 'Rails', level: 2, category: categories[1], author: users[1] },
                       { title: 'HTML', level: 1, category: categories[1], author: users[2] }
                     ])

questions = Question.create!([
                               { body: 'Who Invented the Ruby Language?', test: tests[0] },
                               { body: 'In which file can gems be modified?', test: tests[1] },
                               { body: 'What is an HTML tag?', test: tests[2] }
                             ])

Answer.create!([
                 { body: 'Yukihiro Matsumoto', correct: true, question: questions[0] },
                 { body: 'Rambo', correct: false, question: questions[0] },
                 { body: 'Rubanov Vasily', correct: false, question: questions[0] },
                 { body: 'Gemfile.lock', correct: false, question: questions[1] },
                 { body: 'gems.rb', correct: false, question: questions[1] },
                 { body: 'Gemfile', correct: true, question: questions[1] },
                 { body: '**', correct: false, question: questions[2] },
                 { body: '<>', correct: true, question: questions[2] },
                 { body: '||', correct: false, question: questions[2] }
               ])

TestsUser.create!([
                    { user: users[0], test: tests[0] },
                    { user: users[0], test: tests[1] },
                    { user: users[0], test: tests[2] },
                    { user: users[1], test: tests[1] },
                    { user: users[1], test: tests[2] },
                    { user: users[2], test: tests[0] }
                  ])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
