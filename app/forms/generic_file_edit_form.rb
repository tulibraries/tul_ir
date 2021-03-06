module Sufia
  module Forms
    class GenericFileEditForm < GenericFilePresenter
      include HydraEditor::Form
      include HydraEditor::Form::Permissions
      self.required_fields = [:title, :creator, :tag, :department, :rights, :description, :notes_about_file]
    end
  end
end
