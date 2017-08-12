# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

CSV.foreach('db/phrases.txt', col_sep: "\t") do |row|
  Phrase.create(
    number: row[0].to_i,
    phrase_ja: row[1],
    phrase_en: row[2],
    answer: row[3],
    meanings: row[4],
    explanation: row[5],
    section: row[6].to_i,
    level: row[7].to_i
  )
end
