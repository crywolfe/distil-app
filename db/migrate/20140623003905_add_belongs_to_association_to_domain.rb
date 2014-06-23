class AddBelongsToAssociationToDomain < ActiveRecord::Migration
  def change
    change_table :domains do |t|
      t.belongs_to :account
    end
  end
end
