# frozen_string_literal: true

class CreatePredefinedValuesTable < ActiveRecord::Migration[4.2]
  def change
    create_table :survey_predefined_values do |t|
      t.string  :head_number
      t.string  :name
      t.string  :locale_name
      t.integer :question_id

      t.timestamps
    end

    add_column :survey_answers, :predefined_value_id, :integer
  end
end
