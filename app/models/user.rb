class User < ApplicationRecord
  has_many :schools

  after_create_commit -> { broadcast_prepend_to "users"}
  after_destroy_commit -> { broadcast_remove_to "users"}
end
