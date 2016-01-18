class QuestionChangeContentToText < ActiveRecord::Migration
  def change
    remove_column :questions, :content, :string

    add_column :questions, :content, :text
  end
end
