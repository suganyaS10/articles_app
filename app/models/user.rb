class User
  include ActiveModel::Model
  include ActiveModel::Attributes

  attribute :id, :big_integer
  attribute :first_name, :string
  attribute :avatar_url, :string
end
