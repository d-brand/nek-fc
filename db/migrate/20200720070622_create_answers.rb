class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.integer :schedule_id
      t.string :name
      t.string :reason
      t.string :comment

      t.timestamps
    end
  end
end
