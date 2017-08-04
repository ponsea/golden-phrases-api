class V1::PhraseSerializer < ActiveModel::Serializer
  attributes :id, :number, :level, :phrase_ja, :phrase_en, :answer, :meanings, :explanation
end
