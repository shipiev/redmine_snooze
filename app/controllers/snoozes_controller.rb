class SnoozesController < ApplicationController
  model_object Snooze

  before_filter :find_project_by_project_id, only: [:create]
  before_filter :new_model_object, only: [:create]

  helper :notes
  helper :attachments
  helper :custom_fields

  delegate :model_object, to: :'self.class', prefix: false

  def create
    @snooze.note.source = @snooze.deal
    @snooze.note.author = User.current

    if @snooze.save
      @note = @snooze.note
      @note_source = @snooze.deal

      render template: 'notes/create'
    end
  end

private

  def new_model_object
    @snooze = model_object.new(params[model_object_sym])
  end

  def model_object_sym
    model_object.name.underscore.to_sym
  end
end
