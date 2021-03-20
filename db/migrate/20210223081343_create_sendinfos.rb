class CreateSendinfos < ActiveRecord::Migration[6.0]
  def change
    create_table :sendinfos do |t|
      t.string :postal_code,    default: "",  null: false
      t.integer :prefecture_id,               null: false
      t.string :city,           default: "",  null: false
      t.string :numbering,      default: "",  null: false
      t.string :building,       default: ""
      t.string :phone,                       null: false
      t.references :buyer,                    null: false,   foregin_key: true
      t.timestamps
    end
  end
end
