class BrokerAgency < ActiveRecord::Base
  belongs_to :broker
  has_many :broker_agency_expertises, dependent: :destroy
  has_many :expertises, through: :broker_agency_expertises

  # attr_accessor juste pour voir si la variable :expertise_id peut être stockée
  attr_accessor :expertise_id_1
  attr_accessor :expertise_id_2
  attr_accessor :expertise_id_3
  attr_accessor :expertise_id_4

  # Ajout pour faire le nested form afin de créer les broker_agency_expertises en même temps que l'agence
  accepts_nested_attributes_for :broker_agency_expertises, allow_destroy: true

  validates :broker_id, :business_status, :name, :phone_number, :street, :zipcode, :city, presence: true
  validates_format_of :email, :with => /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  # validates_format_of :phone_number, :with => /\A0[0-9]([-. ]?\d{2}){4}[-. ]?\z/
  # validates_format_of :website, :with => /\A(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(:[0-9]{1,5})?(\/.*)?\z/, allow_blank: true
  # validates_format_of :twitter_account, :with => /\A([a-zA-Z](_?[a-zA-Z0-9]+)*_?|_([a-zA-Z0-9]+_?)*)\z/
  validates_format_of :zipcode, with: /\A[0-9]{5}\z/

  geocoded_by :complete_adress
  after_validation(:geocode, { :if => :complete_adress_changed? })

  # before_validation :strip_whitespaces, only: [:phone_number]

  private

  # def strip_whitespaces
  #   self.phone_number = self.phone_number.strip unless self.email.nil?
  # end



end
