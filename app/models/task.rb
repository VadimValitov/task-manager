class Task < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :assignee, class_name: 'User', optional: true

  validates :name, presence: true
  validates :description, presence: true
  validates :author, presence: true
  validates :description, length: { maximum: 500 }

  state_machine :initial => :new_task do
    event :development do
      transition :new_task => :in_development
    end

    event :development do
      transition :in_qa => :in_development
    end

    event :development do
      transition :review => :in_development
    end

    event :archive do
      transition :new_task => :archived
    end

    event :archive do
      transition :released => :archived
    end

    event :testing do
      transition :in_development => :in_qa
    end

    event :review do
      transition :in_qa => :in_code_review
    end

    event :for_release do
      transition :review => :ready_for_release
    end

    event :for_release do
      transition :review => :ready_for_release
    end

    event :deploy do
      transition :ready_for_release => :released
    end
  end

  scope :with_states, lambda {|*states| {:conditions => {:state => states}}}

  scope :without_states, lambda {|*states| {:conditions => ['state NOT IN (?)', states]}}
end
