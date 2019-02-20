# frozen_string_literal: true

class CreateLessons < ActiveRecord::Migration[4.2]
  def change
    create_table :lessons do |t|
      t.string :name

      t.timestamps
    end
  end
end
