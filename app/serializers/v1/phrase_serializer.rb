class V1::PhraseSerializer < ApplicationSerializer
  attributes :id, :number, :level, :section, :phrase_ja, :phrase_en, :answer, :meanings, :explanation
end
