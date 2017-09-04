class V1::PhraseSerializer < ApplicationSerializer
  attributes :id, :number, :level, :section_id, :phrase_ja, :phrase_en, :answer, :meanings, :explanation
end
