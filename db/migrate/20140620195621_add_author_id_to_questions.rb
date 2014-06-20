class AddAuthorIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :user_id, :integer, null: false
  end
end
