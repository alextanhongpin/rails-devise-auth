class UserSerializer < ActiveModel::Serializer
  attributes :name, :email, :created_at, :updated_at

  def updated_at
    object.updated_at.to_i
  end
end
