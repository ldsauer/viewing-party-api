class CreateInvitees < ActiveRecord::Migration[7.1]
  def change
    create_table :invitees do |t|
      t.references :user, null: false, foreign_key: true
      t.references :viewing_party, null: false, foreign_key: true

      t.timestamps
    end
  end
end
