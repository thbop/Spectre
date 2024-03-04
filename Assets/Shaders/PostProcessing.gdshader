shader_type canvas_item;

uniform sampler2D screen_texture : source_color, hint_screen_texture, filter_nearest;




void fragment() {
	vec4 tex = texture(screen_texture, UV);

	
	COLOR = tex;
}
