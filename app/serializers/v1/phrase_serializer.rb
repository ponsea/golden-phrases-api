class V1::PhraseSerializer < ApplicationSerializer
  attributes :id, :number, :level, :phrase_ja, :phrase_en, :answer, :meanings, :explanation
end
