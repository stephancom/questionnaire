# frozen_string_literal: true

class AddMandatoryToQuestionsTable < ActiveRecord::Migration[4.2]
  def change
    # Survey Questions table
    add_column :survey_questions, :mandatory, :boolean, default: false
  end
end
