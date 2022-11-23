# frozen_string_literal: true

class AddTestsLevelDefault < ActiveRecord::Migration[6.1]
  def up
    change_column_default :tests, :level, 1
  end

  def down
    change_column_default :tests, :level, nil
  end
end
