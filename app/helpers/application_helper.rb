module ApplicationHelper

	def custom_devise_error_messages!
		return "" if resource.errors.empty?
		messages = resource.errors.full_messages.map { |msg| "<li class=\"list-group-item\">#{msg}</li>" }.join
		sentence = I18n.t(	"errors.messages.not_saved",
												count: resource.errors.count,
												resource: resource.class.model_name.human.downcase
											)
		
		html = <<-HTML
						<div id="error_explanation" class="panel panel-default panel-danger">
							<div class="panel-heading">
								<h2 class="panel-title">
									#{sentence}
								</h2>
							</div>
							<ul class="list-group">
									#{messages}
							</ul>
						</div>
		HTML

		html.html_safe
	end		
	
end