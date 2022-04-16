module OrdersHelper
  def link_add_menu_form(name, order_details_form, association)
    new_object = order_details_form.object.send(association).klass.new
    id = new_object.object_id
    
    fields = order_details_form.fields_for(association, new_object, child_index: id) do |builder|
      render(association.to_s.singularize + "_forms", order_details_form: builder)
    end

    link_to(name, '#', class: 'add_form', data: {id: id, fields: fields.gsub("\n", "")})
  end
end
