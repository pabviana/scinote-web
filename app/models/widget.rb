class Widget < ActiveRecord::Base
  enum widget_type: Constants::WIDGET_TYPES

  validates :widget_type, presence: true
  validates :position,
            presence: true,
            numericality: { greater_than_or_equal_to: 0 }
  validates :properties, exclusion: { in: [nil] }
  validates :added_by_id, presence: true
  validates :my_module_id, presence: true, uniqueness: { scope: :position }

  belongs_to :added_by, class_name: 'User', inverse_of: :added_widgets
  belongs_to :last_modified_by,
             class_name: 'User',
             inverse_of: :last_modified_widgets
  belongs_to :my_module, inverse_of: :widgets
end
