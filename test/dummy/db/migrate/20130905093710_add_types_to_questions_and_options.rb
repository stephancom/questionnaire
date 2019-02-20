# frozen_string_literal: true

class AddTypesToQuestionsAndOptions < ActiveRecord::Migration[4.2]
  def change
    # Survey Questions table
    add_column :survey_questions, :questions_type_id, :integer

    # Survey Options table
    add_column :survey_options, :options_type_id, :integer

    # Survey Answers table
    add_column :survey_answers, :option_text, :text
    add_column :survey_answers, :option_number, :integer
  end
end
