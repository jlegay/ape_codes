class ChangeCodeDigitsTypeOnCodes < ActiveRecord::Migration[6.0]
  def change
    remove_column :codes, :code_digits
    add_column :codes, :code_digits, :string
  end
end
