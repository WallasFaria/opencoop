class Operation < ApplicationRecord
  belongs_to :account
  belongs_to :operable, polymorphic: true

  def read_only?
    new_record? ? false : true
  end
end
