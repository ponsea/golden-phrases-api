# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

levels = [
  { id: 1, title: "600点レベル 助走の400語" },
  { id: 2, title: "730点レベル 加速の300語" },
  { id: 3, title: "860点レベル 飛躍の200語" },
  { id: 4, title: "990点レベル 頂点の100語" }
]

levels.each do |level|
  Level.create(level)
end

sectionRanges = [
  [1, 2, 3, 4, 5, 6, 7, 8],
  [9, 10, 11, 12, 13, 14],
  [15, 16, 17, 18],
  [19, 20]
]

4.times do |i|
  sectionRanges[i].each do |j|
    Section.create({id: j, level_id: i + 1})
  end
end

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
