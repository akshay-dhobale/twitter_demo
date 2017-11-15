class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tweets, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :relations
  has_many :friends, :through => :relations

  has_many :inverse_relations, :class_name => "Relation", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_relations, :source => :user

  # has_many :friendships
  # has_many :friends, :through => :friendships

  has_attached_file :photo , styles: { medium: "300x300>", thumb: "100x100>" ,large: "500x500>"}, default_url: "/home/webwerks1/Images"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

end
