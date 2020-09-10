class RenameNumberColumnOnCodes < ActiveRecord::Migration[6.0]
  def change
    rename_column :codes, :number, :code_digits
  end
end
