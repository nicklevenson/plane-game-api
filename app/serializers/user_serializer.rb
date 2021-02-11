class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :username
  has_many :scores, only: [:score]
end
